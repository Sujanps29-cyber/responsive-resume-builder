const express = require("express");
const Resume = require("../models/Resume");
const router = express.Router();

router.post("/save", async (req, res) => {
  try {
    const resume = new Resume(req.body);
    await resume.save();
    res.status(201).json({ message: "Resume saved successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
