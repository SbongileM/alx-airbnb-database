-- 1. Insert Users (guests, hosts, and an admin)

INSERT INTO "user" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    -- Admin
    ('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'ALX', 'Admin', 'admin@alxproperties.com', '$2a$10$xJwL5v5Jz5U5Z5U5Z5U5Ze', '+27865421999', 'admin', NOW() - INTERVAL '1 year'),
    
    -- Hosts
    ('9a5e7d8b-2c4f-4a1d-b876-3e6f8a9b0c1d', 'Sarah', 'Johnson', 'sjohnson@behive.com', 'P@ssw0rd2024!Secure', '+27255512341', 'host', NOW() - INTERVAL '9 months'),
    ('4e3a2b1c-0d9e-4f7a-b8c9-1d2e3f4a5b6c', 'Sizakele', 'Twala', 'stwala@twalaproperties.com', 'Xk9&qLmz#R2tYp5s!', '+27105559876', 'host', NOW() - INTERVAL '6 months'),
    
    -- Guests
    ('7d8e9f0a-1b2c-3d4e-5f6g-7h8i9j0k1l2m', 'Emma', 'Williams', 'emma4@gmail.com', 'TErm$2019', '+27617555123', 'guest', NOW() - INTERVAL '3 months'),
    ('1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p', 'Phumzile', 'Brown', 'pbrown@siyakhaconst.com', '@RandomConstructors1512', '+27755559876', 'guest', NOW() - INTERVAL '2 months'),
    ('6f5e4d3c-2b1a-9f8e-7d6c-5b4a3f2e1d0c', 'Mduduzi', 'Khumalo', 'mduduzimbulazi@.gmailcom', 'WenaMbulazi#2002', '+27625551234', 'guest', NOW() - INTERVAL '1 month');


