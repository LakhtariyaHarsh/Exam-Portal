const Category = require("../models/category");

/**
 * @desc Get all categories with pagination
 * @route GET /api/categories?page=1&limit=10
 * @access Public
 */
exports.getCategories = async (req, res) => {
    try {
        let { page, limit } = req.query;
        page = parseInt(page) || 1;      // Default to page 1
        limit = parseInt(limit) || 10;   // Default to 10 categories per page
        const skip = (page - 1) * limit; // Calculate how many records to skip

        // Fetch categories with pagination
        const categories = await Category.find().skip(skip).limit(limit);

        // Get total count of categories (for frontend pagination)
        const totalCategories = await Category.countDocuments();

        res.status(200).json({
            page,
            limit,
            totalCategories,
            totalPages: Math.ceil(totalCategories / limit),
            categories
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get category by ID
exports.getCategoryById = async (req, res) => {
    try {
        const category = await Category.findById(req.params.id);
        if (!category) return res.status(404).json({ message: "Category not found" });
        res.json(category);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create a new category
exports.createCategory = async (req, res) => {
    try {
        const newCategory = new Category(req.body);
        const savedCategory = await newCategory.save();
        res.status(201).json(savedCategory);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// Update category
exports.updateCategory = async (req, res) => {
    try {
        const updatedCategory = await Category.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedCategory) return res.status(404).json({ message: "Category not found" });
        res.json(updatedCategory);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Delete category
exports.deleteCategory = async (req, res) => {
    try {
        const deletedCategory = await Category.findByIdAndDelete(req.params.id);
        if (!deletedCategory) return res.status(404).json({ message: "Category not found" });
        res.json({ message: "Category deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
