const express = require("express");
const router = express.Router();
const eligibilityController = require("../controller/eligibilityController");

// Eligibility CRUD routes
router.get("/", eligibilityController.getEligibilities);
router.get("/:id", eligibilityController.getEligibilityById);
router.post("/create", eligibilityController.createEligibility);
router.put("/update/:id", eligibilityController.updateEligibility);
router.delete("/delete/:id", eligibilityController.deleteEligibility);

module.exports = router;
