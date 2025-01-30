const Exam = require("../models/Exam");

// Get all exams
exports.getExams = async (req, res) => {
    try {
        const exams = await Exam.find().populate("examCategory postDetails eligibilityCriteria");
        res.json(exams);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get single exam by ID
exports.getExamById = async (req, res) => {
    try {
        const exam = await Exam.findById(req.params.id).populate("examCategory postDetails eligibilityCriteria");
        if (!exam) return res.status(404).json({ message: "Exam not found" });
        res.json(exam);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create a new exam
exports.createExam = async (req, res) => { 
    try {
        const newExam = new Exam(req.body);
        const savedExam = await newExam.save();
        res.status(201).json(savedExam);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// Update exam by ID
exports.updateExam = async (req, res) => {
    try {
        const updatedExam = await Exam.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedExam) return res.status(404).json({ message: "Exam not found" });
        res.json(updatedExam);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Delete exam by ID
exports.deleteExam = async (req, res) => {
    try {
        const deletedExam = await Exam.findByIdAndDelete(req.params.id);
        if (!deletedExam) return res.status(404).json({ message: "Exam not found" });
        res.json({ message: "Exam deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
