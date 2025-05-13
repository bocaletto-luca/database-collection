-- Travel Booking Database
-- Description: Schema for an online travel booking system.
-- Tables included:
--   - Customers: Stores customer basic information.
--   - Bookings: Contains general booking data.
--   - Flights: Definitions of available flights.
--   - Hotels: Information about hotels.
--   - Tours: Details of tour packages.
--   - Booking_Details: Links a booking to a flight, hotel, or tour.
  
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    booking_type ENUM('flight', 'hotel', 'tour') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    origin VARCHAR(100),
    destination VARCHAR(100),
    departure_time DATETIME,
    arrival_time DATETIME,
    price DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    price_per_night DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Tours (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    tour_date DATE,
    location VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Booking_Details will store the specific details for each booking depending on the booking_type.
CREATE TABLE Booking_Details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    reference_id INT,  -- could be flight_id, hotel_id, or tour_id
    detail_type ENUM('flight', 'hotel', 'tour'),
    quantity INT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
