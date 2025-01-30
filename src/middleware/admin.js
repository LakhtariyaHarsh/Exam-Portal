const jwt = require("jsonwebtoken");
require("dotenv").config();

const isAdmin = (req, res, next) => {
    const token = req.headers.authorization && req.headers.authorization.split(" ")[1];  // Get token from Authorization header
    if (!token) return res.status(401).json({ message: "Access denied, no token provided" });

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET); // Verify JWT token
        req.user = decoded;

        if (req.user.role !== "admin") {  // Check if the user is an admin
            return res.status(403).json({ message: "Access denied, you are not an admin" });
        }
        next();  // User is an admin, continue to next middleware or route handler
    } catch (error) {
        res.status(400).json({ message: "Invalid token", error: error.message });
    }
};

module.exports = isAdmin;
