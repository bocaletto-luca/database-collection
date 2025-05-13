-- University Management Database
-- Description: Schema for a university management system.
-- Tables:
--   - Students: Student information.
--   - Professors: Faculty details.
--   - Courses: Offered courses.
--   - Enrollments: Student enrollments in courses.
--   - Class_Schedules: Timetable for courses.
--   - Grades: Grades achieved by students in courses.

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE,
    major VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT,
    course_title VARCHAR(150) NOT NULL,
    description TEXT,
    credits INT,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    student_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Class_Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    day_of_week VARCHAR(20),     -- e.g., Monday, Tuesday
    start_time TIME,
    end_time TIME,
    room VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    grade DECIMAL(4,2),
    grade_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
