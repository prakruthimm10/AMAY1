-- COMPLETE DATABASE SCHEMA FOR AMAY1
-- Includes Users, Services, Dashboard, Staff, Revenue
-- Run this script to fully initialize the database.

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS amay1;
USE amay1;

-- ==================================================
-- 1. USERS MODULE
-- ==================================================
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    role ENUM('customer', 'stylist', 'receptionist', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==================================================
-- 2. SERVICES MODULE
-- ==================================================
CREATE TABLE IF NOT EXISTS services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(200) NOT NULL,
    service_category ENUM('elegance', 'edge', 'edge_elegance') NOT NULL,
    service_group VARCHAR(100) NOT NULL,
    description TEXT,
    price_min DECIMAL(10, 2),
    price_max DECIMAL(10, 2),
    duration_minutes INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==================================================
-- 3. DASHBOARD & MANAGEMENT MODULE
-- ==================================================
-- Bookings Table (General)
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

-- Staff Table
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

-- Customers Table (Detailed Profile)
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

-- Revenue Table
CREATE TABLE IF NOT EXISTS revenue (
    revenue_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('cash', 'card', 'upi', 'other') DEFAULT 'cash',
    transaction_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Service Bookings (Specific linkage to Services table)
CREATE TABLE IF NOT EXISTS service_bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    service_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_phone VARCHAR(20),
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- ==================================================
-- 4. DATA POPULATION
-- ==================================================

-- Insert Elegance Services (Women's Services)
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('K-Tip Extensions', 'elegance', 'Luxury Hair Extensions', 'Keratin-bonded extensions for natural movement', 15000.00, 15000.00, 180),
('I-Tip Extensions', 'elegance', 'Luxury Hair Extensions', 'Beaded method with no heat or glue', 12000.00, 12000.00, 150),
('Volume Weft Extensions', 'elegance', 'Luxury Hair Extensions', 'Add length and fullness with minimal tension', 18000.00, 18000.00, 180),
('Tape-In Extensions', 'elegance', 'Luxury Hair Extensions', 'Seamless, natural-looking extensions', 10000.00, 10000.00, 120),
('Extension Maintenance & Move-Ups', 'elegance', 'Luxury Hair Extensions', 'Keep your extensions looking fresh', 3000.00, 5000.00, 90),
('Precision Haircuts', 'elegance', 'Haircuts & Styling', 'Short to long styles, crafted with expertise', 1500.00, 3000.00, 60),
('Dry Cutting', 'elegance', 'Haircuts & Styling', 'Enhancing texture and movement for a natural look', 2000.00, 3500.00, 60),
('Boho Waves & Beachy Styling', 'elegance', 'Haircuts & Styling', 'Relaxed, effortless styles', 1200.00, 2500.00, 45),
('Luxury Blowouts', 'elegance', 'Haircuts & Styling', 'Polished, voluminous styles for any occasion', 1000.00, 2000.00, 45),
('Balayage & Hand-Painted Highlights', 'elegance', 'Color Services', 'Soft, blended highlights for a natural sun-kissed look', 5000.00, 12000.00, 180),
('Lived-In Blondes & Dimensional Brunettes', 'elegance', 'Color Services', 'Multi-tonal shades that grow beautifully', 6000.00, 15000.00, 210),
('Gloss & Toner Refresh', 'elegance', 'Color Services', 'Enhance shine and color vibrancy', 1500.00, 3000.00, 45),
('Root Touch-Up & Grey Coverage', 'elegance', 'Color Services', 'Seamless, natural results', 2000.00, 4000.00, 90),
('Vivid & Fashion Colors', 'elegance', 'Color Services', 'Bold, statement-making hues', 4000.00, 10000.00, 150),
('Color Corrections', 'elegance', 'Color Services', 'Transformative services to restore and perfect color', 8000.00, 20000.00, 240),
('Luxury Deep Conditioning Treatments', 'elegance', 'Treatments & Specialty Services', 'Rejuvenate dry, damaged hair', 2000.00, 4000.00, 60),
('Scalp Detox & Rejuvenation', 'elegance', 'Treatments & Specialty Services', 'A deep cleanse for a healthy scalp', 1500.00, 3000.00, 45),
('Keratin Smoothing Treatment', 'elegance', 'Treatments & Specialty Services', 'Long-lasting frizz control and shine', 6000.00, 12000.00, 180),
('Customized Hair Repair Services', 'elegance', 'Treatments & Specialty Services', 'Targeted solutions for healthy, beautiful hair', 3000.00, 6000.00, 90),
('Bridal Hair & Trial Styling', 'elegance', 'Bridal & Event Styling', 'Personalized bridal looks to complement your vision', 8000.00, 15000.00, 120),
('Special Occasion Updos & Glam Waves', 'elegance', 'Bridal & Event Styling', 'Elegant, polished styles for any event', 3000.00, 6000.00, 90);

-- Insert Edge Services (Men's Services)
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Buzz Cut/Induction', 'edge', 'Hair Styling', 'Clean, classic military-style cut', 400.00, 400.00, 20),
('Regular Haircut', 'edge', 'Hair Styling', 'Traditional men''s haircut', 500.00, 500.00, 30),
('Scissor Cut', 'edge', 'Hair Styling', 'Precision scissor cutting technique', 600.00, 600.00, 35),
('Fade', 'edge', 'Hair Styling', 'Modern fade haircut', 700.00, 700.00, 40),
('Skin Fade', 'edge', 'Hair Styling', 'Ultra-clean skin fade', 800.00, 800.00, 45),
('Undercut', 'edge', 'Hair Styling', 'Trendy undercut style', 900.00, 900.00, 45),
('Root Touch-Up', 'edge', 'Color Services', 'Cover grays at the roots', 300.00, 300.00, 20),
('Grey Blending', 'edge', 'Color Services', 'Natural gray coverage', 400.00, 400.00, 30),
('Full Color', 'edge', 'Color Services', 'Complete hair coloring', 500.00, 500.00, 45),
('Highlights', 'edge', 'Color Services', 'Dimensional highlights', 600.00, 900.00, 60),
('Deep Conditioning', 'edge', 'Treatments', 'Intensive moisture treatment', 300.00, 300.00, 30),
('Scalp Treatment', 'edge', 'Treatments', 'Healthy scalp therapy', 400.00, 400.00, 30),
('Keratin Treatment', 'edge', 'Treatments', 'Smoothing and strengthening', 500.00, 900.00, 90),
('Blowout', 'edge', 'Styling', 'Professional blow-dry styling', 200.00, 200.00, 20),
('Wash & Style', 'edge', 'Styling', 'Shampoo and styling', 300.00, 300.00, 25),
('Formal Styling', 'edge', 'Styling', 'Special occasion styling', 400.00, 600.00, 40),
('Beard Trim', 'edge', 'Facial & Grooming', 'Professional beard shaping', 200.00, 200.00, 15),
('Beard Shaping', 'edge', 'Facial & Grooming', 'Detailed beard sculpting', 300.00, 300.00, 20),
('Facial Cleanup', 'edge', 'Facial & Grooming', 'Deep cleansing facial', 400.00, 400.00, 45),
('Deluxe Facial', 'edge', 'Facial & Grooming', 'Premium facial treatment', 500.00, 800.00, 60),
('Manicure & Pedicure', 'edge', 'Facial & Grooming', 'Hand and foot grooming', 600.00, 900.00, 60);

-- Insert Edge and Elegance Services (Couples/Unified)
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Couple''s Swedish Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Gentle, relaxing full-body massage', 6000.00, 8000.00, 90),
('Couple''s Deep Tissue Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Therapeutic massage for muscle tension relief', 7000.00, 9000.00, 90),
('Couple''s Aromatherapy Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Relaxing massage with essential oils', 7500.00, 10000.00, 90),
('Couple''s Hot Stone Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Therapeutic heated stone massage', 8000.00, 11000.00, 90),
('Full Body Scrub', 'edge_elegance', 'Body Treatments', 'Exfoliating treatment for smooth, radiant skin', 4000.00, 6000.00, 60),
('Mud Wrap Treatment', 'edge_elegance', 'Body Treatments', 'Detoxifying mud body wrap', 5000.00, 7000.00, 75),
('Seaweed Wrap', 'edge_elegance', 'Body Treatments', 'Nourishing seaweed body treatment', 5500.00, 7500.00, 75),
('Body Polishing Treatment', 'edge_elegance', 'Body Treatments', 'Complete exfoliation and moisturizing', 6000.00, 8500.00, 90),
('Couple''s Classic Facial', 'edge_elegance', 'Facial Treatments', 'Deep cleansing and nourishing facial', 4000.00, 6000.00, 60),
('Anti-Aging Facial', 'edge_elegance', 'Facial Treatments', 'Rejuvenating treatment for youthful skin', 5000.00, 7500.00, 75),
('Brightening Facial', 'edge_elegance', 'Facial Treatments', 'Radiance-boosting facial treatment', 4500.00, 6500.00, 60),
('Hydrating Facial', 'edge_elegance', 'Facial Treatments', 'Deep moisture infusion for dry skin', 4000.00, 6000.00, 60),
('Jacuzzi Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Private jacuzzi experience for two', 2000.00, 3000.00, 45),
('Sauna Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Detoxifying heat therapy', 1500.00, 2500.00, 30),
('Steam Room Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Relaxing steam therapy', 1500.00, 2500.00, 30),
('Complete Hydrotherapy Package', 'edge_elegance', 'Hydrotherapy & Wellness', 'Access to all hydrotherapy amenities', 4000.00, 6000.00, 120),
('Couple''s Manicure', 'edge_elegance', 'Grooming & Beauty Services', 'Hand care with massage and nail grooming', 2000.00, 3500.00, 60),
('Couple''s Pedicure', 'edge_elegance', 'Grooming & Beauty Services', 'Foot spa with exfoliation and massage', 2500.00, 4000.00, 60),
('Couple''s Mani-Pedi Combo', 'edge_elegance', 'Grooming & Beauty Services', 'Complete hands and feet treatment', 4000.00, 6500.00, 90),
('Couple''s Hair Services', 'edge_elegance', 'Grooming & Beauty Services', 'Haircuts and styling for both', 3000.00, 5000.00, 90),
('Hair Spa Treatment', 'edge_elegance', 'Grooming & Beauty Services', 'Refreshing hair treatment for couples', 3500.00, 5500.00, 90),
('Bridal Pre-Wedding Package', 'edge_elegance', 'Bridal & Groom Packages', 'Complete hair, skin, and body treatments for bride', 15000.00, 25000.00, 240),
('Groom Pre-Wedding Package', 'edge_elegance', 'Bridal & Groom Packages', 'Grooming and wellness treatments for groom', 10000.00, 18000.00, 180),
('Couple''s Bridal Package', 'edge_elegance', 'Bridal & Groom Packages', 'Complete pre-wedding preparation for both', 25000.00, 40000.00, 300),
('Wedding Day Styling', 'edge_elegance', 'Bridal & Groom Packages', 'Hair and makeup on your wedding day', 12000.00, 20000.00, 180),
('Bridal Trial Session', 'edge_elegance', 'Bridal & Groom Packages', 'Pre-wedding hair and makeup trial', 5000.00, 8000.00, 120),
('Romantic Spa Day', 'edge_elegance', 'Luxury Spa Packages', 'Full day spa with massage, facial, and refreshments', 15000.00, 25000.00, 360),
('Evening Relaxation Package', 'edge_elegance', 'Luxury Spa Packages', '3-hour spa experience with treatments', 10000.00, 15000.00, 180),
('Anniversary Special', 'edge_elegance', 'Luxury Spa Packages', 'Celebration package with champagne and treats', 18000.00, 28000.00, 240),
('Ultimate Wellness Retreat', 'edge_elegance', 'Luxury Spa Packages', 'Full day wellness with all treatments included', 25000.00, 40000.00, 480);

-- Insert Sample Staff
INSERT INTO staff (staff_name, role, email, phone, specialization, status, hire_date) VALUES
('Ravi Kumar', 'stylist', 'ravi@edgeelegance.com', '9876500001', 'Men''s Haircuts & Styling', 'active', '2023-01-15'),
('Anjali Mehta', 'stylist', 'anjali@edgeelegance.com', '9876500002', 'Hair Coloring & Bridal Styling', 'active', '2023-02-20'),
('Suresh Singh', 'stylist', 'suresh@edgeelegance.com', '9876500003', 'Men''s Grooming & Beard Styling', 'active', '2023-03-10'),
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

-- Insert Sample Bookings
INSERT INTO bookings (customer_name, customer_email, customer_phone, service_name, stylist_name, booking_date, booking_time, price, status) VALUES
('Priya Sharma', 'priya@example.com', '9876543210', 'Precision Haircut', 'Ravi Kumar', CURDATE(), '10:00:00', 1500.00, 'confirmed'),
('Amit Patel', 'amit@example.com', '9876543211', 'Beard Trim', 'Suresh Singh', CURDATE(), '11:00:00', 300.00, 'confirmed'),
('Sneha Reddy', 'sneha@example.com', '9876543212', 'Balayage Highlights', 'Anjali Mehta', CURDATE(), '14:00:00', 8000.00, 'pending'),
('Rahul Verma', 'rahul@example.com', '9876543213', 'Skin Fade', 'Ravi Kumar', CURDATE(), '15:30:00', 800.00, 'confirmed'),
('Kavita Singh', 'kavita@example.com', '9876543214', 'Bridal Hair Styling', 'Anjali Mehta', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', 12000.00, 'pending'),
('Arjun Nair', 'arjun@example.com', '9876543215', 'Regular Haircut', 'Suresh Singh', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:00:00', 500.00, 'confirmed'),
('Deepika Roy', 'deepika@example.com', '9876543216', 'Couple''s Massage', 'Wellness Team', DATE_ADD(CURDATE(), INTERVAL 3 DAY), '11:00:00', 7000.00, 'pending'),
('Vikram Joshi', 'vikram@example.com', '9876543217', 'Facial Cleanup', 'Priya Desai', CURDATE(), '12:00:00', 400.00, 'completed'),
('Ananya Das', 'ananya@example.com', '9876543218', 'Keratin Treatment', 'Anjali Mehta', DATE_ADD(CURDATE(), INTERVAL -1 DAY), '10:00:00', 9000.00, 'completed'),
('Sanjay Gupta', 'sanjay@example.com', '9876543219', 'Hot Stone Massage', 'Wellness Team', DATE_ADD(CURDATE(), INTERVAL -2 DAY), '15:00:00', 5000.00, 'completed');

-- Insert Sample Revenue
INSERT INTO revenue (booking_id, amount, payment_method, transaction_date) VALUES
(8, 400.00, 'card', CURDATE()),
(9, 9000.00, 'upi', DATE_ADD(CURDATE(), INTERVAL -1 DAY)),
(10, 5000.00, 'cash', DATE_ADD(CURDATE(), INTERVAL -2 DAY));
