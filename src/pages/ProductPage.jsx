import React, { useEffect, useState } from "react";

import "./ProductPage.css";

import axios from "axios";

import {
  FaHome,
  FaImage
} from "react-icons/fa";

import {
  useNavigate
} from "react-router-dom";

import {
  getProducts,
  addProduct,
  updateProduct,
  deleteProduct
} from "../services/ProductService";

import {
  REALTIME_REFRESH_MS,
  canAccess,
  getRoleLabel
} from "../utils/permissions";

import {
  PRODUCT_CATEGORIES,
  REQUIRED_PRODUCT_CATALOG,
  getProductCategory,
  saveProductCategory,
  getPreference,
  translations
} from "../utils/appPreferences";

const DEFAULT_PRODUCT_IMAGES = {
  "barcode scanner":
    "https://images.unsplash.com/photo-1580983553428-01fd27e0fca4?auto=format&fit=crop&w=900&q=80",
  "bluetooth speaker":
    "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=900&q=80",
  "bubble wrap":
    "https://images.unsplash.com/photo-1607604760190-ec9ccc12156e?auto=format&fit=crop&w=900&q=80",
  "cpu cabinet":
    "https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&w=900&q=80",
  "cctv camera":
    "https://images.unsplash.com/photo-1557597774-9d273605dfa9?auto=format&fit=crop&w=900&q=80",
  "gaming headset":
    "https://images.unsplash.com/photo-1599669454699-248893623440?auto=format&fit=crop&w=900&q=80",
  "gaming keyboard":
    "https://images.unsplash.com/photo-1618384887929-16ec33fab9ef?auto=format&fit=crop&w=900&q=80",
  "gaming mouse":
    "https://images.unsplash.com/photo-1629429407759-01cd3d7cfb38?auto=format&fit=crop&w=900&q=80",
  "label printer":
    "https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?auto=format&fit=crop&w=900&q=80",
  "mobile charger":
    "https://images.unsplash.com/photo-1583863788434-e58a36330cf0?auto=format&fit=crop&w=900&q=80",
  "office chair":
    "https://images.unsplash.com/photo-1580480055273-228ff5388ef8?auto=format&fit=crop&w=900&q=80",
  "office table":
    "https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?auto=format&fit=crop&w=900&q=80",
  "packing box":
    "https://images.unsplash.com/photo-1601598851547-4302969d0614?auto=format&fit=crop&w=900&q=80",
  "paper roll":
    "https://images.unsplash.com/photo-1586075010923-2dd4570fb338?auto=format&fit=crop&w=900&q=80",
  "power bank":
    "https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?auto=format&fit=crop&w=900&q=80",
  "ps5 controller":
    "https://images.unsplash.com/photo-1605901309584-818e25960a8f?auto=format&fit=crop&w=900&q=80",
  "rgb lights":
    "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=900&q=80",
  "smart watch":
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=80",
  "usb cable":
    "https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?auto=format&fit=crop&w=900&q=80",
  laptop:
    "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=900&q=80",
  mouse:
    "https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&w=900&q=80",
  keyboard:
    "https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=900&q=80",
  iphone:
    "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?auto=format&fit=crop&w=900&q=80",
  phone:
    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=900&q=80",
  mobile:
    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=900&q=80",
  smartphone:
    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=900&q=80",
  tv:
    "https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?auto=format&fit=crop&w=900&q=80",
  lcd:
    "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=900&q=80",
  monitor:
    "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=900&q=80",
  printer:
    "https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?auto=format&fit=crop&w=900&q=80",
  ssd:
    "https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?auto=format&fit=crop&w=900&q=80",
  ram:
    "https://images.unsplash.com/photo-1562976540-1502c2145186?auto=format&fit=crop&w=900&q=80",
  webcam:
    "https://images.unsplash.com/photo-1587826080692-f439cd0b70da?auto=format&fit=crop&w=900&q=80",
  whiteboard:
    "https://images.unsplash.com/photo-1543286386-713bdd548da4?auto=format&fit=crop&w=900&q=80",
  projector:
    "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80",
  earbuds:
    "https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?auto=format&fit=crop&w=900&q=80",
  default:
    "https://images.unsplash.com/photo-1550009158-9ebf69173e03?auto=format&fit=crop&w=900&q=80"
};

const FEATURE_TEMPLATES = {
  mobile: [
    "5G ready smartphone with smooth everyday performance",
    "Full HD+ display for video, shopping and dashboard use",
    "High capacity battery with fast charging support",
    "AI camera system for clear photos and video calls",
    "Dual SIM, Wi-Fi, Bluetooth and GPS connectivity",
    "1 year manufacturer warranty"
  ],
  laptop: [
    "Fast processor for office work, study and multitasking",
    "Full HD display with comfortable viewing",
    "SSD storage for quick boot and app loading",
    "Wi-Fi, Bluetooth, HDMI and USB connectivity",
    "Webcam and microphone for online meetings",
    "1 year manufacturer warranty"
  ],
  gaming: [
    "Built for responsive gaming performance",
    "Durable body with comfortable long-session use",
    "RGB ready design on supported models",
    "Plug and play support for Windows systems",
    "Low latency controls for competitive play",
    "Brand warranty included"
  ],
  printer: [
    "Reliable printing for warehouse and office documents",
    "USB and wireless connectivity on supported models",
    "Low maintenance design for daily operations",
    "Sharp text output for invoices and labels",
    "Compatible with common paper sizes",
    "Brand service support included"
  ],
  accessory: [
    "Compact design for daily carry and warehouse use",
    "Stable performance with compatible devices",
    "Durable build for regular handling",
    "Energy efficient operation",
    "Easy setup and quick usage",
    "Brand warranty included"
  ],
  default: [
    "Verified warehouse catalog product",
    "Ready for live inventory tracking",
    "Barcode and QR code supported",
    "Order tracking enabled after purchase",
    "Fast dispatch from available warehouse",
    "Quality checked before stock update"
  ]
};

