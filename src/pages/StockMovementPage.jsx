import React, {
  useEffect,
  useState
} from "react";

import "./ProductPage.css";

import axios from "axios";

import {
  FaArrowDown,
  FaArrowUp,
  FaExchangeAlt,
  FaHome,
  FaTrash,
  FaWarehouse
} from "react-icons/fa";

import {
  useNavigate
} from "react-router-dom";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

const API_URL =
  "http://localhost:8080/api/stock-movements";

const MOVEMENT_CONFIG = {
  INCOMING: {
    title: "Incoming Stock",
    subtitle: "Record stock received from suppliers and add it to warehouse inventory.",
    icon: <FaArrowDown />,
    primaryWarehouseLabel: "To Warehouse",
    button: "Add Incoming Stock",
    accent: "incoming"
  },
  OUTGOING: {
    title: "Outgoing Stock",
    subtitle: "Record dispatches and reduce stock from the selected warehouse.",
    icon: <FaArrowUp />,
    primaryWarehouseLabel: "From Warehouse",
    button: "Dispatch Stock",
    accent: "outgoing"
  },
  TRANSFER: {
    title: "Stock Transfer",
    subtitle: "Move stock from one warehouse to another and keep inventory synced.",
    icon: <FaExchangeAlt />,
    primaryWarehouseLabel: "From Warehouse",
    button: "Transfer Stock",
    accent: "transfer"
  }
};

