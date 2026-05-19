import axios from "axios";

const API_URL =
  "http://localhost:8080/api/products";

// GET ALL PRODUCTS

export const getProducts = () => {

  return axios.get(API_URL);
};

// ADD PRODUCT

export const addProduct = (product) => {

  return axios.post(
    API_URL,
    product
  );
};

// UPDATE PRODUCT

export const updateProduct = (
  id,
  product
) => {

  return axios.put(
    `${API_URL}/${id}`,
    product
  );
};

// DELETE PRODUCT

export const deleteProduct = (id) => {

  return axios.delete(
    `${API_URL}/${id}`
  );
};

// PRODUCT COUNT

export const getProductCount = () => {

  return axios.get(
    `${API_URL}/count`
  );
};

// ORDER COUNT

export const getOrderCount = () => {

  return axios.get(
    "http://localhost:8080/api/orders/count"
  );
};