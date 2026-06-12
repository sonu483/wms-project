# WMS Notification Server

This server receives order confirmation calls from the React frontend and sends SMS plus WhatsApp through Twilio.

## Run

```powershell
Copy-Item .env.example .env
npm start
```

By default `DRY_RUN=true`, so it logs messages without sending real SMS.

For real SMS and WhatsApp:

1. Create a Twilio account.
2. Add `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN`.
3. Add a real `TWILIO_SMS_FROM` phone number.
4. Keep `TWILIO_WHATSAPP_FROM=whatsapp:+14155238886` for Twilio Sandbox, or replace it with your approved WhatsApp sender.
5. Set `DRY_RUN=false`.
6. Restart the server.

The frontend calls this fallback endpoint automatically:

`POST http://localhost:8081/api/notifications/order-confirmation`

## Check API

Health check:

```powershell
Invoke-RestMethod http://localhost:8081/api/notifications/health
```

Send a test SMS plus WhatsApp message:

```powershell
Invoke-RestMethod `
  -Method Post `
  -Uri http://localhost:8081/api/notifications/test `
  -ContentType "application/json" `
  -Body '{"to":"+919876543210","channels":["sms","whatsapp"],"message":"WMS notification test"}'
```

For frontend deployments, set `REACT_APP_NOTIFICATION_API_URL` to your deployed notification API base URL, for example:

```powershell
REACT_APP_NOTIFICATION_API_URL=https://your-api.example.com/api/notifications
```
