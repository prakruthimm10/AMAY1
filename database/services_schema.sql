-- Database Schema for Edge and Elegance Salon Services
-- Complete schema with all services

-- Create Services Table
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

-- Insert Elegance Services (Women's Services)

-- Luxury Hair Extensions
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('K-Tip Extensions', 'elegance', 'Luxury Hair Extensions', 'Keratin-bonded extensions for natural movement', 15000.00, 15000.00, 180),
('I-Tip Extensions', 'elegance', 'Luxury Hair Extensions', 'Beaded method with no heat or glue', 12000.00, 12000.00, 150),
('Volume Weft Extensions', 'elegance', 'Luxury Hair Extensions', 'Add length and fullness with minimal tension', 18000.00, 18000.00, 180),
('Tape-In Extensions', 'elegance', 'Luxury Hair Extensions', 'Seamless, natural-looking extensions', 10000.00, 10000.00, 120),
('Extension Maintenance & Move-Ups', 'elegance', 'Luxury Hair Extensions', 'Keep your extensions looking fresh', 3000.00, 5000.00, 90);

-- Haircuts & Styling
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Precision Haircuts', 'elegance', 'Haircuts & Styling', 'Short to long styles, crafted with expertise', 1500.00, 3000.00, 60),
('Dry Cutting', 'elegance', 'Haircuts & Styling', 'Enhancing texture and movement for a natural look', 2000.00, 3500.00, 60),
('Boho Waves & Beachy Styling', 'elegance', 'Haircuts & Styling', 'Relaxed, effortless styles', 1200.00, 2500.00, 45),
('Luxury Blowouts', 'elegance', 'Haircuts & Styling', 'Polished, voluminous styles for any occasion', 1000.00, 2000.00, 45);

-- Color Services
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Balayage & Hand-Painted Highlights', 'elegance', 'Color Services', 'Soft, blended highlights for a natural sun-kissed look', 5000.00, 12000.00, 180),
('Lived-In Blondes & Dimensional Brunettes', 'elegance', 'Color Services', 'Multi-tonal shades that grow beautifully', 6000.00, 15000.00, 210),
('Gloss & Toner Refresh', 'elegance', 'Color Services', 'Enhance shine and color vibrancy', 1500.00, 3000.00, 45),
('Root Touch-Up & Grey Coverage', 'elegance', 'Color Services', 'Seamless, natural results', 2000.00, 4000.00, 90),
('Vivid & Fashion Colors', 'elegance', 'Color Services', 'Bold, statement-making hues', 4000.00, 10000.00, 150),
('Color Corrections', 'elegance', 'Color Services', 'Transformative services to restore and perfect color', 8000.00, 20000.00, 240);

-- Treatments & Specialty Services
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Luxury Deep Conditioning Treatments', 'elegance', 'Treatments & Specialty Services', 'Rejuvenate dry, damaged hair', 2000.00, 4000.00, 60),
('Scalp Detox & Rejuvenation', 'elegance', 'Treatments & Specialty Services', 'A deep cleanse for a healthy scalp', 1500.00, 3000.00, 45),
('Keratin Smoothing Treatment', 'elegance', 'Treatments & Specialty Services', 'Long-lasting frizz control and shine', 6000.00, 12000.00, 180),
('Customized Hair Repair Services', 'elegance', 'Treatments & Specialty Services', 'Targeted solutions for healthy, beautiful hair', 3000.00, 6000.00, 90);

-- Bridal & Event Styling
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Bridal Hair & Trial Styling', 'elegance', 'Bridal & Event Styling', 'Personalized bridal looks to complement your vision', 8000.00, 15000.00, 120),
('Special Occasion Updos & Glam Waves', 'elegance', 'Bridal & Event Styling', 'Elegant, polished styles for any event', 3000.00, 6000.00, 90);

-- Insert Edge Services (Men's Services)

-- Hair Styling
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Buzz Cut/Induction', 'edge', 'Hair Styling', 'Clean, classic military-style cut', 400.00, 400.00, 20),
('Regular Haircut', 'edge', 'Hair Styling', 'Traditional men\'s haircut', 500.00, 500.00, 30),
('Scissor Cut', 'edge', 'Hair Styling', 'Precision scissor cutting technique', 600.00, 600.00, 35),
('Fade', 'edge', 'Hair Styling', 'Modern fade haircut', 700.00, 700.00, 40),
('Skin Fade', 'edge', 'Hair Styling', 'Ultra-clean skin fade', 800.00, 800.00, 45),
('Undercut', 'edge', 'Hair Styling', 'Trendy undercut style', 900.00, 900.00, 45);

-- Color Services
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Root Touch-Up', 'edge', 'Color Services', 'Cover grays at the roots', 300.00, 300.00, 20),
('Grey Blending', 'edge', 'Color Services', 'Natural gray coverage', 400.00, 400.00, 30),
('Full Color', 'edge', 'Color Services', 'Complete hair coloring', 500.00, 500.00, 45),
('Highlights', 'edge', 'Color Services', 'Dimensional highlights', 600.00, 900.00, 60);

-- Treatments
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Deep Conditioning', 'edge', 'Treatments', 'Intensive moisture treatment', 300.00, 300.00, 30),
('Scalp Treatment', 'edge', 'Treatments', 'Healthy scalp therapy', 400.00, 400.00, 30),
('Keratin Treatment', 'edge', 'Treatments', 'Smoothing and strengthening', 500.00, 900.00, 90);

-- Styling
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Blowout', 'edge', 'Styling', 'Professional blow-dry styling', 200.00, 200.00, 20),
('Wash & Style', 'edge', 'Styling', 'Shampoo and styling', 300.00, 300.00, 25),
('Formal Styling', 'edge', 'Styling', 'Special occasion styling', 400.00, 600.00, 40);

-- Facial & Grooming
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Beard Trim', 'edge', 'Facial & Grooming', 'Professional beard shaping', 200.00, 200.00, 15),
('Beard Shaping', 'edge', 'Facial & Grooming', 'Detailed beard sculpting', 300.00, 300.00, 20),
('Facial Cleanup', 'edge', 'Facial & Grooming', 'Deep cleansing facial', 400.00, 400.00, 45),
('Deluxe Facial', 'edge', 'Facial & Grooming', 'Premium facial treatment', 500.00, 800.00, 60),
('Manicure & Pedicure', 'edge', 'Facial & Grooming', 'Hand and foot grooming', 600.00, 900.00, 60);

-- Insert Edge and Elegance Services (Couples Services) - EXPANDED

-- Spa & Relaxation Treatments
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Couple\'s Swedish Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Gentle, relaxing full-body massage', 6000.00, 8000.00, 90),
('Couple\'s Deep Tissue Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Therapeutic massage for muscle tension relief', 7000.00, 9000.00, 90),
('Couple\'s Aromatherapy Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Relaxing massage with essential oils', 7500.00, 10000.00, 90),
('Couple\'s Hot Stone Massage', 'edge_elegance', 'Spa & Relaxation Treatments', 'Therapeutic heated stone massage', 8000.00, 11000.00, 90);

-- Body Treatments
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Full Body Scrub', 'edge_elegance', 'Body Treatments', 'Exfoliating treatment for smooth, radiant skin', 4000.00, 6000.00, 60),
('Mud Wrap Treatment', 'edge_elegance', 'Body Treatments', 'Detoxifying mud body wrap', 5000.00, 7000.00, 75),
('Seaweed Wrap', 'edge_elegance', 'Body Treatments', 'Nourishing seaweed body treatment', 5500.00, 7500.00, 75),
('Body Polishing Treatment', 'edge_elegance', 'Body Treatments', 'Complete exfoliation and moisturizing', 6000.00, 8500.00, 90);

-- Facial Treatments
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Couple\'s Classic Facial', 'edge_elegance', 'Facial Treatments', 'Deep cleansing and nourishing facial', 4000.00, 6000.00, 60),
('Anti-Aging Facial', 'edge_elegance', 'Facial Treatments', 'Rejuvenating treatment for youthful skin', 5000.00, 7500.00, 75),
('Brightening Facial', 'edge_elegance', 'Facial Treatments', 'Radiance-boosting facial treatment', 4500.00, 6500.00, 60),
('Hydrating Facial', 'edge_elegance', 'Facial Treatments', 'Deep moisture infusion for dry skin', 4000.00, 6000.00, 60);

