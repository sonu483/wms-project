import { initializeApp } from "firebase/app";

import {
  getAuth,
  GoogleAuthProvider
} from "firebase/auth";

const firebaseConfig = {

  apiKey: "AIzaSyC8i4NGjtkVmGSkTifszqwSbN_lDouIy8A",

  authDomain: "wms-project-24349.firebaseapp.com",

  projectId: "wms-project-24349",

  storageBucket:
    "wms-project-24349.firebasestorage.app",

  messagingSenderId: "425259433585",

  appId:
    "1:425259433585:web:84d69cbcf8fe56b80ae5d0",

  measurementId: "G-T8L5TTE86W"
};

const app =
  initializeApp(firebaseConfig);

export const auth =
  getAuth(app);

export const provider =
  new GoogleAuthProvider();