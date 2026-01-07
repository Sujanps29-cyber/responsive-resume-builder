-- ============================================
-- RESPONSIVE RESUME BUILDER - MYSQL DATABASE
-- SUBMIT THIS FILE TO GOOGLE CLASSROOM
-- ============================================

-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS resume_builder;
USE resume_builder;

-- ============================================
-- TABLE 1: USERS (Store login accounts)
-- ============================================
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLE 2: RESUMES (Store each user's resumes)
-- ============================================
CREATE TABLE resumes (
    resume_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    resume_title VARCHAR(150),
    template_used VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ============================================
-- TABLE 3: PERSONAL_INFO (Name, email, phone)
-- ============================================
CREATE TABLE personal_info (
    info_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL UNIQUE,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    location VARCHAR(100),
    professional_title VARCHAR(100),
    summary TEXT,
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- TABLE 4: EDUCATION (Degrees, colleges)
-- ============================================
CREATE TABLE education (
    education_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL,
    degree VARCHAR(100),
    field_of_study VARCHAR(100),
    institution VARCHAR(150),
    start_year INT,
    end_year INT,
    gpa DECIMAL(3,2),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- TABLE 5: EXPERIENCE (Jobs, internships)
-- ============================================
CREATE TABLE experience (
    experience_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL,
    job_title VARCHAR(100),
    company_name VARCHAR(100),
    employment_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    is_current_job BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- TABLE 6: SKILLS (Technical skills)
-- ============================================
CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL,
    skill_name VARCHAR(100),
    proficiency VARCHAR(50),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- TABLE 7: PROJECTS (Portfolio projects)
-- ============================================
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL,
    project_name VARCHAR(150),
    project_url VARCHAR(255),
    description TEXT,
    technologies_used VARCHAR(255),
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- TABLE 8: CERTIFICATIONS (Courses, certs)
-- ============================================
CREATE TABLE certifications (
    certification_id INT PRIMARY KEY AUTO_INCREMENT,
    resume_id INT NOT NULL,
    certification_name VARCHAR(150),
    issuing_organization VARCHAR(150),
    issue_date DATE,
    FOREIGN KEY (resume_id) REFERENCES resumes(resume_id)
);

-- ============================================
-- SAMPLE DATA (For screenshots)
-- ============================================

-- Insert Users
INSERT INTO users (name, email, password) VALUES
('Raj Kumar', 'raj@example.com', 'hashed_password_123'),
('Priya Singh', 'priya@example.com', 'hashed_password_456');

-- Insert Resumes
INSERT INTO resumes (user_id, resume_title, template_used) VALUES
(1, 'Software Engineer Resume', 'Modern'),
(1, 'Internship Resume', 'Professional'),
(2, 'UI/UX Designer Resume', 'Creative');

-- Insert Personal Info
INSERT INTO personal_info (resume_id, full_name, email, phone, location, professional_title, summary) VALUES
(1, 'Raj Kumar', 'raj@example.com', '+91-9876543210', 'Bangalore', 'Software Engineer', 'BTech CSE student with interest in web development'),
(2, 'Raj Kumar', 'raj@example.com', '+91-9876543210', 'Bangalore', 'Intern', 'Looking for internship opportunities'),
(3, 'Priya Singh', 'priya@example.com', '+91-9123456789', 'Bangalore', 'UI/UX Designer', 'Design enthusiast with 2 years experience');

-- Insert Education
INSERT INTO education (resume_id, degree, field_of_study, institution, start_year, end_year, gpa) VALUES
(1, 'B.Tech', 'Computer Science', 'GKVK Engineering College', 2022, 2026, 3.8),
(2, 'B.Tech', 'Computer Science', 'GKVK Engineering College', 2022, 2026, 3.8),
(3, 'B.Tech', 'Computer Science', 'City Engineering College', 2021, 2025, 3.6);

-- Insert Experience
INSERT INTO experience (resume_id, job_title, company_name, employment_type, start_date, end_date, is_current_job) VALUES
(1, 'Web Developer Intern', 'Tech Company XYZ', 'Internship', '2024-06-01', '2024-08-31', FALSE),
(1, 'Junior Developer', 'StartUp ABC', 'Part-time', '2024-09-01', NULL, TRUE),
(3, 'UI Designer', 'Design Studio', 'Full-time', '2023-01-15', NULL, TRUE);

-- Insert Skills
INSERT INTO skills (resume_id, skill_name, proficiency) VALUES
(1, 'JavaScript', 'Advanced'),
(1, 'HTML & CSS', 'Advanced'),
(1, 'React.js', 'Intermediate'),
(1, 'MySQL', 'Intermediate'),
(2, 'JavaScript', 'Beginner'),
(3, 'Figma', 'Expert'),
(3, 'UI Design', 'Advanced'),
(3, 'Photoshop', 'Advanced');

-- Insert Projects
INSERT INTO projects (resume_id, project_name, project_url, description, technologies_used) VALUES
(1, 'Resume Builder App', 'github.com/raj/resume-builder', 'Web app to create resumes with live preview', 'HTML, CSS, JavaScript, MySQL'),
(1, 'Todo List Application', 'github.com/raj/todo-app', 'Task management application', 'React, Node.js, MongoDB'),
(3, 'Fashion E-commerce Website', 'portfolio.priya.com/fashion', 'UI/UX design for fashion store', 'Figma, Prototyping');

-- Insert Certifications
INSERT INTO certifications (resume_id, certification_name, issuing_organization, issue_date) VALUES
(1, 'Web Development Bootcamp', 'Udemy', '2024-05-15'),
(1, 'JavaScript Mastery', 'Coursera', '2024-03-20'),
(3, 'UI/UX Design Professional', 'Google', '2023-11-10');
