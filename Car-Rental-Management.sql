-- Car Rental Management Database
-- Description: Schema for managing car rental operations.
-- Tables included:
--   - Cars: Stores information about the vehicles.
--   - Customers: Contains customer details.
--   - Branches: Information about rental locations.
--   - Rentals: Records rental transactions.
--   - Payments: Stores payment details for rentals.

CREATE TABLE Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT,
    plate_number VARCHAR(20) UNIQUE,
    status ENUM('available', 'rented', 'maintenance') DEFAULT 'available',
    rental_rate DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    drivers_license VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    branch_id INT, -- pickup branch; you might add drop-off as well
    rental_start DATETIME,
    rental_end DATETIME,
    status ENUM('pending', 'active', 'completed', 'canceled') DEFAULT 'pending',
    total_charge DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    amount DECIMAL(10,2),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