-- Hydrotherapy & Wellness
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Jacuzzi Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Private jacuzzi experience for two', 2000.00, 3000.00, 45),
('Sauna Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Detoxifying heat therapy', 1500.00, 2500.00, 30),
('Steam Room Session', 'edge_elegance', 'Hydrotherapy & Wellness', 'Relaxing steam therapy', 1500.00, 2500.00, 30),
('Complete Hydrotherapy Package', 'edge_elegance', 'Hydrotherapy & Wellness', 'Access to all hydrotherapy amenities', 4000.00, 6000.00, 120);

-- Grooming & Beauty Services
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Couple\'s Manicure', 'edge_elegance', 'Grooming & Beauty Services', 'Hand care with massage and nail grooming', 2000.00, 3500.00, 60),
('Couple\'s Pedicure', 'edge_elegance', 'Grooming & Beauty Services', 'Foot spa with exfoliation and massage', 2500.00, 4000.00, 60),
('Couple\'s Mani-Pedi Combo', 'edge_elegance', 'Grooming & Beauty Services', 'Complete hands and feet treatment', 4000.00, 6500.00, 90),
('Couple\'s Hair Services', 'edge_elegance', 'Grooming & Beauty Services', 'Haircuts and styling for both', 3000.00, 5000.00, 90),
('Hair Spa Treatment', 'edge_elegance', 'Grooming & Beauty Services', 'Refreshing hair treatment for couples', 3500.00, 5500.00, 90);

