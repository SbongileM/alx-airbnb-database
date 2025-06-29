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

-- Booking table
CREATE TABLE booking (
    booking_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_booking_property FOREIGN KEY (property_id) REFERENCES property(property_id),
    CONSTRAINT FK_booking_user FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    CONSTRAINT valid_booking_dates CHECK (end_date > start_date)
);
