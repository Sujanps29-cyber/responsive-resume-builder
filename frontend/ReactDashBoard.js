function ResumePreview({ data }) {
  return React.createElement(
    "div",
    null,
    [
      React.createElement("h1", { key: 1 }, data.name || "Your Name"),
      React.createElement("p", { key: 2 }, data.role || "Your Role"),

      React.createElement("div", { key: 3, className: "block" }, [
        React.createElement("h3", null, "Contact"),
        React.createElement("p", null, data.email),
        React.createElement("p", null, data.phone),
        React.createElement("p", null, data.location)
      ]),

      React.createElement("div", { key: 4, className: "block" }, [
        React.createElement("h3", null, "Skills"),
        React.createElement(
          "ul",
          null,
          data.skills.map((s, i) =>
            React.createElement("li", { key: i }, s)
          )
        )
      ]),

      React.createElement("div", { key: 5, className: "block" }, [
        React.createElement("h3", null, "Projects"),
        React.createElement("p", null, data.projects)
      ]),

      React.createElement("div", { key: 6, className: "block" }, [
        React.createElement("h3", null, "Achievements"),
        React.createElement("p", null, data.achievements)
      ]),

      React.createElement("div", { key: 7, className: "block" }, [
        React.createElement("h3", null, "Education"),
        React.createElement("p", null, data.education)
      ])
    ]
  );
}
