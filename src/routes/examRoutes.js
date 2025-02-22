const express = require("express");
const router = express.Router();
const examController = require("../controller/examController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/admin");

// Exam CRUD routes
router.get("/", examController.getExams);
router.get("/lastDateToApply", examController.getExamsBylastDateToApply);
router.get("/admit-card", examController.getExamsByAdmitCard);
router.get("/result", examController.getExamsByResult);
router.get("/answerkey", examController.getExamsByanswerKey);
router.get("/syllabus", examController.getExamsBysyllabus);
router.get("/exambyid/:id", examController.getExamById);

// Place the searchByName route before the getExamByName route
router.get('/name', examController.searchByName);
router.get("/:name", examController.getExamByName);

router.post("/create", auth, isAdmin, examController.createExam);
router.put("/update/:id", auth, isAdmin, examController.updateExam);
router.delete("/delete/:id", auth, isAdmin, examController.deleteExam);

module.exports = router;