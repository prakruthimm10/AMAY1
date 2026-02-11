<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edge and Elegance - Luxury Salon</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/system-info.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

    <header>
        <div class="logo">
            <a href="#" class="logo-full">Aasif </a>
        </div>
        <nav>
            <ul>
                <li><a href="#home">HOME</a></li>
                <li><a href="#about">ABOUT</a></li>
                <li><a href="services.jsp">SERVICES</a></li>
                <li><a href="#offers">OFFERS</a></li>
                <li><a href="frameit.jsp">FRAMEIT</a></li>
                <li><a href="register.jsp">REGISTER</a></li>
                <li><a href="#booking-section">CONTACT</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <h2>A Revolution in Hairdressing</h2>
        <h1>Welcome to Edge and Elegance</h1>
        <div>
            <a href="#booking-section" class="btn-book" onclick="openBooking()">Book Your Appointment Today <i
                    class="fas fa-arrow-right"></i></a>
        </div>
    </section>

    <!-- Welcome / Main Content Section -->
    <section id="about" class="about-split">
        <div class="split-container">
            <div class="split-image">
                <img src="images/salon_green_neon_edge.png" alt="Edge and Elegance Salon Interior">
            </div>
            <div class="split-content">
                <h3>A Revolution in Hairdressing</h3>
                <h2>Welcome to Edge and Elegance</h2>
                <p>
                    At Edge and Elegance, beauty isn’t just about the latest trends—it’s about crafting an experience of
                    elegance, confidence, and relaxation. Nestled in the heart of Bangalore, our salon is a boho-chic
                    sanctuary where every detail is curated to make you feel pampered, empowered, and absolutely
                    stunning.
                </p>
                <p>
                    With over 20 years of expertise, we specialize in luxury hair extensions, precision haircuts, and
                    custom color artistry. Our commitment goes beyond hair—we create styles that enhance your natural
                    beauty, offering personalized services tailored to your unique look and lifestyle. From effortless
                    beach waves to seamlessly blended extensions, Edge and Elegance is where transformation begins.
                </p>
                <a href="javascript:void(0)" class="btn-book" onclick="toggleContent()"
                    style="margin-top: 20px; font-size: 0.9rem; padding: 0.8rem 2rem;">Learn More <i
                        class="fas fa-arrow-down"></i></a>
            </div>
        </div>
    </section>

    <!-- Hidden Content Container (Founder/Mission/WhyChoose/Loyalty OLD) -->
    <div id="more-content" style="display: none;">
        <!-- Founder Section -->
        <section class="founder-split">
            <div class="split-container reverse">
                <div class="split-content">
                    <h3>Meet Our Founder</h3>
                    <h2>Celina Caban</h2>
                    <p>
                        Behind Edge and Elegance is a visionary hairstylist with a passion for artistry and innovation.
                        With two decades of industry experience, she has mastered the art of luxury hair extensions—from
                        K-Tip and I-Tip to Volume Weft and Tape-Ins—bringing the finest techniques to her clientele. Her
                        expertise in dimensional color, precision styling, and high-end treatments has made her a
                        sought-after professional in the beauty industry.
                    </p>
                    <p>
                        Driven by a mission to create more than just a salon, she envisioned Edge and Elegance as a
                        space where every client receives more than just a service—they receive an experience. Her
                        philosophy is simple: great hair isn’t just about looking good—it’s about feeling confident,
                        radiant, and effortlessly beautiful.
                    </p>
                </div>
                <div class="split-image">
                    <img src="images/founder_celina.png" alt="Celina Caban">
                </div>
            </div>
        </section>

        <!-- Mission -->
        <section class="mission-section">
            <h3>Our Mission</h3>
            <p>We are committed to crafting an environment where every touch is luxurious, every style is personalized,
                and every visit is an experience in refined beauty.</p>
        </section>

        <!-- Why Choose Us -->
        <section id="services" class="why-choose">
            <div class="section-title">
                <h3>Why Choose Edge and Elegance?</h3>
                <p>At Edge and Elegance, we redefine beauty with a blend of artistry, luxury, and expertise.</p>
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <h4>Unmatched Expertise & Experience</h4>
                    <p>With over 20 years in the industry, our founder and team of skilled stylists bring unmatched
                        precision, artistry, and knowledge to every service.</p>
                </div>
                <div class="feature-card">
                    <h4>Luxury Hair Extensions Mastery</h4>
                    <p>We offer four premium hair extension methods—K-Tip, I-Tip, Volume Weft, and Tape-In—applied with
                        expert precision for a seamless, natural look.</p>
                </div>
                <div class="feature-card">
                    <h4>Customized & Bespoke Hair Services</h4>
                    <p>Every client is unique. We take the time to understand your hair goals and create personalized
                        styles that reflect your personality.</p>
                </div>
                <div class="feature-card">
                    <h4>A Chic, Relaxing Atmosphere</h4>
                    <p>Step into a boho-chic sanctuary, where high-end beauty meets laid-back luxury. Unleash your inner
                        glow.</p>
                </div>
                <div class="feature-card">
                    <h4>Commitment to Quality & Innovation</h4>
                    <p>We use only the highest-quality professional hair products and stay ahead of industry trends.</p>
                </div>
            </div>
        </section>
    </div> <!-- End Hidden Content -->


    <!-- Service Highlights Section -->
    <section class="service-highlights">
        <div class="section-overlay">
            <h2 class="script-heading">Where effortless elegance meets everyday luxury</h2>

            <div class="cards-container">
                <!-- Row 1 -->
                <div class="highlight-card">
                    <h3>Luxury Hair Extensions</h3>
                    <hr>
                    <p>Enhance your natural beauty with our premium hair extension services, expertly applied for a
                        flawless, long-lasting look.</p>
                    <a href="javascript:void(0)" onclick="openBooking()">Learn More <i
                            class="fas fa-arrow-down"></i></a>
                </div>
                <div class="highlight-card">
                    <h3>Haircuts & Styling</h3>
                    <hr>
                    <p>From modern trends to timeless cuts, our expert stylists create tailored looks to suit your
                        style.</p>
                    <a href="javascript:void(0)" onclick="openBooking()">Learn More <i
                            class="fas fa-arrow-down"></i></a>
                </div>
                <div class="highlight-card">
                    <h3>Color Services</h3>
                    <hr>
                    <p>Customized color artistry to create dimensional, radiant hues.</p>
                    <a href="javascript:void(0)" onclick="openBooking()">Learn More <i
                            class="fas fa-arrow-down"></i></a>
                </div>
            </div>

            <div class="cards-container row-2">
                <!-- Row 2 -->
                <div class="highlight-card">
                    <h3>Treatments & Specialty Services</h3>
                    <hr>
                    <p>Nourish and restore your hair with our premium treatment options.</p>
                    <a href="javascript:void(0)" onclick="openBooking()">Learn More <i
                            class="fas fa-arrow-down"></i></a>
                </div>
                <div class="highlight-card">
                    <h3>Bridal & Event Styling</h3>
                    <hr>
                    <p>Look flawless for life’s most special moments with our tailored styling services.</p>
                    <a href="javascript:void(0)" onclick="openBooking()">Learn More <i
                            class="fas fa-arrow-down"></i></a>
                </div>
            </div>

            <h2 class="bottom-cta">Book Your Experience Today!</h2>
            <!-- Main Toggle Button for Booking Content -->
            <a href="javascript:void(0)" class="btn-book" onclick="toggleBooking(this)" style="margin-top: 2rem;">Learn
                More
                <i class="fas fa-arrow-down"></i></a>
        </div>
    </section>

    <!-- NEW LOYALTY SECTION -->
    <section id="offers" class="loyalty-new-parallax">
        <div class="loyalty-content-hero">
            <h2 class="loyalty-script-heading">Valentine's Day Specials</h2>
            <p class="loyalty-subheading">Valid from 10th Feb to 14th Feb</p>

            <ul class="loyalty-hero-list">
                <li><i class="fas fa-heart"></i> Edge and Elegance: 50% discount</li>
                <li><i class="fas fa-heart"></i> Edge: 20% discount</li>
                <li><i class="fas fa-heart"></i> Elegance: 20% discount on all services</li>
            </ul>
            <button onclick="startHearts()" class="btn-love">Click for a Surprise</button>

            <a href="javascript:void(0)" class="btn-book" onclick="toggleBooking(this)" style="margin-top: 2rem;">Learn
                More
                <i class="fas fa-arrow-down"></i></a>
        </div>

        <!-- Decorative Balloons -->
        <img src="images/heart_balloon.png" class="edge-balloon left-balloon" alt="Decorative Heart">
        <img src="images/heart_balloon.png" class="edge-balloon right-balloon" alt="Decorative Heart">
    </section>

    <style>
        /* Styles for Decorative Edge Balloons */
        .edge-balloon {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 15vw;
            /* Large size relative to viewport width */
            max-width: 250px;
            height: auto;
            z-index: 5;
            opacity: 0.9;
            filter: drop-shadow(0 10px 10px rgba(0, 0, 0, 0.3));
            animation: floatBalloon 4s ease-in-out infinite;
        }

        .left-balloon {
            left: 2%;
            /* Slightly off the edge */
            animation-delay: 0s;
        }

        .right-balloon {
            right: 2%;
            animation-delay: 2s;
            /* Offset animation */
            transform: translateY(-50%) scaleX(-1);
            /* Mirror image if needed */
        }

        @keyframes floatBalloon {

            0%,
            100% {
                transform: translateY(-50%) rotate(-5deg);
            }

            50% {
                transform: translateY(-60%) rotate(5deg);
            }
        }

        @media (max-width: 768px) {
            .edge-balloon {
                width: 25vw;
                top: 80%;
                /* Move down on mobile so they don't block text */
            }
        }
    </style>
    </section>


    <!-- ELEGANCE GALLERY SECTION -->
    <section class="elegance-gallery">
        <h2 class="gallery-title">Elegance Gallery</h2>
        <div class="gallery-single">
            <img src="images/elegance_gallery.png"
                alt="Elegance Gallery - Showcasing salon interiors, beautiful hairstyles, premium products, and women's spa services">
        </div>
    </section>

    <!-- EDGE GALLERY SECTION -->
    <section class="edge-gallery">
        <h2 class="gallery-title">Edge Gallery</h2>
        <div class="gallery-single">
            <img src="images/edge_gallery.png"
                alt="Edge Gallery - Professional men's grooming, spa treatments, barbershop services, and wellness">
        </div>
    </section>

    <!-- EDGE AND ELEGANCE GALLERY SECTION -->
    <section class="edge-elegance-gallery">
        <h2 class="gallery-title">Edge and Elegance Gallery</h2>
        <div class="gallery-single">
            <img src="images/edge_elegance_gallery.png"
                alt="Edge and Elegance Gallery - Romantic couples spa services, facial treatments, pedicures, and salon experiences">
        </div>
    </section>

    <!-- CONTACT INFORMATION SECTION -->
    <section class="contact-info-section">
        <h2 class="section-title">Get In Touch</h2>

        <div class="contact-details-grid">
            <div class="contact-detail-item">
                <i class="fas fa-envelope"></i>
                <h3>Email</h3>
                <p><a href="mailto:edgeandelegance@gmail.com">edgeelegance@gmail.com</a></p>
            </div>

            <div class="contact-detail-item">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Address</h3>
                <p>3rd Phase, JP Nagar<br>
                    Bangalore, Karnataka<br>
                    India - 560078</p>
            </div>

            <div class="contact-detail-item">
                <i class="fas fa-clock"></i>
                <h3>Hours</h3>
                <p>Monday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                    Tuesday - Friday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                    Saturday: 10:00 AM - 8:00 PM<br>
                    Sunday: Closed</p>
            </div>

            <div class="contact-detail-item">
                <i class="fas fa-phone"></i>
                <h3>Phone Number</h3>
                <a href="tel:080557684">080-557684</a>
            </div>
        </div>

        <div class="social-media-links">
            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-tiktok"></i></a>
        </div>
    </section>

    <!-- HIDDEN BOOKING / CONTACT CONTENT -->
    <div id="booking-content" style="display: none;">
        <section class="contact-full-wrapper" id="booking-section">
            <h1 class="main-contact-title">Edge and Elegance</h1>

            <div class="contact-grid">
                <!-- Left: Info -->
                <div class="contact-info-block">

                    <div class="info-group">
                        <div class="icon-label"><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong></div>
                        <p>3rd Phase, JP Nagar, Bangalore, Karnataka 560078</p>
                    </div>

                    <div class="social-row">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                        <a href="#"><i class="fab fa-tiktok"></i></a>
                    </div>

                    <div class="info-group">
                        <h3>Call Us</h3>
                        <p class="big-phone"><a href="tel:080557684"
                                style="text-decoration: none; color: inherit;">080-557684</a></p>
                    </div>

                    <div class="info-group">
                        <h3>Email Us:</h3>
                        <p><a href="mailto:edgeandelegance@gmail.com"
                                style="text-decoration: none; color: inherit;">edgeandelegance@gmail.com</a></p>
                    </div>

                    <div class="info-group">
                        <h3>Visit Us</h3>
                        <p class="hours">
                            <strong>Hours:</strong><br>
                            Monday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                            Tuesday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                            Wednesday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                            Thursday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                            Friday: 10:30 AM - 2:30 PM, 6:00 PM - 10:30 PM<br>
                            Saturday: 10:00 AM - 8:00 PM<br>
                            Sunday: 10:00 AM - 8:00 PM
                        </p>
                    </div>
                </div>

                <!-- Right: Form -->
                <div class="contact-form-block">
                    <h2>Get in Touch With Us</h2>
                    <form action="#">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" placeholder="Full Name">
                        </div>
                        <div class="form-group">
                            <label>Phone *</label>
                            <input type="tel" placeholder="Phone *" required>
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                            <input type="email" placeholder="Email *" required>
                        </div>
                        <div class="form-group">
                            <label>Message</label>
                            <textarea placeholder="Message" rows="4"></textarea>
                        </div>

                        <div class="consent-box">
                            <input type="checkbox" id="consent">
                            <label for="consent">By checking this box, I consent to receive marketing and promotional
                                messages, including special offers, discounts, new product updates among others. Message
                                frequency may vary. Message & Data rates may apply. Reply HELP for help or STOP to
                                opt-out.</label>
                        </div>

                        <button type="submit" class="btn-submit">Submit</button>
                    </form>
                </div>
            </div>

            <div class="map-embed-footer">
                <p>3rd Phase, JP Nagar, Bangalore, Karnataka 560078, India</p>
            </div>

            <div class="footer-bottom" style="background: #222; color: #fff; padding: 2rem; margin-top: 0;">
                <p>Our core values reflect our dedication to excellence, authenticity, and client satisfaction, ensuring
                    every guest feels empowered, radiant, and valued.</p>
                <div class="footer-nav">
                    <a href="#home" style="color: #fff;">HOME</a>
                    <a href="#about" style="color: #fff;">ABOUT</a>
                    <a href="#services" style="color: #fff;">SERVICES</a>
                    <a href="#booking-section" style="color: #fff;">CONTACT</a>
                </div>
                <p class="copyright">2026 Copyright Edge and Elegance. All rights reserved</p>
            </div>
        </section>
    </div>

    <script>
        function toggleContent() {
            var content = document.getElementById("more-content");
            var btn = document.querySelector(".about-split .btn-book i");

            if (content.style.display === "none") {
                content.style.display = "block";
                content.scrollIntoView({ behavior: 'smooth', block: 'start' });
                btn.classList.remove("fa-arrow-down");
                btn.classList.add("fa-arrow-up");
            } else {
                content.style.display = "none";
                document.getElementById("about").scrollIntoView({ behavior: 'smooth' });
                btn.classList.remove("fa-arrow-up");
                btn.classList.add("fa-arrow-down");
            }
        }

        function toggleBooking(caller) {
            var content = document.getElementById("booking-content");
            // Try to find icon in the caller (this) or fallback to generic for compatibility
            var icon = caller ? caller.querySelector("i") : document.querySelector(".service-highlights .btn-book i");

            if (content.style.display === "none") {
                content.style.display = "block";
                content.scrollIntoView({ behavior: 'smooth', block: 'start' });
                if (icon) {
                    icon.classList.remove("fa-arrow-down");
                    icon.classList.add("fa-arrow-up");
                }
            } else {
                content.style.display = "none";
                if (caller) {
                    caller.scrollIntoView({ behavior: 'smooth', block: 'center' });
                } else {
                    document.getElementById("booking-section").scrollIntoView({ behavior: 'smooth' });
                }

                if (icon) {
                    icon.classList.remove("fa-arrow-up");
                    icon.classList.add("fa-arrow-down");
                }
            }
        }

        function openBooking() {
            var content = document.getElementById("booking-content");
            if (content.style.display === "none") {
                toggleBooking();
            } else {
                content.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }

        function startHearts() {
            for (let i = 0; i < 30; i++) { // Reduced count slightly for larger images
                let heart = document.createElement("div");
                // proper image tag
                heart.innerHTML = '<img src="images/heart_balloon.png" alt="Heart Balloon" style="width: 100%; height: auto;">';
                heart.classList.add("heart");
                heart.style.left = Math.random() * 100 + "vw";
                // Random size for the balloon container
                let size = (Math.random() * 60 + 40) + "px"; // 40px to 100px
                heart.style.width = size;
                heart.style.height = "auto"; // Maintain aspect ratio

                heart.style.animationDuration = (Math.random() * 3 + 4) + "s"; // Slower fall for balloons
                document.body.appendChild(heart);

                setTimeout(() => {
                    heart.remove();
                }, 7000);
            }
        }
    </script>
    <style>
        /* Inlined to avoid caching issues */
        .btn-love {
            background: #ff4d6d !important;
            color: white !important;
            border: none;
            padding: 10px 20px;
            font-size: 1.2rem;
            cursor: pointer;
            border-radius: 30px;
            margin-top: 15px;
            box-shadow: 0 4px 15px rgba(255, 77, 109, 0.4);
            transition: transform 0.2s;
            position: relative;
            z-index: 10;
        }

        .btn-love:hover {
            transform: scale(1.1);
        }

        .heart {
            position: fixed;
            top: -15vh;
            /* Start slightly higher */
            /* Removed font-size and color since we use image */
            animation: fall linear forwards;
            z-index: 99999 !important;
            pointer-events: none;
            /* Let clicks pass through */
            border-radius: 0;
            /* Remove potential interaction with other styles */
        }

        @keyframes fall {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }

            100% {
                transform: translateY(115vh) rotate(20deg);
                /* Slight rotation */
                opacity: 0;
            }
        }
    </style>

    <!-- BLACK COVER PAGE FOOTER -->
    <footer class="black-cover-footer">
        <div class="cover-content">
            <h1 class="cover-title">Edge and Elegance</h1>
            <p class="cover-tagline">Where Luxury Meets Perfection</p>
            <div class="cover-divider"></div>
            <p class="cover-address">Bangalore, India</p>
            <p class="cover-phone">080-557684</p>
        </div>
    </footer>

</body>

</html>