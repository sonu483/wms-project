import http from "node:http";

const port = Number(process.env.PORT || 8081);
const allowedOrigin = process.env.ALLOWED_ORIGIN || "http://localhost:3000";
const defaultChannels = ["sms", "whatsapp"];

const twilioConfig = {
  accountSid: process.env.TWILIO_ACCOUNT_SID || "",
  authToken: process.env.TWILIO_AUTH_TOKEN || "",
  smsFrom: process.env.TWILIO_SMS_FROM || "",
  whatsappFrom: process.env.TWILIO_WHATSAPP_FROM || "whatsapp:+14155238886",
  dryRun: String(process.env.DRY_RUN || "true").toLowerCase() === "true"
};

const jsonResponse = (response, statusCode, body) => {
  response.writeHead(statusCode, {
    "Access-Control-Allow-Origin": allowedOrigin,
    "Access-Control-Allow-Methods": "GET,POST,OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type",
    "Content-Type": "application/json"
  });
  response.end(JSON.stringify(body));
};

const readJsonBody = (request) =>
  new Promise((resolve, reject) => {
    let body = "";

    request.on("data", (chunk) => {
      body += chunk;
    });

    request.on("end", () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (error) {
        reject(error);
      }
    });

    request.on("error", reject);
  });

const normalizePhone = (phone) => {
  const value = String(phone || "").trim();
  const digits = value.replace(/\D/g, "");

  if (!digits) {
    return "";
  }

  if (value.startsWith("+")) {
    return `+${digits}`;
  }

  if (digits.length === 10) {
    return `+91${digits}`;
  }

  return digits.startsWith("91") ? `+${digits}` : `+${digits}`;
};

const getRequestedChannels = (channels) => {
  const requestedChannels = Array.isArray(channels) && channels.length
    ? channels
    : defaultChannels;

  return requestedChannels.filter((channel) =>
    defaultChannels.includes(String(channel).toLowerCase())
  );
};

const sendTwilioMessage = async ({ from, to, body }) => {
  if (twilioConfig.dryRun) {
    console.log(`[DRY_RUN] from=${from} to=${to} body=${body}`);

    return {
      dryRun: true,
      to,
      from
    };
  }

  if (!twilioConfig.accountSid || !twilioConfig.authToken || !from) {
    throw new Error("Twilio credentials are missing.");
  }

  const auth =
    Buffer.from(`${twilioConfig.accountSid}:${twilioConfig.authToken}`)
      .toString("base64");
  const formData = new URLSearchParams({
    From: from,
    To: to,
    Body: body
  });
  const response = await fetch(
    `https://api.twilio.com/2010-04-01/Accounts/${twilioConfig.accountSid}/Messages.json`,
    {
      method: "POST",
      headers: {
        Authorization: `Basic ${auth}`,
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: formData
    }
  );
  const result = await response.json();

  if (!response.ok) {
    throw new Error(result.message || "Twilio message failed.");
  }

  return result;
};

const sendOrderConfirmation = async (payload) => {
  const to = normalizePhone(payload.to || payload.phone);
  const channels = getRequestedChannels(payload.channels);
  const message = payload.message ||
    `Your order is confirmed. Order ID: ${payload.order?.orderCode || "new order"}.`;
  const sent = [];

  if (!to) {
    throw new Error("Customer phone number is required.");
  }

  if (!channels.length) {
    throw new Error("At least one valid channel is required.");
  }

  if (channels.includes("sms")) {
    sent.push({
      channel: "sms",
      result: await sendTwilioMessage({
        from: twilioConfig.smsFrom,
        to,
        body: message
      })
    });
  }

  if (channels.includes("whatsapp")) {
    sent.push({
      channel: "whatsapp",
      result: await sendTwilioMessage({
        from: twilioConfig.whatsappFrom,
        to: `whatsapp:${to}`,
        body: message
      })
    });
  }

  return sent;
};

const getHealthResponse = () => ({
  ok: true,
  service: "wms-notification-server",
  dryRun: twilioConfig.dryRun,
  channels: defaultChannels,
  configured: {
    sms: twilioConfig.dryRun || Boolean(twilioConfig.smsFrom),
    whatsapp: twilioConfig.dryRun || Boolean(twilioConfig.whatsappFrom),
    credentials:
      twilioConfig.dryRun ||
      Boolean(twilioConfig.accountSid && twilioConfig.authToken)
  }
});

const server = http.createServer(async (request, response) => {
  if (request.method === "OPTIONS") {
    jsonResponse(response, 204, {});
    return;
  }

  if (
    request.method === "GET" &&
    (request.url === "/health" ||
      request.url === "/api/notifications/health")
  ) {
    jsonResponse(response, 200, getHealthResponse());
    return;
  }

  if (
    request.method === "POST" &&
    (request.url === "/api/notifications/order-confirmation" ||
      request.url === "/api/notifications/test")
  ) {
    try {
      const payload = await readJsonBody(request);
      const sent = await sendOrderConfirmation(payload);

      jsonResponse(response, 200, {
        success: true,
        dryRun: twilioConfig.dryRun,
        sent
      });
    } catch (error) {
      jsonResponse(response, 400, {
        success: false,
        message: error.message
      });
    }

    return;
  }

  jsonResponse(response, 404, {
    success: false,
    message: "Route not found"
  });
});

server.listen(port, () => {
  console.log(`WMS notification server running on http://localhost:${port}`);
  console.log(`DRY_RUN=${twilioConfig.dryRun}`);
});
