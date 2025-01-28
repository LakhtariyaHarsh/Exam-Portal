const mongoose = require("mongoose");

const EligibilitySchema = new mongoose.Schema({
    eligiblityCriteria: { type: String, required: true }
});

module.exports = mongoose.model("Eligibility", EligibilitySchema);
