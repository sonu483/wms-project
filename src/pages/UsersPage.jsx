import React,
{
  useEffect,
  useState
} from "react";

import "./ProductPage.css";

import axios from "axios";

import {
  FaTrash,
  FaHome
} from "react-icons/fa";

import {
  useNavigate
} from "react-router-dom";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

function UsersPage() {

  const navigate =
    useNavigate();

  const [users,
    setUsers] = useState([]);

  const [errorMessage,
    setErrorMessage] = useState("");

  const canManageUsers = canAccess("manageUsers");
  const roleLabel = getRoleLabel();

  useEffect(() => {

    fetchUsers();

    const realtime =
      setInterval(fetchUsers, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);

  }, []);

  const fetchUsers =
    async () => {

      try {

        const response =
          await axios.get(
            "http://localhost:8080/api/users"
          );

        setUsers(response.data);
        setErrorMessage("");

      } catch (error) {

        setUsers([]);
        setErrorMessage(
          "Users backend is not connected. Please start Eclipse backend on port 8080."
        );
      }
  };

  const handleDelete =
    async (id) => {

      if (!canManageUsers) {
        return;
      }

      try {

        await axios.delete(

          `http://localhost:8080/api/users/${id}`
        );

        fetchUsers();

      } catch (error) {

        setErrorMessage("User delete failed. Please check backend connection.");
      }
  };

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
          Users Management
        </h1>

        <div></div>

      </div>

      <p className="access-note">
        Current Role: {roleLabel} | Access: {
          canManageUsers ? "Full Control" : "View Only"
        }
      </p>

      {errorMessage && (
        <div className="page-error-message">
          {errorMessage}
        </div>
      )}

      <table className="product-table">

        <thead>

          <tr>

            <th>ID</th>

            <th>Name</th>

            <th>Email</th>

            <th>Role</th>

            <th>Actions</th>

          </tr>

        </thead>

        <tbody>

          {users.map((user) => (

            <tr key={user.id}>

              <td>{user.id}</td>

              <td>{user.name}</td>

              <td>{user.email}</td>

              <td>{user.role}</td>

              <td>

                <button
                  className="action-btn delete-btn"
                  disabled={!canManageUsers}
                  title={!canManageUsers ? "User delete access is admin only" : ""}
                  onClick={() =>
                    handleDelete(user.id)}
                >

                  <FaTrash />

                  {" "}Delete

                </button>

              </td>

            </tr>

          ))}

        </tbody>

      </table>

    </div>
  );
}

export default UsersPage;
