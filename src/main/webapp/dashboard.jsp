<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Edge and Elegance</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/system-info.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

    <header>
        <div class="logo">
            <a href="index.jsp" class="logo-full">Edge and Elegance</a>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="index.jsp#about">ABOUT</a></li>
                <li><a href="services.jsp">SERVICES</a></li>
                <li><a href="index.jsp#offers">OFFERS</a></li>
                <li><a href="frameit.jsp">FRAMEIT</a></li>
                <li><a href="index.jsp#booking-section">CONTACT</a></li>
            </ul>
        </nav>
    </header>

    <section id="system-info" class="system-info-section" style="padding-top: 120px;">
        <h2 class="dashboard-main-title">Salon Management Dashboards</h2>

        <!-- Dashboard Tabs -->
        <% String role=(String) session.getAttribute("role"); String displayStyle=(role !=null)
            ? "style='display:none;'" : "" ; %>
            <div class="dashboard-tabs" <%=displayStyle %>>
                <button class="dashboard-tab active" onclick="showDashboard('admin')">
                    <i class="fas fa-user-shield"></i> Admin Dashboard
                </button>
                <button class="dashboard-tab" onclick="showDashboard('stylist')">
                    <i class="fas fa-cut"></i> Stylist Dashboard
                </button>
                <button class="dashboard-tab" onclick="showDashboard('customer')">
                    <i class="fas fa-user"></i> Customer Dashboard
                </button>
                <button class="dashboard-tab" onclick="showDashboard('receptionist')">
                    <i class="fas fa-desktop"></i> Receptionist Dashboard
                </button>
            </div>

            <script>
                window.onload = function () {
                    var userRole = "<%= (role != null) ? role : "" %>";
                    if (userRole && userRole.trim() !== "") {
                        showDashboard(userRole);
                    } else {
                        showDashboard('admin');
                    }
                };
            </script>

            <!-- ADMIN DASHBOARD -->
            <div id="admin-dashboard" class="dashboard-content active">
                <div class="dashboard-header">
                    <h3><i class="fas fa-user-shield"></i> Admin Dashboard</h3>
                    <p>Real-Time Business Overview</p>
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: var(--primary-color); color: #000;"><i
                                class="fas fa-rupee-sign"></i></div>
                        <div class="stat-info">
                            <h4>Total Revenue</h4>
                            <p class="stat-number" id="admin-daily-revenue">₹0</p>
                            <span class="stat-label">Daily Commission</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-calendar-alt"></i></div>
                        <div class="stat-info">
                            <h4>Appointments</h4>
                            <p class="stat-number" id="admin-total-appts">0</p>
                            <span class="stat-label">Total Bookings</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-users"></i></div>
                        <div class="stat-info">
                            <h4>Active Staff</h4>
                            <p class="stat-number" id="admin-active-staff-count">4</p>
                            <span class="stat-label">Stylists & Reception</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-box-open"></i></div>
                        <div class="stat-info">
                            <h4>Inventory Status</h4>
                            <p class="stat-number" id="admin-inventory-status">Good</p>
                            <span class="stat-label">Stock Level</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-chart-line"></i></div>
                        <div class="stat-info">
                            <h4>Monthly Revenue</h4>
                            <p class="stat-number" id="admin-monthly-revenue">₹0</p>
                            <span class="stat-label">Projected</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-user-plus"></i></div>
                        <div class="stat-info">
                            <h4>Stats</h4>
                            <p class="stat-number" id="admin-customer-count">0</p>
                            <span class="stat-label">Total Customers</span>
                        </div>
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 20px;">
                    <div class="dashboard-section" style="margin-top: 0;">
                        <div class="section-header">
                            <h4><i class="fas fa-users-cog"></i> Staff Management</h4>
                            <div>
                                <button class="btn-primary" onclick="window.prompt('Enter Staff Name:')"
                                    style="padding: 5px 10px; font-size: 0.8rem;">
                                    <i class="fas fa-plus"></i> Add
                                </button>
                                <button class="btn-cancel" onclick="alert('Staff Removed')"
                                    style="padding: 5px 10px; font-size: 0.8rem;">
                                    <i class="fas fa-minus"></i> Remove
                                </button>
                            </div>
                        </div>
                        <div class="table-container" style="max-height: 250px; overflow-y: auto;">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody id="admin-staff-table"></tbody>
                            </table>
                        </div>
                    </div>

                    <div class="dashboard-section" style="margin-top: 0;">
                        <div class="section-header">
                            <h4><i class="fas fa-cut"></i> Service Management</h4>
                            <button class="btn-primary" onclick="alert('Service Added!')"
                                style="padding: 5px 10px; font-size: 0.8rem;">
                                <i class="fas fa-plus"></i> Add Service
                            </button>
                        </div>
                        <div class="table-container" style="max-height: 250px; overflow-y: auto;">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Service</th>
                                        <th>Price</th>
                                        <th>Category</th>
                                    </tr>
                                </thead>
                                <tbody id="admin-services-table"></tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="dashboard-section">
                    <div class="section-header">
                        <h4><i class="fas fa-file-alt"></i> Reports & Analytics</h4>
                        <button class="btn-refresh" onclick="location.reload()">
                            <i class="fas fa-sync-alt"></i> Refresh Data
                        </button>
                    </div>
                    <div style="display: flex; gap: 10px; padding: 10px;">
                        <button class="btn-primary" onclick="downloadReport('daily')">Download Daily Report</button>
                        <button class="btn-primary" onclick="downloadReport('monthly')">Download Monthly Report</button>
                        <button class="btn-primary" onclick="showPerformanceSummary()">View Performance Summary</button>
                    </div>
                </div>

                <div class="dashboard-section" style="margin-top: 20px;">
                    <div class="section-header">
                        <h4><i class="fas fa-calendar-check"></i> Manage All Bookings</h4>
                        <button class="btn-refresh" onclick="loadAdminDashboard()">
                            <i class="fas fa-sync-alt"></i> Refresh Data
                        </button>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Date/Time</th>
                                    <th>Customer</th>
                                    <th>Service</th>
                                    <th>Stylist</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-bookings-table">
                                <tr>
                                    <td colspan="6" class="loading">Loading all bookings...</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- PERFORMANCE SUMMARY MODAL -->
            <div id="performance-modal" class="modal-overlay" style="display: none;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Performance Summary</h3>
                        <button class="btn-close-modal" onclick="closePerformanceModal()"><i
                                class="fas fa-times"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="perf-stats">
                            <div class="perf-item">
                                <h5>Total Bookings (This Month)</h5>
                                <p id="perf-total-bookings">0</p>
                            </div>
                            <div class="perf-item">
                                <h5>Total Revenue (This Month)</h5>
                                <p id="perf-total-revenue">₹0</p>
                            </div>
                            <div class="perf-item">
                                <h5>Most Popular Service</h5>
                                <p id="perf-top-service">-</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- STYLIST DASHBOARD -->
            <div id="stylist-dashboard" class="dashboard-content">
                <div class="dashboard-header" style="justify-content: space-between;">
                    <div>
                        <h3><i class="fas fa-cut"></i> Stylist Dashboard</h3>
                        <p>Manage your schedule and earnings</p>
                    </div>
                    <div class="stylist-selector" style="display: flex; align-items: center; gap: 10px;">
                        <label for="current-stylist-view" style="color: #bbb;">View As:</label>
                        <select id="current-stylist-view" onchange="loadStylistDashboard()"
                            style="padding: 5px; background: #333; color: #fff; border: 1px solid #d4a373; border-radius: 5px;">
                            <option value="Ravi Kumar">Ravi Kumar</option>
                            <option value="Anjali Mehta">Anjali Mehta</option>
                            <option value="Suresh Singh">Suresh Singh</option>
                            <option value="Priya Desai">Priya Desai</option>
                        </select>
                    </div>
                </div>

                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-calendar-day"></i></div>
                        <div class="stat-info">
                            <h4>Today's Appointments</h4>
                            <p class="stat-number" id="stylist-today-count">0</p><span
                                class="stat-label">Scheduled</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-check-circle"></i></div>
                        <div class="stat-info">
                            <h4>Completed Jobs</h4>
                            <p class="stat-number" id="stylist-completed-count">0</p><span class="stat-label">This
                                Month</span>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-wallet"></i></div>
                        <div class="stat-info">
                            <h4>My Earnings</h4>
                            <p class="stat-number" id="stylist-earnings">₹0</p><span
                                class="stat-label">Commissions</span>
                        </div>
                    </div>
                    <div class="stat-card" style="background: rgba(255, 255, 255, 0.05);">
                        <div class="stat-info" style="width: 100%;">
                            <h4 style="font-size: 0.9rem; margin-bottom: 8px;">Quick Status Update</h4>
                            <div style="display: flex; flex-direction: column; gap: 8px;">
                                <select id="quick-booking-select"
                                    style="width: 100%; padding: 6px; background: #222; color: #fff; border: 1px solid #444; border-radius: 4px; font-size: 0.85rem;">
                                    <option value="">Select Appointment...</option>
                                </select>
                                <div style="display: flex; gap: 5px;">
                                    <select id="quick-status-select"
                                        style="flex: 1; padding: 6px; background: #222; color: #fff; border: 1px solid #444; border-radius: 4px; font-size: 0.85rem;">
                                        <option value="confirmed">Confirm ✅</option>
                                        <option value="completed">Complete 🏁</option>
                                        <option value="cancelled">Cancel ❌</option>
                                    </select>
                                    <button onclick="quickUpdateStatus()"
                                        style="padding: 6px 12px; background: var(--primary-color); color: #000; border: none; border-radius: 4px; cursor: pointer;"><i
                                            class="fas fa-paper-plane"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-section">
                    <div class="section-header">
                        <h4><i class="fas fa-list-alt"></i> My Schedule & Tasks</h4>
                        <button class="btn-refresh" onclick="loadStylistDashboard()"><i class="fas fa-sync-alt"></i>
                            Refresh</button>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Time</th>
                                    <th>Customer</th>
                                    <th>Service</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="stylist-appointments-table">
                                <tr>
                                    <td colspan="6" class="loading">Loading schedule...</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- CUSTOMER DASHBOARD -->
            <div id="customer-dashboard" class="dashboard-content">
                <div class="dashboard-header">
                    <h3><i class="fas fa-user"></i> Customer Dashboard</h3>
                    <p>Salon Customers</p>
                </div>

                <div class="customer-profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar"><i class="fas fa-user-circle"></i></div>
                        <div class="profile-info">
                            <h4 id="customer-profile-name">Guest User</h4>
                            <p id="customer-profile-email">guest@example.com</p>
                            <button class="btn-edit-profile" onclick="showEditProfileForm()"><i class="fas fa-edit"></i>
                                Edit Profile</button>
                        </div>
                    </div>
                </div>

                <div class="dashboard-section">
                    <div class="section-header">
                        <h4><i class="fas fa-calendar-plus"></i> Book New Appointment</h4>
                    </div>
                    <form id="booking-form" class="booking-form">
                        <div class="form-row">
                            <div class="form-group"><label for="customer-name">Full Name *</label><input type="text"
                                    id="customer-name" name="customerName" required placeholder="Enter your name"></div>
                            <div class="form-group"><label for="customer-phone">Phone Number *</label><input type="tel"
                                    id="customer-phone" name="customerPhone" required
                                    placeholder="10-digit mobile number"></div>
                        </div>
                        <div class="form-row">
                            <div class="form-group"><label for="customer-email">Email Address *</label><input
                                    type="email" id="customer-email" name="customerEmail" required
                                    placeholder="your.email@example.com"></div>
                            <div class="form-group">
                                <label for="service-category">Service Category *</label>
                                <select id="service-category" name="serviceCategory" required
                                    onchange="loadServicesByCategory()">
                                    <option value="">Select Category</option>
                                    <option value="elegance">Elegance (Women's Services)</option>
                                    <option value="edge">Edge (Men's Services)</option>
                                    <option value="edge_elegance">Edge & Elegance (Couples)</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="service-name">Select Service *</label>
                                <input type="text" id="service-name" name="serviceName" required readonly
                                    placeholder="Click 'Browse Services' button below"
                                    style="cursor: pointer; background: rgba(255,255,255,0.1);">
                                <input type="hidden" id="service-price" name="servicePrice">
                                <button type="button" class="browse-services-btn" onclick="openServiceModal()"><i
                                        class="fas fa-search"></i> Browse All Services</button>
                            </div>
                            <div class="form-group">
                                <label for="preferred-stylist">Preferred Stylist</label>
                                <select id="preferred-stylist" name="preferredStylist">
                                    <option value="">Any Available</option>
                                    <option value="Ravi Kumar">Ravi Kumar (Men's Specialist)</option>
                                    <option value="Anjali Mehta">Anjali Mehta (Hair Coloring)</option>
                                    <option value="Suresh Singh">Suresh Singh (Grooming)</option>
                                    <option value="Priya Desai">Priya Desai (Beautician)</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group"><label for="booking-date">Appointment Date *</label><input
                                    type="date" id="booking-date" name="bookingDate" required></div>
                            <div class="form-group">
                                <label for="booking-time">Appointment Time *</label>
                                <select id="booking-time" name="bookingTime" required>
                                    <option value="">Select Time</option>
                                    <option value="09:00">09:00 AM</option>
                                    <option value="10:00">10:00 AM</option>
                                    <option value="11:00">11:00 AM</option>
                                    <option value="12:00">12:00 PM</option>
                                    <option value="14:00">02:00 PM</option>
                                    <option value="15:00">03:00 PM</option>
                                    <option value="16:00">04:00 PM</option>
                                    <option value="17:00">05:00 PM</option>
                                    <option value="18:00">06:00 PM</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group full-width"><label for="special-requests">Special Requests
                                    (Optional)</label><textarea id="special-requests" name="specialRequests" rows="3"
                                    placeholder="Any specific requirements or preferences..."></textarea></div>
                        </div>
                        <div class="booking-summary">
                            <div class="summary-item"><span>Estimated Price:</span><strong
                                    id="estimated-price">₹0</strong></div>
                        </div>
                        <button type="submit" class="btn-submit-booking"><i class="fas fa-check-circle"></i> Book
                            Appointment</button>
                    </form>
                </div>

                <div class="dashboard-section">
                    <div class="section-header">
                        <h4><i class="fas fa-calendar-check"></i> Upcoming Bookings</h4><button class="btn-refresh"
                            onclick="loadCustomerUpcomingBookings()"><i class="fas fa-sync-alt"></i> Refresh</button>
                    </div>
                    <div class="bookings-grid" id="upcoming-bookings-grid">
                        <p class="loading">Loading your upcoming bookings...</p>
                    </div>
                </div>

                <!-- Booking History Removed as per User Request -->
            </div>

            <!-- RECEPTIONIST DASHBOARD -->
            <div id="receptionist-dashboard" class="dashboard-content">
                <div class="dashboard-header">
                    <h3><i class="fas fa-desktop"></i> Receptionist Dashboard</h3>
                    <p>Manage Appointments & Walk-ins</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-calendar-check"></i></div>
                        <div class="stat-info">
                            <h4>Today's Appointments</h4>
                            <p class="stat-number" id="recep-today-count">0</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-walking"></i></div>
                        <div class="stat-info">
                            <h4>Walk-ins Today</h4>
                            <p class="stat-number" id="recep-walkins-count">0</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-user-friends"></i></div>
                        <div class="stat-info">
                            <h4>Active Stylists (4)</h4>
                            <ul style="list-style: none; padding: 0; margin-top: 5px; font-size: 0.85rem; color: #ccc;">
                                <li style="margin-bottom: 2px;"><i class="fas fa-circle"
                                        style="color: #4cd137; font-size: 8px;"></i> Ravi Kumar</li>
                                <li style="margin-bottom: 2px;"><i class="fas fa-circle"
                                        style="color: #4cd137; font-size: 8px;"></i> Anjali Mehta</li>
                                <li style="margin-bottom: 2px;"><i class="fas fa-circle"
                                        style="color: #4cd137; font-size: 8px;"></i> Suresh Singh</li>
                                <li><i class="fas fa-circle" style="color: #4cd137; font-size: 8px;"></i> Priya Desai
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="stat-card" style="cursor: pointer;" onclick="promptWalkIn()">
                        <div class="stat-icon" style="background: var(--primary-color); color: #000;"><i
                                class="fas fa-plus"></i></div>
                        <div class="stat-info">
                            <h4 style="color: var(--primary-color);">New Walk-in</h4><span class="stat-label">Click to
                                Book</span>
                        </div>
                    </div>
                </div>

                <div class="dashboard-section">
                    <div class="section-header">
                        <h4><i class="fas fa-tasks"></i> Manage All Bookings</h4>
                        <button class="btn-refresh" onclick="loadReceptionistDashboard()"><i
                                class="fas fa-sync-alt"></i> Refresh</button>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Time</th>
                                    <th>Customer</th>
                                    <th>Source</th>
                                    <th>Service</th>
                                    <th>Stylist (Assign)</th>
                                    <th>Status</th>
                                    <th>Payment</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="receptionist-table">
                                <tr>
                                    <td colspan="8" class="loading">Loading bookings...</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

    </section>

    <!-- Dashboard JavaScript -->
    <script src="js/dashboard.js?v=3.2"></script>

    <!-- Service Selection Modal -->
    <div id="serviceModal" class="service-modal" style="display: none;">
        <div class="modal-content-services">
            <div class="modal-header">
                <h2><i class="fas fa-spa"></i> Select Your Service</h2>
                <button class="close-modal" onclick="closeServiceModal()">&times;</button>
            </div>
            <div class="modal-body">
                <div class="service-tabs">
                    <button class="service-tab active" onclick="showServiceCategory('elegance')"><i
                            class="fas fa-female"></i> Elegance (Women)</button>
                    <button class="service-tab" onclick="showServiceCategory('edge')"><i class="fas fa-male"></i> Edge
                        (Men)</button>
                    <button class="service-tab" onclick="showServiceCategory('edge_elegance')"><i
                            class="fas fa-heart"></i> Edge & Elegance (Couples)</button>
                </div>
                <div id="elegance-services-modal" class="services-grid"></div>
                <div id="edge-services-modal" class="services-grid" style="display: none;"></div>
                <div id="edge_elegance-services-modal" class="services-grid" style="display: none;"></div>
            </div>
        </div>
    </div>

    <!-- BILLING MODAL -->
    <div id="billing-modal" class="modal-overlay" style="display: none; z-index: 10001; background: rgba(0,0,0,0.8);">
        <div class="modal-content" style="max-width: 500px; background: #1e1e1e; border: 1px solid #d4a373;">
            <div class="modal-header"
                style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); padding: 15px;">
                <h3 id="bill-modal-title" style="color: #fff; margin:0;"><i class="fas fa-file-invoice-dollar"></i> Send
                    Invoice</h3>
                <button class="btn-close-modal" onclick="closeBillingModal()"
                    style="color:white; font-size: 1.5rem;">&times;</button>
            </div>
            <div class="modal-body" style="padding: 20px;">
                <form id="billing-form" onsubmit="event.preventDefault(); return false;">
                    <div class="form-group" style="margin-bottom: 15px;">
                        <label style="color: #ccc; display: block; margin-bottom: 5px;">Customer Name</label>
                        <input type="text" id="bill-cust-name" class="form-control" placeholder="Enter Name"
                            style="width: 100%; padding: 10px; background: #333; color: white; border: 1px solid #555; border-radius: 4px;">
                    </div>
                    <div class="form-group" style="margin-bottom: 15px;">
                        <label style="color: #ccc; display: block; margin-bottom: 5px;">WhatsApp Number</label>
                        <div style="display: flex; align-items: center; gap: 5px;">
                            <span
                                style="background: #333; color: #fff; padding: 10px; border-radius: 4px; border: 1px solid #555;">+91</span>
                            <input type="tel" id="bill-cust-phone" class="form-control" placeholder="9876543210"
                                style="width: 100%; padding: 10px; background: #333; color: white; border: 1px solid #555; border-radius: 4px;">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 15px;">
                        <label style="color: #ccc; display: block; margin-bottom: 5px;">Service Rendered</label>
                        <input type="text" id="bill-service" class="form-control" placeholder="e.g. Haircut"
                            style="width: 100%; padding: 10px; background: #333; color: white; border: 1px solid #555; border-radius: 4px;">
                    </div>
                    <div class="form-group" style="margin-bottom: 15px;">
                        <label style="color: #ccc; display: block; margin-bottom: 5px;">Total Amount (₹)</label>
                        <input type="number" id="bill-amount" class="form-control" placeholder="0.00"
                            style="width: 100%; padding: 10px; background: #333; color: white; border: 1px solid #555; border-radius: 4px;">
                    </div>

                    <input type="hidden" id="bill-type" value="bill">

                    <div style="margin-top: 20px; display: grid; gap: 10px;">
                        <button onclick="sendBillWhatsApp()"
                            style="background: #25D366; color: white; padding: 12px; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 10px; font-size: 1rem;">
                            <i class="fab fa-whatsapp"></i> <span id="bill-btn-text">Send to WhatsApp</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <style>
        .service-modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.9);
            z-index: 10000;
            overflow-y: auto;
            padding: 20px;
        }

        .modal-content-services {
            background: #1a1a1a;
            max-width: 1200px;
            margin: 50px auto;
            border-radius: 15px;
            border: 2px solid #d4a373;
        }

        .modal-header {
            background: linear-gradient(135deg, #d4a373 0%, #c89d6f 100%);
            padding: 20px 30px;
            border-radius: 15px 15px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h2 {
            margin: 0;
            color: #000;
            font-size: 1.8rem;
        }

        .close-modal {
            background: none;
            border: none;
            font-size: 2.5rem;
            color: #000;
            cursor: pointer;
            line-height: 1;
        }

        .modal-body {
            padding: 30px;
        }

        .service-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .service-tab {
            flex: 1;
            min-width: 200px;
            padding: 15px 20px;
            background: rgba(255, 255, 255, 0.05);
            border: 2px solid rgba(212, 163, 115, 0.3);
            color: #fff;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            font-weight: 600;
        }

        .service-tab:hover {
            border-color: #d4a373;
            background: rgba(212, 163, 115, 0.1);
        }

        .service-tab.active {
            background: #d4a373;
            color: #000;
            border-color: #d4a373;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.05);
            border: 2px solid rgba(212, 163, 115, 0.3);
            border-radius: 10px;
            padding: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .service-card:hover {
            border-color: #d4a373;
            background: rgba(212, 163, 115, 0.1);
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(212, 163, 115, 0.3);
        }

        .service-card h3 {
            color: #d4a373;
            margin: 0 0 10px 0;
            font-size: 1.2rem;
        }

        .service-card .price {
            color: #fff;
            font-size: 1.3rem;
            font-weight: bold;
            margin-top: 10px;
        }

        .service-card .description {
            color: #aaa;
            font-size: 0.9rem;
            margin-top: 10px;
        }
    </style>

    <script>
        console.log('=== Loading Services Database Inline ===');
        const bookingServicesData = {
            elegance: [
                { isHeader: true, title: 'Luxury Hair Extensions', description: 'Enhance your natural beauty with our premium hair extension services, expertly applied for a flawless, long-lasting look.' },
                { name: 'K-Tip Extensions', price: 15000, priceRange: 'Starting at ₹15,000' },
                { name: 'I-Tip Extensions', price: 12000, priceRange: 'Starting at ₹12,000' },
                { name: 'Volume Weft Extensions', price: 18000, priceRange: 'Starting at ₹18,000' },
                { name: 'Tape-In Extensions', price: 10000, priceRange: 'Starting at ₹10,000' },
                { name: 'Extension Maintenance & Move-Ups', price: 3000, priceRange: '₹3,000 - ₹5,000' },
                { isHeader: true, title: 'Haircuts & Styling', description: 'From modern trends to timeless cuts, our expert stylists create tailored looks to suit your style.' },
                { name: 'Precision Haircuts', price: 1500, priceRange: '₹1,500 - ₹3,000' },
                { name: 'Dry Cutting', price: 2000, priceRange: '₹2,000 - ₹3,500' },
                { name: 'Boho Waves & Beachy Styling', price: 1200, priceRange: '₹1,200 - ₹2,500' },
                { name: 'Luxury Blowouts', price: 1000, priceRange: '₹1,000 - ₹2,000' },
                { isHeader: true, title: 'Color Services', description: 'Customized color artistry to create dimensional, radiant hues.' },
                { name: 'Balayage & Hand-Painted Highlights', price: 5000, priceRange: '₹5,000 - ₹12,000' },
                { name: 'Lived-In Blondes & Dimensional Brunettes', price: 6000, priceRange: '₹6,000 - ₹15,000' },
                { name: 'Gloss & Toner Refresh', price: 1500, priceRange: '₹1,500 - ₹3,000' },
                { name: 'Root Touch-Up & Grey Coverage', price: 2000, priceRange: '₹2,000 - ₹4,000' },
                { name: 'Vivid & Fashion Colors', price: 4000, priceRange: '₹4,000 - ₹10,000' },
                { name: 'Color Corrections', price: 8000, priceRange: '₹8,000 - ₹20,000' },
                { isHeader: true, title: 'Treatments & Specialty Services', description: 'Nourish and restore your hair with our premium treatment options.' },
                { name: 'Luxury Deep Conditioning Treatments', price: 2000, priceRange: '₹2,000 - ₹4,000' },
                { name: 'Scalp Detox & Rejuvenation', price: 1500, priceRange: '₹1,500 - ₹3,000' },
                { name: 'Keratin Smoothing Treatment', price: 6000, priceRange: '₹6,000 - ₹12,000' },
                { name: 'Customized Hair Repair Services', price: 3000, priceRange: '₹3,000 - ₹6,000' },
                { isHeader: true, title: 'Bridal & Event Styling', description: 'Look flawless for life\'s most special moments with our tailored styling services.' },
                { name: 'Bridal Hair & Trial Styling', price: 8000, priceRange: '₹8,000 - ₹15,000' },
                { name: 'Special Occasion Updos & Glam Waves', price: 3000, priceRange: '₹3,000 - ₹6,000' }
            ],
            edge: [
                { name: 'Buzz Cut/Induction', price: 400, priceRange: '₹400' },
                { name: 'Regular Haircut', price: 500, priceRange: '₹500' },
                { name: 'Scissor Cut', price: 600, priceRange: '₹600' },
                { name: 'Fade', price: 700, priceRange: '₹700' },
                { name: 'Skin Fade', price: 800, priceRange: '₹800' },
                { name: 'Undercut', price: 900, priceRange: '₹900' },
                { name: 'Root Touch-Up', price: 300, priceRange: '₹300' },
                { name: 'Grey Blending', price: 400, priceRange: '₹400' },
                { name: 'Full Color', price: 500, priceRange: '₹500' },
                { name: 'Highlights', price: 600, priceRange: '₹600 - ₹900' },
                { name: 'Deep Conditioning', price: 300, priceRange: '₹300' },
                { name: 'Scalp Treatment', price: 400, priceRange: '₹400' },
                { name: 'Keratin Treatment', price: 500, priceRange: '₹500 - ₹900' },
                { name: 'Blowout', price: 200, priceRange: '₹200' },
                { name: 'Wash & Style', price: 300, priceRange: '₹300' },
                { name: 'Formal Styling', price: 400, priceRange: '₹400 - ₹600' },
                { name: 'Beard Trim', price: 200, priceRange: '₹200' },
                { name: 'Beard Shaping', price: 300, priceRange: '₹300' },
                { name: 'Facial Cleanup', price: 400, priceRange: '₹400' },
                { name: 'Deluxe Facial', price: 500, priceRange: '₹500 - ₹800' },
                { name: 'Manicure & Pedicure', price: 600, priceRange: '₹600 - ₹900' }
            ],
            edge_elegance: [
                { name: 'Couple\'s Swedish Massage', price: 6000, priceRange: '₹6,000 - ₹8,000' },
                { name: 'Couple\'s Deep Tissue Massage', price: 7000, priceRange: '₹7,000 - ₹9,000' },
                { name: 'Couple\'s Aromatherapy Massage', price: 7500, priceRange: '₹7,500 - ₹10,000' },
                { name: 'Couple\'s Hot Stone Massage', price: 8000, priceRange: '₹8,000 - ₹11,000' },
                { name: 'Full Body Scrub', price: 4000, priceRange: '₹4,000 - ₹6,000' },
                { name: 'Mud Wrap Treatment', price: 5000, priceRange: '₹5,000 - ₹7,000' },
                { name: 'Seaweed Wrap', price: 5500, priceRange: '₹5,500 - ₹7,500' },
                { name: 'Body Polishing Treatment', price: 6000, priceRange: '₹6,000 - ₹8,500' },
                { name: 'Couple\'s Classic Facial', price: 4000, priceRange: '₹4,000 - ₹6,000' },
                { name: 'Anti-Aging Facial', price: 5000, priceRange: '₹5,000 - ₹7,500' },
                { name: 'Brightening Facial', price: 4500, priceRange: '₹4,500 - ₹6,500' },
                { name: 'Hydrating Facial', price: 4000, priceRange: '₹4,000 - ₹6,000' },
                { name: 'Jacuzzi Session', price: 2000, priceRange: '₹2,000 - ₹3,000' },
                { name: 'Sauna Session', price: 1500, priceRange: '₹1,500 - ₹2,500' },
                { name: 'Steam Room Session', price: 1500, priceRange: '₹1,500 - ₹2,500' },
                { name: 'Complete Hydrotherapy Package', price: 4000, priceRange: '₹4,000 - ₹6,000' },
                { name: 'Couple\'s Manicure', price: 2000, priceRange: '₹2,000 - ₹3,500' },
                { name: 'Couple\'s Pedicure', price: 2500, priceRange: '₹2,500 - ₹4,000' },
                { name: 'Couple\'s Mani-Pedi Combo', price: 4000, priceRange: '₹4,000 - ₹6,500' },
                { name: 'Couple\'s Hair Services', price: 3000, priceRange: '₹3,000 - ₹5,000' },
                { name: 'Hair Spa Treatment', price: 3500, priceRange: '₹3,500 - ₹5,500' },
                { name: 'Bridal Pre-Wedding Package', price: 15000, priceRange: '₹15,000 - ₹25,000' },
                { name: 'Groom Pre-Wedding Package', price: 10000, priceRange: '₹10,000 - ₹18,000' },
                { name: 'Couple\'s Bridal Package', price: 25000, priceRange: '₹25,000 - ₹40,000' },
                { name: 'Wedding Day Styling', price: 12000, priceRange: '₹12,000 - ₹20,000' },
                { name: 'Bridal Trial Session', price: 5000, priceRange: '₹5,000 - ₹8,000' },
                { name: 'Romantic Spa Day', price: 15000, priceRange: '₹15,000 - ₹25,000' },
                { name: 'Evening Relaxation Package', price: 10000, priceRange: '₹10,000 - ₹15,000' },
                { name: 'Anniversary Special', price: 18000, priceRange: '₹18,000 - ₹28,000' },
                { name: 'Ultimate Wellness Retreat', price: 25000, priceRange: '₹25,000 - ₹40,000' }
            ]
        };

        function openServiceModal() {
            document.getElementById('serviceModal').style.display = 'block';
            const currentCat = document.getElementById('service-category').value;
            if (currentCat) {
                showServiceCategory(currentCat);
            } else {
                showServiceCategory('elegance');
            }
        }

        function closeServiceModal() {
            document.getElementById('serviceModal').style.display = 'none';
        }

        function showServiceCategory(category) {
            document.querySelectorAll('.service-tab').forEach(tab => tab.classList.remove('active'));
            document.getElementById('elegance-services-modal').style.display = 'none';
            document.getElementById('edge-services-modal').style.display = 'none';
            document.getElementById('edge_elegance-services-modal').style.display = 'none';

            const containerId = category + '-services-modal';
            const container = document.getElementById(containerId);
            if (container) {
                container.style.display = 'grid';
                loadServicesIntoModal(category, container);
            }
        }

        function loadServicesIntoModal(category, container) {
            container.innerHTML = '';
            if (bookingServicesData[category]) {
                bookingServicesData[category].forEach(service => {
                    if (service.isHeader) {
                        const header = document.createElement('div');
                        header.className = 'service-group-header';
                        header.style.gridColumn = '1 / -1'; header.style.marginTop = '20px'; header.style.borderBottom = '1px solid #d4a373'; header.style.paddingBottom = '10px'; header.style.marginBottom = '10px';
                        header.innerHTML = '<h3 style="color: #d4a373; font-size: 1.5rem; margin-bottom: 5px;">' + service.title + '</h3><p style="color: #aaa; margin: 0; font-size: 0.95rem;">' + service.description + '</p>';
                        container.appendChild(header);
                    } else {
                        const card = document.createElement('div');
                        card.className = 'service-card';
                        card.onclick = () => selectService(service.name, service.price, service.priceRange, category);
                        card.innerHTML = '<h3>' + service.name + '</h3><div class="price">' + service.priceRange + '</div>';
                        container.appendChild(card);
                    }
                });
            }
        }

        function selectService(name, price, range, category) {
            document.getElementById('service-name').value = name;
            document.getElementById('service-price').value = price;
            document.getElementById('estimated-price').textContent = '₹' + price.toLocaleString();
            document.getElementById('service-category').value = category;
            closeServiceModal();
        }

        window.onclick = function (event) {
            const modal = document.getElementById('serviceModal');
            const billingModal = document.getElementById('billing-modal');
            if (event.target == modal) { closeServiceModal(); }
            if (event.target == billingModal) { closeBillingModal(); }
        }

        function loadServicesByCategory() { }

        // --- BILLING MODAL FUNCTIONS ---
        function openBillingModal(name, phone, service, price, type) {
            document.getElementById('bill-cust-name').value = name || '';
            document.getElementById('bill-cust-phone').value = phone || '';
            document.getElementById('bill-service').value = service || '';
            document.getElementById('bill-amount').value = price || '';
            document.getElementById('bill-type').value = type || 'bill';
            document.getElementById('billing-modal').style.display = 'flex';

            const titleElem = document.getElementById('bill-modal-title');
            const btnTextElem = document.getElementById('bill-btn-text');

            if (type === 'receipt') {
                titleElem.innerHTML = '<i class="fas fa-check-circle"></i> Send Receipt';
                btnTextElem.textContent = "Send Payment Receipt";
            } else {
                titleElem.innerHTML = '<i class="fas fa-file-invoice-dollar"></i> Send Invoice';
                btnTextElem.textContent = "Send Invoice";
            }
        }

        function closeBillingModal() {
            document.getElementById('billing-modal').style.display = 'none';
        }

        function sendBillWhatsApp() {
            const name = document.getElementById('bill-cust-name').value;
            const phone = document.getElementById('bill-cust-phone').value;
            const service = document.getElementById('bill-service').value;
            const amount = document.getElementById('bill-amount').value;
            const type = document.getElementById('bill-type').value;

            if (!phone || phone.length < 10) {
                alert("Please enter a valid valid WhatsApp number.");
                return;
            }

            let message = '';

            if (type === 'receipt') {
                message = `*PAYMENT RECEIPT: Edge & Elegance Salon*%0A%0A` +
                    `Hello ${name},%0A` +
                    `We have received your payment. Thank you for visiting us!%0A%0A` +
                    `✅ *Service:* ${service}%0A` +
                    `💰 *Amount Paid:* ₹${amount}%0A%0A` +
                    `We hope to see you again soon! ✨`;
            } else {
                message = `*INVOICE: Edge & Elegance Salon*%0A%0A` +
                    `Hello ${name},%0A` +
                    `Thank you for visiting us! Here are your payment details:%0A%0A` +
                    `✂️ *Service:* ${service}%0A` +
                    `💰 *Total Amount:* ₹${amount}%0A%0A` +
                    `Please pay via UPI or Cash at the counter.%0A` +
                    `We hope to see you again soon! ✨`;
            }

            const url = `https://wa.me/91${phone}?text=${message}`;
            window.open(url, '_blank');
            closeBillingModal();
        }
    </script>

</body>

</html>