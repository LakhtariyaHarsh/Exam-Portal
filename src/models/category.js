const mongoose = require("mongoose");

const CategorySchema = new mongoose.Schema({
    categoryName: { type: String, required: true },
    createdDate: { type: Date, default: Date.now }
}, { timestamps: true });

module.exports = mongoose.model("Category", CategorySchema);
