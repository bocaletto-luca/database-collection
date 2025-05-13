-- Logistics and Shipping Database
-- Description: Schema for managing logistics and shipping.
-- Tables:
--   - Shipments: Details of shipments.
--   - Tracking_Events: Logs events during shipment transit.
--   - Carriers: Shipping companies.
--   - Warehouses: Storage locations.
--   - Delivery_Status: Status updates for shipments.

CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    capacity INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Carriers (
    carrier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    contact_info VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT,
    carrier_id INT,
    shipment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    expected_delivery DATETIME,
    actual_delivery DATETIME,
    status VARCHAR(50) DEFAULT 'in transit',
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id) ON DELETE SET NULL,
    FOREIGN KEY (carrier_id) REFERENCES Carriers(carrier_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Tracking_Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    event_description VARCHAR(255),
    event_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
