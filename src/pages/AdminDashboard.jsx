import './Dashboard.css';

import {
  useEffect,
  useState
} from "react";

import axios from "axios";

import {
  getProductCount,
  getOrderCount
} from "../services/ProductService";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

import {
  applyTheme,
  getPreference,
  setPreference,
  translations,
  parseOrderDetails
} from "../utils/appPreferences";

import {
  getProductCategory
} from "../utils/appPreferences";

import {
  FaBoxOpen,
  FaWarehouse,
  FaShoppingCart,
  FaUsers,
  FaClipboardList,
  FaChartLine,
  FaCog,
  FaSignOutAlt,
  FaSearch,
  FaBars,
  FaShoppingBag,
  FaRupeeSign,
  FaStar,
  FaMoon,
  FaSun,
  FaGlobe,
  FaExchangeAlt,
  FaFileAlt,
  FaArrowDown,
  FaArrowUp,
  FaBell,
  FaUserCircle
} from 'react-icons/fa';

import { useNavigate } from 'react-router-dom';

const DEMO_WAREHOUSES = [
  "Main Warehouse",
  "Delhi Warehouse",
  "Mumbai Warehouse",
  "Chennai Warehouse",
  "Kolkata Warehouse"
];

const MONTHLY_INVENTORY_POINTS = [
  3200,
  5400,
  5000,
  7100,
  4100,
  6200,
  5200,
  8000,
  6400,
  7200,
  5100,
  9000
];

const formatDate = (value) => {
  if (!value) {
    return "Today";
  }

  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "Today";
  }

  return date.toLocaleDateString("en-GB", {
    day: "2-digit",
    month: "short",
    year: "numeric"
  });
};

const getOrderDate = (order, index) => {
  return formatDate(order.orderDate || order.date || order.createdAt) ||
    `${11 - index} May 2026`;
};

const getDisplayOrderId = (order, index = 0) => {
  return (
    order.orderCode ||
    `ORD-${String(order.id || index + 1).padStart(5, "0")}`
  );
};

const getWarehouseName = (item, index) => {
  return (
    item.warehouseName ||
    item.warehouse ||
    DEMO_WAREHOUSES[index % DEMO_WAREHOUSES.length]
  );
};

const getStockStatus = (quantity) => {
  const stock = Number(quantity || 0);

  if (stock <= 0) {
    return "out";
  }

  if (stock < 10) {
    return "low";
  }

  return "in";
};

