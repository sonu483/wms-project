import './Profile.css';

import {
  useState,
  useEffect
} from "react";

import {
  useNavigate
} from "react-router-dom";

import {
  FaCamera,
  FaEnvelope,
  FaHome,
  FaLock,
  FaPhone,
  FaSave,
  FaUser
} from "react-icons/fa";

function ProfilePage() {

  const navigate = useNavigate();

  const [message, setMessage] = useState("");

  const [user, setUser] = useState({
    username: "",
    email: "",
    mobile: "",
    address: "",
    password: "",
    confirmPassword: "",
    role: "",
    photo: ""
  });

  useEffect(() => {

    setUser({
      username:
        localStorage.getItem("profileName") || "User",
      email:
        localStorage.getItem("email") || "",
      mobile:
        localStorage.getItem("profileMobile") || "",
      address:
        localStorage.getItem("profileAddress") || "",
      password: "",
      confirmPassword: "",
      role:
        localStorage.getItem("role") || "USER",
      photo:
        localStorage.getItem("profilePhoto") || ""
    });

  }, []);

  const handleChange = (e) => {

    setUser({
      ...user,
      [e.target.name]: e.target.value
    });
  };

  const handlePhotoChange = (e) => {

    const file = e.target.files?.[0];

    if (!file) {
      return;
    }

    const reader = new FileReader();

    reader.onloadend = () => {
      setUser({
        ...user,
        photo: reader.result
      });
    };

    reader.readAsDataURL(file);
  };

  const handleUpdate = (e) => {

    e.preventDefault();

    if (user.password && user.password !== user.confirmPassword) {
      setMessage("Password and confirm password do not match.");
      return;
    }

    localStorage.setItem("profileName", user.username || "");
    localStorage.setItem("email", user.email || "");
    localStorage.setItem("profileMobile", user.mobile || "");
    localStorage.setItem("profileAddress", user.address || "");
    localStorage.setItem("profilePhoto", user.photo || "");

    if (user.password) {
      localStorage.setItem("profilePassword", user.password);
    }

    setMessage("Profile updated successfully.");
  };

  return (

    <div className="profile-container">

      <div className="profile-shell">

        <div className="profile-topbar">

          <button
            className="profile-home-btn"
            onClick={() => navigate("/admin")}
          >
            <FaHome /> Home
          </button>

          <div>
            <h1>Edit Profile</h1>
            <p>Manage your account details, contact info and password.</p>
          </div>

        </div>

        <form
          className="profile-layout"
          onSubmit={handleUpdate}
        >

          <div className="profile-photo-panel">

            <div className="profile-avatar">
              {user.photo ? (
                <img src={user.photo} alt="profile" />
              ) : (
                <FaUser />
              )}
            </div>

            <label className="photo-upload-btn">
              <FaCamera /> Upload Photo
              <input
                type="file"
                accept="image/*"
                onChange={handlePhotoChange}
              />
            </label>

            <div className="role-badge">
              {user.role}
            </div>

          </div>

          <div className="profile-form-panel">

            <div className="form-grid">

              <label>
                Full Name
                <div className="input-icon">
                  <FaUser />
                  <input
                    type="text"
                    name="username"
                    value={user.username}
                    onChange={handleChange}
                    placeholder="Enter full name"
                    required
                  />
                </div>
              </label>

              <label>
                Email Address
                <div className="input-icon">
                  <FaEnvelope />
                  <input
                    type="email"
                    name="email"
                    value={user.email}
                    onChange={handleChange}
                    placeholder="Enter email"
                    required
                  />
                </div>
              </label>

              <label>
                Mobile Number
                <div className="input-icon">
                  <FaPhone />
                  <input
                    type="tel"
                    name="mobile"
                    value={user.mobile}
                    onChange={handleChange}
                    placeholder="Enter mobile number"
                  />
                </div>
              </label>

              <label>
                Role
                <input
                  type="text"
                  value={user.role}
                  disabled
                />
              </label>

            </div>

            <label>
              Address
              <textarea
                name="address"
                value={user.address}
                onChange={handleChange}
                placeholder="Enter delivery address"
              ></textarea>
            </label>

            <div className="password-section">

              <h2>Password Settings</h2>

              <div className="form-grid">

                <label>
                  New Password
                  <div className="input-icon">
                    <FaLock />
                    <input
                      type="password"
                      name="password"
                      value={user.password}
                      onChange={handleChange}
                      placeholder="Enter new password"
                    />
                  </div>
                </label>

                <label>
                  Confirm Password
                  <div className="input-icon">
                    <FaLock />
                    <input
                      type="password"
                      name="confirmPassword"
                      value={user.confirmPassword}
                      onChange={handleChange}
                      placeholder="Confirm new password"
                    />
                  </div>
                </label>

              </div>

            </div>

            {message && (
              <p className="profile-message">
                {message}
              </p>
            )}

            <button
              className="profile-save-btn"
              type="submit"
            >
              <FaSave /> Save Profile
            </button>

          </div>

        </form>

      </div>

    </div>
  );
}

export default ProfilePage;
