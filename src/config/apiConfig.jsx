const trimTrailingSlash = (value) =>
  String(value || "").replace(/\/+$/, "");

export const API_BASE_URL = trimTrailingSlash(
  process.env.REACT_APP_API_BASE_URL || "http://localhost:8080/api"
);

export const NOTIFICATION_API_URLS = [
  process.env.REACT_APP_NOTIFICATION_API_URL,
  `${API_BASE_URL}/notifications`,
  "http://localhost:8081/api/notifications"
]
  .filter(Boolean)
  .map(trimTrailingSlash);

export const apiUrl = (path = "") => {
  const normalizedPath = String(path || "").replace(/^\/+/, "");

  return normalizedPath
    ? `${API_BASE_URL}/${normalizedPath}`
    : API_BASE_URL;
};
