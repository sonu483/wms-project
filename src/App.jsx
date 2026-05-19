import './App.css';

import axios from 'axios';

import OrdersPage from "./pages/OrdersPage";

import { useState } from 'react';

import UsersPage from "./pages/UsersPage";

import InventoryPage
  from "./pages/InventoryPage";

import {
  Routes,
  Route,
  useNavigate
} from 'react-router-dom';

import {
  FaGoogle,
  FaEye,
  FaEyeSlash,
  FaWarehouse
} from 'react-icons/fa';

import {
  signInWithPopup
} from "firebase/auth";

import {
  auth,
  provider
} from "./firebase";

import {
  applyTheme,
  getPreference,
  setPreference,
  translations
} from "./utils/appPreferences";

import AdminDashboard
  from './pages/AdminDashboard';

import ProductPage
  from './pages/ProductPage';

import SettingsPage
  from './pages/SettingsPage';

import ProfilePage
  from './pages/ProfilePage';

import StockMovementPage
  from './pages/StockMovementPage';

const STAFF_CREDENTIALS = {
  ADMIN: {
    email: "admin@wms.com",
    password: "admin@8757"
  },
  MANAGER: {
    email: "manager@wms.com",
    password: "manager@8757"
  },
  OPERATOR: {
    email: "operator@wms.com",
    password: "operator@8757"
  }
};

