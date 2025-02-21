const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
require("dotenv").config();

let refreshTokens = []; // Store refresh tokens (use DB for production)

/**
 * @desc Register a new user
 * @route POST /api/users/register
 * @access Public
 */
exports.registerUser = async (req, res) => {
    try {
        const { name, email, password } = req.body;

        // Check if user already exists
        let user = await User.findOne({ email });
        if (user) return res.status(400).json({ message: "User already exists" });

        // Hash password before saving to database
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Create new user
        user = new User({ name, email, password: hashedPassword });
        await user.save();

        res.status(201).json({ message: "User registered successfully" });
    } catch (error) {
        res.status(500).json({ message: "Server Error", error: error.message });
    }
};


// Generate Access Token
const generateAccessToken = (user) => {
    return jwt.sign({ id: user._id, role: user.role }, process.env.JWT_SECRET, { expiresIn: process.env.ACCESS_TOKEN_EXPIRES_IN });
};

// Generate Refresh Token
const generateRefreshToken = (user) => {
    const refreshToken = jwt.sign({ id: user._id }, process.env.JWT_REFRESH_SECRET, { expiresIn: process.env.REFRESH_TOKEN_EXPIRES_IN });
    refreshTokens.push(refreshToken);
    return refreshToken;
};

/**
 * @desc Authenticate user & generate tokens
 * @route POST /api/users/login
 * @access Public
 */
exports.loginUser = async (req, res) => {
    try {
        const { email, password } = req.body;

        // Check if user exists
        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ message: "Invalid email or password" });

        // Validate password
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ message: "Invalid email or password" });

        // Generate tokens
        const accessToken = generateAccessToken(user);
        const refreshToken = generateRefreshToken(user);

        res.status(200).json({ accessToken, refreshToken, user: { id: user._id, name: user.name, email: user.email, role: user.role } });
    } catch (error) {
        res.status(500).json({ message: "Server Error", error: error.message });
    }
};

/**
 * @desc Generate new Access Token using Refresh Token
 * @route POST /api/users/refresh-token
 * @access Public
 */
exports.refreshToken = (req, res) => {
    const { token } = req.body;

    if (!token) return res.status(401).json({ message: "No refresh token provided" });
    if (!refreshTokens.includes(token)) return res.status(403).json({ message: "Invalid refresh token" });

    try {
        const decoded = jwt.verify(token, process.env.JWT_REFRESH_SECRET);
        const newAccessToken = generateAccessToken({ _id: decoded.id });

        res.status(200).json({ accessToken: newAccessToken });
    } catch (error) {
        res.status(403).json({ message: "Invalid or expired refresh token" });
    }
};

/**
 * @desc Logout user and remove refresh token
 * @route POST /api/users/logout
 * @access Private
 */
exports.logoutUser = (req, res) => {
    const { token } = req.body;
    refreshTokens = refreshTokens.filter(t => t !== token);
    res.status(200).json({ message: "Logged out successfully" });
};
/**
 * @desc Get user profile
 * @route GET /api/users/profile
 * @access Private
 */
exports.getUserProfile = async (req, res) => {
    try {
        const user = await User.findById(req.user.id).select("-password");
        if (!user) return res.status(404).json({ message: "User not found" });

        res.status(200).json(user);
    } catch (error) {
        res.status(500).json({ message: "Server Error", error: error.message });
    }
};

/**
 * @desc Update user profile
 * @route PUT /api/users/profile
 * @access Private
 */ 
exports.updateUserProfile = async (req, res) => {
    try {
        const { userId } = req.params; // Get user ID from URL params
        const { name, email, role } = req.body; // Get new data from request body

        // Ensure the logged-in user (admin) can update the user
        const updatedUser = await User.findByIdAndUpdate(userId, { name, email, role }, { new: true });

        if (!updatedUser) {
            return res.status(404).json({ message: "User not found" });
        }

        res.status(200).json({ message: "User updated successfully", user: updatedUser });
    } catch (error) {
        res.status(500).json({ message: "Server error", error: error.message });
    }
};
/**
 * @desc Get all users with pagination (Admin only)
 * @route GET /api/users?page=1&limit=10
 * @access Private (Admin)
 */
exports.getAllUsers = async (req, res) => {
    try {
        if (req.user.role !== "admin") return res.status(403).json({ message: "Access denied" });

        let { page, limit } = req.query;
        page = parseInt(page) || 1;      // Default: Page 1
        limit = parseInt(limit) || 10;   // Default: 10 users per page
        const skip = (page - 1) * limit; // Calculate how many records to skip

        // Fetch users with pagination
        const users = await User.find().select("-password").skip(skip).limit(limit);

        // Get total count of users (for frontend pagination)
        const totalUsers = await User.countDocuments();

        res.status(200).json({
            page,
            limit,
            totalUsers,
            totalPages: Math.ceil(totalUsers / limit),
            users
        });
    } catch (error) {
        res.status(500).json({ message: "Server Error", error: error.message });
    }
};


/**
 * @desc Delete a user (Admin only)
 * @route DELETE /api/users/:id
 * @access Private (Admin)
 */
// Delete a user (admin only)
exports.deleteUser = async (req, res) => {
    try {
        const { userId } = req.params; // Get user ID from URL params

        const user = await User.findByIdAndDelete(userId);

        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }

        res.status(200).json({ message: "User deleted successfully" });
    } catch (error) {
        res.status(500).json({ message: "Server error", error: error.message });
    }
};
