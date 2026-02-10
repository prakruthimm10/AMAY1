package com.amay.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/setup-db")
public class SetupDatabaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>DB Setup</title><style>body{font-family:sans-serif; background:#111; color:#eee; padding:20px;} .success{color:#4caf50;} .error{color:#ff5252;}</style></head><body>");
        out.println("<h2>AMAY1 Database Setup (Complete)</h2>");

        String url = "jdbc:mysql://localhost:3306/?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String pass = "root";
        
        // Path to the complete SQL file
        String sqlFilePath = "c:\\Users\\priya\\eclipse-workspace\\AMAY1\\database\\complete_database.sql";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 Statement stmt = conn.createStatement()) {

                out.println("<p>Connected to MySQL Server...</p>");
                
                // Read SQL file
                java.nio.file.Path path = java.nio.file.Paths.get(sqlFilePath);
                if (!java.nio.file.Files.exists(path)) {
                    out.println("<h3 class='error'>Error: SQL file not found at " + sqlFilePath + "</h3>");
                    return;
                }
                
                String sqlScript = new String(java.nio.file.Files.readAllBytes(path));
                
                // Split by semi-colon to execute one by one (Basic SQL runner)
                // This is primitive but works for simple scripts without triggers/procedures
                String[] commands = sqlScript.split(";");
                
                int count = 0;
                for (String command : commands) {
                    String trimmed = command.trim();
                    if (trimmed.isEmpty() || trimmed.startsWith("--")) continue;
                    
                    try {
                        stmt.execute(trimmed);
                        count++;
                    } catch (Exception e) {
                        // Ignore "Database exists" or simple errors, but log others
                        out.println("<p class='error'>Error executing command: " + 
                            (trimmed.length() > 50 ? trimmed.substring(0, 50) + "..." : trimmed) + 
                            " <br/>Reason: " + e.getMessage() + "</p>");
                    }
                }
                
                out.println("<h3 class='success'>SUCCESS! Executed " + count + " SQL commands from schema file.</h3>");
                out.println("<p>Tables created: Users, Services, Bookings, Staff, etc.</p>");
                out.println("<br/><a href='register.jsp' style='color:#d4a373; font-size:1.2em;'>Go to Registration</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 class='error'>FATAL ERROR: " + e.getMessage() + "</h3>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }
        out.println("</body></html>");
    }
}
