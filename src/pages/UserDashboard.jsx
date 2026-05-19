import './Dashboard.css';

function UserDashboard() {

  return (

    <div className="dashboard-container">

      <div className="sidebar">

        <h2>USER PANEL</h2>

        <ul>

          <li>Dashboard</li>

          <li>Products</li>

          <li>My Orders</li>

          <li>Track Orders</li>

          <li>Logout</li>

        </ul>

      </div>

      <div className="main-content">

        <h1>
          USER DASHBOARD
        </h1>

        <div className="card-container">

          <div className="card">

            <h2>25</h2>

            <p>Available Products</p>

          </div>

          <div className="card">

            <h2>5</h2>

            <p>My Orders</p>

          </div>

        </div>

      </div>

    </div>
  );
}

export default UserDashboard;