function AdminDashboard() {

  const navigate = useNavigate();

  const roleLabel = getRoleLabel();

  const canManageUsers = canAccess("manageUsers");
  const canOpenSettings = canAccess("settings");
  const isUser = roleLabel === "USER";
  const [language, setLanguage] = useState(
    getPreference("language", "en")
  );
  const [theme, setTheme] = useState(
    getPreference("theme", "dark")
  );
  const t = translations[language] || translations.en;
  const email =
    localStorage.getItem("email") || "";
  const profileKeyBase =
    `profile:${roleLabel}:${email.toLowerCase()}`;
  const profileName =
    localStorage.getItem(`${profileKeyBase}:name`) ||
    email.split("@")[0] ||
    roleLabel;
  const profilePhoto =
    localStorage.getItem(`${profileKeyBase}:photo`);

  // PRODUCT COUNT

  const [productCount,
    setProductCount] = useState(0);

  // ORDER COUNT

  const [orderCount,
    setOrderCount] = useState(0);

  const [inventoryTotal,
    setInventoryTotal] = useState(0);

  const [warehouseCount,
    setWarehouseCount] = useState(0);

  const [dashboardWidgets,
    setDashboardWidgets] = useState({
      totalSales: 0,
      revenue: 0,
      topProduct: "No orders",
      monthlyGrowth: "0%"
    });

  const [dashboardOverview,
    setDashboardOverview] = useState({
      recentOrders: [],
      lowStockItems: [],
      inventorySummary: [],
      stockStatus: {
        low: 0,
        out: 0,
        in: 0
      }
    });

  useEffect(() => {
    applyTheme(theme);
    setPreference("theme", theme);
  }, [theme]);

  useEffect(() => {
    setPreference("language", language);
  }, [language]);

  useEffect(() => {

    fetchProductCount();

    fetchOrderCount();

    fetchInventoryTotal();

    fetchWarehouseCount();

    fetchDashboardWidgets();

    const realtime =
      setInterval(() => {
        fetchProductCount();
        fetchOrderCount();
        fetchInventoryTotal();
        fetchWarehouseCount();
        fetchDashboardWidgets();
      }, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);

  // Polling functions intentionally read latest API data on a fixed interval.
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // FETCH PRODUCT COUNT

  const fetchProductCount =
    async () => {

      try {

        const response =
          await getProductCount();

        setProductCount(
          response.data
        );

      } catch (error) {

        setProductCount(0);
      }
  };

  // FETCH ORDER COUNT

  const fetchOrderCount =
    async () => {

      try {

        const response =
          await getOrderCount();

        setOrderCount(
          response.data
        );

      } catch (error) {

        setOrderCount(0);
      }
  };

  const fetchDashboardWidgets =
    async () => {

      try {
        const [ordersResponse, productsResponse, inventoryResponse] =
          await Promise.all([
            axios.get("http://localhost:8080/api/orders"),
            axios.get("http://localhost:8080/api/products"),
            axios.get("http://localhost:8080/api/inventory")
          ]);
        const orders = ordersResponse.data || [];
        const products = productsResponse.data || [];
        const inventory = inventoryResponse.data || [];
        const productPriceMap =
          new Map(
            products.map((product) => [
              product.name?.toLowerCase(),
              Number(product.price || 0)
            ])
          );
        const productSales =
          new Map();
        const totalSales =
          orders.reduce((sum, order) => {
            const details = parseOrderDetails(order.customerName);
            const quantity = Number(details.quantity || 1);
            const productName = details.product || "Product";
            const price =
              productPriceMap.get(productName.toLowerCase()) || 0;

            productSales.set(
              productName,
              (productSales.get(productName) || 0) + quantity
            );

            return sum + quantity * price;
          }, 0);
        const topProduct =
          Array.from(productSales.entries())
            .sort((first, second) => second[1] - first[1])[0]?.[0] ||
          "No orders";

        setDashboardWidgets({
          totalSales: orders.length,
          revenue: totalSales,
          topProduct,
          monthlyGrowth:
            orders.length > 0
              ? `+${Math.min(orders.length * 4, 99)}%`
              : "0%"
        });

        const stockStatus =
          inventory.reduce(
            (summary, item) => {
              summary[getStockStatus(item.quantity)] += 1;
              return summary;
            },
            {
              low: 0,
              out: 0,
              in: 0
            }
          );

        const recentOrders =
          orders.slice(0, 5).map((order, index) => {
            const details = parseOrderDetails(order.customerName);

            return {
              id: getDisplayOrderId(order, index),
              customer: details.customer || order.customerName || "Customer",
              warehouse: getWarehouseName(order, index),
              status: order.status || "Pending",
              date: getOrderDate(order, index)
            };
          });

        const lowStockItems =
          inventory
            .filter((item) => Number(item.quantity || 0) < 10)
            .slice(0, 5)
            .map((item, index) => ({
              product:
                item.productName ||
                item.name ||
                products[index]?.name ||
                "Product",
              sku:
                item.sku ||
                `${String(item.productName || "WMS")
                  .slice(0, 3)
                  .toUpperCase()}-${String(index + 1).padStart(3, "0")}`,
              warehouse: getWarehouseName(item, index),
              availableStock: Number(item.quantity || 0)
            }));

        const inventorySummary =
          inventory.slice(0, 5).map((item, index) => {
            const totalStock = Number(item.quantity || 0);
            const reservedStock =
              Math.max(0, Math.round(totalStock * 0.2));

            return {
              product:
                item.productName ||
                item.name ||
                products[index]?.name ||
                "Product",
              sku:
                item.sku ||
                `${String(item.productName || "WMS")
                  .slice(0, 3)
                  .toUpperCase()}-${String(index + 1).padStart(3, "0")}`,
              category:
                getProductCategory(products[index] || item),
              warehouse: getWarehouseName(item, index),
              totalStock,
              availableStock: Math.max(0, totalStock - reservedStock),
              reservedStock
            };
          });

        setDashboardOverview({
          recentOrders,
          lowStockItems,
          inventorySummary,
          stockStatus
        });
      } catch (error) {
        setDashboardWidgets({
          totalSales: orderCount,
          revenue: 0,
          topProduct: "No orders",
          monthlyGrowth: "0%"
        });

        setDashboardOverview({
          recentOrders: [],
          lowStockItems: [],
          inventorySummary: [],
          stockStatus: {
            low: 0,
            out: 0,
            in: 0
          }
        });
      }
  };

  const fetchInventoryTotal =
    async () => {

      try {

        const response =
          await axios.get(
            "http://localhost:8080/api/inventory"
          );

        const total =
          response.data.reduce(
            (sum, item) =>
              sum + Number(item.quantity || 0),
            0
          );

        setInventoryTotal(total);

      } catch (error) {

        setInventoryTotal(0);
      }
  };

  const fetchWarehouseCount =
    async () => {

      try {

        const response =
          await axios.get(
            "http://localhost:8080/api/warehouses/count"
          );

        setWarehouseCount(response.data);

      } catch (error) {

        setWarehouseCount(0);
      }
  };

  const totalStockGroups =
    dashboardOverview.stockStatus.low +
    dashboardOverview.stockStatus.out +
    dashboardOverview.stockStatus.in;
  const lowStockPercent =
    totalStockGroups
      ? Math.round((dashboardOverview.stockStatus.low / totalStockGroups) * 100)
      : 0;
  const outStockPercent =
    totalStockGroups
      ? Math.round((dashboardOverview.stockStatus.out / totalStockGroups) * 100)
      : 0;
  const inStockPercent =
    totalStockGroups
      ? Math.max(0, 100 - lowStockPercent - outStockPercent)
      : 0;
  const chartMax =
    Math.max(...MONTHLY_INVENTORY_POINTS);
  const chartPoints =
    MONTHLY_INVENTORY_POINTS.map((point, index) => {
      const x =
        (index / (MONTHLY_INVENTORY_POINTS.length - 1)) * 100;
      const y =
        100 - ((point / chartMax) * 100);

      return `${x},${y}`;
    }).join(" ");

  return (

    <div className="dashboard-container">

      {/* SIDEBAR */}

      <div className="sidebar">

        <div className="logo">

          <h2>WMS</h2>

          <p>
            Warehouse Management System
          </p>

        </div>

        <ul>

          <li className="active">

            <FaChartLine />

            Dashboard

          </li>

          <li
            onClick={() =>
              navigate("/products")}>

            {isUser ? <FaShoppingBag /> : <FaBoxOpen />}

            {isUser ? "Shop Products" : "Products"}

          </li>

          {!isUser && (

          <li>

            <FaWarehouse />

            Warehouses

          </li>

          )}

        {!isUser && (

        <li
          onClick={() =>
            navigate("/inventory")}>
            
            <FaClipboardList />
            
          Inventory
            
        </li>

        )}

          {!isUser && (

          <li
            onClick={() =>
              navigate("/incoming")}>

            <FaArrowDown />

            Incoming

          </li>

          )}

          {!isUser && (

          <li
            onClick={() =>
              navigate("/outgoing")}>

            <FaArrowUp />

            Outgoing

          </li>

          )}

          {!isUser && (

          <li
            onClick={() =>
              navigate("/stock-transfer")}>

            <FaExchangeAlt />

            Stock Transfer

          </li>

          )}

          <li
            onClick={() =>
              navigate("/orders")}>

            <FaShoppingCart />

            {isUser ? "My Orders" : "Orders"}

          </li>

          {!isUser && (

          <li>

            <FaFileAlt />

            Reports

          </li>

          )}

          <li
            className={!canManageUsers ? "locked" : ""}
            title={!canManageUsers ? "Users access is admin only" : ""}
            onClick={() =>
              canManageUsers && navigate("/users")}>
              
            <FaUsers />
              
              Users
                
          </li>

          <li
            className={!canOpenSettings ? "locked" : ""}
            title={!canOpenSettings ? "Settings access is admin only" : ""}
            onClick={() =>
              canOpenSettings && navigate("/settings")}>

            <FaCog />

            Settings

          </li>

          <li
            onClick={() => {
              localStorage.removeItem("role");
              navigate("/");
            }}>

            <FaSignOutAlt />

            Logout

          </li>

        </ul>

      </div>

      {/* MAIN */}

      <div className="main-content">

        {/* TOPBAR */}

        <div className="topbar">

          <div className="top-left">

            <FaBars />

            <h1>
              {isUser ? t.shoppingDashboard : t.dashboard}
            </h1>

          </div>

          <div className="top-right">

            <div className="search-box">

              <input
                type="text"
                placeholder="Search..."
              />

              <FaSearch />

            </div>

            <div className="notification">

              <FaBell />

              <span>3</span>

            </div>

            <div className="preference-controls">

              <label title={t.language}>
                <FaGlobe />
                <select
                  value={language}
                  onChange={(e) => setLanguage(e.target.value)}
                >
                  <option value="en">English</option>
                  <option value="hi">Hindi</option>
                </select>
              </label>

              <button
                type="button"
                onClick={() =>
                  setTheme(theme === "dark" ? "light" : "dark")}
                title={theme === "dark" ? t.lightMode : t.darkMode}
              >
                {theme === "dark" ? <FaSun /> : <FaMoon />}
              </button>

            </div>

            <div className="admin-profile">

              <img
                src={
                  profilePhoto ||
                  "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                }
                alt="admin"
              />

              <h3>
                {profileName}
              </h3>

              <FaUserCircle className="profile-caret" />

            </div>

          </div>

        </div>

        {/* CARDS */}

        <div className="stats-grid">

          <div className="card blue">

            <div>

              <p>Total Products</p>

              <h2>{productCount}</h2>

              <span className="stat-trend">+12 this month</span>

            </div>

            <FaBoxOpen />

          </div>

          <div className="card green">

            <div>

              <p>Total Warehouses</p>

              <h2>{isUser ? "2-4d" : warehouseCount}</h2>

              <span className="stat-trend">+1 this month</span>

            </div>

            <FaWarehouse />

          </div>

          <div className="card orange">

            <div>

              <p>{isUser ? "Delivery Tracking" : "Total Inventory"}</p>

              <h2>{isUser ? "Live" : inventoryTotal}</h2>

              <span className="stat-trend">+320 this month</span>

            </div>

            <FaClipboardList />

          </div>

          <div className="card purple">

            <div>

              <p>Total Orders</p>

              <h2>{orderCount}</h2>

              <span className="stat-trend">+15 this month</span>

            </div>

            <FaShoppingCart />

          </div>

        </div>

        {!isUser && (

        <div className="dashboard-analytics-grid">

          <section className="dashboard-panel inventory-overview-panel">

            <div className="panel-header">

              <h2>Inventory Overview</h2>

              <select>
                <option>This Month</option>
                <option>Last Month</option>
                <option>This Quarter</option>
              </select>

            </div>

            <div className="line-chart">

              <div className="chart-scale">
                <span>10K</span>
                <span>8K</span>
                <span>6K</span>
                <span>4K</span>
                <span>2K</span>
                <span>0</span>
              </div>

              <div className="chart-canvas">

                <svg
                  viewBox="0 0 100 100"
                  preserveAspectRatio="none"
                  aria-label="Inventory monthly trend"
                >
                  <polyline
                    className="line-chart-area"
                    points={`0,100 ${chartPoints} 100,100`}
                  />
                  <polyline
                    className="line-chart-line"
                    points={chartPoints}
                  />
                </svg>

                <div className="chart-months">
                  <span>01 May</span>
                  <span>05 May</span>
                  <span>10 May</span>
                  <span>15 May</span>
                  <span>20 May</span>
                  <span>25 May</span>
                  <span>30 May</span>
                </div>

              </div>

            </div>

          </section>

          <section className="dashboard-panel stock-status-panel">

            <h2>Stock Status</h2>

            <div className="stock-status-content">

              <div
                className="stock-donut"
                style={{
                  "--low": `${lowStockPercent}%`,
                  "--out": `${lowStockPercent + outStockPercent}%`
                }}
              >
                <span></span>
              </div>

              <div className="stock-legend">

                <div>
                  <span className="legend-dot low"></span>
                  Low Stock
                  <strong>
                    {dashboardOverview.stockStatus.low} ({lowStockPercent}%)
                  </strong>
                </div>

                <div>
                  <span className="legend-dot out"></span>
                  Out of Stock
                  <strong>
                    {dashboardOverview.stockStatus.out} ({outStockPercent}%)
                  </strong>
                </div>

                <div>
                  <span className="legend-dot in"></span>
                  In Stock
                  <strong>
                    {dashboardOverview.stockStatus.in} ({inStockPercent}%)
                  </strong>
                </div>

              </div>

            </div>

          </section>

        </div>

        )}

        {!isUser && (

        <div className="dashboard-table-grid">

          <section className="dashboard-panel">

            <div className="panel-header">
              <h2>Recent Orders</h2>
              <button onClick={() => navigate("/orders")}>View All</button>
            </div>

            <div className="table-scroll">

              <table className="dashboard-table">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Warehouse</th>
                    <th>Status</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  {dashboardOverview.recentOrders.length === 0 && (
                    <tr>
                      <td colSpan="5" className="empty-row">
                        No recent orders yet
                      </td>
                    </tr>
                  )}
                  {dashboardOverview.recentOrders.map((order) => (
                    <tr key={order.id}>
                      <td className="link-cell">#{order.id}</td>
                      <td>{order.customer}</td>
                      <td>{order.warehouse}</td>
                      <td>
                        <span
                          className={`status-pill ${order.status
                            .toLowerCase()
                            .replaceAll(" ", "-")}`}
                        >
                          {order.status}
                        </span>
                      </td>
                      <td>{order.date}</td>
                    </tr>
                  ))}
                </tbody>
              </table>

            </div>

          </section>

          <section className="dashboard-panel">

            <div className="panel-header">
              <h2>Low Stock Alert</h2>
              <button onClick={() => navigate("/inventory")}>View All</button>
            </div>

            <div className="table-scroll">

              <table className="dashboard-table">
                <thead>
                  <tr>
                    <th>Product</th>
                    <th>SKU</th>
                    <th>Warehouse</th>
                    <th>Available Stock</th>
                  </tr>
                </thead>
                <tbody>
                  {dashboardOverview.lowStockItems.length === 0 && (
                    <tr>
                      <td colSpan="4" className="empty-row">
                        No low stock alerts
                      </td>
                    </tr>
                  )}
                  {dashboardOverview.lowStockItems.map((item) => (
                    <tr key={`${item.sku}-${item.warehouse}`}>
                      <td>{item.product}</td>
                      <td>{item.sku}</td>
                      <td>{item.warehouse}</td>
                      <td className="danger-cell">{item.availableStock}</td>
                    </tr>
                  ))}
                </tbody>
              </table>

            </div>

          </section>

        </div>

        )}

        {!isUser && (

        <section className="dashboard-panel inventory-summary-panel">

          <div className="panel-header">
            <h2>Inventory Summary</h2>
            <button onClick={() => navigate("/inventory")}>View All</button>
          </div>

          <div className="table-scroll">

            <table className="dashboard-table">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>SKU</th>
                  <th>Category</th>
                  <th>Warehouse</th>
                  <th>Total Stock</th>
                  <th>Available Stock</th>
                  <th>Reserved Stock</th>
                </tr>
              </thead>
              <tbody>
                {dashboardOverview.inventorySummary.length === 0 && (
                  <tr>
                    <td colSpan="7" className="empty-row">
                      Inventory summary will appear after stock is added
                    </td>
                  </tr>
                )}
                {dashboardOverview.inventorySummary.map((item) => (
                  <tr key={`${item.sku}-${item.product}`}>
                    <td>{item.product}</td>
                    <td>{item.sku}</td>
                    <td>{item.category}</td>
                    <td>{item.warehouse}</td>
                    <td>{item.totalStock}</td>
                    <td>{item.availableStock}</td>
                    <td>{item.reservedStock}</td>
                  </tr>
                ))}
              </tbody>
            </table>

          </div>

        </section>

        )}

        <div className="quick-panel">

          <h2>
            {isUser ? "Quick Shopping Actions" : "Operations Control"}
          </h2>

          <div className="quick-grid">

            <button onClick={() => navigate("/products")}>
              {isUser ? "Browse Products" : "Manage Products"}
            </button>

            <button onClick={() => navigate("/orders")}>
              {isUser ? "Track Orders" : "Update Order Status"}
            </button>

            <button onClick={() => navigate("/settings")}>
              Edit Profile
            </button>

            {!isUser && (
              <button onClick={() => navigate("/inventory")}>
                Inventory Control
              </button>
            )}

          </div>

          {!isUser && (

          <div className="card teal">

            <div>

              <p>{t.totalSales}</p>

              <h2>{dashboardWidgets.totalSales}</h2>

            </div>

            <FaShoppingCart />

          </div>

          )}

          {!isUser && (

          <div className="card rose">

            <div>

              <p>{t.revenue}</p>

              <h2>Rs {dashboardWidgets.revenue}</h2>

            </div>

            <FaRupeeSign />

          </div>

          )}

          {!isUser && (

          <div className="card indigo">

            <div>

              <p>{t.topProduct}</p>

              <h2>{dashboardWidgets.topProduct}</h2>

            </div>

            <FaStar />

          </div>

          )}

          {!isUser && (

          <div className="card cyan">

            <div>

              <p>{t.monthlyGrowth}</p>

              <h2>{dashboardWidgets.monthlyGrowth}</h2>

            </div>

            <FaChartLine />

          </div>

          )}

        </div>

      </div>

    </div>
  );
}

export default AdminDashboard;
