const Eligibility = require("../models/Eligibility");

/**
 * @desc Get all eligibility criteria with pagination
 * @route GET /api/eligibilities?page=1&limit=10
 * @access Public
 */
exports.getEligibilities = async (req, res) => {
    try {
        // Extract page & limit from query params
        let { page, limit } = req.query;
        page = parseInt(page) || 1;      // Default to page 1
        limit = parseInt(limit) || 10;   // Default to 10 entries per page
        const skip = (page - 1) * limit; // Calculate records to skip

        // Fetch paginated eligibility criteria
        const eligibilities = await Eligibility.find().skip(skip).limit(limit);

        // Get total count of eligibility criteria
        const totalEligibilities = await Eligibility.countDocuments();

        // Send paginated response
        res.status(200).json({
            page,
            limit,
            totalEligibilities,
            totalPages: Math.ceil(totalEligibilities / limit),
            eligibilities
        });

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Search Eligibility by name dynamically
exports.searchByEligibilityName = async (req, res) => {
    try {
        console.log("Inside the Function Query:"); // Debugging

        const searchQuery = req.query.query;
        console.log("Search Query:", searchQuery); // Debugging
        
        if (!searchQuery) {
            return res.status(400).json({ message: "Search query is required" });
        }
        
        const eligibilities = await Eligibility.find({
            eligiblityCriteria: { $regex: searchQuery, $options: "i" }
        });
        
        console.log("Found eligibilities:", eligibilities); // Debugging
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
