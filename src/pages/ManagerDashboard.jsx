import './Dashboard.css';

function ManagerDashboard() {

  return (

    <div className="dashboard-container">

      <div className="sidebar">

        <h2>MANAGER PANEL</h2>

        <ul>

          <li>Dashboard</li>

          <li>Inventory</li>

          <li>Orders</li>

          <li>Reports</li>

          <li>Suppliers</li>

          <li>Logout</li>

        </ul>

      </div>

      <div className="main-content">

        <h1>
          MANAGER DASHBOARD
        </h1>

        <div className="card-container">

          <div className="card">

            <h2>500+</h2>

            <p>Inventory Items</p>

          </div>

          <div className="card">

            <h2>230+</h2>

            <p>Pending Orders</p>

          </div>

          <div className="card">

            <h2>32</h2>

            <p>Suppliers</p>

          </div>

        </div>

      </div>

    </div>
  );
}

export default ManagerDashboard;