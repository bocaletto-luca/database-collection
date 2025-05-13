-- Ticketing / Helpdesk Database
-- Description:
-- This schema is for a ticketing/helpdesk system.
-- It includes tables for tickets, ticket comments, attachments, and ticket categories.

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,  -- The user who opened the ticket
    title VARCHAR(150) NOT NULL,
    description TEXT,
    status VARCHAR(50),  -- e.g., open, in progress, closed
    priority VARCHAR(50),
    open_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    close_date DATETIME,
    INDEX (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ticket_Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    user_id INT,
    content TEXT,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Tickets(ticket_id) -- Adjust if you have a separate Users table
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Attachments (
    attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    file_path VARCHAR(255),
    file_name VARCHAR(150),
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ticket_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
