package com.amay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amay.dao.UserDAO;
import com.amay.model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String role = request.getParameter("role");

        if (password != null && password.equals(confirmPassword)) {
            User user = new User(fullname, email, phone, password, role);
            try {
                boolean result = userDAO.registerUser(user);

                if (result) {
                    // Registration successful
                    response.sendRedirect("login.jsp?success=1");
                } else {
                    // Registration failed (generic)
                    request.setAttribute("errorMessage", "Registration failed! Please try again.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } catch (java.sql.SQLIntegrityConstraintViolationException e) {
                // Handle duplicate email or other constraints
                e.printStackTrace();
                String msg = "Registration failed: Account with this Email already exists.";
                request.setAttribute("errorMessage", msg);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "System Error: " + e.getMessage());
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            // Passwords do not match
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