function LoginRegisterPage() {

  const navigate = useNavigate();

  const [showRegister,
    setShowRegister] = useState(false);

  const [message,
    setMessage] = useState('');

  const [showPassword,
    setShowPassword] = useState(false);

  const [showReset,
    setShowReset] = useState(false);
  const [language,
    setLanguage] = useState(getPreference("language", "en"));
  const [theme,
    setTheme] = useState(getPreference("theme", "dark"));
  const [otpStep,
    setOtpStep] = useState(null);
  const [otpInput,
    setOtpInput] = useState("");

  // LOGIN

  const [email,
    setEmail] = useState('');

  const [password,
    setPassword] = useState('');

  const [role,
    setRole] = useState('USER');

  const [resetEmail,
    setResetEmail] = useState('');

  // REGISTER

  const [name,
    setName] = useState('');

  const [registerEmail,
    setRegisterEmail] = useState('');

  const [phone,
    setPhone] = useState('');

  const [address,
    setAddress] = useState('');

  const [registerPassword,
    setRegisterPassword] = useState('');

  const [confirmPassword,
    setConfirmPassword] = useState('');

  const t = translations[language] || translations.en;

  const generateOtp = () => {
    return String(Math.floor(100000 + Math.random() * 900000));
  };

  const updateLanguage = (nextLanguage) => {
    setLanguage(nextLanguage);
    setPreference("language", nextLanguage);
  };

  const updateTheme = (nextTheme) => {
    setTheme(nextTheme);
    setPreference("theme", nextTheme);
    applyTheme(nextTheme);
  };

  const startOtpVerification = (type, afterVerify, targetEmail) => {
    const otp = generateOtp();

    setOtpStep({
      type,
      code: otp,
      email: targetEmail,
      afterVerify
    });
    setOtpInput("");
    setMessage(
      `OTP sent to ${targetEmail || "email"}. Demo OTP: ${otp}`
    );
  };

  const verifyOtp = async () => {
    if (!otpStep || otpInput !== otpStep.code) {
      setMessage("INVALID OTP");
      return;
    }

    await otpStep.afterVerify();
    setOtpStep(null);
    setOtpInput("");
  };

  // LOGIN API

  const handleLogin = async () => {

    const normalizedEmail = email.toLowerCase();
    const staffUser = STAFF_CREDENTIALS[role];
    const selectedStaffRole =
      Object.keys(STAFF_CREDENTIALS).find(
        (staffRole) =>
          STAFF_CREDENTIALS[staffRole].email === normalizedEmail
      );

    if (selectedStaffRole && selectedStaffRole !== role) {
      setMessage('PLEASE SELECT CORRECT ROLE FOR THIS ACCOUNT');
      return;
    }

    if (staffUser && normalizedEmail === staffUser.email) {

      if (
        normalizedEmail !== staffUser.email ||
        password !== staffUser.password
      ) {

        setMessage(
          'INVALID EMAIL, PASSWORD OR ROLE'
        );

        return;
      }

      localStorage.setItem("role", role);
      localStorage.setItem("email", email);

      setMessage(`${role} LOGIN SUCCESS`);

      navigate("/admin");

      return;
    }

    try {

      const response = await axios.post(

        'http://localhost:8080/api/auth/login',

        {
          email,
          password,
          role
        }
      );

      const loginMessage =
        response.data || "LOGIN SUCCESS";

      if (loginMessage.includes("INVALID")) {
        setMessage(loginMessage);
        return;
      }

      const responseRole =
        ["ADMIN", "MANAGER", "OPERATOR", "USER"].find(
          (loginRole) =>
            loginMessage.toUpperCase().startsWith(loginRole)
        ) || role;

      localStorage.setItem("role", responseRole);
      localStorage.setItem("email", email);

      setMessage(loginMessage);

      navigate("/admin");

    } catch (error) {

      setMessage('LOGIN FAILED');
    }
  };

  // REGISTER API

  const handleRegister = async () => {

    if(registerPassword !== confirmPassword) {

      setMessage('PASSWORD NOT MATCHED');

      return;
    }

    try {

      startOtpVerification(
        "register",
        async () => {
          await axios.post(

            'http://localhost:8080/api/auth/register',

            {
              username: name,

              email: registerEmail,

              password: registerPassword,

              phone,

              address,

              role: "USER"
            }
          );

          setMessage('EMAIL VERIFIED. REGISTER SUCCESS');

          setShowRegister(false);
        },
        registerEmail
      );

    } catch (error) {

      setMessage('REGISTER FAILED');
    }
  };

  // GOOGLE LOGIN

  const handleGoogleLogin = async () => {

    try {

      const result =
        await signInWithPopup(
          auth,
          provider
        );

      setMessage(

        "WELCOME " +

        result.user.displayName
      );

      localStorage.setItem("role", "USER");
      localStorage.setItem("email", result.user.email);

      // SAME DASHBOARD

      navigate("/admin");

    } catch (error) {

      setMessage(
        "GOOGLE LOGIN FAILED"
      );
    }
  };

  // PASSWORD RESET EMAIL

  const handlePasswordReset = async () => {

    try {

      const response = await axios.post(
        'http://localhost:8080/api/auth/password-reset',
        {
          email: resetEmail || email
        }
      );

      setMessage(response.data);
      setShowReset(false);

    } catch (error) {

      setMessage('PASSWORD RESET EMAIL FAILED');
    }
  };

  return (

    <div className="main-container">

      <div className="overlay"></div>

      <div className="auth-card">

        {/* LEFT */}

        <div className="left-section">

          <div className="logo-box">

            <FaWarehouse className="logo-icon" />

          </div>

          <h1>

            Warehouse
            <br />
            Management
            <br />
            System

          </h1>

          <p>

            Smart Inventory • Orders • Analytics • Logistics

          </p>

          <div className="roles">

            <span>ADMIN</span>

            <span>MANAGER</span>

            <span>OPERATOR</span>

            <span>USER</span>

          </div>

        </div>

        {/* RIGHT */}

        <div className="right-section">

          <div className="auth-preferences">

            <select
              value={language}
              onChange={(e) => updateLanguage(e.target.value)}
            >
              <option value="en">English</option>
              <option value="hi">Hindi</option>
            </select>

            <button
              type="button"
              onClick={() =>
                updateTheme(theme === "dark" ? "light" : "dark")}
            >
              {theme === "dark" ? "Light" : "Dark"}
            </button>

          </div>

          {otpStep && (

            <div className="otp-box">

              <h2>{t.verifyOtp}</h2>

              <p>
                Enter the 6 digit OTP sent to {otpStep.email}
              </p>

              <input
                type="text"
                placeholder="Enter OTP"
                value={otpInput}
                onChange={(e) => setOtpInput(e.target.value)}
              />

              <button onClick={verifyOtp}>
                {t.verifyOtp}
              </button>

              <button
                className="secondary-btn"
                onClick={() => setOtpStep(null)}
              >
                Cancel
              </button>

            </div>
          )}

          {
            !otpStep && showRegister ?

            <>

              <h2>{t.createAccount}</h2>

              <input
                type="text"
                placeholder="Full Name"

                onChange={(e) =>
                  setName(e.target.value)}
              />

              <input
                type="email"
                placeholder="Email Address"

                onChange={(e) =>
                  setRegisterEmail(
                    e.target.value)}
              />

              <input
                type="text"
                placeholder="Phone Number"

                onChange={(e) =>
                  setPhone(e.target.value)}
              />

              <textarea
                placeholder="Address"

                onChange={(e) =>
                  setAddress(e.target.value)}>
              </textarea>

              <div className="password-box">

                <input
                  type={
                    showPassword ?
                    'text' :
                    'password'
                  }

                  placeholder="Password"

                  onChange={(e) =>
                    setRegisterPassword(
                      e.target.value)}
                />

                <span
                  onClick={() =>
                    setShowPassword(
                      !showPassword)}>

                  {
                    showPassword ?

                    <FaEyeSlash />

                    :

                    <FaEye />
                  }

                </span>

              </div>

              <input
                type="password"
                placeholder="Confirm Password"

                onChange={(e) =>
                  setConfirmPassword(
                    e.target.value)}
              />

              <button
                onClick={handleRegister}>

                REGISTER NOW

              </button>

              <button
                className="google-btn"

                onClick={handleGoogleLogin}>

                <FaGoogle />

                Continue with Google

              </button>

              <p className="switch-text">

                Already have account?

                <span
                  onClick={() =>
                    setShowRegister(false)}>

                  Login

                </span>

              </p>

            </>

            : !otpStep &&

            <>

              <h2>{t.login}</h2>

              <input
                type="email"
                placeholder="Enter Email"

                onChange={(e) =>
                  setEmail(e.target.value)}
              />

              <div className="password-box">

                <input
                  type={
                    showPassword ?
                    'text' :
                    'password'
                  }

                  placeholder="Enter Password"

                  onChange={(e) =>
                    setPassword(e.target.value)}
                />

                <span
                  onClick={() =>
                    setShowPassword(
                      !showPassword)}>

                  {
                    showPassword ?

                    <FaEyeSlash />

                    :

                    <FaEye />
                  }

                </span>

              </div>

              <select
                value={role}

                onChange={(e) =>
                  setRole(e.target.value)}>

                <option value="ADMIN">
                  ADMIN
                </option>

                <option value="MANAGER">
                  MANAGER
                </option>

                <option value="OPERATOR">
                  OPERATOR
                </option>

                <option value="USER">
                  USER
                </option>

              </select>

              <button
                onClick={handleLogin}>

                LOGIN NOW

              </button>

              {
                showReset &&

                <div className="reset-box">

                  <input
                    type="email"
                    placeholder="Registered Email"
                    value={resetEmail}
                    onChange={(e) =>
                      setResetEmail(e.target.value)}
                  />

                  <button
                    className="secondary-btn"
                    onClick={handlePasswordReset}>

                    SEND RESET EMAIL

                  </button>

                </div>
              }

              <button
                className="google-btn"

                onClick={handleGoogleLogin}>

                <FaGoogle />

                Continue with Google

              </button>

              <p className="switch-text">

                New user?

                <span
                  onClick={() =>
                    setShowRegister(true)}>

                  Register

                </span>

              </p>

              <p className="switch-text">

                Forgot password?

                <span
                  onClick={() =>
                    setShowReset(!showReset)}>

                  Reset Email

                </span>

              </p>

            </>
          }

          <p className="message">

            {message}

          </p>

        </div>

      </div>

    </div>
  );
}

function App() {

  return (

    <Routes>

      <Route
        path="/"
        element={<LoginRegisterPage />}
      />

      <Route
        path="/admin"
        element={<AdminDashboard />}
      />

      <Route
        path="/products"
        element={<ProductPage />}
      />

      <Route
        path="/orders"
        element={<OrdersPage />}
      />

      <Route
        path="/inventory"
        element={<InventoryPage />}
      />

      <Route
        path="/incoming"
        element={<StockMovementPage type="INCOMING" />}
      />

      <Route
        path="/outgoing"
        element={<StockMovementPage type="OUTGOING" />}
      />

      <Route
        path="/stock-transfer"
        element={<StockMovementPage type="TRANSFER" />}
      />

      <Route
        path="/users"
        element={<UsersPage />}
      />

      <Route
        path="/settings"
        element={<SettingsPage />}
      />

      <Route
        path="/profile"
        element={<ProfilePage />}
      />

    </Routes>
  );
}

export default App;
