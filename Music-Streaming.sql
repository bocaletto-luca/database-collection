-- Music Streaming Service Database
-- Description: Schema for a music streaming platform.
-- The tables include Users, Artists, Albums, Tracks, Playlists, and Playlist_Tracks (a many-to-many relationship).

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    bio TEXT,
    debut_year YEAR
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    release_year YEAR,
    genre VARCHAR(50),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Tracks (
    track_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT,
    title VARCHAR(150) NOT NULL,
    duration TIME,
    track_number INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Playlist_Tracks (
    playlist_id INT,
    track_id INT,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
