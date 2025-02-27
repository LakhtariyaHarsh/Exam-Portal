const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
    postName: { type: String, required: true },
    totalPost: Number,
    generalPost: Number,
    obcPost: Number,
    ewsPost: Number,
    scPost: Number,
    stPost: Number,
    eligiblityDetails: { type: mongoose.Schema.ObjectId, ref: "Eligibility" },
});

module.exports = mongoose.model("Post", PostSchema);
