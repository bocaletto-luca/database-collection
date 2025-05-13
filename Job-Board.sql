-- Job Board Database
-- Description: Schema for a job board platform.
-- Tables:
--   - Employers: Contains employer information.
--   - Job_Posts: Job openings posted by employers.
--   - Categories: Job categories (e.g., IT, Finance, Healthcare).
--   - Applications: Applications submitted by candidates.
--   - Job_Alerts: (Optional) Alerts for new jobs.

CREATE TABLE Employers (
    employer_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    contact_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    website VARCHAR(150),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Job_Posts (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    salary_range VARCHAR(50),
    posted_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('open', 'closed') DEFAULT 'open',
    FOREIGN KEY (employer_id) REFERENCES Employers(employer_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Job_Posts_Categories (
    job_id INT,
    category_id INT,
    PRIMARY KEY (job_id, category_id),
    FOREIGN KEY (job_id) REFERENCES Job_Posts(job_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL,
    candidate_name VARCHAR(100) NOT NULL,
    candidate_email VARCHAR(100),
    resume TEXT,
    cover_letter TEXT,
    application_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('submitted', 'reviewed', 'accepted', 'rejected') DEFAULT 'submitted',
    FOREIGN KEY (job_id) REFERENCES Job_Posts(job_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