-- Bridal & Groom Packages
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Bridal Pre-Wedding Package', 'edge_elegance', 'Bridal & Groom Packages', 'Complete hair, skin, and body treatments for bride', 15000.00, 25000.00, 240),
('Groom Pre-Wedding Package', 'edge_elegance', 'Bridal & Groom Packages', 'Grooming and wellness treatments for groom', 10000.00, 18000.00, 180),
('Couple\'s Bridal Package', 'edge_elegance', 'Bridal & Groom Packages', 'Complete pre-wedding preparation for both', 25000.00, 40000.00, 300),
('Wedding Day Styling', 'edge_elegance', 'Bridal & Groom Packages', 'Hair and makeup on your wedding day', 12000.00, 20000.00, 180),
('Bridal Trial Session', 'edge_elegance', 'Bridal & Groom Packages', 'Pre-wedding hair and makeup trial', 5000.00, 8000.00, 120);

-- Luxury Spa Packages
INSERT INTO services (service_name, service_category, service_group, description, price_min, price_max, duration_minutes) VALUES
('Romantic Spa Day', 'edge_elegance', 'Luxury Spa Packages', 'Full day spa with massage, facial, and refreshments', 15000.00, 25000.00, 360),
('Evening Relaxation Package', 'edge_elegance', 'Luxury Spa Packages', '3-hour spa experience with treatments', 10000.00, 15000.00, 180),
('Anniversary Special', 'edge_elegance', 'Luxury Spa Packages', 'Celebration package with champagne and treats', 18000.00, 28000.00, 240),
('Ultimate Wellness Retreat', 'edge_elegance', 'Luxury Spa Packages', 'Full day wellness with all treatments included', 25000.00, 40000.00, 480);

-- Create Service Bookings Table (for future use)
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

-- Query to view all services by category
-- SELECT * FROM services WHERE service_category = 'elegance' ORDER BY service_group, service_name;
-- SELECT * FROM services WHERE service_category = 'edge' ORDER BY service_group, service_name;
-- SELECT * FROM services WHERE service_category = 'edge_elegance' ORDER BY service_group, service_name;

-- Total services count:
-- Elegance: 23 services
-- Edge: 21 services
-- Edge and Elegance: 33 services
-- TOTAL: 77 services
