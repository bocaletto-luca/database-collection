-- Event Management and Ticketing Database
-- Description: Schema for event management and ticketing.
-- It includes tables for events, venues, tickets, attendees, sponsors, and event schedules.

CREATE TABLE Venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    capacity INT,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_id INT,
    event_name VARCHAR(150) NOT NULL,
    description TEXT,
    start_date DATETIME,
    end_date DATETIME,
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    ticket_type VARCHAR(50),  -- e.g., VIP, General Admission
    price DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Attendees (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    ticket_id INT,
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Sponsors (
    sponsor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    contact_info TEXT,
    website VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Event_Sponsors (
    event_id INT,
    sponsor_id INT,
    PRIMARY KEY (event_id, sponsor_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (sponsor_id) REFERENCES Sponsors(sponsor_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Event_Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    session_title VARCHAR(150) NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    description TEXT,
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
