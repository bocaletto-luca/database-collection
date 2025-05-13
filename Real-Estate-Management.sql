-- Real Estate Management Database
-- Description: Schema for a real estate management system.
-- The tables cover Properties, Agents, Clients, Listings, Appointments, and Contracts.

CREATE TABLE Agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    agency_name VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(15),
    property_type VARCHAR(50),
    price DECIMAL(15,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Listings (
    listing_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    agent_id INT,
    listing_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),  -- e.g., active, sold, pending
    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    listing_id INT,
    client_id INT,
    appointment_date DATETIME,
    notes TEXT,
    FOREIGN KEY (listing_id) REFERENCES Listings(listing_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    listing_id INT,
    client_id INT,
    agent_id INT,
    contract_date DATE,
    amount DECIMAL(15,2),
    status VARCHAR(50),
    FOREIGN KEY (listing_id) REFERENCES Listings(listing_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE,
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
