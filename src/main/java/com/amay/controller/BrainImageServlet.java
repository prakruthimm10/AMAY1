package com.amay.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/brain-images/*")
public class BrainImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Base path where images are stored
    private static final String IMAGE_BASE_PATH = "C:/Users/priya/.gemini/antigravity/brain/3dc9884f-ff4d-434c-8ee5-3d37288b6dcf/";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Remove leading slash
        String filename = pathInfo.substring(1);
        // Decode filename
        filename = URLDecoder.decode(filename, "UTF-8");
        
        File file = new File(IMAGE_BASE_PATH, filename);
        
        if (!file.exists() || !file.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Get content type
        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }
        
        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(file.length()));
        
        // Write file content
        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = response.getOutputStream()) {
            
            byte[] buffer = new byte[1024];
            int bytesRead;
            
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
