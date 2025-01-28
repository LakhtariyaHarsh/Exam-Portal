const express = require("express");
const router = express.Router();
const examController = require("../controller/examController");

// Exam CRUD routes
router.get("/", examController.getExams);
router.get("/:id", examController.getExamById);
router.post("/create", examController.createExam);
router.put("/update/:id", examController.updateExam);
router.delete("/delete/:id", examController.deleteExam);

module.exports = router;
