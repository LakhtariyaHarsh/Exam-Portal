const express = require("express");
const router = express.Router();
const eligibilityController = require("../controller/eligibilityController");
const auth = require("../middleware/auth");
const isAdmin = require("../middleware/admin");

// Eligibility CRUD routes
router.get("/", eligibilityController.getEligibilities);
router.get("/eligibilityByid/:id", eligibilityController.getEligibilityById);
router.get("/name", eligibilityController.searchByEligibilityName);
router.post("/create",auth, isAdmin, eligibilityController.createEligibility);
router.put("/update/:id",auth, isAdmin, eligibilityController.updateEligibility);
router.delete("/delete/:id",auth, isAdmin, eligibilityController.deleteEligibility);

module.exports = router;
