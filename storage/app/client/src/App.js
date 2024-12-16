import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import "./index.css";
import Welcome from "./Welcome";
import Register from "./components/Register";
import Login from "./components/Login";
import Home from "../src/components/Home";

function App() {
  return (
    <BrowserRouter>
      <Routes>
      <Route exact path="/" element={<Welcome />} />
      <Route exact path="/login" element={<Login />} />
      <Route exact path="/register" element={<Register />} />
      <Route exact path="/home" element={<Home />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
