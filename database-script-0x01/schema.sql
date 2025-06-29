CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- User table
CREATE TABLE user (
    user_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(25),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_email UNIQUE (email)
);

-- Property table
CREATE TABLE property (
    property_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(128) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_property_host FOREIGN KEY (host_id) REFERENCES "user"(user_id)
);
