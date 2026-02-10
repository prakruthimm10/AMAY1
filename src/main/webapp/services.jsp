<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Edge and Elegance</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

    <header>
        <div class="logo">
            <a href="index.jsp" class="logo-full">Edge and Elegance</a>
        </div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="services.jsp" class="active">Services</a>
            <a href="index.jsp#system-info">Click Me</a>
            <a href="#" onclick="window.location.href='index.jsp#booking-section'">Contact</a>
        </nav>
    </header>

    <!-- SERVICES HERO SECTION -->
    <section class="services-hero">
        <h1>Our Services</h1>
        <p>Discover luxury treatments tailored for everyone</p>
    </section>

    <!-- SERVICES TABS SECTION -->
    <section class="services-section">
        <div class="services-tabs">
            <button class="tab-btn active" onclick="showServices('elegance')">Elegance Services</button>
            <button class="tab-btn" onclick="showServices('edge')">Edge Services</button>
            <button class="tab-btn" onclick="showServices('edge-elegance')">Edge and Elegance Services</button>
        </div>

        <!-- ELEGANCE SERVICES (WOMEN'S) -->
        <div id="elegance-services" class="services-content active">
            <h2 class="services-category-title">Elegance Services</h2>
            <p class="services-category-desc">Premium salon services for women</p>

            <!-- Luxury Hair Extensions -->
            <div class="service-group">
                <h3 class="service-group-title">Luxury Hair Extensions</h3>
                <p class="service-group-desc">Enhance your natural beauty with our premium hair extension services,
                    expertly applied for a flawless, long-lasting look.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-star"></i></div>
                        <h4>K-Tip Extensions</h4>
                        <p>Keratin-bonded extensions for natural movement</p>
                        <span class="service-price">Starting at ₹15,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-gem"></i></div>
                        <h4>I-Tip Extensions</h4>
                        <p>Beaded method with no heat or glue</p>
                        <span class="service-price">Starting at ₹12,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-crown"></i></div>
                        <h4>Volume Weft Extensions</h4>
                        <p>Add length and fullness with minimal tension</p>
                        <span class="service-price">Starting at ₹18,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-magic"></i></div>
                        <h4>Tape-In Extensions</h4>
                        <p>Seamless, natural-looking extensions</p>
                        <span class="service-price">Starting at ₹10,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-tools"></i></div>
                        <h4>Extension Maintenance & Move-Ups</h4>
                        <p>Keep your extensions looking fresh</p>
                        <span class="service-price">₹3,000 - ₹5,000</span>
                    </div>
                </div>
            </div>

            <!-- Haircuts & Styling -->
            <div class="service-group">
                <h3 class="service-group-title">Haircuts & Styling</h3>
                <p class="service-group-desc">From modern trends to timeless cuts, our expert stylists create tailored
                    looks to suit your style.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-cut"></i></div>
                        <h4>Precision Haircuts</h4>
                        <p>Short to long styles, crafted with expertise</p>
                        <span class="service-price">₹1,500 - ₹3,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-scissors"></i></div>
                        <h4>Dry Cutting</h4>
                        <p>Enhancing texture and movement for a natural look</p>
                        <span class="service-price">₹2,000 - ₹3,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-water"></i></div>
                        <h4>Boho Waves & Beachy Styling</h4>
                        <p>Relaxed, effortless styles</p>
                        <span class="service-price">₹1,200 - ₹2,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-wind"></i></div>
                        <h4>Luxury Blowouts</h4>
                        <p>Polished, voluminous styles for any occasion</p>
                        <span class="service-price">₹1,000 - ₹2,000</span>
                    </div>
                </div>
            </div>

            <!-- Color Services -->
            <div class="service-group">
                <h3 class="service-group-title">Color Services</h3>
                <p class="service-group-desc">Customized color artistry to create dimensional, radiant hues.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-palette"></i></div>
                        <h4>Balayage & Hand-Painted Highlights</h4>
                        <p>Soft, blended highlights for a natural sun-kissed look</p>
                        <span class="service-price">₹5,000 - ₹12,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-paint-brush"></i></div>
                        <h4>Lived-In Blondes & Dimensional Brunettes</h4>
                        <p>Multi-tonal shades that grow beautifully</p>
                        <span class="service-price">₹6,000 - ₹15,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-sparkles"></i></div>
                        <h4>Gloss & Toner Refresh</h4>
                        <p>Enhance shine and color vibrancy</p>
                        <span class="service-price">₹1,500 - ₹3,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fill-drip"></i></div>
                        <h4>Root Touch-Up & Grey Coverage</h4>
                        <p>Seamless, natural results</p>
                        <span class="service-price">₹2,000 - ₹4,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-rainbow"></i></div>
                        <h4>Vivid & Fashion Colors</h4>
                        <p>Bold, statement-making hues</p>
                        <span class="service-price">₹4,000 - ₹10,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-redo"></i></div>
                        <h4>Color Corrections</h4>
                        <p>Transformative services to restore and perfect color</p>
                        <span class="service-price">₹8,000 - ₹20,000</span>
                    </div>
                </div>
            </div>

            <!-- Treatments & Specialty Services -->
            <div class="service-group">
                <h3 class="service-group-title">Treatments & Specialty Services</h3>
                <p class="service-group-desc">Nourish and restore your hair with our premium treatment options.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spa"></i></div>
                        <h4>Luxury Deep Conditioning Treatments</h4>
                        <p>Rejuvenate dry, damaged hair</p>
                        <span class="service-price">₹2,000 - ₹4,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-leaf"></i></div>
                        <h4>Scalp Detox & Rejuvenation</h4>
                        <p>A deep cleanse for a healthy scalp</p>
                        <span class="service-price">₹1,500 - ₹3,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fire"></i></div>
                        <h4>Keratin Smoothing Treatment</h4>
                        <p>Long-lasting frizz control and shine</p>
                        <span class="service-price">₹6,000 - ₹12,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-heart"></i></div>
                        <h4>Customized Hair Repair Services</h4>
                        <p>Targeted solutions for healthy, beautiful hair</p>
                        <span class="service-price">₹3,000 - ₹6,000</span>
                    </div>
                </div>
            </div>

            <!-- Bridal & Event Styling -->
            <div class="service-group">
                <h3 class="service-group-title">Bridal & Event Styling</h3>
                <p class="service-group-desc">Look flawless for life's most special moments with our tailored styling
                    services.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-ring"></i></div>
                        <h4>Bridal Hair & Trial Styling</h4>
                        <p>Personalized bridal looks to complement your vision</p>
                        <span class="service-price">₹8,000 - ₹15,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-glass-cheers"></i></div>
                        <h4>Special Occasion Updos & Glam Waves</h4>
                        <p>Elegant, polished styles for any event</p>
                        <span class="service-price">₹3,000 - ₹6,000</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- EDGE SERVICES (MEN'S) -->
        <div id="edge-services" class="services-content">
            <h2 class="services-category-title">Edge Services</h2>
            <p class="services-category-desc">Premium grooming services for men</p>

            <!-- Hair Styling -->
            <div class="service-group">
                <h3 class="service-group-title">Hair Styling</h3>
                <p class="service-group-desc">Expert haircuts and styling for the modern gentleman.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-cut"></i></div>
                        <h4>Buzz Cut/Induction</h4>
                        <p>Clean, classic military-style cut</p>
                        <span class="service-price">₹400</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-scissors"></i></div>
                        <h4>Regular Haircut</h4>
                        <p>Traditional men's haircut</p>
                        <span class="service-price">₹500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-user-tie"></i></div>
                        <h4>Scissor Cut</h4>
                        <p>Precision scissor cutting technique</p>
                        <span class="service-price">₹600</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-star"></i></div>
                        <h4>Fade</h4>
                        <p>Modern fade haircut</p>
                        <span class="service-price">₹700</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-crown"></i></div>
                        <h4>Skin Fade</h4>
                        <p>Ultra-clean skin fade</p>
                        <span class="service-price">₹800</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-gem"></i></div>
                        <h4>Undercut</h4>
                        <p>Trendy undercut style</p>
                        <span class="service-price">₹900</span>
                    </div>
                </div>
            </div>

            <!-- Color Services -->
            <div class="service-group">
                <h3 class="service-group-title">Color Services</h3>
                <p class="service-group-desc">Professional hair coloring for men.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-paint-brush"></i></div>
                        <h4>Root Touch-Up</h4>
                        <p>Cover grays at the roots</p>
                        <span class="service-price">₹300</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-palette"></i></div>
                        <h4>Grey Blending</h4>
                        <p>Natural gray coverage</p>
                        <span class="service-price">₹400</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fill-drip"></i></div>
                        <h4>Full Color</h4>
                        <p>Complete hair coloring</p>
                        <span class="service-price">₹500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-sparkles"></i></div>
                        <h4>Highlights</h4>
                        <p>Dimensional highlights</p>
                        <span class="service-price">₹600 - ₹900</span>
                    </div>
                </div>
            </div>

            <!-- Treatments -->
            <div class="service-group">
                <h3 class="service-group-title">Treatments</h3>
                <p class="service-group-desc">Nourishing hair and scalp treatments.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spa"></i></div>
                        <h4>Deep Conditioning</h4>
                        <p>Intensive moisture treatment</p>
                        <span class="service-price">₹300</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-leaf"></i></div>
                        <h4>Scalp Treatment</h4>
                        <p>Healthy scalp therapy</p>
                        <span class="service-price">₹400</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fire"></i></div>
                        <h4>Keratin Treatment</h4>
                        <p>Smoothing and strengthening</p>
                        <span class="service-price">₹500 - ₹900</span>
                    </div>
                </div>
            </div>

            <!-- Styling Services -->
            <div class="service-group">
                <h3 class="service-group-title">Styling</h3>
                <p class="service-group-desc">Professional styling for any occasion.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-wind"></i></div>
                        <h4>Blowout</h4>
                        <p>Professional blow-dry styling</p>
                        <span class="service-price">₹200</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-water"></i></div>
                        <h4>Wash & Style</h4>
                        <p>Shampoo and styling</p>
                        <span class="service-price">₹300</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-magic"></i></div>
                        <h4>Formal Styling</h4>
                        <p>Special occasion styling</p>
                        <span class="service-price">₹400 - ₹600</span>
                    </div>
                </div>
            </div>

            <!-- Facial & Grooming -->
            <div class="service-group">
                <h3 class="service-group-title">Facial & Grooming</h3>
                <p class="service-group-desc">Complete grooming and facial services.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-razor"></i></div>
                        <h4>Beard Trim</h4>
                        <p>Professional beard shaping</p>
                        <span class="service-price">₹200</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-cut"></i></div>
                        <h4>Beard Shaping</h4>
                        <p>Detailed beard sculpting</p>
                        <span class="service-price">₹300</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spa"></i></div>
                        <h4>Facial Cleanup</h4>
                        <p>Deep cleansing facial</p>
                        <span class="service-price">₹400</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hand-sparkles"></i></div>
                        <h4>Deluxe Facial</h4>
                        <p>Premium facial treatment</p>
                        <span class="service-price">₹500 - ₹800</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hands"></i></div>
                        <h4>Manicure & Pedicure</h4>
                        <p>Hand and foot grooming</p>
                        <span class="service-price">₹600 - ₹900</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- EDGE AND ELEGANCE SERVICES (COUPLES) -->
        <div id="edge-elegance-services" class="services-content">
            <h2 class="services-category-title">Edge and Elegance Services</h2>
            <p class="services-category-desc">Romantic spa experiences for couples</p>

            <!-- Spa & Relaxation Treatments -->
            <div class="service-group">
                <h3 class="service-group-title">Spa & Relaxation Treatments</h3>
                <p class="service-group-desc">Indulge in luxurious spa treatments designed for couples to relax and
                    rejuvenate together.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spa"></i></div>
                        <h4>Couple's Swedish Massage</h4>
                        <p>Gentle, relaxing full-body massage</p>
                        <span class="service-price">₹6,000 - ₹8,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hands"></i></div>
                        <h4>Couple's Deep Tissue Massage</h4>
                        <p>Therapeutic massage for muscle tension relief</p>
                        <span class="service-price">₹7,000 - ₹9,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-leaf"></i></div>
                        <h4>Couple's Aromatherapy Massage</h4>
                        <p>Relaxing massage with essential oils</p>
                        <span class="service-price">₹7,500 - ₹10,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fire-alt"></i></div>
                        <h4>Couple's Hot Stone Massage</h4>
                        <p>Therapeutic heated stone massage</p>
                        <span class="service-price">₹8,000 - ₹11,000</span>
                    </div>
                </div>
            </div>

            <!-- Body Treatments -->
            <div class="service-group">
                <h3 class="service-group-title">Body Treatments</h3>
                <p class="service-group-desc">Exfoliate, nourish, and rejuvenate your skin with our luxurious body
                    treatments.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-sparkles"></i></div>
                        <h4>Full Body Scrub</h4>
                        <p>Exfoliating treatment for smooth, radiant skin</p>
                        <span class="service-price">₹4,000 - ₹6,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-water"></i></div>
                        <h4>Mud Wrap Treatment</h4>
                        <p>Detoxifying mud body wrap</p>
                        <span class="service-price">₹5,000 - ₹7,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-seedling"></i></div>
                        <h4>Seaweed Wrap</h4>
                        <p>Nourishing seaweed body treatment</p>
                        <span class="service-price">₹5,500 - ₹7,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-gem"></i></div>
                        <h4>Body Polishing Treatment</h4>
                        <p>Complete exfoliation and moisturizing</p>
                        <span class="service-price">₹6,000 - ₹8,500</span>
                    </div>
                </div>
            </div>

            <!-- Facial Treatments -->
            <div class="service-group">
                <h3 class="service-group-title">Facial Treatments</h3>
                <p class="service-group-desc">Specialized facials tailored to your skin type for a radiant, healthy
                    complexion.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-smile"></i></div>
                        <h4>Couple's Classic Facial</h4>
                        <p>Deep cleansing and nourishing facial</p>
                        <span class="service-price">₹4,000 - ₹6,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-star"></i></div>
                        <h4>Anti-Aging Facial</h4>
                        <p>Rejuvenating treatment for youthful skin</p>
                        <span class="service-price">₹5,000 - ₹7,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-sun"></i></div>
                        <h4>Brightening Facial</h4>
                        <p>Radiance-boosting facial treatment</p>
                        <span class="service-price">₹4,500 - ₹6,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-tint"></i></div>
                        <h4>Hydrating Facial</h4>
                        <p>Deep moisture infusion for dry skin</p>
                        <span class="service-price">₹4,000 - ₹6,000</span>
                    </div>
                </div>
            </div>

            <!-- Hydrotherapy & Wellness -->
            <div class="service-group">
                <h3 class="service-group-title">Hydrotherapy & Wellness</h3>
                <p class="service-group-desc">Relax in our luxury hydrotherapy facilities designed for couples.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hot-tub"></i></div>
                        <h4>Jacuzzi Session</h4>
                        <p>Private jacuzzi experience for two</p>
                        <span class="service-price">₹2,000 - ₹3,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-fire"></i></div>
                        <h4>Sauna Session</h4>
                        <p>Detoxifying heat therapy</p>
                        <span class="service-price">₹1,500 - ₹2,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-cloud"></i></div>
                        <h4>Steam Room Session</h4>
                        <p>Relaxing steam therapy</p>
                        <span class="service-price">₹1,500 - ₹2,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spa"></i></div>
                        <h4>Complete Hydrotherapy Package</h4>
                        <p>Access to all hydrotherapy amenities</p>
                        <span class="service-price">₹4,000 - ₹6,000</span>
                    </div>
                </div>
            </div>

            <!-- Grooming & Beauty Services -->
            <div class="service-group">
                <h3 class="service-group-title">Grooming & Beauty Services</h3>
                <p class="service-group-desc">Professional grooming and beauty treatments for couples.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hand-sparkles"></i></div>
                        <h4>Couple's Manicure</h4>
                        <p>Hand care with massage and nail grooming</p>
                        <span class="service-price">₹2,000 - ₹3,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-shoe-prints"></i></div>
                        <h4>Couple's Pedicure</h4>
                        <p>Foot spa with exfoliation and massage</p>
                        <span class="service-price">₹2,500 - ₹4,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-hands-wash"></i></div>
                        <h4>Couple's Mani-Pedi Combo</h4>
                        <p>Complete hands and feet treatment</p>
                        <span class="service-price">₹4,000 - ₹6,500</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-cut"></i></div>
                        <h4>Couple's Hair Services</h4>
                        <p>Haircuts and styling for both</p>
                        <span class="service-price">₹3,000 - ₹5,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-spray-can"></i></div>
                        <h4>Hair Spa Treatment</h4>
                        <p>Refreshing hair treatment for couples</p>
                        <span class="service-price">₹3,500 - ₹5,500</span>
                    </div>
                </div>
            </div>

            <!-- Bridal & Groom Packages -->
            <div class="service-group">
                <h3 class="service-group-title">Bridal & Groom Packages</h3>
                <p class="service-group-desc">Comprehensive pre-wedding packages to prepare for your special day.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-ring"></i></div>
                        <h4>Bridal Pre-Wedding Package</h4>
                        <p>Complete hair, skin, and body treatments for bride</p>
                        <span class="service-price">₹15,000 - ₹25,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-user-tie"></i></div>
                        <h4>Groom Pre-Wedding Package</h4>
                        <p>Grooming and wellness treatments for groom</p>
                        <span class="service-price">₹10,000 - ₹18,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-heart"></i></div>
                        <h4>Couple's Bridal Package</h4>
                        <p>Complete pre-wedding preparation for both</p>
                        <span class="service-price">₹25,000 - ₹40,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-crown"></i></div>
                        <h4>Wedding Day Styling</h4>
                        <p>Hair and makeup on your wedding day</p>
                        <span class="service-price">₹12,000 - ₹20,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-glass-cheers"></i></div>
                        <h4>Bridal Trial Session</h4>
                        <p>Pre-wedding hair and makeup trial</p>
                        <span class="service-price">₹5,000 - ₹8,000</span>
                    </div>
                </div>
            </div>

            <!-- Luxury Spa Packages -->
            <div class="service-group">
                <h3 class="service-group-title">Luxury Spa Packages</h3>
                <p class="service-group-desc">All-inclusive spa experiences for the ultimate relaxation.</p>

                <div class="services-grid">
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-wine-glass-alt"></i></div>
                        <h4>Romantic Spa Day</h4>
                        <p>Full day spa with massage, facial, and refreshments</p>
                        <span class="service-price">₹15,000 - ₹25,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-moon"></i></div>
                        <h4>Evening Relaxation Package</h4>
                        <p>3-hour spa experience with treatments</p>
                        <span class="service-price">₹10,000 - ₹15,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-gift"></i></div>
                        <h4>Anniversary Special</h4>
                        <p>Celebration package with champagne and treats</p>
                        <span class="service-price">₹18,000 - ₹28,000</span>
                    </div>
                    <div class="service-card">
                        <div class="service-icon"><i class="fas fa-star"></i></div>
                        <h4>Ultimate Wellness Retreat</h4>
                        <p>Full day wellness with all treatments included</p>
                        <span class="service-price">₹25,000 - ₹40,000</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- BLACK COVER PAGE FOOTER -->
    <footer class="black-cover-footer">
        <div class="cover-content">
            <h1 class="cover-title">Edge and Elegance</h1>
            <p class="cover-tagline">Where Luxury Meets Perfection</p>
            <div class="cover-divider"></div>
            <p class="cover-address">3rd Phase, JP Nagar, Bangalore, Karnataka - 560078</p>
            <p class="cover-phone">080-557684</p>
        </div>
    </footer>

    <script>
        function showServices(category) {
            // Hide all service contents
            const contents = document.querySelectorAll('.services-content');
            contents.forEach(content => content.classList.remove('active'));

            // Remove active class from all tabs
            const tabs = document.querySelectorAll('.tab-btn');
            tabs.forEach(tab => tab.classList.remove('active'));

            // Show selected content and activate tab
            if (category === 'elegance') {
                document.getElementById('elegance-services').classList.add('active');
                event.target.classList.add('active');
            } else if (category === 'edge') {
                document.getElementById('edge-services').classList.add('active');
                event.target.classList.add('active');
            } else if (category === 'edge-elegance') {
                document.getElementById('edge-elegance-services').classList.add('active');
                event.target.classList.add('active');
            }
        }
    </script>

</body>

</html>