import "./Sidebar.css";

import { useNavigate } from "react-router-dom";

function Sidebar() {

  const navigate = useNavigate();

  const handleLogout = () => {

    localStorage.removeItem("role");

    navigate("/");
  };

  return (

    <div className="sidebar">

      <h2>WMS PANEL</h2>

      <ul>

        <li onClick={() => navigate("/admin")}>
          Dashboard
        </li>

        <li onClick={() => navigate("/products")}>
          Products
        </li>

        <li onClick={() => navigate("/settings")}>
          Settings
        </li>

        <li onClick={handleLogout}>
          Logout
        </li>

      </ul>

    </div>
  );
}

export default Sidebar;