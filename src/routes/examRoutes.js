const express = require("express");
const router = express.Router();
const examController = require("../controller/examController");

// Exam CRUD routes
router.get("/", examController.getExams);
router.get("/lastDateToApply", examController.getExamsBylastDateToApply);
router.get("/admit-card", examController.getExamsByAdmitCard);
router.get("/result", examController.getExamsByResult);
router.get("/answerkey", examController.getExamsByanswerKey);
router.get("/syllabus", examController.getExamsBysyllabus);
// router.get("/:id", examController.getExamById);
router.get("/:name", examController.getExamByName);
router.post("/create", examController.createExam);
router.put("/update/:id", examController.updateExam);
router.delete("/delete/:id", examController.deleteExam);

module.exports = router;
