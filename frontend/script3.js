// script3.js
// PURPOSE: Handle Save Resume logic only
// React handles LIVE PREVIEW now

document.getElementById("saveBtn").addEventListener("click", function () {
  const resumeData = {
    name: document.getElementById("nameInput").value,
    role: document.getElementById("roleInput").value,
    email: document.getElementById("emailInput").value,
    phone: document.getElementById("phoneInput").value,
    location: document.getElementById("locationInput").value,
    skills: document.getElementById("skillsInput").value,
    projects: document.getElementById("projectsInput").value,
    achievements: document.getElementById("achievementsInput").value,
    education: document.getElementById("educationInput").value
  };

  // ✅ Option 1: Save to Local Storage
  localStorage.setItem("resumeData", JSON.stringify(resumeData));
  alert("Resume saved successfully!");
});

/* 
---------------------------------------
OPTIONAL: Load saved data on page reload
---------------------------------------
*/

window.addEventListener("load", function () {
  const savedData = localStorage.getItem("resumeData");
  if (!savedData) return;

  const data = JSON.parse(savedData);

  document.getElementById("nameInput").value = data.name || "";
  document.getElementById("roleInput").value = data.role || "";
  document.getElementById("emailInput").value = data.email || "";
  document.getElementById("phoneInput").value = data.phone || "";
  document.getElementById("locationInput").value = data.location || "";
  document.getElementById("skillsInput").value = data.skills || "";
  document.getElementById("projectsInput").value = data.projects || "";
  document.getElementById("achievementsInput").value = data.achievements || "";
  document.getElementById("educationInput").value = data.education || "";
});
