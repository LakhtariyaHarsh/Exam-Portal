const express = require("express");
const router = express.Router();
const postController = require("../controller/postController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/admin");

// Post CRUD routes
router.get("/", postController.getPosts);
router.get("/postByid/:id", postController.getPostById);
router.get("/name", postController.searchByPostName);
router.post("/create",auth, isAdmin, postController.createPost);
router.put("/update/:id",auth, isAdmin, postController.updatePost);
router.delete("/delete/:id",auth, isAdmin, postController.deletePost);

module.exports = router;