const getProductFamily = (product) => {
  const text =
    `${product.name || ""} ${product.brand || ""} ${product.model || ""} ${getProductCategory(product) || ""}`
      .toLowerCase();

  if (
    text.includes("mobile") ||
    text.includes("smartphone") ||
    text.includes("phone") ||
    text.includes("iphone")
  ) {
    return "mobile";
  }

  if (text.includes("laptop")) {
    return "laptop";
  }

  if (
    text.includes("lcd") ||
    text.includes("tv") ||
    text.includes("monitor")
  ) {
    return "display";
  }

  if (
    text.includes("gaming") ||
    text.includes("controller") ||
    text.includes("headset")
  ) {
    return "gaming";
  }

  if (text.includes("printer")) {
    return "printer";
  }

  if (
    text.includes("charger") ||
    text.includes("power bank") ||
    text.includes("earbuds") ||
    text.includes("watch") ||
    text.includes("cable")
  ) {
    return "accessory";
  }

  return "default";
};

const getProductFeatures = (product) => {
  return FEATURE_TEMPLATES[getProductFamily(product)] || FEATURE_TEMPLATES.default;
};

const imageSearchUrl = (query, width = 900, height = 900) =>
  `https://tse1.mm.bing.net/th?q=${encodeURIComponent(query)}&w=${width}&h=${height}&c=7&rs=1&p=0&o=5&pid=1.7`;

const isGeneratedProductPhoto = (photo) => {
  const normalizedPhoto = (photo || "").toLowerCase();

  return (
    normalizedPhoto.includes("source.unsplash.com") ||
    normalizedPhoto.includes("images.unsplash.com") ||
    normalizedPhoto.includes("tse1.mm.bing.net/th?q=")
  );
};

const getProductImageQuery = (product, view = "official product photo") => {
  const brand = product.brand || "WMS";
  const name = product.name || "Product";
  const model = product.model || `${brand} ${name}`;
  const family = getProductFamily(product);

  if (family === "mobile") {
    return `${brand} ${model} ${view} smartphone`;
  }

  if (family === "laptop") {
    return `${brand} ${model} ${view} laptop`;
  }

  if (family === "display") {
    const displayText = `${name} ${model}`.toLowerCase();

    if (displayText.includes("lcd") || displayText.includes("tv")) {
      return `${brand} LCD TV ${view}`;
    }

    return `${brand} ${model} monitor ${view}`;
  }

  return `${brand} ${model} ${name} ${view}`;
};

const getGeneratedProductPhoto = (product, view) =>
  imageSearchUrl(getProductImageQuery(product, view));

const getStoredProductPhoto = (product) => {
  const backendPhoto = product.photo || "";
  const localIdPhoto =
    typeof localStorage !== "undefined"
      ? localStorage.getItem(`productPhoto:id:${product.id}`) || ""
      : "";
  const localNamePhoto =
    typeof localStorage !== "undefined"
      ? localStorage.getItem(`productPhoto:name:${product.name}`) || ""
      : "";

  if (backendPhoto && !isGeneratedProductPhoto(backendPhoto)) {
    return backendPhoto;
  }

  if (localIdPhoto && !isGeneratedProductPhoto(localIdPhoto)) {
    return localIdPhoto;
  }

  if (localNamePhoto && !isGeneratedProductPhoto(localNamePhoto)) {
    return localNamePhoto;
  }

  return backendPhoto || localIdPhoto || localNamePhoto;
};

const getProductColors = (product) =>
  (product.colors || "Black, Blue, Silver")
    .split(",")
    .map((color) => color.trim())
    .filter(Boolean);

const getProductGallery = (product) => {
  const storedPhoto = getStoredProductPhoto(product);
  const colors = getProductColors(product);
  const galleryPhotos = [
    storedPhoto,
    getGeneratedProductPhoto(product, "official product photo"),
    ...colors.slice(0, 3).map((color) =>
      getGeneratedProductPhoto(product, `${color} colour product photo`)
    ),
    getGeneratedProductPhoto(product, "front and back product photo"),
    getGeneratedProductPhoto(product, "side view product photo")
  ].filter(Boolean);

  return [...new Set(galleryPhotos)].slice(0, 6);
};

