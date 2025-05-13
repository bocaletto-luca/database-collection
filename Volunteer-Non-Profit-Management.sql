-- Volunteer / Non-Profit Management Database
-- Description: Schema for managing non-profit activities and volunteer events.
-- Tables:
--   - Volunteers: Profile of volunteers.
--   - Events: Volunteer events or outreach activities.
--   - Projects: Non-profit projects.
--   - Volunteer_Assignments: Mapping volunteers to events or projects.
--   - Donations: Records of donations received.

CREATE TABLE Volunteers (
    volunteer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    description TEXT,
    event_date DATE,
    location VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Volunteer_Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    volunteer_id INT,
    assignment_type ENUM('event','project') NOT NULL,
    assignment_id_ref INT NOT NULL,  -- References either event_id or project_id based on assignment_type
    assignment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (volunteer_id) REFERENCES Volunteers(volunteer_id) ON DELETE CASCADE
    -- Note: assignment_id_ref is not enforced with a foreign key constraint,
    -- so application logic should manage the reference based on assignment_type.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    donation_date DATE DEFAULT CURRENT_DATE,
    method VARCHAR(50),
    notes TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
