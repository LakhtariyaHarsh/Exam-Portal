const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectDB = require("./config/db");
const morgan = require("morgan");

// Load environment variables
dotenv.config();

// Connect to Database
connectDB();

const app = express();

// Middleware
app.use(cors({ origin: "*" })); // Allow all origins (For Development)
app.use(express.json());
app.use(morgan("dev"));

// Routes
app.use("/api/users", require("./src/routes/userRoutes")); // User authentication
app.use("/api/exams", require("./src/routes/examRoutes"));
app.use("/api/categories", require("./src/routes/categoryRoutes"));
app.use("/api/posts", require("./src/routes/postRoutes"));
app.use("/api/eligibilities", require("./src/routes/eligibilityRoutes"));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
 