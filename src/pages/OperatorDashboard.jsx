import './Dashboard.css';

function OperatorDashboard() {

  return (

    <div className="dashboard-container">

      <div className="sidebar">

        <h2>OPERATOR PANEL</h2>

        <ul>

          <li>Dashboard</li>

          <li>Dispatch Orders</li>

          <li>Update Stock</li>

          <li>Receive Products</li>

          <li>Logout</li>

        </ul>

      </div>

      <div className="main-content">

        <h1>
          OPERATOR DASHBOARD
        </h1>

        <div className="card-container">

          <div className="card">

            <h2>120</h2>

            <p>Orders Dispatched</p>

          </div>

          <div className="card">

            <h2>40</h2>

            <p>Products Received</p>

          </div>

        </div>

      </div>

    </div>
  );
}

export default OperatorDashboard;