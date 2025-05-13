-- Fitness and Gym Management Database
-- Description: Schema for managing gym or fitness center operations.
-- Tables included:
--   - Members: Stores the gym members.
--   - Trainers: Stores the trainers and their details.
--   - Fitness_Classes: Contains scheduled classes along with assigned trainers.
--   - Memberships: Details individual membership plans.
--   - Checkins: Records member check-in times.

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    membership_type VARCHAR(50),
    join_date DATE DEFAULT CURRENT_DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    hire_date DATE DEFAULT CURRENT_DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Fitness_Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    description TEXT,
    trainer_id INT,
    class_date DATETIME,
    capacity INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    membership_plan VARCHAR(50),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Checkins (
    checkin_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    checkin_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR(100),
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
