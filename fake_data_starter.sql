INSERT INTO ADMIN (username, PASSWORD, email, created_at, updated_at) VALUES
('adminUser1', 'securePassword123', 'admin1@example.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO visitee (NAME, unit_number, phone, email, created_at, PASSWORD) VALUES
('John Doe', 'Unit 101', '555-1234', 'johndoe@example.com', CURRENT_TIMESTAMP, 'visitorPassword456');
