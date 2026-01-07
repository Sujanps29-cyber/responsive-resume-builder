const mongoose = require("mongoose");

const resumeSchema = new mongoose.Schema({
  name: String,
  role: String,
  email: String,
  phone: String,
  location: String,
  skills: [String],
  projects: String,
  achievements: String,
  education: String
});

module.exports = mongoose.model("Resume", resumeSchema);