function StockMovementPage({ type }) {

  const navigate =
    useNavigate();
  const config =
    MOVEMENT_CONFIG[type] || MOVEMENT_CONFIG.INCOMING;
  const roleLabel =
    getRoleLabel();
  const canCreate =
    canAccess("create") || canAccess("update");
  const canDelete =
    canAccess("delete");
  const [movements,
    setMovements] = useState([]);
  const [inventory,
    setInventory] = useState([]);
  const [warehouses,
    setWarehouses] = useState([]);
  const [message,
    setMessage] = useState("");
  const [formData,
    setFormData] = useState({
      productName: "",
      quantity: "",
      fromWarehouse: "",
      toWarehouse: "",
      referenceNo: "",
      status: "Completed"
    });

  const totalQuantity =
    movements.reduce(
      (sum, movement) =>
        sum + Number(movement.quantity || 0),
      0
    );
  const completedCount =
    movements.filter((movement) =>
      (movement.status || "").toLowerCase() === "completed"
    ).length;
  const pendingCount =
    movements.length - completedCount;
  const productOptions =
    Array.from(
      new Set(
        inventory
          .map((item) => item.productName)
          .filter(Boolean)
      )
    );
  const warehouseOptions =
    Array.from(
      new Set([
        ...warehouses.map((warehouse) => warehouse.warehouseName),
        ...inventory.map((item) => item.warehouseName)
      ].filter(Boolean))
    );

  useEffect(() => {
    fetchPageData();

    const realtime =
      setInterval(fetchPageData, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);
  // Data refresh is intentionally interval-based for this operations page.
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [type]);

  const fetchPageData =
    async () => {

      try {
        const [
          movementsResponse,
          inventoryResponse,
          warehousesResponse
        ] = await Promise.all([
          axios.get(`${API_URL}/type/${type}`),
          axios.get("http://localhost:8080/api/inventory"),
          axios.get("http://localhost:8080/api/warehouses")
        ]);

        setMovements(movementsResponse.data);
        setInventory(inventoryResponse.data);
        setWarehouses(warehousesResponse.data);
      } catch (error) {
        setMessage(
          "Backend is not connected. Please start Eclipse backend on port 8080."
        );
      }
    };

  const handleChange =
    (e) => {

      setFormData({
        ...formData,
        [e.target.name]: e.target.value
      });
    };

  const handleSubmit =
    async (e) => {

      e.preventDefault();

      if (!canCreate) {
        setMessage("This role cannot create stock movements.");
        return;
      }

      try {
        await axios.post(API_URL, {
          ...formData,
          type,
          quantity: Number(formData.quantity)
        });

        setFormData({
          productName: "",
          quantity: "",
          fromWarehouse: "",
          toWarehouse: "",
          referenceNo: "",
          status: "Completed"
        });
        setMessage(`${config.title} saved and inventory updated.`);
        fetchPageData();
      } catch (error) {
        setMessage("Save failed. Please check backend connection.");
      }
    };

  const handleDelete =
    async (id) => {

      if (!canDelete) {
        setMessage("Delete access is admin only.");
        return;
      }

      try {
        await axios.delete(`${API_URL}/${id}`);
        fetchPageData();
      } catch (error) {
        setMessage("Delete failed. Please check backend connection.");
      }
    };

  const formatDate =
    (value) => {

      if (!value) {
        return "Today";
      }

      return new Date(value).toLocaleString("en-IN", {
        day: "2-digit",
        month: "short",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit"
      });
    };

  return (

    <div className={`product-container movement-container ${config.accent}`}>

      <div className="movement-hero">

        <button
          onClick={() => navigate("/admin")}
          className="page-home-btn"
        >
          <FaHome />
          Home
        </button>

        <div className="movement-title">
          <span className="module-kicker">
            Warehouse Operations
          </span>
          <h1>
            {config.icon}
            {config.title}
          </h1>
          <p>{config.subtitle}</p>
        </div>

        <div className="inventory-role-card">
          <FaWarehouse />
          <span>Current Role</span>
          <strong>{roleLabel}</strong>
          <p>{canCreate ? "Movement entry allowed" : "View only"}</p>
        </div>

      </div>

      {message && (
        <div className="movement-message">
          {message}
        </div>
      )}

      <div className="inventory-summary movement-summary">

        <div className="inventory-stat-card">
          {config.icon}
          <span>Total Entries</span>
          <strong>{movements.length}</strong>
          <small>{config.title} records</small>
        </div>

        <div className="inventory-stat-card">
          <FaWarehouse />
          <span>Total Quantity</span>
          <strong>{totalQuantity}</strong>
          <small>Units processed</small>
        </div>

        <div className="inventory-stat-card">
          <FaExchangeAlt />
          <span>Completed</span>
          <strong>{completedCount}</strong>
          <small>Inventory synced</small>
        </div>

        <div className="inventory-stat-card warning">
          <FaArrowUp />
          <span>Pending</span>
          <strong>{pendingCount}</strong>
          <small>Needs attention</small>
        </div>

      </div>

      <form
        className="product-form inventory-form movement-form"
        onSubmit={handleSubmit}
      >

        <input
          list="movement-products"
          type="text"
          name="productName"
          placeholder="Product Name"
          value={formData.productName}
          onChange={handleChange}
          required
        />

        <datalist id="movement-products">
          {productOptions.map((productName) => (
            <option
              key={productName}
              value={productName}
            />
          ))}
        </datalist>

        <input
          type="number"
          name="quantity"
          min="1"
          placeholder="Quantity"
          value={formData.quantity}
          onChange={handleChange}
          required
        />

        {(type === "OUTGOING" || type === "TRANSFER") && (
          <input
            list="movement-warehouses"
            type="text"
            name="fromWarehouse"
            placeholder={config.primaryWarehouseLabel}
            value={formData.fromWarehouse}
            onChange={handleChange}
            required
          />
        )}

        {(type === "INCOMING" || type === "TRANSFER") && (
          <input
            list="movement-warehouses"
            type="text"
            name="toWarehouse"
            placeholder={
              type === "TRANSFER" ? "To Warehouse" : config.primaryWarehouseLabel
            }
            value={formData.toWarehouse}
            onChange={handleChange}
            required
          />
        )}

        <datalist id="movement-warehouses">
          {warehouseOptions.map((warehouseName) => (
            <option
              key={warehouseName}
              value={warehouseName}
            />
          ))}
        </datalist>

        <input
          type="text"
          name="referenceNo"
          placeholder="Reference No"
          value={formData.referenceNo}
          onChange={handleChange}
        />

        <select
          name="status"
          value={formData.status}
          onChange={handleChange}
        >
          <option value="Completed">Completed</option>
          <option value="Pending">Pending</option>
          <option value="In Review">In Review</option>
        </select>

        <button
          type="submit"
          disabled={!canCreate}
        >
          {config.button}
        </button>

      </form>

      <div className="inventory-table-wrap">

        <table className="product-table inventory-table movement-table">

          <thead>
            <tr>
              <th>ID</th>
              <th>Product</th>
              <th>Qty</th>
              <th>From</th>
              <th>To</th>
              <th>Reference</th>
              <th>Status</th>
              <th>Date</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tbody>
            {movements.length > 0 ? (
              movements.map((movement) => (
                <tr key={movement.id}>
                  <td>{movement.id}</td>
                  <td>{movement.productName}</td>
                  <td>{movement.quantity}</td>
                  <td>{movement.fromWarehouse || "-"}</td>
                  <td>{movement.toWarehouse || "-"}</td>
                  <td>{movement.referenceNo}</td>
                  <td>
                    <span className="stock-badge ok">
                      {movement.status}
                    </span>
                  </td>
                  <td>{formatDate(movement.movementDate)}</td>
                  <td>
                    <button
                      className="action-btn delete-btn"
                      disabled={!canDelete}
                      onClick={() => handleDelete(movement.id)}
                    >
                      <FaTrash />
                      Delete
                    </button>
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="9">
                  No {config.title.toLowerCase()} records yet
                </td>
              </tr>
            )}
          </tbody>

        </table>

      </div>

    </div>
  );
}

export default StockMovementPage;
