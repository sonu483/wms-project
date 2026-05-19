export const REALTIME_REFRESH_MS = 5000;

const ROLE_PERMISSIONS = {
  ADMIN: ["view", "create", "update", "delete", "manageUsers", "settings", "profile"],
  MANAGER: ["view", "create", "update", "settings", "profile"],
  OPERATOR: ["view", "update", "settings", "profile"],
  OPEROTER: ["view", "update", "settings", "profile"],
  USER: ["view", "createOrder", "settings", "profile"]
};

export const getCurrentRole = () => {
  return (localStorage.getItem("role") || "USER").toUpperCase();
};

export const canAccess = (action, role = getCurrentRole()) => {
  const permissions =
    ROLE_PERMISSIONS[role?.toUpperCase()] || ROLE_PERMISSIONS.USER;

  return permissions.includes(action);
};

export const getRoleLabel = (role = getCurrentRole()) => {
  return role?.toUpperCase() === "OPEROTER" ? "OPERATOR" : role?.toUpperCase();
};
