const express = require("express");
const router = express.Router();
const userController = require("../controller/userController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/admin");

// Public Routes
router.post("/register", userController.registerUser);
router.post("/login", userController.loginUser);
router.post("/refresh-token", userController.refreshToken);
router.post("/logout", userController.logoutUser);

// Protected Routes
router.get("/profile", auth, userController.getUserProfile);

// Admin Only Route (Delete User)
router.get("/get-allusers", auth, userController.getAllUsers);
router.put("/update/:userId", auth, isAdmin, userController.updateUserProfile); // Admins can update any user
router.delete("/delete/:userId", auth, isAdmin, userController.deleteUser); // Admins can delete any user

module.exports = router;
