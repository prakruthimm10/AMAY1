package com.amay.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/frameit-process")
@MultipartConfig
public class FrameItServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // 1. Retrieve Parameters
            String backgroundName = request.getParameter("background");
            Part filePart = request.getPart("userPhoto");
            
            if (backgroundName == null || filePart == null) {
                out.print("{\"success\": false, \"message\": \"Missing background or photo.\"}");
                return;
            }

            // 2. Mock processing - In a real app, we would save the file or send binary to API
            // String fileName = filePart.getSubmittedFileName();
            // InputStream fileContent = filePart.getInputStream();

            // 3. Construct the "Antigravity Prompt" (Final Optimized Version)
            String prompt = constructPrompt(backgroundName);
            String negativePrompt = constructNegativePrompt();
            
            // Log the prompt to console to verify the requirements
            System.out.println("--- GENERATING FRAMEIT AI REQUEST (FINAL) ---");
            System.out.println("THEME: " + backgroundName);
            System.out.println("PROMPT: \n" + prompt);
            System.out.println("NEGATIVE PROMPT: \n" + negativePrompt);
            System.out.println("---------------------------------------------");

            /* 
             * ============================================================
             * INTEGRATION POINT: Antigravity Image-to-Image API
             * ============================================================
             * CRITICAL: You must send BOTH the Image and the Prompt.
             * 
             * 1. PREPARE IMAGE:
             *    String base64Image = convertToBase64(filePart.getInputStream());
             * 
             * 2. CALL API (Image + Text):
             *    AntigravityResponse response = AntigravityClient.generate(
             *        new GenerationRequest()
             *            .setMode("image-to-image") // IMPORTANT: Not text-to-image
             *            .setReferenceImage(base64Image)
             *            .setPrompt(prompt)
             *            .setNegativePrompt(negativePrompt)
             *            .setStrength(0.75) // Balance between reference and prompt
             *    );
             * 
             * 3. GET RESULT:
             *    String resultUrl = response.getImageUrl();
             * ============================================================
             */

            // 5. PREPARE COMPOSITE DATA
            String submittedFileName = filePart.getSubmittedFileName();
            // Sanitize
            if (submittedFileName == null) submittedFileName = "photo.png";
            submittedFileName = submittedFileName.replaceAll("[^a-zA-Z0-9.-]", "_");
            String uniqueFileName = "gen_" + UUID.randomUUID().toString() + "_" + submittedFileName;
            
            // Fixed Source Path (Persistence)
            String fixedSourcePath = "c:\\Users\\priya\\eclipse-workspace\\AMAY1\\src\\main\\webapp\\images\\uploaded";
            // Runtime Path (Immediate Serving)
            String runtimePath = request.getServletContext().getRealPath("/images/uploaded");

            // 1. Save to SOURCE (so it stays after restart)
            java.io.File sourceDir = new java.io.File(fixedSourcePath);
            if (!sourceDir.exists()) sourceDir.mkdirs();
            
            java.nio.file.Path sourceFilePath = java.nio.file.Paths.get(fixedSourcePath, uniqueFileName);
            
            // Use standard IO copy instead of filePart.write() to avoid container-specific absolute path issues
            try (InputStream input = filePart.getInputStream()) {
                java.nio.file.Files.copy(input, sourceFilePath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }

            // 2. Copy to RUNTIME (so it works right now)
            if (runtimePath != null) {
                java.io.File runtimeDir = new java.io.File(runtimePath);
                if (!runtimeDir.exists()) runtimeDir.mkdirs();
                
                java.nio.file.Path runtimeFilePath = java.nio.file.Paths.get(runtimePath, uniqueFileName);
                // Copy from source to runtime
                java.nio.file.Files.copy(sourceFilePath, runtimeFilePath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }
            
            String userPhotoUrl = "images/uploaded/" + uniqueFileName;
            String backgroundUrl = getMockResultImage(backgroundName);
            
            out.print("{\"success\": true, \"message\": \"AI Composition Successful!\", " + 
                     "\"backgroundUrl\": \"" + backgroundUrl + "\", " +
                     "\"userPhotoUrl\": \"" + userPhotoUrl + "\", " +
                     "\"promptUsed\": \"" + escapeJson(prompt) + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            // Return JSON error even in crash
            out.print("{\"success\": false, \"message\": \"Server Error: " + escapeJson(e.getMessage()) + "\"}");
        }
    }

    private String constructPrompt(String themeName) {
        // COMPOSITE PROMPT (User requested: "Add that photo in that background with perfect alignment")
        return 
            "Use the uploaded user photo as the SUBJECT REFERENCE.\n" +
            "Use the selected '" + themeName + "' image as the BACKGROUND.\n\n" +
            "COMMAND: Composite the subject into the background.\n" +
            "1. Extract the person from the user photo (remove original background).\n" +
            "2. Place them naturally into the center of the '" + themeName + "' scene.\n" +
            "3. Adjust size and perspective to match the environment scale.\n" +
            "4. Apply lighting correction so the subject looks like they are actually there.\n" +
            "5. Generate accurate shadows on the floor/furniture.\n\n" +
            "Ensure perfect alignment. No floating bodies. Seamless blending.\n" +
            "high quality, realistic, professional manipulation.";
    }

    private String getStylePrompt(String themeName) {
         return ""; // Not needed for strict composite prompt, handled in main logic
    }

    private String constructNegativePrompt() {
        return 
            "cartoon, anime, bad composite, floating, bad resizing, " +
            "pixelated, blurry edges, mismatched lighting, fake look";
    }
    
    // Mapping existing images to use as Backgrounds in the Composite View
    private String getMockResultImage(String background) {
        if (background == null) return "images/photobooth_neon_vibes_v2_1770012202375.png";
        switch (background) {
            case "The Floral Swing": return "images/photobooth_floral_swing_v2_1770012179898.png"; 
            case "Neon Vibes": return "images/photobooth_neon_vibes_v2_1770012202375.png";
            case "Love Hearts": return "images/photobooth_love_hearts_1770013206868.png";
            case "Starry Night": return "images/photobooth_starry_night_1770013227507.png";
            case "Gold Geometric": return "images/photobooth_gold_geometric_1770013247581.png";
            default: return "images/photobooth_neon_vibes_v2_1770012202375.png";
        }
    }
    
    private String escapeJson(String s) {
        return s.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }
}
