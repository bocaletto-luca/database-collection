-- CRM Database
-- Description:
-- This schema is used for managing customer relationships,
-- including tables for clients, contacts, leads, sales opportunities,
-- and related activities.

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100),
    industry VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    role VARCHAR(50),
    CONSTRAINT fk_contacts_client FOREIGN KEY (client_id)
       REFERENCES Clients(client_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Leads (
    lead_id INT AUTO_INCREMENT PRIMARY KEY,
    lead_name VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    status VARCHAR(50),
    entry_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Opportunities (
    opp_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    description TEXT,
    expected_amount DECIMAL(10,2),
    status VARCHAR(50),
    due_date DATE,
    CONSTRAINT fk_opportunities_client FOREIGN KEY (client_id)
       REFERENCES Clients(client_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    opp_id INT,
    description TEXT,
    activity_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    type VARCHAR(50),
    CONSTRAINT fk_activities_opp FOREIGN KEY (opp_id)
       REFERENCES Opportunities(opp_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
