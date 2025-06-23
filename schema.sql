-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'collaborator', 'viewer') DEFAULT 'viewer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Whiteboards Table
CREATE TABLE Whiteboards (
    board_id INT PRIMARY KEY AUTO_INCREMENT,
    board_name VARCHAR(100),
    owner_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);

-- Collaborators Table
CREATE TABLE Collaborators (
    board_id INT,
    user_id INT,
    permission ENUM('read', 'write') DEFAULT 'read',
    PRIMARY KEY (board_id, user_id),
    FOREIGN KEY (board_id) REFERENCES Whiteboards(board_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Drawing Elements Table
CREATE TABLE DrawingElements (
    element_id INT PRIMARY KEY AUTO_INCREMENT,
    board_id INT,
    element_type VARCHAR(50),
    properties JSON,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (board_id) REFERENCES Whiteboards(board_id),
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
);

-- Notes Table
CREATE TABLE Notes (
    note_id INT PRIMARY KEY AUTO_INCREMENT,
    element_id INT,
    content TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (element_id) REFERENCES DrawingElements(element_id)
);

-- Version History Table
CREATE TABLE VersionHistory (
    version_id INT PRIMARY KEY AUTO_INCREMENT,
    board_id INT,
    version_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (board_id) REFERENCES Whiteboards(board_id)
);

-- Audit Logs Table
CREATE TABLE AuditLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action_type VARCHAR(50),
    description TEXT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);