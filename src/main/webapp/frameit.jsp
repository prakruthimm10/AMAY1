<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FrameIt - Edge and Elegance</title>
    <link rel="stylesheet" href="css/style.css?v=1.1">
    <link rel="stylesheet" href="css/frameit.css?v=1.3">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Cropper.js -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
</head>

<body>

    <header>
        <div class="logo">
            <a href="index.jsp" class="logo-full">Edge and Elegance</a>
        </div>
        <nav>
            <a href="index.jsp">HOME</a>
            <a href="index.jsp#about">ABOUT</a>
            <a href="services.jsp">SERVICES</a>
            <a href="index.jsp#offers">OFFERS</a>
            <a href="frameit.jsp" class="active">FRAMEIT</a>
            <a href="index.jsp#system-info">CLICK ME</a>
            <a href="index.jsp#booking-section">CONTACT</a>
        </nav>
    </header>

    <!-- FRAMEIT HERO -->
    <section class="frameit-hero">
        <div class="frameit-content">
            <h1>welcome to ur space</h1>
            <p>make it memories here</p>
            <div class="divider-small"></div>
        </div>
    </section>

    <!-- PHOTOBOOTH GRID -->
    <section class="photobooth-section">
        <div class="photobooth-grid">
            <!-- Booth 1 -->
            <div class="photobooth-card" onclick="openPhotobooth('floral')">
                <div class="booth-img-container">
                    <img src="images/photobooth_floral_swing_v2_1770012179898.png" alt="Floral Swing">
                </div>
                <h3>The Floral Swing</h3>
                <p>Whimsical vines and soft pink roses. <strong>(Click to Try!)</strong></p>
            </div>

            <!-- Booth 2 -->
            <div class="photobooth-card" onclick="openPhotobooth('neon')">
                <div class="booth-img-container">
                    <img src="images/photobooth_neon_vibes_v2_1770012202375.png" alt="Neon Vibes">
                </div>
                <h3>Neon Vibes</h3>
                <p>Electric blues and purples for a bold shot. <strong>(Click to Try!)</strong></p>
            </div>

            <!-- Booth 3 -->
            <div class="photobooth-card" onclick="openPhotobooth('hearts')">
                <div class="booth-img-container">
                    <img src="images/photobooth_love_hearts_1770013206868.png" alt="Love Hearts">
                </div>
                <h3>Love Hearts</h3>
                <p>Romantic floating balloons and neon love. <strong>(Click to Try!)</strong></p>
            </div>

            <!-- Booth 4 -->
            <div class="photobooth-card" onclick="openPhotobooth('starry')">
                <div class="booth-img-container">
                    <img src="images/photobooth_starry_night_1770013227507.png" alt="Starry Night">
                </div>
                <h3>Starry Night</h3>
                <p>Dreamy moon and twinkling fairy lights. <strong>(Click to Try!)</strong></p>
            </div>

            <!-- Booth 5 -->
            <div class="photobooth-card" onclick="openPhotobooth('geometric')">
                <div class="booth-img-container">
                    <img src="images/photobooth_gold_geometric_1770013247581.png" alt="Gold Geometric">
                </div>
                <h3>Gold Geometric</h3>
                <p>Modern luxury with chic gold lines. <strong>(Click to Try!)</strong></p>
            </div>
        </div>
    </section>

    <!-- AI PHOTOBOOTH MODAL -->
    <div id="photobooth-modal" class="webcam-modal" style="display:none;">
        <div class="modal-content-camera">
            <span class="close-camera" onclick="closePhotobooth()">&times;</span>

            <!-- STEP 1: UPLOAD & CROP -->
            <div id="step-upload" class="step-container" style="display: flex; flex-direction: column; height: 100%;">
                <h2>FrameIt AI Studio</h2>
                <p id="selected-theme-text">Theme: Selection</p>
                <div class="divider-small"></div>

                <div class="upload-area"
                    style="flex:1; display: flex; flex-direction: column; justify-content: center; overflow: hidden;">
                    <!-- Upload State -->
                    <div class="upload-box" onclick="document.getElementById('file-upload').click()">
                        <i class="fas fa-cloud-upload-alt fa-3x"></i>
                        <p>Click to Upload Your Photo</p>
                        <input type="file" id="file-upload" accept="image/*" style="display:none"
                            onchange="previewImage(this)">
                    </div>

                    <!-- Crop State -->
                    <div id="image-preview-container"
                        style="display:none; height: 100%; width: 100%; overflow: hidden;">
                        <img id="image-preview" src="" alt="Preview" style="max-width: 100%; display: block;">
                    </div>
                </div>

                <div class="action-buttons" style="margin-top: 15px;">
                    <!-- Dual Buttons for Crop State -->
                    <button type="button" class="btn-change" onclick="resetUpload()" style="margin-right: 10px;">Change
                        Photo</button>

                    <button type="button" id="btn-generate" class="btn-capture" onclick="generateAIPhoto()" disabled>
                        <i class="fas fa-magic"></i> GENERATE SALON LOOK
                    </button>
                </div>
            </div>

            <!-- STEP 2: PROCESSING -->
            <div id="step-processing" class="step-container" style="display:none; text-align: center;">
                <div class="spinner"></div>
                <h3>Staging your event...</h3>
                <p class="processing-detail">Analyzing room lights...</p>
                <p class="processing-detail" style="animation-delay: 1s;">Blending colors...</p>
            </div>

            <!-- STEP 3: RESULT -->
            <div id="step-result" class="step-container"
                style="display:none; height: 100%; display: flex; flex-direction: column;">
                <h2 style="margin: 5px 0 10px 0; font-size: 1.5rem;">Your Masterpiece</h2>

                <!-- NEW COMPOSITE VIEW using Canvas -->
                <!-- Reduced max-width to ensure buttons fit on screen -->
                <div class="result-composite-container" style="flex: 1; overflow-y: auto; text-align: center;">
                    <canvas id="composite-canvas" width="2000" height="1500"
                        style="width:100%; max-width: 480px; height:auto; border-radius:12px; cursor: move; touch-action: none; box-shadow: 0 10px 30px rgba(0,0,0,0.5);"></canvas>

                    <!-- CONTROLS -->
                    <div class="controls-panel"
                        style="background: rgba(30,30,30,0.9); padding: 12px; border-radius: 12px; margin: 10px auto; max-width: 500px; border: 1px solid rgba(255,255,255,0.1);">

                        <!-- Toggle Remove BG -->
                        <div
                            style="margin-bottom: 10px; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px;">
                            <label
                                style="color: #eee; cursor:pointer; display:flex; align-items:center; justify-content:center; gap: 10px; font-weight: 500;">
                                <input type="checkbox" id="chk-remove-bg" onchange="toggleRemoveBg()"
                                    style="width:20px; height:20px; accent-color: #d4af37;">
                                Remove Background (For White Walls)
                            </label>
                        </div>

                        <!-- Sliders Grid -->
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px; text-align: left;">
                            <!-- Zoom -->
                            <div>
                                <label
                                    style="color: #d4af37; font-size:0.85em; display:block; margin-bottom: 4px;">Zoom</label>
                                <input type="range" id="scale-slider" min="0.2" max="2.0" step="0.05" value="0.8"
                                    oninput="updateParam('scale', this.value)" style="width:100%; cursor: pointer;">
                            </div>
                            <!-- Brightness -->
                            <div>
                                <label
                                    style="color: #d4af37; font-size:0.85em; display:block; margin-bottom: 4px;">Brightness</label>
                                <input type="range" id="brightness-slider" min="0.5" max="1.5" step="0.05" value="1.0"
                                    oninput="updateParam('brightness', this.value)"
                                    style="width:100%; cursor: pointer;">
                            </div>
                            <!-- Atmosphere/Blend -->
                            <div>
                                <label
                                    style="color: #d4af37; font-size:0.85em; display:block; margin-bottom: 4px;">Theme
                                    Blend</label>
                                <input type="range" id="blend-slider" min="0" max="1.0" step="0.1" value="0.4"
                                    oninput="updateParam('blend', this.value)" style="width:100%; cursor: pointer;">
                            </div>
                            <!-- Opacity -->
                            <div>
                                <label
                                    style="color: #d4af37; font-size:0.85em; display:block; margin-bottom: 4px;">Opacity</label>
                                <input type="range" id="opacity-slider" min="0.5" max="1.0" step="0.05" value="1.0"
                                    oninput="updateParam('opacity', this.value)" style="width:100%; cursor: pointer;">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="action-buttons" style="margin-top: 10px; padding-bottom: 10px;">
                    <a id="download-link" class="btn-download" download="frameit-masterpiece.png"
                        style="background: linear-gradient(45deg, #d4af37, #f8f8f8); color: black; font-weight: bold; width: 100%; display: block; text-align: center; padding: 12px; border-radius: 50px; text-decoration: none; box-shadow: 0 4px 15px rgba(212, 175, 55, 0.4);">
                        <i class="fas fa-save"></i> Save to Device
                    </a>
                    <button type="button" class="btn-change" onclick="resetAll()"
                        style="background: transparent; border: 1px solid #777; color: #ccc; margin-top: 10px; padding: 8px 20px; border-radius: 20px;">Try
                        Another Look</button>
                </div>
            </div>

        </div>
    </div>

    <!-- FOOTER (Simplified) -->
    <footer class="black-cover-footer">
        <div class="cover-content">
            <h1 class="cover-title">Edge and Elegance</h1>
            <p class="cover-tagline">Where Luxury Meets Perfection</p>
        </div>
    </footer>

    <script>
        // --- CONFIG & STATE ---
        const modal = document.getElementById('photobooth-modal');
        const fileInput = document.getElementById('file-upload');
        const previewContainer = document.getElementById('image-preview-container');
        const previewImg = document.getElementById('image-preview');
        const uploadBox = document.querySelector('.upload-box');
        const generateBtn = document.getElementById('btn-generate');

        const stepUpload = document.getElementById('step-upload');
        const stepProcessing = document.getElementById('step-processing');
        const stepResult = document.getElementById('step-result');

        const canvas = document.getElementById('composite-canvas');
        const downloadLink = document.getElementById('download-link');
        const themeText = document.getElementById('selected-theme-text');

        // State
        let currentTheme = '';
        let originalUserImg = null;  // The raw Image object
        let processedUserCanvas = null; // The processed version (BG removed or Masked)
        let bgImgObj = null; // The theme background
        let cropper = null; // Cropper Instance

        // Transform State
        let state = {
            scale: 0.8,
            posX: 0,
            posY: 0,
            brightness: 1.0,
            blend: 0.4, // How much theme color overlay to apply
            opacity: 1.0,
            removeBg: false
        };

        // Theme Data
        const themes = {
            'floral': {
                name: 'The Floral Swing',
                bg: 'images/photobooth_floral_swing_v2_1770012179898.png',
                overlayColor: 'rgb(255, 200, 220)', // Soft Pink
                overlayMode: 'soft-light'
            },
            'neon': {
                name: 'Neon Vibes',
                bg: 'images/photobooth_neon_vibes_v2_1770012202375.png',
                overlayColor: 'rgb(0, 100, 255)', // Electric Blue
                overlayMode: 'overlay'
            },
            'hearts': {
                name: 'Love Hearts',
                bg: 'images/photobooth_love_hearts_1770013206868.png',
                overlayColor: 'rgb(255, 50, 50)', // Red
                overlayMode: 'soft-light'
            },
            'starry': {
                name: 'Starry Night',
                bg: 'images/photobooth_starry_night_1770013227507.png',
                overlayColor: 'rgb(20, 20, 80)', // Deep Blue
                overlayMode: 'hard-light'
            },
            'geometric': {
                name: 'Gold Geometric',
                bg: 'images/photobooth_gold_geometric_1770013247581.png',
                overlayColor: 'rgb(255, 215, 0)', // Gold
                overlayMode: 'soft-light'
            }
        };

        // --- LIFECYCLE ---

        function openPhotobooth(themeKey) {
            currentTheme = themeKey;
            themeText.textContent = "Theme: " + (themes[themeKey]?.name || themeKey);
            modal.style.display = 'flex';
            resetAll();
        }

        function closePhotobooth() {
            modal.style.display = 'none';
        }

        function previewImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    // Cleanup old
                    if (cropper) {
                        cropper.destroy();
                        cropper = null;
                    }

                    previewImg.src = e.target.result;
                    uploadBox.style.display = 'none';
                    previewContainer.style.display = 'block';
                    generateBtn.disabled = false;
                    generateBtn.classList.add('ready');

                    // Init Cropper
                    setTimeout(() => {
                        cropper = new Cropper(previewImg, {
                            viewMode: 1,
                            dragMode: 'move',
                            aspectRatio: NaN, // Free crop
                            autoCropArea: 0.9,
                            background: false,
                            minContainerWidth: 300,
                            minContainerHeight: 300,
                            zoomable: true
                        });
                    }, 100);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function resetUpload() {
            if (cropper) {
                cropper.destroy();
                cropper = null;
            }
            fileInput.value = '';
            uploadBox.style.display = 'flex';
            previewContainer.style.display = 'none';
            generateBtn.disabled = true;
            generateBtn.classList.remove('ready');
        }

        function resetAll() {
            resetUpload();
            stepUpload.style.display = 'flex'; // RE-FLEX
            stepProcessing.style.display = 'none';
            stepResult.style.display = 'none';

            // Reset State controls
            state.scale = 0.8;
            state.brightness = 1.0;
            state.blend = 0.4;
            state.opacity = 1.0;
            state.posX = 0;
            state.posY = 0;
            state.removeBg = false;

            document.getElementById('chk-remove-bg').checked = false;
            document.getElementById('scale-slider').value = 0.8;
            document.getElementById('brightness-slider').value = 1.0;
            document.getElementById('blend-slider').value = 0.4;
        }

        // --- CORE LOGIC ---

        function generateAIPhoto() {
            if (!cropper) return;

            // UI Transition
            stepUpload.style.display = 'none';
            stepProcessing.style.display = 'block';

            // 1. Get Cropped Version
            const croppedDataUrl = cropper.getCroppedCanvas({
                maxWidth: 2000,
                maxHeight: 2000
            }).toDataURL('image/png');

            // 2. Load User Image
            originalUserImg = new Image();
            originalUserImg.onload = function () {
                // 3. Load Theme Background
                bgImgObj = new Image();
                bgImgObj.onload = function () {
                    // Ready to render
                    stepProcessing.style.display = 'none';
                    stepResult.style.display = 'flex';

                    initPosition();
                    processUserImage();
                    drawComposite();
                };
                bgImgObj.onerror = function () {
                    alert("Error loading background.");
                    resetAll();
                };
                bgImgObj.src = themes[currentTheme].bg;
            }
            originalUserImg.src = croppedDataUrl;
        }

        function initPosition() {
            state.scale = 0.8;
            state.posX = 0;
            state.posY = 0;
        }

        // Handle "Remove White BG" toggle
        function toggleRemoveBg() {
            state.removeBg = document.getElementById('chk-remove-bg').checked;
            processUserImage();
            drawComposite();
        }

        function updateParam(key, val) {
            state[key] = parseFloat(val);
            drawComposite();
        }

        function processUserImage() {
            const w = originalUserImg.width;
            const h = originalUserImg.height;
            const temp = document.createElement('canvas');
            temp.width = w;
            temp.height = h;
            const ctx = temp.getContext('2d');

            ctx.drawImage(originalUserImg, 0, 0);

            if (state.removeBg) {
                const imageData = ctx.getImageData(0, 0, w, h);
                const data = imageData.data;
                const threshold = 230;

                for (let i = 0; i < data.length; i += 4) {
                    const r = data[i], g = data[i + 1], b = data[i + 2];
                    if (r > threshold && g > threshold && b > threshold) {
                        data[i + 3] = 0;
                    }
                }
                ctx.putImageData(imageData, 0, 0);
            } else {
                // SOFT EDGE - Since we cropped, we assume user cropped to face/body
                ctx.globalCompositeOperation = 'destination-in';
                const grad = ctx.createRadialGradient(w / 2, h / 2, h * 0.35, w / 2, h / 2, h * 0.7);
                grad.addColorStop(0, "rgba(0,0,0,1)");
                grad.addColorStop(1, "rgba(0,0,0,0)");
                ctx.fillStyle = grad;
                ctx.fillRect(0, 0, w, h);
            }
            processedUserCanvas = temp;
        }

        function drawComposite() {
            if (!bgImgObj || !processedUserCanvas) return;

            const ctx = canvas.getContext('2d');
            const cw = canvas.width;
            const ch = canvas.height;

            ctx.clearRect(0, 0, cw, ch);

            // 1. BG
            ctx.filter = 'none';
            ctx.drawImage(bgImgObj, 0, 0, cw, ch);

            // 2. User
            ctx.save();
            const userAspect = processedUserCanvas.width / processedUserCanvas.height;
            const targetH = ch * state.scale;
            const targetW = targetH * userAspect;

            const centerX = cw / 2;
            const centerY = ch / 2;
            const drawX = centerX - (targetW / 2) + state.posX;
            const drawY = centerY - (targetH / 2) + state.posY;

            ctx.filter = `brightness(${state.brightness})`;
            ctx.globalAlpha = state.opacity;
            ctx.shadowColor = "rgba(0,0,0,0.5)";
            ctx.shadowBlur = 40;
            ctx.shadowOffsetY = 20;

            ctx.drawImage(processedUserCanvas, drawX, drawY, targetW, targetH);
            ctx.restore();

            // 3. LOOK (Color Grade)
            const theme = themes[currentTheme];
            if (theme && state.blend > 0) {
                ctx.save();
                ctx.globalCompositeOperation = theme.overlayMode;
                ctx.fillStyle = theme.overlayColor;
                ctx.globalAlpha = state.blend;
                ctx.fillRect(0, 0, cw, ch);
                ctx.restore();
            }

            // 4. Branding
            ctx.shadowColor = "black";
            ctx.shadowBlur = 4;
            ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
            ctx.font = "italic 40px 'Playfair Display', serif";
            ctx.fillText("Edge & Elegance", cw - 350, ch - 50);

            // Update Link
            try {
                const dataUrl = canvas.toDataURL("image/png");
                downloadLink.href = dataUrl;
            } catch (e) {
                console.warn("Canvas Tainted", e);
            }
        }

        // --- DRAG INTERACTION ---
        let isDragging = false;
        let dragStartX, dragStartY;

        function getMousePos(evt) {
            const rect = canvas.getBoundingClientRect();
            let clientX, clientY;
            if (evt.touches) {
                clientX = evt.touches[0].clientX;
                clientY = evt.touches[0].clientY;
            } else {
                clientX = evt.clientX;
                clientY = evt.clientY;
            }
            return {
                x: (clientX - rect.left) * (canvas.width / rect.width),
                y: (clientY - rect.top) * (canvas.height / rect.height)
            };
        }

        canvas.addEventListener('mousedown', startDrag);
        canvas.addEventListener('touchstart', startDrag, { passive: false });

        function startDrag(e) {
            isDragging = true;
            const pos = getMousePos(e);
            dragStartX = pos.x - state.posX;
            dragStartY = pos.y - state.posY;
            canvas.style.cursor = "grabbing";
        }

        window.addEventListener('mousemove', drag);
        window.addEventListener('touchmove', drag, { passive: false });

        function drag(e) {
            if (!isDragging) return;
            e.preventDefault();
            const pos = getMousePos(e);
            state.posX = pos.x - dragStartX;
            state.posY = pos.y - dragStartY;
            drawComposite();
        }

        window.addEventListener('mouseup', endDrag);
        window.addEventListener('touchend', endDrag);

        function endDrag() {
            isDragging = false;
            canvas.style.cursor = "move";
        }

        // Close modal outside click
        window.onclick = function (event) {
            if (event.target == modal) {
                closePhotobooth();
            }
        }
    </script>
</body>

</html>