const getProductSpecs = (product) => {
  const family = getProductFamily(product);
  const brand = product.brand || "WMS";
  const price = Number(product.price || 0);

  const baseSpecs = [
    ["Brand", brand],
    ["Model", product.model || `${brand} ${product.name || "Product"}`],
    ["Available Colours", product.colors || "Black, Blue, Silver"],
    ["Category", getProductCategory(product)],
    ["SKU", getProductCode(product)],
    ["Available Stock", `${product.quantity || 0} units`],
    ["Warehouse Status", Number(product.quantity) > 0 ? "In Stock" : "Out of Stock"]
  ];

  if (family === "mobile") {
    return [
      ...baseSpecs,
      ["RAM", price > 50000 ? "12 GB" : price > 25000 ? "8 GB" : "6 GB"],
      ["Storage", price > 50000 ? "256 GB" : "128 GB"],
      ["Display", price > 30000 ? "Full HD+ AMOLED" : "Full HD+ Display"],
      ["Camera", price > 40000 ? "50MP triple camera" : "50MP dual camera"],
      ["Battery", price > 30000 ? "5000 mAh fast charge" : "5000 mAh"]
    ];
  }

  if (family === "laptop") {
    return [
      ...baseSpecs,
      ["Processor", price > 70000 ? "Intel i7 / Ryzen 7 class" : "Intel i5 / Ryzen 5 class"],
      ["RAM", price > 70000 ? "16 GB" : "8 GB"],
      ["Storage", "512 GB SSD"],
      ["Display", "15.6 inch Full HD"],
      ["Operating System", brand === "Apple" ? "macOS" : "Windows compatible"]
    ];
  }

  if (family === "gaming") {
    return [
      ...baseSpecs,
      ["Use Case", "Gaming and performance setup"],
      ["Connectivity", "USB / Wireless on supported models"],
      ["Response", "Low latency"],
      ["Build", "Durable gaming grade"]
    ];
  }

  return [
    ...baseSpecs,
    ["Use Case", "Warehouse, office and customer orders"],
    ["Tracking", "QR and barcode enabled"],
    ["Delivery", "2-4 days after order"],
    ["Warranty", "Brand warranty"]
  ];
};

const getListPrice = (product) => {
  const price = Number(product.price || 0);

  if (!price) {
    return 0;
  }

  return Math.round(price * 1.18);
};

const getDiscountPercent = (product) => {
  const price = Number(product.price || 0);
  const listPrice = getListPrice(product);

  if (!price || !listPrice) {
    return 0;
  }

  return Math.max(5, Math.round(((listPrice - price) / listPrice) * 100));
};

const getProductCode = (product) => {
  return `WMS-${String(product.id || 0).padStart(5, "0")}`;
};

const getBarcodeBars = (product) => {
  const source =
    `${product.name || "product"}-${product.id || 0}`;

  return Array.from({ length: 30 }, (_, index) => {
    const charCode =
      source.charCodeAt(index % source.length) || 1;

    return {
      width: (charCode % 4) + 1,
      dark: (charCode + index) % 3 !== 0
    };
  });
};

const getQrCells = (product) => {
  const source =
    `${product.name || "product"}-${product.id || 0}-${product.quantity || 0}`;

  return Array.from({ length: 64 }, (_, index) => {
    const row = Math.floor(index / 8);
    const col = index % 8;
    const finder =
      (row < 3 && col < 3) ||
      (row < 3 && col > 4) ||
      (row > 4 && col < 3);
    const charCode =
      source.charCodeAt(index % source.length) || 1;

    return finder || ((charCode + row + col + index) % 2 === 0);
  });
};

const getCatalogProductPayload = (catalogProduct) => ({
  name: catalogProduct.name,
  brand: "WMS Catalog",
  model: `${catalogProduct.name} Standard`,
  colors: "Black, Silver",
  quantity: 10,
  price: catalogProduct.price,
  category: catalogProduct.category,
  photo: ""
});

