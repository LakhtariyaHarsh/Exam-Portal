const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectDB = require("./config/db");

// Load environment variables
dotenv.config();

// Connect to Database
connectDB();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Routes
// app.use("/api/exams", require("./src/routes/examRoutes"));
// app.use("/api/categories", require("./src/routes/categoryRoutes"));
// app.use("/api/posts", require("./src/routes/postRoutes"));
// app.use("/api/eligibilities", require("./src/routes/eligibilityRoutes"));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
