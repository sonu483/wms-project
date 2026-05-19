import React,
{
  useEffect,
  useState
} from "react";

import "./ProductPage.css";

import axios from "axios";

import {
  FaHome,
  FaEdit,
  FaTrash
} from "react-icons/fa";

import {
  useNavigate
} from "react-router-dom";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

import {
  ORDER_STATUSES,
  parseOrderDetails,
  getPreference,
  translations
} from "../utils/appPreferences";

const getDisplayOrderId = (order) => {
  return order.orderCode || `ORD-${String(order.id || 0).padStart(5, "0")}`;
};

const formatOrderDateTime = (value) => {
  if (!value) {
    return "Date not available";
  }

  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "Date not available";
  }

  return date.toLocaleString("en-IN", {
    day: "2-digit",
    month: "short",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit"
  });
};

function OrdersPage() {

  const navigate =
    useNavigate();

  const [orders,
    setOrders] = useState([]);

  const [editingId,
    setEditingId] = useState(null);

  const [formData,
    setFormData] = useState({

      customerName: "",

      status: ""
  });

  const [errorMessage,
    setErrorMessage] = useState("");

  const canCreate = canAccess("create");
  const canCreateOrder = canAccess("createOrder");
  const canUpdate = canAccess("update");
  const canDelete = canAccess("delete");
  const canSubmit = editingId ? canUpdate : (canCreate || canCreateOrder);
  const roleLabel = getRoleLabel();
  const isUser = roleLabel === "USER";
  const language = getPreference("language", "en");
  const t = translations[language] || translations.en;
  const email = localStorage.getItem("email") || "";
  const visibleOrders =
    isUser && email
      ? orders.filter((order) =>
          order.customerName?.toLowerCase().includes(email.toLowerCase())
        )
      : orders;

  const getTrackingStep = (status) => {
    const index =
      ORDER_STATUSES.findIndex((orderStatus) =>
        orderStatus.toLowerCase() ===
        (status || "Pending").toLowerCase()
      );

    return index >= 0 ? index : 0;
  };

  useEffect(() => {

    fetchOrders();

    const realtime =
      setInterval(fetchOrders, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);

  }, []);

  const fetchOrders =
    async () => {

      try {

        const response =
          await axios.get(
            "http://localhost:8080/api/orders"
          );

        setOrders(response.data);
        setErrorMessage("");

      } catch (error) {

        setOrders([]);
        setErrorMessage(
          "Orders backend is not connected. Please start Eclipse backend on port 8080."
        );
      }
  };

  const handleChange = (e) => {

    setFormData({

      ...formData,

      [e.target.name]:
      e.target.value
    });
  };

  const handleSubmit =
    async (e) => {

      e.preventDefault();

      if (!canSubmit) {
        return;
      }

      if(editingId) {

        await axios.put(

          `http://localhost:8080/api/orders/${editingId}`,

          formData
        );

        setEditingId(null);

      }

      else {

        await axios.post(

          "http://localhost:8080/api/orders",

          formData
        );
      }

      fetchOrders();

      setFormData({

        customerName: "",

        status: ""
      });
  };

  const handleEdit =
    (order) => {

      if (!canUpdate) {
        return;
      }

      setEditingId(order.id);

      setFormData({

        customerName:
          order.customerName,

        status:
          order.status
      });
  };

  const handleDelete =
    async (id) => {

      if (!canDelete) {
        return;
      }

      await axios.delete(

        `http://localhost:8080/api/orders/${id}`
      );

      fetchOrders();
  };

  const handleStatusChange =
    async (order, status) => {

      if (!canUpdate) {
        return;
      }

      await axios.put(

        `http://localhost:8080/api/orders/${order.id}`,

        {
          customerName: order.customerName,
          status
        }
      );

      fetchOrders();
  };

  if (isUser) {

    return (

      <div className="product-container">

        <div
          style={{

            display: "flex",

            justifyContent:
              "space-between",

            alignItems: "center",

            marginBottom: "20px"
          }}
        >

          <button

            onClick={() =>
              navigate("/admin")}

            style={{

              background: "#2563eb",

              color: "white",

              border: "none",

              padding:
                "10px 20px",

              borderRadius: "8px",

              cursor: "pointer",

              fontWeight: "bold"
            }}
          >

            <FaHome />

            {" "}Home

          </button>

            <h1>
            My Orders
          </h1>

          <div></div>

        </div>

        <p className="access-note">
          {t.orderTracking} refreshes automatically every few seconds
        </p>

        {errorMessage && (
          <div className="page-error-message">
            {errorMessage}
          </div>
        )}

        <div className="tracking-list">

          {visibleOrders.length > 0 ? (

            visibleOrders.map((order) => {

              const step = getTrackingStep(order.status);
              const orderDetails =
                parseOrderDetails(order.customerName);

              return (

                <div
                  className="tracking-card"
                  key={order.id}
                >

                  <div className="tracking-head">

                    <div>

                      <h2>{orderDetails.product}</h2>

                      <p>Order ID: #{getDisplayOrderId(order)}</p>

                      <p>
                        Ordered On: {formatOrderDateTime(order.orderDate)}
                      </p>

                    </div>

                    <span className="status-pill">
                      {order.status || "Pending"}
                    </span>

                  </div>

                  <div className="timeline">

                    {ORDER_STATUSES.map((status, index) => (
                      <div
                        className={step >= index ? "step active" : "step"}
                        key={status}
                      >
                        <span></span>
                        <p>{status}</p>
                      </div>
                    ))}

                  </div>

                  <p className="tracking-copy">
                    Estimated delivery: 2-4 days. Status updates come from backend order status.
                  </p>

                  <div className="order-detail-grid">

                    <span>Qty: {orderDetails.quantity}</span>

                    <span>Payment: {orderDetails.payment}</span>

                    <span>Status: {orderDetails.paymentStatus}</span>

                    <span>Phone: {orderDetails.phone}</span>

                    <span>Address: {orderDetails.address}</span>

                  </div>

                </div>
              );
            })

          ) : (

            <div className="empty-orders">
              No orders yet. Go to Products and place your first order.
            </div>

          )}

        </div>

      </div>
    );
  }

  return (

    <div className="product-container">

      <div
        style={{

          display: "flex",

          justifyContent:
            "space-between",

          alignItems: "center",

          marginBottom: "20px"
        }}
      >

        <button

          onClick={() =>
            navigate("/admin")}

          style={{

            background: "#2563eb",

            color: "white",

            border: "none",

            padding:
              "10px 20px",

            borderRadius: "8px",

            cursor: "pointer",

            fontWeight: "bold"
          }}
        >

          <FaHome />

          {" "}Home

        </button>

        <h1>
          Orders Management
        </h1>

        <div></div>

      </div>

      <p className="access-note">
        Current Role: {roleLabel} | Access: {
          roleLabel === "ADMIN"
            ? "Full Control"
            : roleLabel === "USER"
              ? "View Only"
              : "Limited Control"
        }
      </p>

      {errorMessage && (
        <div className="page-error-message">
          {errorMessage}
        </div>
      )}

      <form
        className="product-form"
        onSubmit={handleSubmit}
      >

        <input
          type="text"
          name="customerName"
          placeholder="Customer Name"
          value={formData.customerName}
          onChange={handleChange}
          required
        />

        <select
          name="status"
          value={formData.status}
          onChange={handleChange}
          required
        >

          <option value="">
            Select Status
          </option>

          {ORDER_STATUSES.map((status) => (
            <option
              key={status}
              value={status}
            >
              {status}
            </option>
          ))}

        </select>

        <button
          type="submit"
          disabled={!canSubmit}
          title={!canSubmit ? "This role does not have this access" : ""}
        >

          {
            editingId ?

            "Update Order"

            :

            "Add Order"
          }

        </button>

      </form>

      <table className="product-table">

        <thead>

          <tr>

            <th>ID</th>

            <th>Order Details</th>

            <th>Status</th>

            <th>Actions</th>

          </tr>

        </thead>

        <tbody>

          {visibleOrders.map((order) => {

            const orderDetails =
              parseOrderDetails(order.customerName);

            return (

            <tr key={order.id}>

              <td>
                <strong>#{getDisplayOrderId(order)}</strong>
                <span className="order-date-line">
                  {formatOrderDateTime(order.orderDate)}
                </span>
              </td>

              <td>
                <div className="staff-order-details">
                  <strong>{orderDetails.product}</strong>
                  <span>Customer: {orderDetails.customer}</span>
                  <span>Qty: {orderDetails.quantity}</span>
                  <span>Payment: {orderDetails.payment}</span>
                  <span>Phone: {orderDetails.phone}</span>
                  <span>Address: {orderDetails.address}</span>
                </div>
              </td>

              <td>
                <div className="status-actions">

                  <span className="status-pill">
                    {order.status || "Pending"}
                  </span>

                  {ORDER_STATUSES.map((status) => (
                    <button
                      className="mini-status-btn"
                      disabled={!canUpdate}
                      key={status}
                      onClick={() =>
                        handleStatusChange(order, status)}
                    >
                      {status}
                    </button>
                  ))}

                </div>
              </td>

              <td>

                <button
                  className="action-btn edit-btn"
                  disabled={!canUpdate}
                  title={!canUpdate ? "Edit access is not allowed" : ""}
                  onClick={() =>
                    handleEdit(order)}
                >

                  <FaEdit />

                  {" "}Edit

                </button>

                <button
                  className="action-btn delete-btn"
                  disabled={!canDelete}
                  title={!canDelete ? "Delete access is admin only" : ""}
                  onClick={() =>
                    handleDelete(order.id)}
                >

                  <FaTrash />

                  {" "}Delete

                </button>

              </td>

            </tr>

            );
          })}

        </tbody>

      </table>

    </div>
  );
}

export default OrdersPage;
