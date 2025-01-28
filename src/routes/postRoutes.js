const express = require("express");
const router = express.Router();
const postController = require("../controller/postController");

// Post CRUD routes
router.get("/", postController.getPosts);
router.get("/:id", postController.getPostById);
router.post("/create", postController.createPost);
router.put("/update/:id", postController.updatePost);
router.delete("/delete/:id", postController.deletePost);

module.exports = router;
