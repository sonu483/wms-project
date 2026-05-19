import './Settings.css';

import {
  useEffect,
  useState
} from 'react';

import {
  FaHome,
  FaCamera,
  FaEnvelope,
  FaLock,
  FaMapMarkerAlt,
  FaPhone,
  FaSave,
  FaUser
} from "react-icons/fa";

import {
  useNavigate
} from 'react-router-dom';

import {
  applyTheme,
  getPreference,
  setPreference,
  translations
} from "../utils/appPreferences";

function SettingsPage() {

  const navigate = useNavigate();

  const [activeTab,
    setActiveTab] = useState("profile");

  const [message,
    setMessage] = useState("");
  const [theme,
    setTheme] = useState(getPreference("theme", "dark"));
  const [language,
    setLanguage] = useState(getPreference("language", "en"));

  const [profile,
    setProfile] = useState({
      name: "",
      email: "",
      mobile: "",
      address: "",
      role: "",
      photo: "",
      password: "",
      confirmPassword: ""
    });

  const getProfileKey = (field) => {
    const role =
      (localStorage.getItem("role") || "USER").toUpperCase();
    const email =
      (localStorage.getItem("email") || "guest").toLowerCase();

    return `profile:${role}:${email}:${field}`;
  };

  const t = translations[language] || translations.en;

  useEffect(() => {

    const role =
      localStorage.getItem("role") || "USER";
    const email =
      localStorage.getItem("email") || "";

    setProfile({
      name:
        localStorage.getItem(getProfileKey("name")) ||
        email.split("@")[0] ||
        "User",
      email:
        email,
      mobile:
        localStorage.getItem(getProfileKey("mobile")) || "",
      address:
        localStorage.getItem(getProfileKey("address")) || "",
      role:
        role,
      photo:
        localStorage.getItem(getProfileKey("photo")) || "",
      password: "",
      confirmPassword: ""
    });

    applyTheme(theme);

  }, [theme]);

  const handleSavePreferences = () => {
    setPreference("theme", theme);
    setPreference("language", language);
    applyTheme(theme);
    setMessage("Preferences saved successfully.");
  };

  const handleProfileChange = (e) => {

    setProfile({
      ...profile,
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
      setProfile({
        ...profile,
        photo: reader.result
      });
    };

    reader.readAsDataURL(file);
  };

  const handleSaveProfile = (e) => {

    e.preventDefault();

    if (profile.password && profile.password !== profile.confirmPassword) {
      setMessage("Password and confirm password do not match.");
      return;
    }

    const oldEmail =
      localStorage.getItem("email") || "";

    localStorage.setItem(getProfileKey("name"), profile.name || "");
    localStorage.setItem(getProfileKey("mobile"), profile.mobile || "");
    localStorage.setItem(getProfileKey("address"), profile.address || "");
    localStorage.setItem(getProfileKey("photo"), profile.photo || "");
    localStorage.setItem("email", profile.email || "");

    if (profile.email !== oldEmail) {
      const newRole =
        (localStorage.getItem("role") || "USER").toUpperCase();
      const newEmail =
        (profile.email || "guest").toLowerCase();

      localStorage.setItem(`profile:${newRole}:${newEmail}:name`, profile.name || "");
      localStorage.setItem(`profile:${newRole}:${newEmail}:mobile`, profile.mobile || "");
      localStorage.setItem(`profile:${newRole}:${newEmail}:address`, profile.address || "");
      localStorage.setItem(`profile:${newRole}:${newEmail}:photo`, profile.photo || "");
    }

    if (profile.password) {
      localStorage.setItem(getProfileKey("password"), profile.password);
    }

    setMessage("Profile updated successfully.");
  };

  return (

    <div className="settings-container">

      <div className="settings-sidebar">

        <h2>Settings</h2>

        <button
          className="settings-home-btn"
          onClick={() => navigate("/admin")}
        >
          <FaHome /> Home
        </button>

        <ul>

          <li
            className={activeTab === "profile" ? "active" : ""}
            onClick={() =>
              setActiveTab("profile")}>

            Profile

          </li>

          <li
            className={activeTab === "notifications" ? "active" : ""}
            onClick={() =>
              setActiveTab("notifications")}>

            Notifications

          </li>

          <li
            className={activeTab === "theme" ? "active" : ""}
            onClick={() =>
              setActiveTab("theme")}>

            Theme

          </li>

        </ul>

      </div>

      <div className="settings-content">

        {
          activeTab === "profile" &&

          <form
            className="settings-profile-form"
            onSubmit={handleSaveProfile}
          >

            <div className="settings-heading">
              <h1>Edit Profile</h1>
              <p>Update your photo, name, contact details and password.</p>
            </div>

            <div className="profile-editor">

              <div className="profile-photo-card">

                <div className="profile-preview">
                  {profile.photo ? (
                    <img src={profile.photo} alt="profile" />
                  ) : (
                    <FaUser />
                  )}
                </div>

                <label className="photo-btn">
                  <FaCamera /> Upload Photo
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handlePhotoChange}
                  />
                </label>

                <span className="settings-role-badge">
                  {profile.role}
                </span>

              </div>

              <div className="profile-fields-card">

                <div className="settings-grid">

                  <label>
                    Full Name
                    <div className="settings-input-icon">
                      <FaUser />
                      <input
                        type="text"
                        name="name"
                        value={profile.name}
                        onChange={handleProfileChange}
                        placeholder="Enter full name"
                        required
                      />
                    </div>
                  </label>

                  <label>
                    Email Address
                    <div className="settings-input-icon">
                      <FaEnvelope />
                      <input
                        type="email"
                        name="email"
                        value={profile.email}
                        onChange={handleProfileChange}
                        placeholder="Enter email"
                        required
                      />
                    </div>
                  </label>

                  <label>
                    Mobile Number
                    <div className="settings-input-icon">
                      <FaPhone />
                      <input
                        type="tel"
                        name="mobile"
                        value={profile.mobile}
                        onChange={handleProfileChange}
                        placeholder="Enter mobile number"
                      />
                    </div>
                  </label>

                  <label>
                    Role
                    <input
                      type="text"
                      value={profile.role}
                      disabled
                    />
                  </label>

                </div>

                <label>
                  Address
                  <div className="settings-input-icon textarea-icon">
                    <FaMapMarkerAlt />
                    <textarea
                      name="address"
                      value={profile.address}
                      onChange={handleProfileChange}
                      placeholder="Enter address"
                    ></textarea>
                  </div>
                </label>

                <div className="password-panel">

                  <h2>Password</h2>

                  <div className="settings-grid">

                    <label>
                      New Password
                      <div className="settings-input-icon">
                        <FaLock />
                        <input
                          type="password"
                          name="password"
                          value={profile.password}
                          onChange={handleProfileChange}
                          placeholder="Enter new password"
                        />
                      </div>
                    </label>

                    <label>
                      Confirm Password
                      <div className="settings-input-icon">
                        <FaLock />
                        <input
                          type="password"
                          name="confirmPassword"
                          value={profile.confirmPassword}
                          onChange={handleProfileChange}
                          placeholder="Confirm password"
                        />
                      </div>
                    </label>

                  </div>

                </div>

                {message && (
                  <p className="settings-message">
                    {message}
                  </p>
                )}

                <button type="submit">
                  <FaSave /> SAVE PROFILE
                </button>

              </div>

            </div>

          </form>
        }

        {
          activeTab === "notifications" &&

          <div>

            <h1>
              Notification Settings
            </h1>

            <div className="toggle-box">

              <label>
                Email Notifications
              </label>

              <input type="checkbox" />

            </div>

            <div className="toggle-box">

              <label>
                Order Alerts
              </label>

              <input type="checkbox" />

            </div>

            <div className="toggle-box">

              <label>
                Inventory Alerts
              </label>

              <input type="checkbox" />

            </div>

          </div>
        }

        {
          activeTab === "theme" &&

          <div>

            <h1>{t.theme} Settings</h1>

            <label className="settings-select-label">
              {t.language}
              <select
                value={language}
                onChange={(e) => setLanguage(e.target.value)}
              >
                <option value="en">English</option>
                <option value="hi">Hindi</option>
              </select>
            </label>

            <label className="settings-select-label">
              {t.theme}
              <select
                value={theme}
                onChange={(e) => setTheme(e.target.value)}
              >
                <option value="light">{t.lightMode}</option>
                <option value="dark">{t.darkMode}</option>
              </select>
            </label>

            <button onClick={handleSavePreferences}>
              SAVE PREFERENCES
            </button>

          </div>
        }

      </div>

    </div>
  );
}

export default SettingsPage;
