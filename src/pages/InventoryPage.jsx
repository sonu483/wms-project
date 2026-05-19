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
  FaTrash,
  FaBoxes,
  FaWarehouse,
  FaExclamationTriangle,
  FaClipboardCheck,
  FaMapMarkerAlt,
  FaUserShield
} from "react-icons/fa";

import {
  useNavigate
} from "react-router-dom";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

function InventoryPage() {

  const navigate =
    useNavigate();

  const [inventory,
    setInventory] = useState([]);

  const [editingId,
    setEditingId] = useState(null);

  const [formData,
    setFormData] = useState({

      productName: "",

      quantity: "",

      warehouseName: ""
  });

  const [searchText,
    setSearchText] = useState("");

  const [errorMessage,
    setErrorMessage] = useState("");

  const canCreate = canAccess("create");
  const canUpdate = canAccess("update");
  const canDelete = canAccess("delete");
  const canSubmit = editingId ? canUpdate : canCreate;
  const roleLabel = getRoleLabel();
  const filteredInventory =
    inventory.filter((item) =>
      item.productName?.toLowerCase().includes(searchText.toLowerCase()) ||
      item.warehouseName?.toLowerCase().includes(searchText.toLowerCase())
    );
  const lowStockCount =
    inventory.filter((item) => Number(item.quantity) < 10).length;
  const warehouseCount =
    new Set(inventory.map((item) => item.warehouseName)).size;
  const totalStock =
    inventory.reduce(
      (sum, item) => sum + Number(item.quantity || 0),
      0
    );
  const lowStockItems =
    inventory.filter((item) => Number(item.quantity) < 10);
  const warehouseStock =
    Array.from(
      inventory.reduce((warehouseMap, item) => {
        const warehouseName =
          item.warehouseName || "Unassigned";
        const currentStock =
          warehouseMap.get(warehouseName) || 0;

        warehouseMap.set(
          warehouseName,
          currentStock + Number(item.quantity || 0)
        );

        return warehouseMap;
      }, new Map())
    );
  const roleAccessText =
    roleLabel === "ADMIN"
      ? "Full inventory control"
      : roleLabel === "MANAGER"
        ? "Manage stock"
        : roleLabel === "OPERATOR"
          ? "Update stock"
          : "View inventory only";

  useEffect(() => {

    fetchInventory();

    const realtime =
      setInterval(fetchInventory, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);

  }, []);

  const fetchInventory =
    async () => {

      try {

        const response =
          await axios.get(
            "http://localhost:8080/api/inventory"
          );

        setInventory(response.data);
        setErrorMessage("");

      } catch (error) {

        setInventory([]);
        setErrorMessage(
          "Inventory backend is not connected. Please start Eclipse backend on port 8080."
        );
      }
  };

  const handleChange =
    (e) => {

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

      try {

      if(editingId) {

        await axios.put(

          `http://localhost:8080/api/inventory/${editingId}`,

          formData
        );

        setEditingId(null);
      }

      else {

        await axios.post(

          "http://localhost:8080/api/inventory",

          formData
        );
      }

      fetchInventory();

      setFormData({

        productName: "",

        quantity: "",

        warehouseName: ""
      });

      setErrorMessage("");

      } catch (error) {

        setErrorMessage(
          "Inventory save failed. Please check backend connection."
        );
      }
  };

  const handleEdit =
    (item) => {

      if (!canUpdate) {
        return;
      }

      setEditingId(item.id);

      setFormData({

        productName:
          item.productName,

        quantity:
          item.quantity,

        warehouseName:
          item.warehouseName
      });
  };

  const handleDelete =
    async (id) => {

      if (!canDelete) {
        return;
      }

      try {

      await axios.delete(

        `http://localhost:8080/api/inventory/${id}`
      );

      fetchInventory();

      } catch (error) {

        setErrorMessage(
          "Inventory delete failed. Please check backend connection."
        );
      }
  };

  return (

    <div className="product-container inventory-container">

      <div className="inventory-hero">

        <button

          onClick={() =>
            navigate("/admin")}
          className="page-home-btn inventory-home-btn"
        >

          <FaHome />

          {" "}Home

        </button>

        <div className="inventory-title-block">

          <span className="module-kicker">
            Warehouse Management System
          </span>

          <h1>
            Inventory Control
          </h1>

          <p>
            Track stock quantity, warehouse location, dispatch impact,
            and low-stock risk from one live module.
          </p>

        </div>

        <div className="inventory-role-card">

          <FaUserShield />

          <span>Current Role</span>

          <strong>{roleLabel}</strong>

          <p>{roleAccessText}</p>

        </div>

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

      <div className="inventory-summary">

        <div className="inventory-stat-card">
          <FaBoxes />
          <span>Total Inventory</span>
          <strong>{totalStock}</strong>
          <small>Units available</small>
        </div>

        <div className="inventory-stat-card">
          <FaClipboardCheck />
          <span>Product Records</span>
          <strong>{inventory.length}</strong>
          <small>SKU entries</small>
        </div>

        <div className="inventory-stat-card warning">
          <FaExclamationTriangle />
          <span>Low Stock</span>
          <strong>{lowStockCount}</strong>
          <small>Below 10 units</small>
        </div>

        <div className="inventory-stat-card">
          <FaWarehouse />
          <span>Warehouses</span>
          <strong>{warehouseCount}</strong>
          <small>Active locations</small>
        </div>

      </div>

      <div className="inventory-insights">

        <div className="inventory-panel">

          <div className="panel-heading">
            <FaExclamationTriangle />
            <h2>Low Stock Alert</h2>
          </div>

          {lowStockItems.length > 0 ? (

            <div className="low-stock-list">

              {lowStockItems.map((item) => (

                <div
                  className="low-stock-item"
                  key={item.id}
                >
                  <strong>{item.productName}</strong>
                  <span>{item.quantity} left in {item.warehouseName}</span>
                </div>

              ))}

            </div>

          ) : (

            <p className="panel-empty">
              All products are above the low-stock limit.
            </p>

          )}

        </div>

        <div className="inventory-panel">

          <div className="panel-heading">
            <FaMapMarkerAlt />
            <h2>Warehouse Tracking</h2>
          </div>

          {warehouseStock.length > 0 ? (

            <div className="warehouse-list">

              {warehouseStock.map(([warehouseName, stock]) => (

                <div
                  className="warehouse-row"
                  key={warehouseName}
                >
                  <span>{warehouseName}</span>
                  <strong>{stock} units</strong>
                </div>

              ))}

            </div>

          ) : (

            <p className="panel-empty">
              Add inventory to start warehouse-wise tracking.
            </p>

          )}

        </div>

      </div>

      <div className="inventory-toolbar">

        <input
          type="text"
          placeholder="Search inventory..."
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
        />

      </div>

      <form
        className="product-form inventory-form"
        onSubmit={handleSubmit}
      >

        <input
          type="text"
          name="productName"
          placeholder="Product Name"
          value={formData.productName}
          onChange={handleChange}
          required
        />

        <input
          type="number"
          name="quantity"
          placeholder="Quantity"
          value={formData.quantity}
          onChange={handleChange}
          required
        />

        <input
          type="text"
          name="warehouseName"
          placeholder="Warehouse Name"
          value={formData.warehouseName}
          onChange={handleChange}
          required
        />

        <button
          type="submit"
          disabled={!canSubmit}
          title={!canSubmit ? "This role does not have this access" : ""}
        >

          {
            editingId ?

            "Update Inventory"

            :

            "Add Inventory"
          }

        </button>

      </form>

      <div className="inventory-table-wrap">

      <table className="product-table inventory-table">

        <thead>

          <tr>

            <th>ID</th>

            <th>Product</th>

            <th>Quantity</th>

            <th>Warehouse</th>

            <th>Actions</th>

          </tr>

        </thead>

        <tbody>

          {filteredInventory.length > 0 ? (

          filteredInventory.map((item) => (

            <tr key={item.id}>

              <td>{item.id}</td>

              <td>{item.productName}</td>

              <td>
                {item.quantity}
                <span className={
                  Number(item.quantity) < 10
                    ? "stock-badge low"
                    : "stock-badge ok"
                }>
                  {Number(item.quantity) < 10 ? "Low Stock" : "OK"}
                </span>
              </td>

              <td>{item.warehouseName}</td>

              <td>

                <button
                  className="action-btn edit-btn"
                  disabled={!canUpdate}
                  title={!canUpdate ? "Edit access is not allowed" : ""}
                  onClick={() =>
                    handleEdit(item)}
                >

                  <FaEdit />

                  {" "}Edit

                </button>

                <button
                  className="action-btn delete-btn"
                  disabled={!canDelete}
                  title={!canDelete ? "Delete access is admin only" : ""}
                  onClick={() =>
                    handleDelete(item.id)}
                >

                  <FaTrash />

                  {" "}Delete

                </button>

              </td>

            </tr>

          ))

          ) : (

            <tr>

              <td colSpan="5">
                No Inventory Available
              </td>

            </tr>

          )}

        </tbody>

      </table>

      </div>

    </div>
  );
}

export default InventoryPage;
