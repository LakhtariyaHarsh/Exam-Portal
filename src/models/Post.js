const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
    postName: { type: String, required: true },
    totalPost: Number,
    generalPost: Number,
    obcPost: Number,
    ewsPost: Number,
    scPost: Number,
    stPost: Number,
    eligiblityDetails: String
});

module.exports = mongoose.model("Post", PostSchema);