function ProductPage() {

  const navigate = useNavigate();

  const [products, setProducts] = useState([]);

  const [editingId, setEditingId] = useState(null);

  const [formData, setFormData] = useState({
    name: "",
    brand: "",
    model: "",
    colors: "",
    quantity: "",
    price: "",
    category: "Electronics",
    photo: ""
  });

  const [searchText, setSearchText] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("All");
  const [orderMessage, setOrderMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [catalogMessage, setCatalogMessage] = useState("");
  const [isAddingCatalog, setIsAddingCatalog] = useState(false);
  const [placingOrderId, setPlacingOrderId] = useState(null);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [detailProduct, setDetailProduct] = useState(null);
  const [activePhotoIndex, setActivePhotoIndex] = useState(0);
  const [checkoutData, setCheckoutData] = useState({
    quantity: "1",
    phone: "",
    address: "",
    payment: "Cash on Delivery",
    upiId: "",
    cardNumber: "",
    cardName: "",
    cardExpiry: "",
    cardCvv: ""
  });

  const canCreate = canAccess("create");
  const canCreateOrder = canAccess("createOrder");
  const canUpdate = canAccess("update");
  const canDelete = canAccess("delete");
  const canSubmit = editingId ? canUpdate : canCreate;
  const roleLabel = getRoleLabel();
  const isUser = roleLabel === "USER";
  const language = getPreference("language", "en");
  const t = translations[language] || translations.en;

  const visibleProducts =
    products.filter((product) =>
      (
        product.name?.toLowerCase().includes(searchText.toLowerCase()) ||
        product.brand?.toLowerCase().includes(searchText.toLowerCase()) ||
        product.model?.toLowerCase().includes(searchText.toLowerCase()) ||
        product.colors?.toLowerCase().includes(searchText.toLowerCase())
      ) &&
      (
        categoryFilter === "All" ||
        getProductCategory(product) === categoryFilter
      )
    );

  const getProductPhoto = (product) => {
    const productName =
      product.name?.toLowerCase() || "";
    const storedPhoto = getStoredProductPhoto(product);
    const matchedImageKey =
      Object.keys(DEFAULT_PRODUCT_IMAGES)
        .filter((imageKey) => imageKey !== "default")
        .sort((firstKey, secondKey) =>
          secondKey.length - firstKey.length
        )
        .find((imageKey) =>
          productName.includes(imageKey)
        );

    return (
      storedPhoto ||
      getGeneratedProductPhoto(product) ||
      DEFAULT_PRODUCT_IMAGES[matchedImageKey] ||
      DEFAULT_PRODUCT_IMAGES.default
    );
  };

  const handleImageError = (event, product, view = "official product photo") => {
    event.currentTarget.onerror = null;
    event.currentTarget.src = getGeneratedProductPhoto(product, view);
  };

  const openProductDetail = (product) => {
    setActivePhotoIndex(0);
    setDetailProduct(product);
  };

  const closeProductDetail = () => {
    setActivePhotoIndex(0);
    setDetailProduct(null);
  };

  useEffect(() => {
    fetchProducts();

    const realtime =
      setInterval(fetchProducts, REALTIME_REFRESH_MS);

    return () => clearInterval(realtime);
  }, []);

  const fetchProducts = async () => {

    try {

      const response = await getProducts();

      setProducts(response.data);
      setErrorMessage("");

    } catch (error) {

      setProducts([]);
      setErrorMessage(
        "Products backend is not connected. Please start Eclipse backend on port 8080."
      );
    }
  };

  const handleChange = (e) => {

    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleProductPhotoChange = (e) => {

    const file = e.target.files?.[0];

    if (!file) {
      return;
    }

    const reader = new FileReader();

    reader.onloadend = () => {
      setFormData({
        ...formData,
        photo: reader.result
      });
    };

    reader.readAsDataURL(file);
  };

  const handleSubmit = async (e) => {

    e.preventDefault();

    if (!canSubmit) {
      return;
    }

    const productPayload = {
      name: formData.name,
      brand: formData.brand,
      model: formData.model,
      colors: formData.colors,
      quantity: formData.quantity,
      price: formData.price,
      category: formData.category,
      photo: formData.photo
    };

    if (editingId) {

      await updateProduct(editingId, productPayload);

      localStorage.setItem(
        `productPhoto:id:${editingId}`,
        formData.photo || ""
      );
      saveProductCategory(
        {
          id: editingId,
          name: formData.name
        },
        formData.category
      );

      setEditingId(null);

    } else {

      const response = await addProduct(productPayload);

      saveProductCategory(
        {
          id: response.data?.id,
          name: formData.name
        },
        formData.category
      );
    }

    localStorage.setItem(
      `productPhoto:name:${formData.name}`,
      formData.photo || ""
    );
    localStorage.setItem(
      `productCategory:name:${formData.name}`,
      formData.category
    );

    fetchProducts();

    setFormData({
      name: "",
      brand: "",
      model: "",
      colors: "",
      quantity: "",
      price: "",
      category: "Electronics",
      photo: ""
    });
  };

  const handleAddMissingCatalogProducts = async () => {

    if (!canCreate || isAddingCatalog) {
      return;
    }

    const existingNames =
      new Set(
        products
          .map((product) => product.name?.trim().toLowerCase())
          .filter(Boolean)
      );

    const missingCatalogProducts =
      REQUIRED_PRODUCT_CATALOG.filter((catalogProduct) =>
        !existingNames.has(catalogProduct.name.toLowerCase())
      );

    if (missingCatalogProducts.length === 0) {
      setCatalogMessage("All requested catalog products are already added.");
      return;
    }

    setIsAddingCatalog(true);
    setCatalogMessage(`Adding ${missingCatalogProducts.length} missing products...`);

    try {
      for (const catalogProduct of missingCatalogProducts) {
        const payload = getCatalogProductPayload(catalogProduct);
        const response = await addProduct(payload);

        saveProductCategory(
          {
            id: response.data?.id,
            name: catalogProduct.name
          },
          catalogProduct.category
        );
      }

      setCatalogMessage(
        `Added ${missingCatalogProducts.length} missing products. Old products were kept.`
      );
      fetchProducts();
    } catch (error) {
      setCatalogMessage(
        "Could not add missing products. Please check backend on port 8080."
      );
    } finally {
      setIsAddingCatalog(false);
    }
  };

  const handleEdit = (product) => {

    if (!canUpdate) {
      return;
    }

    setEditingId(product.id);

    setFormData({
      name: product.name,
      brand: product.brand || "",
      model: product.model || "",
      colors: product.colors || "",
      quantity: product.quantity,
      price: product.price,
      category: getProductCategory(product),
      photo: getProductPhoto(product)
    });
  };

  const handleDelete = async (id) => {

    if (!canDelete) {
      return;
    }

    try {

      await deleteProduct(id);

      fetchProducts();

    } catch (error) {

      setErrorMessage("Product delete failed. Please check backend connection.");
    }
  };

  const handleOrderNow = async (product) => {

    if (!canCreateOrder || Number(product.quantity) <= 0) {
      return;
    }

    const email =
      localStorage.getItem("email") || "Guest User";
    const phone =
      localStorage.getItem("profileMobile") ||
      localStorage.getItem("profile:USER:" + email.toLowerCase() + ":mobile") ||
      "";
    const address =
      localStorage.getItem("profileAddress") ||
      localStorage.getItem("profile:USER:" + email.toLowerCase() + ":address") ||
      "";

    setOrderMessage("");
    setSelectedProduct(product);
    setCheckoutData({
      quantity: "1",
      phone,
      address,
      payment: "Cash on Delivery",
      upiId: "",
      cardNumber: "",
      cardName: "",
      cardExpiry: "",
      cardCvv: ""
    });
  };

  const handleCheckoutChange = (e) => {

    setCheckoutData({
      ...checkoutData,
      [e.target.name]: e.target.value
    });
  };

  const handlePlaceOrder = async (e) => {

    e.preventDefault();

    if (!selectedProduct) {
      return;
    }

    const requestedQuantity = Number(checkoutData.quantity);
    const availableQuantity = Number(selectedProduct.quantity);

    if (requestedQuantity < 1 || requestedQuantity > availableQuantity) {
      setOrderMessage("Please select a valid quantity.");
      return;
    }

    const email = localStorage.getItem("email") || "Guest User";
    const deliveryPhone =
      checkoutData.phone.trim() || "Not added";
    const deliveryAddress =
      checkoutData.address.trim() || "Not added";
    const paymentStatus =
      checkoutData.payment === "Cash on Delivery"
        ? "Pay on delivery"
        : "Paid online";

    const orderDetails = [
      email,
      `product:${selectedProduct.name}`,
      `qty:${checkoutData.quantity}`,
      `phone:${deliveryPhone}`,
      `address:${deliveryAddress}`,
      `payment:${checkoutData.payment}`,
      `paymentStatus:${paymentStatus}`
    ].join(" | ");

    try {

      setPlacingOrderId(selectedProduct.id);
      setOrderMessage(`Placing ${selectedProduct.name} order...`);

      const orderResponse = await axios.post(
        "http://localhost:8080/api/orders",
        {
          customerName: orderDetails,
          status: "Pending"
        }
      );

      const orderCode =
        orderResponse.data?.orderCode ||
        `ORD-${String(orderResponse.data?.id || "").padStart(5, "0")}`;
      const orderDate =
        orderResponse.data?.orderDate
          ? new Date(orderResponse.data.orderDate).toLocaleString("en-IN", {
              day: "2-digit",
              month: "short",
              year: "numeric",
              hour: "2-digit",
              minute: "2-digit"
            })
          : "just now";

      setOrderMessage(
        `${selectedProduct.name} order placed successfully. Order ID: ${orderCode}. Ordered on: ${orderDate}. Stock updated live.`
      );
      setSelectedProduct(null);
      await fetchProducts();

    } catch (error) {

      setOrderMessage(
        "Order failed. Please check backend is running on port 8080 and try again."
      );

    } finally {

      setPlacingOrderId(null);
    }
  };

  if (isUser) {

    return (

      <div className="product-container storefront-container">

        <button
          className="page-home-btn"
          onClick={() => navigate("/admin")}
        >
          <FaHome /> Home
        </button>

        <h1>Shop Products</h1>

        <p className="access-note">
          Live products | Order online | Track from Orders
        </p>

        <div className="store-toolbar">

          <input
            type="text"
            placeholder="Search products..."
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
          />

          <select
            value={categoryFilter}
            onChange={(e) => setCategoryFilter(e.target.value)}
          >
            <option value="All">{t.allCategories}</option>
            {PRODUCT_CATEGORIES.map((category) => (
              <option
                key={category}
                value={category}
              >
                {category}
              </option>
            ))}
          </select>

          <span>
            {visibleProducts.length} {t.productsAvailable}
          </span>

        </div>

        {orderMessage && (

          <div className="order-message">
            {orderMessage}
          </div>

        )}

        <div className="product-grid">

          {visibleProducts.map((product) => (

            <div
              className="product-card"
              key={product.id}
              role="button"
              tabIndex="0"
              onClick={() => openProductDetail(product)}
              onKeyDown={(event) => {
                if (event.key === "Enter" || event.key === " ") {
                  openProductDetail(product);
                }
              }}
            >

              <div className="product-image">
                {getProductPhoto(product) ? (
                  <img
                    src={getProductPhoto(product)}
                    alt={`${product.brand || "WMS"} ${product.model || product.name}`}
                    onError={(event) => handleImageError(event, product)}
                  />
                ) : (
                  <span>{product.name?.charAt(0) || "P"}</span>
                )}
              </div>

              <div className="product-info">

                <h2>{product.name}</h2>

                <p className="brand-pill">
                  Brand: {product.brand || "WMS"}
                </p>

                <p className="model-pill">
                  Model: {product.model || `${product.brand || "WMS"} ${product.name}`}
                </p>

                <div className="color-swatch-row">
                  {(product.colors || "Black, Blue, Silver")
                    .split(",")
                    .slice(0, 5)
                    .map((color) => (
                      <span key={color.trim()}>{color.trim()}</span>
                    ))}
                </div>

                <p className="rating">4.3 star | Fast delivery</p>

                <p className="category-pill">
                  {getProductCategory(product)}
                </p>

                <p className="price">Rs {product.price}</p>

                <p className="stock">
                  {Number(product.quantity) > 0
                    ? `${product.quantity} in stock`
                    : "Out of stock"}
                </p>

                <p className="delivery">
                  Delivery in 2-4 days | Real-time order tracking
                </p>

                <ul className="product-feature-preview">
                  {getProductFeatures(product).slice(0, 3).map((feature) => (
                    <li key={feature}>{feature}</li>
                  ))}
                </ul>

                <div className="product-code-panel">

                  <div
                    className="mini-qr"
                    title="Product QR Code"
                  >
                    {getQrCells(product).map((active, index) => (
                      <span
                        key={index}
                        className={active ? "active" : ""}
                      ></span>
                    ))}
                  </div>

                  <div className="barcode-box">

                    <span>QR / Barcode</span>

                    <strong>{getProductCode(product)}</strong>

                    <div className="barcode-lines">
                      {getBarcodeBars(product).map((bar, index) => (
                        <i
                          key={index}
                          style={{
                            width: `${bar.width}px`,
                            opacity: bar.dark ? 1 : 0.18
                          }}
                        ></i>
                      ))}
                    </div>

                  </div>

                </div>

                <button
                  className="buy-btn"
                  disabled={
                    Number(product.quantity) <= 0
                  }
                  onClick={(event) => {
                    event.stopPropagation();
                    handleOrderNow(product);
                  }}
                >
                  Order Now
                </button>

              </div>

            </div>

          ))}

        </div>

        {detailProduct && (

          <div
            className="checkout-backdrop product-detail-backdrop"
            onClick={closeProductDetail}
          >

            <section
              className="product-detail-modal"
              onClick={(event) => event.stopPropagation()}
            >

              <div className="detail-topbar">

                <span>Home</span>
                <b>/</b>
                <span>{getProductCategory(detailProduct)}</span>
                <b>/</b>
                <strong>{detailProduct.model || `${detailProduct.brand || "WMS"} ${detailProduct.name}`}</strong>

              </div>

              <div className="checkout-head detail-heading">

                <div>

                  <span className="detail-kicker">
                    Live Product Details
                  </span>

                  <h2>
                    {detailProduct.model || `${detailProduct.brand || "WMS"} ${detailProduct.name}`}
                  </h2>

                  <p>
                    Product code {getProductCode(detailProduct)} | Real-time stock and order tracking
                  </p>

                </div>

                <button
                  type="button"
                  className="close-btn"
                  onClick={closeProductDetail}
                >
                  X
                </button>

              </div>

              <div className="detail-layout">

                <div className="detail-media">

                  <div className="detail-main-image">
                    <img
                      src={
                        getProductGallery(detailProduct)[activePhotoIndex] ||
                        getProductPhoto(detailProduct)
                      }
                      alt={`${detailProduct.brand || "WMS"} ${detailProduct.model || detailProduct.name}`}
                      onError={(event) =>
                        handleImageError(event, detailProduct, "official product photo")
                      }
                    />
                  </div>

                  <div className="detail-gallery-grid">
                    {getProductGallery(detailProduct).map((photo, index) => (
                      <button
                        type="button"
                        key={photo}
                        className={
                          index === activePhotoIndex
                            ? "detail-gallery-thumb active"
                            : "detail-gallery-thumb"
                        }
                        onClick={() => setActivePhotoIndex(index)}
                      >
                        <img
                          src={photo}
                          alt={`${detailProduct.model || detailProduct.name} view ${index + 1}`}
                          onError={(event) =>
                            handleImageError(event, detailProduct, "product photo")
                          }
                        />
                      </button>
                    ))}
                  </div>

                  <div className="detail-code-row">

                    <div
                      className="mini-qr"
                      title="Product QR Code"
                    >
                      {getQrCells(detailProduct).map((active, index) => (
                        <span
                          key={index}
                          className={active ? "active" : ""}
                        ></span>
                      ))}
                    </div>

                    <div className="barcode-box">

                      <span>Inventory Barcode</span>

                      <strong>{getProductCode(detailProduct)}</strong>

                      <div className="barcode-lines">
                        {getBarcodeBars(detailProduct).map((bar, index) => (
                          <i
                            key={index}
                            style={{
                              width: `${bar.width}px`,
                              opacity: bar.dark ? 1 : 0.18
                            }}
                          ></i>
                        ))}
                      </div>

                    </div>

                  </div>

                  <div className="detail-side-actions">

                    <button
                      type="button"
                      className="cart-btn"
                      disabled={Number(detailProduct.quantity) <= 0}
                      onClick={() => {
                        closeProductDetail();
                        handleOrderNow(detailProduct);
                      }}
                    >
                      Add to Cart
                    </button>

                    <button
                      type="button"
                      className="buy-btn"
                      disabled={Number(detailProduct.quantity) <= 0}
                      onClick={() => {
                        closeProductDetail();
                        handleOrderNow(detailProduct);
                      }}
                    >
                      Buy Now
                    </button>

                  </div>

                </div>

                <div className="detail-content">

                  <h3 className="detail-product-title">
                    {detailProduct.model || `${detailProduct.brand || "WMS"} ${detailProduct.name}`} ({detailProduct.brand || "WMS"}, {getProductCategory(detailProduct)}, {getProductCode(detailProduct)})
                  </h3>

                  <div className="detail-review-row">

                    <span className="detail-rating">4.4 star</span>

                    <strong>2,430 Ratings & 418 Reviews</strong>

                    <em>Assured warehouse stock</em>

                  </div>

                  <div className="detail-price-row">

                    <strong>Rs {detailProduct.price}</strong>

                    <span>Rs {getListPrice(detailProduct)}</span>

                    <em>{getDiscountPercent(detailProduct)}% off</em>

                  </div>

                  <p className="detail-stock">
                    {Number(detailProduct.quantity) > 0
                      ? `${detailProduct.quantity} units available`
                      : "Out of stock"}
                  </p>

                  <section className="detail-colors">

                    <h3>Available Colours</h3>

                    <div className="color-swatch-row detail-color-row">
                      {(detailProduct.colors || "Black, Blue, Silver")
                        .split(",")
                        .map((color) => (
                          <span key={color.trim()}>{color.trim()}</span>
                        ))}
                    </div>

                  </section>

                  <section className="detail-offers">

                    <h3>Available Offers</h3>

                    <p>Bank Offer: 10% instant discount on selected cards</p>

                    <p>Exchange Offer: Up to Rs {Math.round(Number(detailProduct.price || 0) * 0.25)} off on old device</p>

                    <p>Warehouse Offer: Free dispatch from nearest available warehouse</p>

                  </section>

                  <section className="detail-delivery-box">

                    <div>
                      <span>Delivery</span>
                      <strong>2-4 days</strong>
                    </div>

                    <div>
                      <span>Payment</span>
                      <strong>COD / UPI / Card</strong>
                    </div>

                    <div>
                      <span>Seller</span>
                      <strong>WMS Verified</strong>
                    </div>

                  </section>

                  <h3>Highlights</h3>

                  <ul className="detail-feature-list">
                    {getProductFeatures(detailProduct).map((feature) => (
                      <li key={feature}>{feature}</li>
                    ))}
                  </ul>

                  <h3>Specifications</h3>

                  <div className="spec-table">
                    {getProductSpecs(detailProduct).map(([label, value]) => (
                      <div key={label}>
                        <span>{label}</span>
                        <strong>{value}</strong>
                      </div>
                    ))}
                  </div>

                  <button
                    type="button"
                    className="detail-secondary-btn"
                    onClick={closeProductDetail}
                  >
                    Continue Browsing
                  </button>

                </div>

              </div>

            </section>

          </div>

        )}

        {selectedProduct && (

          <div className="checkout-backdrop">

            <form
              className="checkout-modal"
              onSubmit={handlePlaceOrder}
            >

              <div className="checkout-head">

                <div>

                  <h2>Secure Checkout</h2>

                  <p>Review your order and place it safely</p>

                </div>

                <button
                  type="button"
                  className="close-btn"
                  onClick={() => setSelectedProduct(null)}
                >
                  X
                </button>

              </div>

              <div className="checkout-product-summary">

                <img
                  src={getProductPhoto(selectedProduct)}
                  alt={`${selectedProduct.brand || "WMS"} ${selectedProduct.model || selectedProduct.name}`}
                  onError={(event) => handleImageError(event, selectedProduct)}
                />

                <div>

                  <h3>{selectedProduct.name}</h3>

                  <span>Brand: {selectedProduct.brand || "WMS"}</span>

                  <span>Model: {selectedProduct.model || `${selectedProduct.brand || "WMS"} ${selectedProduct.name}`}</span>

                  <span>Colours: {selectedProduct.colors || "Black, Blue, Silver"}</span>

                  <p>Rs {selectedProduct.price} | {selectedProduct.quantity} in stock</p>

                  <span>{t.category}: {getProductCategory(selectedProduct)}</span>

                  <span>Delivery in 2-4 days</span>

                  <strong className="checkout-code">
                    Code: {getProductCode(selectedProduct)}
                  </strong>

                </div>

              </div>

              <label>
                Quantity
                <input
                  type="number"
                  name="quantity"
                  min="1"
                  max={selectedProduct.quantity}
                  value={checkoutData.quantity}
                  onChange={handleCheckoutChange}
                  required
                />
              </label>

              <label>
                Phone Number
                <input
                  type="text"
                  name="phone"
                  placeholder="Enter phone number"
                  value={checkoutData.phone}
                  onChange={handleCheckoutChange}
                />
              </label>

              <label>
                Delivery Address
                <textarea
                  name="address"
                  placeholder="Enter delivery address"
                  value={checkoutData.address}
                  onChange={handleCheckoutChange}
                ></textarea>
              </label>

              <div className="payment-section">

                <h3>Payment Method</h3>

                <div className="payment-options">

                  <label className={
                    checkoutData.payment === "Cash on Delivery"
                      ? "payment-option selected"
                      : "payment-option"
                  }>
                    <input
                      type="radio"
                      name="payment"
                      value="Cash on Delivery"
                      checked={checkoutData.payment === "Cash on Delivery"}
                      onChange={handleCheckoutChange}
                    />
                    Cash on Delivery
                  </label>

                  <label className={
                    checkoutData.payment === "UPI"
                      ? "payment-option selected"
                      : "payment-option"
                  }>
                    <input
                      type="radio"
                      name="payment"
                      value="UPI"
                      checked={checkoutData.payment === "UPI"}
                      onChange={handleCheckoutChange}
                    />
                    UPI
                  </label>

                  <label className={
                    checkoutData.payment === "Card"
                      ? "payment-option selected"
                      : "payment-option"
                  }>
                    <input
                      type="radio"
                      name="payment"
                      value="Card"
                      checked={checkoutData.payment === "Card"}
                      onChange={handleCheckoutChange}
                    />
                    Credit / Debit Card
                  </label>

                </div>

                {checkoutData.payment === "UPI" && (

                  <label>
                    UPI ID
                    <input
                      type="text"
                      name="upiId"
                      placeholder="example@upi"
                      value={checkoutData.upiId}
                      onChange={handleCheckoutChange}
                      required
                    />
                  </label>

                )}

                {checkoutData.payment === "Card" && (

                  <div className="card-fields">

                    <label>
                      Card Number
                      <input
                        type="text"
                        name="cardNumber"
                        placeholder="1234 5678 9012 3456"
                        value={checkoutData.cardNumber}
                        onChange={handleCheckoutChange}
                        required
                      />
                    </label>

                    <label>
                      Name on Card
                      <input
                        type="text"
                        name="cardName"
                        value={checkoutData.cardName}
                        onChange={handleCheckoutChange}
                        required
                      />
                    </label>

                    <div className="card-row">

                      <label>
                        Expiry
                        <input
                          type="text"
                          name="cardExpiry"
                          placeholder="MM/YY"
                          value={checkoutData.cardExpiry}
                          onChange={handleCheckoutChange}
                          required
                        />
                      </label>

                      <label>
                        CVV
                        <input
                          type="password"
                          name="cardCvv"
                          placeholder="123"
                          value={checkoutData.cardCvv}
                          onChange={handleCheckoutChange}
                          required
                        />
                      </label>

                    </div>

                  </div>

                )}

                {checkoutData.payment === "Cash on Delivery" && (

                  <p className="payment-note">
                    Pay by cash when your order is delivered.
                  </p>

                )}

              </div>

              <div className="checkout-total">
                Total: Rs {
                  Number(selectedProduct.price) *
                  Number(checkoutData.quantity || 1)
                }
              </div>

              <button
                className="buy-btn"
                type="submit"
                disabled={placingOrderId === selectedProduct.id}
              >
                {
                  placingOrderId === selectedProduct.id
                    ? "Placing Order..."
                    : "Place Order"
                }
              </button>

            </form>

          </div>

        )}

      </div>
    );
  }

  return (

    <div className="product-container">

      <button
        className="page-home-btn"
        onClick={() => navigate("/admin")}
      >
        <FaHome /> Home
      </button>

      <h1>Product Management</h1>

      <p className="access-note">
        Current Role: {roleLabel} | Access: {
          roleLabel === "ADMIN"
            ? "Full Control"
            : roleLabel === "USER"
              ? "View Only"
              : "Limited Control"
        }
      </p>

      {errorMessage && (
        <div className="page-error-message">
          {errorMessage}
        </div>
      )}

      <form
        onSubmit={handleSubmit}
        className="product-form"
      >

        <input
          type="text"
          name="name"
          placeholder="Enter Product Name"
          value={formData.name}
          onChange={handleChange}
          required
        />

        <input
          type="text"
          name="brand"
          placeholder="Enter Brand Name"
          value={formData.brand}
          onChange={handleChange}
          required
        />

        <input
          type="text"
          name="model"
          placeholder="Enter Model Name"
          value={formData.model}
          onChange={handleChange}
          required
        />

        <input
          type="text"
          name="colors"
          placeholder="Enter Colours"
          value={formData.colors}
          onChange={handleChange}
          required
        />

        <input
          type="number"
          name="quantity"
          placeholder="Enter Quantity"
          value={formData.quantity}
          onChange={handleChange}
          required
        />

        <input
          type="number"
          name="price"
          placeholder="Enter Price"
          value={formData.price}
          onChange={handleChange}
          required
        />

        <select
          name="category"
          value={formData.category}
          onChange={handleChange}
          required
        >
          {PRODUCT_CATEGORIES.map((category) => (
            <option
              key={category}
              value={category}
            >
              {category}
            </option>
          ))}
        </select>

        <label className="product-photo-upload">
          <FaImage /> Product Photo
          <input
            type="file"
            accept="image/*"
            onChange={handleProductPhotoChange}
          />
        </label>

        {formData.photo && (
          <img
            className="product-photo-preview"
            src={formData.photo}
            alt="product preview"
          />
        )}

        <button
          type="submit"
          disabled={!canSubmit}
          title={!canSubmit ? "This role does not have this access" : ""}
        >

          {
            editingId
              ? "Update Product"
              : "Add Product"
          }

        </button>

      </form>

      <div className="catalog-actions">
        <button
          type="button"
          onClick={handleAddMissingCatalogProducts}
          disabled={!canCreate || isAddingCatalog}
          title={!canCreate ? "This role cannot add products" : ""}
        >
          {
            isAddingCatalog
              ? "Adding Missing Products..."
              : "Add Missing Catalog Products"
          }
        </button>

        <span>
          {catalogMessage || `${REQUIRED_PRODUCT_CATALOG.length} catalog products checked by name`}
        </span>
      </div>

      <table className="product-table">

        <thead>

          <tr>

            <th>ID</th>

            <th>Product Name</th>

            <th>Brand</th>

            <th>Model</th>

            <th>Colours</th>

            <th>Photo</th>

            <th>Quantity</th>

            <th>Price</th>

            <th>Category</th>

            <th>Actions</th>

          </tr>

        </thead>

        <tbody>

          {products.length > 0 ? (

            products.map((product) => (

              <tr key={product.id}>

                <td>{product.id}</td>

                <td>{product.name}</td>

                <td>{product.brand || "WMS"}</td>

                <td>{product.model || `${product.brand || "WMS"} ${product.name}`}</td>

                <td>{product.colors || "Black, Blue, Silver"}</td>

                <td>
                  {getProductPhoto(product) ? (
                    <img
                      className="table-product-photo"
                      src={getProductPhoto(product)}
                      alt={`${product.brand || "WMS"} ${product.model || product.name}`}
                      onError={(event) => handleImageError(event, product)}
                    />
                  ) : (
                    "No Photo"
                  )}
                </td>

                <td>{product.quantity}</td>

                <td>Rs {product.price}</td>

                <td>{getProductCategory(product)}</td>

                <td>

                  <button
                    className="action-btn edit-btn"
                    disabled={!canUpdate}
                    title={!canUpdate ? "Edit access is not allowed" : ""}
                    onClick={() =>
                      handleEdit(product)}
                  >
                    Edit
                  </button>

                  <button
                    className="action-btn delete-btn"
                    disabled={!canDelete}
                    title={!canDelete ? "Delete access is admin only" : ""}
                    onClick={() =>
                      handleDelete(product.id)}
                  >
                    Delete
                  </button>

                </td>

              </tr>

            ))

          ) : (

            <tr>

              <td colSpan="8">

                No Products Available

              </td>

            </tr>

          )}

        </tbody>

      </table>

    </div>
  );
}

export default ProductPage;
