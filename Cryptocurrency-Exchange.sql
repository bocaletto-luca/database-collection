-- Cryptocurrency Exchange Database
-- Description: Schema for a cryptocurrency exchange platform.
-- Tables:
--   - Users: Exchange users.
--   - Wallets: Digital wallets for users.
--   - Cryptocurrencies: List of cryptocurrencies.
--   - Orders: Buy/sell orders.
--   - Trades: Executed trades.
--   - Transaction_History: Historical transaction data.

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Wallets (
    wallet_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    balance DECIMAL(20,8) DEFAULT 0,
    currency VARCHAR(10) NOT NULL,  -- primary currency of the wallet
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Cryptocurrencies (
    crypto_id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    current_price DECIMAL(20,8)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    crypto_id INT,
    order_type ENUM('buy','sell') NOT NULL,
    amount DECIMAL(20,8) NOT NULL,
    price DECIMAL(20,8) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'open',
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Trades (
    trade_id INT AUTO_INCREMENT PRIMARY KEY,
    buy_order_id INT,
    sell_order_id INT,
    crypto_id INT,
    amount DECIMAL(20,8) NOT NULL,
    price DECIMAL(20,8) NOT NULL,
    trade_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buy_order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (sell_order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (crypto_id) REFERENCES Cryptocurrencies(crypto_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Transaction_History (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT,
    amount DECIMAL(20,8) NOT NULL,
    transaction_type ENUM('deposit','withdrawal','trade','fee') NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (wallet_id) REFERENCES Wallets(wallet_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
