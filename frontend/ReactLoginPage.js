const root = ReactDOM.createRoot(
  document.getElementById("react-root")
);

function App() {
  const [resume, setResume] = React.useState({
    name: "",
    role: "",
    email: "",
    phone: "",
    location: "",
    skills: [],
    projects: "",
    achievements: "",
    education: ""
  });

  React.useEffect(() => {
    function syncFromInputs() {
      setResume({
        name: document.getElementById("nameInput")?.value || "",
        role: document.getElementById("roleInput")?.value || "",
        email: document.getElementById("emailInput")?.value || "",
        phone: document.getElementById("phoneInput")?.value || "",
        location: document.getElementById("locationInput")?.value || "",
        skills: document
          .getElementById("skillsInput")
          ?.value.split(",")
          .map(s => s.trim())
          .filter(Boolean) || [],
        projects: document.getElementById("projectsInput")?.value || "",
        achievements: document.getElementById("achievementsInput")?.value || "",
        education: document.getElementById("educationInput")?.value || ""
      });
    }

    // 🔥 THIS IS THE IMPORTANT PART
    document.addEventListener("input", syncFromInputs);

    syncFromInputs(); // initial render

    return () => {
      document.removeEventListener("input", syncFromInputs);
    };
  }, []);

  return React.createElement(ResumePreview, { data: resume });
}

root.render(React.createElement(App));
