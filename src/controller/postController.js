const Post = require("../models/Post");

/**
 * @desc Get all posts with pagination (10 posts per page)
 * @route GET /api/posts?page=1
 * @access Public
 */
exports.getPosts = async (req, res) => {
    try {
        let { page, limit } = req.query;
        page = parseInt(page) || 1;      // Default: Page 1
        limit = parseInt(limit) || 10;   // Default: 10 posts per page
        const skip = (page - 1) * limit; // Calculate records to skip

        // Fetch posts with pagination
        const posts = await Post.find().skip(skip).limit(limit);

        // Get total number of posts
        const totalPosts = await Post.countDocuments();

        res.status(200).json({
            page,
            limit,
            totalPosts,
            totalPages: Math.ceil(totalPosts / limit),
            posts
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Search post by name dynamically
exports.searchByPostName = async (req, res) => {
    try {
        console.log("Inside the post Function Query:"); // Debugging

        const searchQuery = req.query.query;
        console.log("Search Query:", searchQuery); // Debugging
        
        if (!searchQuery) {
            return res.status(400).json({ message: "Search query is required" });
        }
        
        const posts = await Post.find({
            postName: { $regex: searchQuery, $options: "i" }
        });
        
        console.log("Found posts:", posts); // Debugging
        res.json(posts);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get post by ID
exports.getPostById = async (req, res) => {
    try {
        const post = await Post.findById(req.params.id);
        if (!post) return res.status(404).json({ message: "Post not found" });
        res.json(post);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create a new post
exports.createPost = async (req, res) => {
    try {
        const newPost = new Post(req.body);
        const savedPost = await newPost.save();
        res.status(201).json(savedPost);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// Update post
exports.updatePost = async (req, res) => {
    try {
        const updatedPost = await Post.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedPost) return res.status(404).json({ message: "Post not found" });
        res.json(updatedPost);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Delete post
exports.deletePost = async (req, res) => {
    try {
        const deletedPost = await Post.findByIdAndDelete(req.params.id);
        if (!deletedPost) return res.status(404).json({ message: "Post not found" });
        res.json({ message: "Post deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
