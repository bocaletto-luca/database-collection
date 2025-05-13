-- Financial Portfolio Management Database
-- Description: Schema for tracking investment portfolios.
-- Tables included:
--   - Investors: Stores investor information.
--   - Assets: Lists available financial assets (e.g., stocks, bonds).
--   - Portfolios: Each investor's portfolio.
--   - Portfolio_Holdings: The holdings in each portfolio.
--   - Trades: Records of trades (buy/sell operations).
--   - Market_Data: Historical market data for assets.

CREATE TABLE Investors (
    investor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Assets (
    asset_id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(150),
    asset_type VARCHAR(50)  -- e.g., stock, bond
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Portfolios (
    portfolio_id INT AUTO_INCREMENT PRIMARY KEY,
    investor_id INT,
    portfolio_name VARCHAR(150) NOT NULL,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (investor_id) REFERENCES Investors(investor_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Portfolio_Holdings (
    holding_id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id INT,
    asset_id INT,
    quantity DECIMAL(15,4),
    average_cost DECIMAL(15,4),
    FOREIGN KEY (portfolio_id) REFERENCES Portfolios(portfolio_id) ON DELETE CASCADE,
    FOREIGN KEY (asset_id) REFERENCES Assets(asset_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Trades (
    trade_id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id INT,
    asset_id INT,
    trade_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(15,4),
    quantity DECIMAL(15,4),
    trade_type ENUM('buy', 'sell'),
    FOREIGN KEY (portfolio_id) REFERENCES Portfolios(portfolio_id) ON DELETE CASCADE,
    FOREIGN KEY (asset_id) REFERENCES Assets(asset_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Market_Data (
    market_data_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id INT,
    data_date DATE,
    open DECIMAL(15,4),
    close DECIMAL(15,4),
    high DECIMAL(15,4),
    low DECIMAL(15,4),
    volume BIGINT,
    FOREIGN KEY (asset_id) REFERENCES Assets(asset_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
