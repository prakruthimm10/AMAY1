// ========== DATA SOURCES ==========

// Staff List (Simulated Database)
let staffList = JSON.parse(localStorage.getItem('staffList')) || [
    { name: 'Ravi Kumar', role: 'Senior Stylist', status: 'Active' },
    { name: 'Anjali Mehta', role: 'Hair Specialist', status: 'Active' },
    { name: 'Suresh Singh', role: 'Massage Therapist', status: 'Active' },
    { name: 'Priya Desai', role: 'Nail Technician', status: 'Active' }
];

// Services Database (Full List)
const servicesDatabase = {
    elegance: [
        { name: 'K-Tip Extensions', price: 15000 },
        { name: 'I-Tip Extensions', price: 12000 },
        { name: 'Volume Weft Extensions', price: 18000 },
        { name: 'Haircuts & Styling', price: 1500 },
        { name: 'Balayage', price: 5000 },
        { name: 'Bridal Hair', price: 8000 }
    ],
    edge: [
        { name: 'Regular Haircut', price: 500 },
        { name: 'Fade', price: 700 },
        { name: 'Beard Trim', price: 200 },
        { name: 'Facial', price: 500 }
    ],
    edge_elegance: [
        { name: 'Couple Massage', price: 6000 },
        { name: 'Full Body Scrub', price: 4000 },
        { name: 'Couple Facial', price: 4000 }
    ]
};

// Global Booking Data 
let customerUpcomingBookings = JSON.parse(localStorage.getItem('customerUpcomingBookings')) || [];
let customerBookingHistory = JSON.parse(localStorage.getItem('customerBookingHistory')) || [];

function saveBookingData() {
    localStorage.setItem('customerUpcomingBookings', JSON.stringify(customerUpcomingBookings));
    localStorage.setItem('customerBookingHistory', JSON.stringify(customerBookingHistory));
}

// ========== DASHBOARD NAVIGATION ==========
function showDashboard(dashboardName) {
    document.querySelectorAll('.dashboard-content').forEach(dash => {
        dash.classList.remove('active');
    });
    document.querySelectorAll('.dashboard-tab').forEach(tab => {
        tab.classList.remove('active');
    });
    const content = document.getElementById(dashboardName + '-dashboard');
    if (content) content.classList.add('active');

    // Highlight active tab
    if (window.event && window.event.target) {
        const tab = window.event.target.closest('.dashboard-tab');
        if (tab) tab.classList.add('active');
    }

    if (dashboardName === 'customer') { loadCustomerDashboard(); }
    else if (dashboardName === 'stylist') { loadStylistDashboard(); }
    else if (dashboardName === 'receptionist') { loadReceptionistDashboard(); }
    else if (dashboardName === 'admin') { loadAdminDashboard(); }
}

