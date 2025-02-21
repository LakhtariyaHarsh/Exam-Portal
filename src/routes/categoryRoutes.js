const express = require("express");
const router = express.Router();
const categoryController = require("../controller/categoryController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/admin");

// Category CRUD routes
router.get("/", categoryController.getCategories);
router.get("/categorybyid/:id", categoryController.getCategoryById);
router.get("/:name", categoryController.getCategoryByName);
router.post("/create",auth, isAdmin, categoryController.createCategory);
router.put("/update/:id",auth, isAdmin, categoryController.updateCategory);
router.delete("/delete/:id",auth, isAdmin, categoryController.deleteCategory);

module.exports = router;
