<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Edge and Elegance</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #111;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .register-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(212, 163, 115, 0.2);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
        }

        .header-center {
            text-align: center;
            margin-bottom: 30px;
        }

        .header-center h2 {
            color: #d4a373;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .header-center p {
            color: #aaa;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #d4a373;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            background: #222;
            border: 1px solid #444;
            color: #fff;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: #d4a373;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #d4a373 0%, #c89d6f 100%);
            border: none;
            color: #000;
            font-weight: bold;
            font-size: 1.1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .btn-submit:hover {
            transform: scale(1.02);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #aaa;
        }

        .login-link a {
            color: #d4a373;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <header>
        <div class="logo">
            <a href="index.jsp" class="logo-full">Edge and Elegance</a>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="index.jsp#booking-section">CONTACT</a></li>
            </ul>
        </nav>
    </header>

    <div class="register-container">
        <div class="header-center">
            <h2>Create Account</h2>
            <p>Join Edge and Elegance today</p>
            <% String errorMessage=(String) request.getAttribute("errorMessage"); if (errorMessage !=null) { %>
                <div
                    style="background-color: #ff4444; color: white; padding: 10px; border-radius: 5px; margin-top: 10px;">
                    <%= errorMessage %>
                </div>
                <% } %>
        </div>

        <form action="RegisterServlet" method="POST"> <!-- Assuming Servlet based registration -->
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" required placeholder="John Doe">
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role" required
                    style="width: 100%; padding: 12px; background: #222; border: 1px solid #444; color: #fff; border-radius: 5px; font-size: 1rem;">
                    <option value="customer">Customer</option>
                    <option value="stylist">Stylist</option>
                    <option value="receptionist">Receptionist</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="john@example.com">
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" required placeholder="1234567890">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="********">
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm_password" required placeholder="********">
            </div>

            <button type="submit" class="btn-submit">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>

</body>

</html>