// ========== ADMIN DASHBOARD FUNCTIONS ==========
function loadAdminDashboard() {
    const revenueDailyElem = document.getElementById('admin-daily-revenue');
    const revenueMonthlyElem = document.getElementById('admin-monthly-revenue');
    const totalApptsElem = document.getElementById('admin-total-appts');
    const activeStaffElem = document.getElementById('admin-active-staff-count');
    const customerCountElem = document.getElementById('admin-customer-count');
    const inventoryElem = document.getElementById('admin-inventory-status');

    let allBookings = [...customerUpcomingBookings, ...customerBookingHistory];
    const completedJobs = allBookings.filter(b => b.status === 'completed');
    const totalRevenue = completedJobs.reduce((sum, job) => sum + (job.price || 0), 0);

    const todayStr = new Date().toISOString().split('T')[0];
    const todayJobs = completedJobs.filter(b => b.date === todayStr);
    const dailyRevenue = todayJobs.reduce((sum, job) => sum + (job.price || 0), 0);
    const uniqueCustomers = new Set(allBookings.map(b => b.customerName));

    if (revenueDailyElem) revenueDailyElem.textContent = '₹' + dailyRevenue.toLocaleString();
    if (revenueMonthlyElem) revenueMonthlyElem.textContent = '₹' + totalRevenue.toLocaleString();
    if (totalApptsElem) totalApptsElem.textContent = allBookings.length;
    if (customerCountElem) customerCountElem.textContent = uniqueCustomers.size;
    if (activeStaffElem) activeStaffElem.textContent = staffList.length;

    if (inventoryElem) {
        if (allBookings.length > 20) {
            inventoryElem.textContent = 'Restock Needed';
            inventoryElem.style.color = 'red';
        } else {
            inventoryElem.textContent = 'Good';
            inventoryElem.style.color = 'var(--primary-color)';
        }
    }

    // Populate Staff Table
    const staffTable = document.getElementById('admin-staff-table');
    if (staffTable) {
        let staffHtml = '';
        if (staffList.length === 0) {
            staffHtml = '<tr><td colspan="3" class="no-data">No staff found.</td></tr>';
        } else {
            staffList.forEach((staff) => {
                staffHtml += `<tr><td>${staff.name}</td><td>${staff.role}</td><td><span class="status-badge status-confirmed">${staff.status}</span></td></tr>`;
            });
        }
        staffTable.innerHTML = staffHtml;
    }

    // Populate Services Table
    const servicesTable = document.getElementById('admin-services-table');
    if (servicesTable) {
        let serviceHtml = '';
        const categories = Object.keys(servicesDatabase);
        categories.forEach(cat => {
            servicesDatabase[cat].forEach(svc => {
                let catLabel = cat === 'elegance' ? 'Elegance' : cat === 'edge' ? 'Edge' : 'Edge & Elegance';
                serviceHtml += `<tr><td>${svc.name}</td><td>₹${svc.price}</td><td>${catLabel}</td></tr>`;
            });
        });
        servicesTable.innerHTML = serviceHtml;
    }

    // Populate All Bookings Table (Admin View)
    const bookingsTable = document.getElementById('admin-bookings-table');
    if (bookingsTable) {
        if (allBookings.length === 0) {
            bookingsTable.innerHTML = '<tr><td colspan="6" class="no-data">No bookings found in system.</td></tr>';
        } else {
            // Sort by date/time (newest first)
            allBookings.sort((a, b) => (b.date + b.time).localeCompare(a.date + a.time));

            let bookingHtml = '';
            allBookings.forEach((job) => {
                const statusClass = job.status === 'confirmed' ? 'status-confirmed' :
                    job.status === 'completed' ? 'status-completed' :
                        job.status === 'cancelled' ? 'status-cancelled' : 'status-pending';

                bookingHtml += `
                    <tr>
                        <td>${job.date} <br> <small>${job.time}</small></td>
                        <td>${job.customerName || 'Guest'}</td>
                        <td>${job.service}</td>
                        <td>${job.stylist}</td>
                        <td><span class="status-badge ${statusClass}">${job.status}</span></td>
                        <td>
                            <button class="btn-cancel" onclick="adminDeleteBooking(${job.id})" title="Delete/Block Booking" style="background-color: #ff4757; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer;">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </td>
                    </tr>
                `;
            });
            bookingsTable.innerHTML = bookingHtml;
        }
    }
}

function adminDeleteBooking(id) {
    if (confirm('ADMIN ACTION: Are you sure you want to PERMANENTLY DELETE this booking record? This cannot be undone.')) {
        // Remove from both lists
        let index = customerUpcomingBookings.findIndex(b => b.id === id);
        if (index !== -1) {
            customerUpcomingBookings.splice(index, 1);
        } else {
            index = customerBookingHistory.findIndex(b => b.id === id);
            if (index !== -1) {
                customerBookingHistory.splice(index, 1);
            }
        }
        saveBookingData();
        loadAdminDashboard();
        alert('Booking record deleted successfully.');
    }
}

