-- 1. Insert Users (guests, hosts, and an admin)

INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    -- Admin
    ('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'ALX', 'Admin', 'admin@alxproperties.com', '$2a$10$xJwL5v5Jz5U5Z5U5Z5U5Ze', '+27865421999', 'admin', NOW() - INTERVAL '1 year'),
    
    -- Hosts
    ('9a5e7d8b-2c4f-4a1d-b876-3e6f8a9b0c1d', 'Sarah', 'Johnson', 'sjohnson@behive.com', 'P@ssw0rd2024!Secure', '+27255512341', 'host', NOW() - INTERVAL '9 months'),
    ('4e3a2b1c-0d9e-4f7a-b8c9-1d2e3f4a5b6c', 'Sizakele', 'Twala', 'stwala@twalaproperties.com', 'Xk9&qLmz#R2tYp5s!', '+27105559876', 'host', NOW() - INTERVAL '6 months'),
    
    -- Guests
    ('7d8e9f0a-1b2c-3d4e-5f6g-7h8i9j0k1l2m', 'Emma', 'Williams', 'emma4@gmail.com', 'TErm$2019', '+27617555123', 'guest', NOW() - INTERVAL '3 days'),
    ('1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p', 'Phumzile', 'Brown', 'pbrown@siyakhaconst.com', '@RandomConstructors1512', '+27755559876', 'guest', NOW() - INTERVAL '2 months'),
    ('6f5e4d3c-2b1a-9f8e-7d6c-5b4a3f2e1d0c', 'Mduduzi', 'Khumalo', 'mduduzimbulazi@.gmailcom', 'WenaMbulazi#2002', '+27625551234', 'guest', NOW() - INTERVAL '1 month');
    ('1c2d3e4f-5g6h-7i8j-9k0l-1m2n3o4p5q6r7s8t', 'Gcina', 'Sithole', 'gcinasithole@gmail.com', '#justgotmarried', '+27797558143', 'guest', NOW() - INTERVAL '3 days'),
    ('8a9b0c1d-2e3f-4g5h-6i7j-8k9l0m1n2o3p4q5r', 'Londiwe', 'Sithole', 'londykhumalo@gmail.com', '#honeymoonVib3z', '+27845654321', 'guest', NOW() - INTERVAL '2 months');


-- 2. Insert Properties

INSERT INTO property (property_id, host_id, name, description, location, price_per_night, created_at)
VALUES
    -- Behive properties
    ('8a7b6c5d-4e3f-2g1h-0i9j-8k7l6m5n4o3p2', '9a5e7d8b-2c4f-4a1d-b876-3e6f8a9b0c1d', 'Cozy Mountain Cabin', 'Beautiful log cabin with mountain views', 'Hazyview', 4250.00, NOW() - INTERVAL '8 months'),
    ('3b4c5d6e-7f8g-9h0i-1j2k-3l4m5n6o7p8q9r', '9a5e7d8b-2c4f-4a1d-b876-3e6f8a9b0c1d', 'Downtown Loft', 'Modern loft in the heart of the city', 'Johannesburg, Braamfontein', 3000.00, NOW() - INTERVAL '6 months'),
    
    -- Twala properties
    ('0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t', '4e3a2b1c-0d9e-4f7a-b8c9-1d2e3f4a5b6c', 'Beachfront Villa', 'Luxury villa with private beach access', 'Durban, South Beach', 8099.00, NOW() - INTERVAL '10 months'),
    ('5a6b7c8d-9e0f-1g2h-3i4j-5k6l7m8n9o0p1q', '4e3a2b1c-0d9e-4f7a-b8c9-1d2e3f4a5b6c', 'Beachside Cottage', 'Charming cottage with garden', 'CapeTown, Llandudno', 5999.00, NOW() - INTERVAL '8 months');


-- 3. Insert Bookings

INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES
    -- Past bookings
    ('6b7c8d9e-0f1g-2h3i-4j5k-6l7m8n9o0p1q2r3s', '8a7b6c5d-4e3f-2g1h-0i9j-8k7l6m5n4o3p2', '1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p', NOW() - INTERVAL '2 months', NOW() - INTERVAL '1 month 28 days', 'confirmed', NOW() - INTERVAL '2 months'),
    ('3e4f5g6h-7i8j-9k0l-1m2n-3o4p5q6r7s8t9u0v', '5a6b7c8d-9e0f-1g2h-3i4j-5k6l7m8n9o0p1q', '6f5e4d3c-2b1a-9f8e-7d6c-5b4a3f2e1d0c', NOW() - INTERVAL '1 month', NOW() - INTERVAL '3 weeks', 'cancelled', NOW() - INTERVAL '1 month'),
    
    -- Current bookings
    ('0a1b2c3d-4e5f-6g7h-8i9j-0k1l2m3n4o5p6q7r', '0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t', '1c2d3e4f-5g6h-7i8j-9k0l-1m2n3o4p5q6r7s8t', NOW() - INTERVAL '7 days', NOW() + INTERVAL '2 weeks', 'confirmed', NOW() - INTERVAL '1 week'),
    ('7e8f9g0h-1i2j-3k4l-5m6n-7o8p9q0r1s2t3u4v', '0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t', '8a9b0c1d-2e3f-4g5h-6i7j-8k9l0m1n2o3p4q5r', NOW() + INTERVAL '7 days', NOW() + INTERVAL '2 weeks', 'confirmed', NOW() - INTERVAL '1 week'),
    
    -- Pending booking
    ('4b5c6d7e-8f9g-0h1i-2j3k-4l5m6n7o8p9q0r1s', '5a6b7c8d-9e0f-1g2h-3i4j-5k6l7m8n9o0p1q', '7d8e9f0a-1b2c-3d4e-5f6g-7h8i9j0k1l2m', NOW() + INTERVAL '1 week', NOW() + INTERVAL '3 weeks', 'pending', NOW() - INTERVAL '3 days');


-- 4. Insert Payments

INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('3d4e5f6g-7h8i-9j0k-1l2m-3n4o5p6q7r8s9t', '0a1b2c3d-4e5f-6g7h-8i9j-0k1l2m3n4o5p6q7r', 
     (SELECT (EXTRACT(DAY FROM (NOW() - INTERVAL '7 days' - (NOW() + INTERVAL '2 weeks'))) * price_per_night 
     FROM property WHERE property_id = '0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t', 
     NOW() - INTERVAL '2 weeks', 'credit_card'),
    
     
    ('6a5b4c3d-2e1f-0g9h-8i7j-6k5l4m3n2o1p0q', '7e8f9g0h-1i2j-3k4l-5m6n-7o8p9q0r1s2t3u4v', 
     (SELECT (EXTRACT(DAY FROM (NOW() - INTERVAL '7 days' - (NOW() + INTERVAL '2 weeks'))) * price_per_night 
     FROM property WHERE property_id = '0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t'), 
     NOW() - INTERVAL '2 weeks', 'credit_card'),
     
    ('9e8f7g6h-5i4j-3k2l-1m0n-9o8p7q6r5s4t3u2', '4b5c6d7e-8f9g-0h1i-2j3k-4l5m6n7o8p9q0r1s', 
     (SELECT (EXTRACT(DAY FROM (NOW() + INTERVAL '1 week' - (NOW() + INTERVAL '3 weeks'))) * price_per_night 
     FROM property WHERE property_id = '5a6b7c8d-9e0f-1g2h-3i4j-5k6l7m8n9o0p1q', 
     NOW() + INTERVAL '3 weeks', 'paypal');


-- 5. Insert Reviews

INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('0e1f2g3h-4i5j-6k7l-8m9n-0o1p2q3r4s5t6u', '8a7b6c5d-4e3f-2g1h-0i9j-8k7l6m5n4o3p2', '1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p', 5, 'The cabin was absolutely perfect! Beautiful views and cozy interior.', NOW() - INTERVAL '1 month'),
    ('8b9c0d1e-2f3g-4h5i-6j7k-8l9m0n1o2p3q4r', '0d1e2f3g-4h5i-6j7k-8l9m-0n1o2p3q4r5s6t', '1c2d3e4f-5g6h-7i8j-9k0l-1m2n3o4p5q6r7s8t', 4, 'Amazing location right on the beach. The vibe is good for romantic vacations.', NOW() - INTERVAL '1 weeks');
    