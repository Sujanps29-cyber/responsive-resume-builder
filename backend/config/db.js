const mysql = require("mysql2");

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "sujan29@09",
  database: "resume_builder",
  port: 3306
});

db.connect((err) => {
  if (err) {
    console.error("MySQL connection failed:", err.message);
    return;
  }
  console.log("MySQL connected successfully");
});

module.exports = db;