function downloadReport(type) {
    let allBookingsRaw = [...customerUpcomingBookings, ...customerBookingHistory];
    const uniqueBookingsMap = new Map();
    allBookingsRaw.forEach(b => uniqueBookingsMap.set(b.id, b));
    let allBookings = Array.from(uniqueBookingsMap.values());
    let reportData = [];

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const todayStr = `${year}-${month}-${day}`;
    const currentMonthPrefix = `${year}-${month}`;

    let filename = '';
    if (type === 'daily') {
        reportData = allBookings.filter(b => b.date === todayStr);
        filename = `Daily_Report_${todayStr}.csv`;
        if (reportData.length === 0) {
            const availableDates = [...new Set(allBookings.map(b => b.date))].join(", ");
            alert(`No bookings found for today (${todayStr}).\n\nAvailable Dates: ${availableDates || 'None'}`);
            return;
        }
    } else if (type === 'monthly') {
        reportData = allBookings.filter(b => b.date && b.date.startsWith(currentMonthPrefix));
        filename = `Monthly_Report_${currentMonthPrefix}.csv`;
        if (reportData.length === 0) {
            alert(`No bookings found for this month (${currentMonthPrefix}).`);
            return;
        }
    }

    let csvContent = "data:text/csv;charset=utf-8,ID,Date,Time,Customer,Service,Stylist,Price,Status,Payment Status\n";
    reportData.forEach(job => {
        let row = [
            job.id, job.date, job.time, `"${job.customerName || 'Guest'}"`, `"${job.service}"`, `"${job.stylist}"`, job.price || 0, job.status, job.paymentStatus || 'Unpaid'
        ].join(",");
        csvContent += row + "\n";
    });

    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function showPerformanceSummary() {
    let allBookingsRaw = [...customerUpcomingBookings, ...customerBookingHistory];
    const uniqueBookingsMap = new Map();
    allBookingsRaw.forEach(b => uniqueBookingsMap.set(b.id, b));
    let allBookings = Array.from(uniqueBookingsMap.values());

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const currentMonthPrefix = `${year}-${month}`;
    const monthBookings = allBookings.filter(b => b.date && b.date.startsWith(currentMonthPrefix));

    const totalBookings = monthBookings.length;
    const revenueBookings = monthBookings.filter(b => b.status === 'completed' || b.status === 'confirmed');
    const totalRevenue = revenueBookings.reduce((sum, job) => sum + (job.price || 0), 0);

    const serviceCounts = {};
    monthBookings.forEach(b => {
        const sName = b.service || 'Unknown';
        serviceCounts[sName] = (serviceCounts[sName] || 0) + 1;
    });

    let topService = '-';
    let maxCount = 0;
    for (const [service, count] of Object.entries(serviceCounts)) {
        if (count > maxCount) { maxCount = count; topService = service; }
    }

    document.getElementById('perf-total-bookings').textContent = totalBookings;
    document.getElementById('perf-total-revenue').textContent = '₹' + totalRevenue.toLocaleString();
    document.getElementById('perf-top-service').textContent = topService + (maxCount > 0 ? ` (${maxCount})` : '');
    document.getElementById('performance-modal').style.display = 'flex';
}

function closePerformanceModal() { document.getElementById('performance-modal').style.display = 'none'; }


// ========== RECEPTIONIST DASHBOARD ==========
function loadReceptionistDashboard() {
    const table = document.getElementById('receptionist-table');
    const todayCountElem = document.getElementById('recep-today-count');
    const walkinsCountElem = document.getElementById('recep-walkins-count');

    let allBookings = [...customerUpcomingBookings, ...customerBookingHistory];
    allBookings.sort((a, b) => (a.date + a.time).localeCompare(b.date + b.time));

    const todayStr = new Date().toISOString().split('T')[0];
    const todays = allBookings.filter(b => b.date === todayStr);
    if (todayCountElem) todayCountElem.textContent = todays.length;
    const walkins = allBookings.filter(b => b.source === 'Walk-in' && b.date === todayStr);
    if (walkinsCountElem) walkinsCountElem.textContent = walkins.length;

    if (allBookings.length === 0) {
        table.innerHTML = '<tr><td colspan="8" class="no-data">No bookings found in system.</td></tr>';
        return;
    }

    let html = '';
    allBookings.forEach((job) => {
        const sourceLabel = job.source === 'Walk-in'
            ? '<span class="status-badge" style="background:#d4a373;color:#000;">Walk-in</span>'
            : '<span class="status-badge" style="background:#333;color:#ccc;">Online</span>';

        const isPaid = job.paymentStatus === 'Paid';
        const paymentBtn = `
            <button class="${isPaid ? 'status-completed' : 'status-pending'}" 
                    style="border:none; border-radius:4px; padding:4px 8px; cursor:pointer;"
                    onclick="togglePaymentStatus(${job.id})">
                ${isPaid ? 'Paid ✅' : 'Unpaid ❌'}
            </button>
        `;

        let stylistCell = job.stylist;
        if (!job.status || job.status === 'pending' || job.status === 'confirmed') {
            stylistCell = `
                <select onchange="assignStylist(${job.id}, this.value)" style="background:#222; color:#fff; border:1px solid #555; padding:2px;">
                    <option value="Any Available" ${job.stylist === 'Any Available' ? 'selected' : ''}>Any Available</option>
                    <option value="Ravi Kumar" ${job.stylist === 'Ravi Kumar' ? 'selected' : ''}>Ravi Kumar</option>
                    <option value="Anjali Mehta" ${job.stylist === 'Anjali Mehta' ? 'selected' : ''}>Anjali Mehta</option>
                    <option value="Suresh Singh" ${job.stylist === 'Suresh Singh' ? 'selected' : ''}>Suresh Singh</option>
                     <option value="Priya Desai" ${job.stylist === 'Priya Desai' ? 'selected' : ''}>Priya Desai</option>
                </select>
            `;
        }

        const statusClass = job.status === 'confirmed' ? 'status-confirmed' :
            job.status === 'completed' ? 'status-completed' :
                job.status === 'cancelled' ? 'status-cancelled' : 'status-pending';

        // --- BILLING / RECEIPT BUTTON LOGIC ---
        let billBtn = '';
        if (isPaid) {
            billBtn = `
                <button class="status-confirmed" onclick="openBillingModal('${job.customerName || 'Guest'}', '${job.customerPhone || ''}', '${job.service}', '${job.price}', 'receipt')" title="Send Receipt" style="border:none; border-radius:4px; padding:6px 10px; cursor:pointer; background: #4cd137; color: #fff;">
                       <i class="fas fa-file-invoice"></i> Receipt
                </button>
             `;
        } else {
            billBtn = `
                <button class="status-completed" onclick="openBillingModal('${job.customerName || 'Guest'}', '${job.customerPhone || ''}', '${job.service}', '${job.price}', 'bill')" title="Send Bill" style="border:none; border-radius:4px; padding:6px 10px; cursor:pointer; background: #25D366; color: #fff;">
                       <i class="fab fa-whatsapp"></i> Bill
                </button>
             `;
        }

        html += `
            <tr>
                 <td>${job.bookingDate || job.date} <br> <small>${job.time}</small></td>
                <td>${job.customerName || 'Guest'}</td>
                <td>${sourceLabel}</td>
                <td>${job.service}</td>
                <td>${stylistCell}</td>
                <td><span class="status-badge ${statusClass}">${job.status}</span></td>
                <td>${paymentBtn}</td>
                <td>
                    <button class="btn-cancel" onclick="cancelCustomerBooking(${customerUpcomingBookings.findIndex(b => b.id === job.id)})" title="Cancel Booking" style="margin-right: 5px;">
                        <i class="fas fa-times"></i>
                    </button>
                    ${billBtn}
                </td>
            </tr>
        `;
    });
    table.innerHTML = html;
}

function assignStylist(id, newStylist) {
    const booking = customerUpcomingBookings.find(b => b.id === id) || customerBookingHistory.find(b => b.id === id);
    if (booking) {
        booking.stylist = newStylist;
        saveBookingData();
        alert(`Stylist assigned: ${newStylist}`);
    }
}

function togglePaymentStatus(id) {
    const booking = customerUpcomingBookings.find(b => b.id === id) || customerBookingHistory.find(b => b.id === id);
    if (booking) {
        booking.paymentStatus = booking.paymentStatus === 'Paid' ? 'Unpaid' : 'Paid';
        saveBookingData();
        loadReceptionistDashboard();
    }
}

function promptWalkIn() {
    const name = prompt("Customer Name:");
    if (!name) return;
    const service = prompt("Service Name (e.g., Haircut):");
    if (!service) return;
    const stylist = prompt("Preferred Stylist (Optional):") || "Any Available";
    const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    const today = new Date().toISOString().split('T')[0];

    const newBooking = {
        id: Date.now(),
        customerName: name,
        service: service,
        stylist: stylist,
        date: today,
        bookingDate: today,
        time: time,
        price: 0, // Placeholder
        status: 'confirmed',
        source: 'Walk-in',
        paymentStatus: 'Unpaid'
    };

    customerUpcomingBookings.push(newBooking);
    saveBookingData();
    alert("Walk-in booking created successfully!");
    loadReceptionistDashboard();
}

// ========== STYLIST DASHBOARD ==========
function loadStylistDashboard() {
    const selector = document.getElementById('current-stylist-view');
    const currentStylistName = selector ? selector.value : "Ravi Kumar";
    const table = document.getElementById('stylist-appointments-table');
    const todayCountElem = document.getElementById('stylist-today-count');
    const completedCountElem = document.getElementById('stylist-completed-count');
    const earningsElem = document.getElementById('stylist-earnings');
    const activeJobs = customerUpcomingBookings.filter(b => b.stylist === currentStylistName || b.stylist === 'Any Available');
    const completedJobs = customerBookingHistory.filter(b => b.stylist === currentStylistName && b.status === 'completed');

    if (todayCountElem) todayCountElem.textContent = activeJobs.length;
    if (completedCountElem) completedCountElem.textContent = completedJobs.length;

    // Simple 40% commission calc
    const totalRevenue = completedJobs.reduce((sum, job) => sum + (job.price || 0), 0);
    const commission = totalRevenue * 0.40;
    if (earningsElem) earningsElem.textContent = '₹' + commission.toLocaleString();

    const dropdown = document.getElementById('quick-booking-select');
    if (dropdown) {
        dropdown.innerHTML = '<option value="">Select Appointment...</option>';
        activeJobs.forEach(job => {
            const opt = document.createElement('option');
            opt.value = job.id;
            opt.textContent = `${job.time} - ${job.customerName || 'Guest'}`;
            dropdown.appendChild(opt);
        });
    }

    if (activeJobs.length === 0) {
        table.innerHTML = '<tr><td colspan="6" class="no-data">No active appointments scheduled.</td></tr>';
        return;
    }

    let html = '';
    activeJobs.forEach((job) => {
        let actionButtons = '';
        if (job.status === 'pending') {
            actionButtons = `<button class="btn-approve" onclick="updateBookingStatus(${job.id}, 'confirmed')"><i class="fas fa-check"></i> Accept</button>`;
        } else if (job.status === 'confirmed') {
            actionButtons = `<button class="btn-primary" onclick="updateBookingStatus(${job.id}, 'completed')" style="padding: 5px 10px; font-size: 0.8rem;"><i class="fas fa-check-double"></i> Complete</button>`;
        }
        const statusClass = job.status === 'confirmed' ? 'status-confirmed' : 'status-pending';
        html += `<tr><td>${job.time}</td><td>${job.customerName || 'Guest'}</td><td>${job.service}</td><td>₹${job.price.toLocaleString()}</td><td><span class="status-badge ${statusClass}">${job.status}</span></td><td>${actionButtons}</td></tr>`;
    });
    table.innerHTML = html;
}

function quickUpdateStatus() {
    const bookingId = document.getElementById('quick-booking-select').value;
    const status = document.getElementById('quick-status-select').value;
    if (!bookingId) { alert('Please select an appointment first.'); return; }
    updateBookingStatus(Number(bookingId), status);
}

function updateBookingStatus(bookingId, newStatus) {
    const bookingIndex = customerUpcomingBookings.findIndex(b => b.id === bookingId);
    if (bookingIndex !== -1) {
        const booking = customerUpcomingBookings[bookingIndex];
        if (newStatus === 'cancelled') {
            if (confirm('Are you sure you want to cancel this booking?')) {
                customerUpcomingBookings.splice(bookingIndex, 1);
                customerBookingHistory.push({ ...booking, status: 'cancelled' });
                alert(`Notification sent to customer: Appointment cancelled.`);
                saveBookingData();
                loadStylistDashboard();
            }
            return;
        }
        booking.status = newStatus;
        if (newStatus === 'confirmed') {
            alert(`Notification sent to customer: Your appointment is CONFIRMED.`);
        }
        if (newStatus === 'completed') {
            alert('Job Completed! Earnings updated.\nNotification sent to customer: Thank you for visiting!');
            customerBookingHistory.push({ ...booking, status: 'completed' });
            customerUpcomingBookings.splice(bookingIndex, 1);
        } else {
            alert('Booking status updated to: ' + newStatus);
        }
        loadStylistDashboard();
    }
}

// ========== CUSTOMER DASHBOARD FUNCTIONS ==========

// Attach Event Listener for Customer Booking
// Use event delegation or check if element exists (since script runs at end of body, it should exist)
const bookingForm = document.getElementById('booking-form');
if (bookingForm) {
    bookingForm.addEventListener('submit', function (e) {
        e.preventDefault();

        // 1. Collect Data
        const name = document.getElementById('customer-name').value;
        const phone = document.getElementById('customer-phone').value;
        const email = document.getElementById('customer-email').value;
        const service = document.getElementById('service-name').value;
        const price = parseFloat(document.getElementById('service-price').value) || 0;
        const stylist = document.getElementById('preferred-stylist').value || 'Any Available';
        const date = document.getElementById('booking-date').value;
        const time = document.getElementById('booking-time').value;
        const notes = document.getElementById('special-requests').value;

        // 2. Validate
        if (!service) {
            alert('Please select a service.');
            return;
        }

        // 3. Create Booking Object
        const newBooking = {
            id: Date.now(),
            customerName: name,
            customerPhone: phone, // Added phone for WhatsApp logic
            customerEmail: email,
            service: service,
            stylist: stylist,
            date: date,
            bookingDate: date,
            time: time,
            price: price,
            notes: notes,
            status: 'confirmed', // Auto-confirming for demo
            source: 'Online',
            paymentStatus: 'Unpaid'
        };

        // 4. Save
        customerUpcomingBookings.push(newBooking);
        saveBookingData();

        // 5. Success Message & Reset
        alert('Appointment Booked Successfully!');
        bookingForm.reset();
        document.getElementById('estimated-price').textContent = '₹0';

        // 6. Refresh List
        loadCustomerUpcomingBookings();
    });
}


function loadCustomerDashboard() {
    // Populate profile if needed (mock)
    loadCustomerUpcomingBookings();
    // loadCustomerBookingHistory(); // Removed as per user request
}

function loadCustomerUpcomingBookings() {
    const grid = document.getElementById('upcoming-bookings-grid');
    if (!grid) return;

    if (customerUpcomingBookings.length === 0) {
        grid.innerHTML = '<p>No upcoming appointments found.</p>';
        return;
    }

    let html = '';
    customerUpcomingBookings.forEach(booking => {
        html += `
            <div class="booking-card">
                <div class="booking-header">
                    <h5>${booking.service}</h5>
                    <span class="status-badge status-confirmed">${booking.status}</span>
                </div>
                <div class="booking-details">
                    <p><i class="far fa-calendar"></i> ${booking.date}</p>
                    <p><i class="far fa-clock"></i> ${booking.time}</p>
                    <p><i class="far fa-user"></i> ${booking.stylist}</p>
                </div>
            </div>
        `;
    });
    grid.innerHTML = html;
}

// Dummy functions for other actions
function showAddServiceForm() { alert('Add Service feature pending backend integration.'); }
function editService() { }
function deleteService() { }
function showAddStaffForm() { alert('Add Staff feature pending backend integration.'); }
function editStaff() { }
function deleteStaff() { }
function showEditProfileForm() { alert('Edit Profile feature pending backend integration.'); }
function cancelCustomerBooking(index) {
    if (confirm('Cancel this booking?')) {
        customerUpcomingBookings.splice(index, 1);
        saveBookingData();
        loadReceptionistDashboard();
    }
}
