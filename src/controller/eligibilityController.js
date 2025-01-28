const Eligibility = require("../models/Eligibility");

// Get all eligibility criteria
exports.getEligibilities = async (req, res) => {
    try {
        const eligibilities = await Eligibility.find();
        res.json(eligibilities);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get eligibility by ID
exports.getEligibilityById = async (req, res) => {
    try {
        const eligibility = await Eligibility.findById(req.params.id);
        if (!eligibility) return res.status(404).json({ message: "Eligibility not found" });
        res.json(eligibility);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create a new eligibility criteria
exports.createEligibility = async (req, res) => {
    try {
        const newEligibility = new Eligibility(req.body);
        const savedEligibility = await newEligibility.save();
        res.status(201).json(savedEligibility);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// Update eligibility criteria
exports.updateEligibility = async (req, res) => {
    try {
        const updatedEligibility = await Eligibility.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedEligibility) return res.status(404).json({ message: "Eligibility not found" });
        res.json(updatedEligibility);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Delete eligibility criteria
exports.deleteEligibility = async (req, res) => {
    try {
        const deletedEligibility = await Eligibility.findByIdAndDelete(req.params.id);
        if (!deletedEligibility) return res.status(404).json({ message: "Eligibility not found" });
        res.json({ message: "Eligibility deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
