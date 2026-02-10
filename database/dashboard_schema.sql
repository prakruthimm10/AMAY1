-- Dashboard Database Schema for Real-Time Salon Management System

-- Create Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_phone VARCHAR(20),
    service_name VARCHAR(200) NOT NULL,
    stylist_name VARCHAR(100),
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    price DECIMAL(10, 2),
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Staff Table
CREATE TABLE IF NOT EXISTS staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(100) NOT NULL,
    role ENUM('stylist', 'beautician', 'receptionist', 'manager') NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    specialization VARCHAR(200),
    status ENUM('active', 'inactive') DEFAULT 'active',
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    total_visits INT DEFAULT 0,
    total_spent DECIMAL(10, 2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Revenue Table
CREATE TABLE IF NOT EXISTS revenue (
    revenue_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('cash', 'card', 'upi', 'other') DEFAULT 'cash',
    transaction_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Insert Sample Bookings
INSERT INTO bookings (customer_name, customer_email, customer_phone, service_name, stylist_name, booking_date, booking_time, price, status) VALUES
('Priya Sharma', 'priya@example.com', '9876543210', 'Precision Haircut', 'Ravi Kumar', CURDATE(), '10:00:00', 1500.00, 'confirmed'),
('Amit Patel', 'amit@example.com', '9876543211', 'Beard Trim', 'Suresh Singh', CURDATE(), '11:00:00', 300.00, 'confirmed'),
('Sneha Reddy', 'sneha@example.com', '9876543212', 'Balayage Highlights', 'Anjali Mehta', CURDATE(), '14:00:00', 8000.00, 'pending'),
('Rahul Verma', 'rahul@example.com', '9876543213', 'Skin Fade', 'Ravi Kumar', CURDATE(), '15:30:00', 800.00, 'confirmed'),
('Kavita Singh', 'kavita@example.com', '9876543214', 'Bridal Hair Styling', 'Anjali Mehta', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', 12000.00, 'pending'),
('Arjun Nair', 'arjun@example.com', '9876543215', 'Regular Haircut', 'Suresh Singh', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:00:00', 500.00, 'confirmed'),
('Deepika Roy', 'deepika@example.com', '9876543216', 'Couple\'s Massage', 'Wellness Team', DATE_ADD(CURDATE(), INTERVAL 3 DAY), '11:00:00', 7000.00, 'pending'),
('Vikram Joshi', 'vikram@example.com', '9876543217', 'Facial Cleanup', 'Priya Desai', CURDATE(), '12:00:00', 400.00, 'completed'),
('Ananya Das', 'ananya@example.com', '9876543218', 'Keratin Treatment', 'Anjali Mehta', DATE_ADD(CURDATE(), INTERVAL -1 DAY), '10:00:00', 9000.00, 'completed'),
('Sanjay Gupta', 'sanjay@example.com', '9876543219', 'Hot Stone Massage', 'Wellness Team', DATE_ADD(CURDATE(), INTERVAL -2 DAY), '15:00:00', 5000.00, 'completed');

-- Insert Sample Staff
INSERT INTO staff (staff_name, role, email, phone, specialization, status, hire_date) VALUES
('Ravi Kumar', 'stylist', 'ravi@edgeelegance.com', '9876500001', 'Men\'s Haircuts & Styling', 'active', '2023-01-15'),
('Anjali Mehta', 'stylist', 'anjali@edgeelegance.com', '9876500002', 'Hair Coloring & Bridal Styling', 'active', '2023-02-20'),
('Suresh Singh', 'stylist', 'suresh@edgeelegance.com', '9876500003', 'Men\'s Grooming & Beard Styling', 'active', '2023-03-10'),
('Priya Desai', 'beautician', 'priya.d@edgeelegance.com', '9876500004', 'Facials & Skin Treatments', 'active', '2023-04-05'),
('Neha Kapoor', 'receptionist', 'neha@edgeelegance.com', '9876500005', 'Customer Service', 'active', '2023-05-12'),
('Rajesh Iyer', 'manager', 'rajesh@edgeelegance.com', '9876500006', 'Salon Management', 'active', '2022-12-01');

-- Insert Sample Customers
INSERT INTO customers (customer_name, email, phone, address, total_visits, total_spent) VALUES
('Priya Sharma', 'priya@example.com', '9876543210', 'JP Nagar, Bangalore', 5, 7500.00),
('Amit Patel', 'amit@example.com', '9876543211', 'Koramangala, Bangalore', 3, 1200.00),
('Sneha Reddy', 'sneha@example.com', '9876543212', 'Indiranagar, Bangalore', 8, 25000.00),
('Rahul Verma', 'rahul@example.com', '9876543213', 'Whitefield, Bangalore', 2, 1600.00),
('Kavita Singh', 'kavita@example.com', '9876543214', 'HSR Layout, Bangalore', 1, 0.00);

-- Insert Sample Revenue
INSERT INTO revenue (booking_id, amount, payment_method, transaction_date) VALUES
(8, 400.00, 'card', CURDATE()),
(9, 9000.00, 'upi', DATE_ADD(CURDATE(), INTERVAL -1 DAY)),
(10, 5000.00, 'cash', DATE_ADD(CURDATE(), INTERVAL -2 DAY));

-- Queries for Dashboard Statistics
-- Total Bookings Today
-- SELECT COUNT(*) as today_bookings FROM bookings WHERE booking_date = CURDATE();

-- Total Bookings This Month
-- SELECT COUNT(*) as monthly_bookings FROM bookings WHERE MONTH(booking_date) = MONTH(CURDATE()) AND YEAR(booking_date) = YEAR(CURDATE());

-- Total Revenue Today
-- SELECT SUM(amount) as today_revenue FROM revenue WHERE transaction_date = CURDATE();

-- Total Revenue This Month
-- SELECT SUM(amount) as monthly_revenue FROM revenue WHERE MONTH(transaction_date) = MONTH(CURDATE()) AND YEAR(transaction_date) = YEAR(CURDATE());

-- Active Staff Count
-- SELECT COUNT(*) as active_staff FROM staff WHERE status = 'active';

-- Pending Bookings
-- SELECT COUNT(*) as pending_bookings FROM bookings WHERE status = 'pending';
