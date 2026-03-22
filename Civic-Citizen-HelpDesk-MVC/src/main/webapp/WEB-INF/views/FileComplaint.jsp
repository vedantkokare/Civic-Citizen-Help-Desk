<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File a Complaint - Civic Citizen Help Desk</title>
   <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header Styles */
        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        /* Main Content */
        .main-content {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 40px;
            align-items: start;
        }

        /* Complaint Form */
        .complaint-form {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .form-section {
            margin-bottom: 30px;
        }

        .form-section h3 {
            color: #4a5568;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 1.4rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a5568;
        }

        .required::after {
            content: " *";
            color: #e53e3e;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* Camera Section */
        .camera-section {
            border: 2px dashed #cbd5e0;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            background: #f7fafc;
        }

        .camera-container {
            margin: 20px 0;
        }

        #cameraVideo, #cameraCanvas {
            width: 100%;
            max-width: 400px;
            border-radius: 8px;
            border: 2px solid #667eea;
        }

        .camera-controls {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin: 15px 0;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: #667eea;
            color: white;
        }

        .btn-primary:hover {
            background: #5a67d8;
            transform: translateY(-2px);
        }

        .btn-success {
            background: #48bb78;
            color: white;
        }

        .btn-success:hover {
            background: #38a169;
            transform: translateY(-2px);
        }

        .btn:disabled {
            background: #a0aec0;
            cursor: not-allowed;
            transform: none;
        }

        .captured-image {
            margin-top: 20px;
        }

        .captured-image img {
            max-width: 100%;
            border-radius: 8px;
            border: 2px solid #48bb78;
        }

        .location-info {
            background: #edf2f7;
            padding: 15px;
            border-radius: 8px;
            margin-top: 15px;
            font-size: 14px;
        }

        .hidden {
            display: none;
        }

        /* File Upload */
        .file-upload {
            border: 2px dashed #cbd5e0;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            background: #f7fafc;
            cursor: pointer;
            transition: border-color 0.3s ease;
        }

        .file-upload:hover {
            border-color: #667eea;
        }

        .file-upload i {
            font-size: 2rem;
            color: #667eea;
            margin-bottom: 10px;
        }

        /* Submit Button */
        .submit-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
        }

        /* Stats Sidebar */
        .stats-sidebar {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .stats-grid {
            display: grid;
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            text-align: center;
            padding: 20px;
            background: #f7fafc;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            display: block;
        }

        .stat-label {
            color: #4a5568;
            font-size: 0.9rem;
        }

        .services-list {
            list-style: none;
        }

        .services-list li {
            padding: 15px;
            margin-bottom: 10px;
            background: #f7fafc;
            border-radius: 8px;
            border-left: 4px solid #48bb78;
            transition: transform 0.3s ease;
        }

        .services-list li:hover {
            transform: translateX(5px);
        }

        .service-title {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 5px;
        }

        .service-desc {
            color: #718096;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .complaint-form {
                padding: 20px;
            }
        }
    </style>
    <!-- keep your CSS/Bootstrap includes -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/image/Helpdesk_Logo-removebg-preview.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/FileComplaint.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%@ include file="/WEB-INF/views/Header.jsp" %>

<div class="container">
    <div class="header">
        <h1>Your Voice Matters</h1>
        <p>Report civic issues, track resolutions, and contribute to a better Maharashtra</p>
    </div>

    <div class="main-content">
        <div class="complaint-form">
            <h2 style="text-align: center; margin-bottom: 30px; color: #2d3748;">File a Complaint</h2>

            <!-- IMPORTANT: use contextPath and correct controller path -->
            <form action="${pageContext.request.contextPath}/complaint" method="post" enctype="multipart/form-data" id="complaintForm">

                <!-- Personal Info -->
                <div class="form-section">
                    <h3>Personal Information</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fullName" class="required">Full Name</label>
                            <input type="text" id="fullName" name="fullName" required>
                        </div>
                        <div class="form-group">
                            <label for="email" class="required">Email Address</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone">
                        </div>
                        <div class="form-group">
                            <label for="address">Residential Address</label>
                            <input type="text" id="address" name="address">
                        </div>
                    </div>
                </div>

                <!-- Issue Details -->
                <div class="form-section">
                    <h3>Issue Details</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="category" class="required">Issue Category</label>
                            <select id="category" name="category" required>
                                <option value="">Select Category</option>
                                <option value="road">Road & Infrastructure</option>
                                <option value="water">Water Supply</option>
                                <option value="electricity">Electricity</option>
                                <option value="waste">Waste Management</option>
                                <option value="sanitation">Sanitation</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="subject" class="required">Subject</label>
                        <input type="text" id="subject" name="subject" placeholder="Brief description of the issue" required>
                    </div>
                    <div class="form-group">
                        <label for="description" class="required">Detailed Description</label>
                        <textarea id="description" name="description" placeholder="Please provide detailed information..." required></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="location">Exact Location</label>
                            <!-- IMPORTANT: name must match entity property "locationText" -->
                            <input type="text" id="locationText" name="locationText" placeholder="Street, Landmark, Area">
                        </div>
                        <div class="form-group">
                            <label for="ward">Ward Number</label>
                            <input type="text" id="ward" name="ward" placeholder="If known">
                        </div>
                    </div>
                </div>

                <!-- Evidence -->
                <div class="form-section">
                    <h3>Add Evidence</h3>

                    <div class="camera-section">
                        <h4>Take Photo</h4>
                        <div class="camera-container">
                            <video id="cameraVideo" autoplay playsinline class="hidden"></video>
                            <canvas id="cameraCanvas" class="hidden"></canvas>
                        </div>
                        <div class="camera-controls">
                            <button type="button" id="startCamera" class="btn btn-primary">Start Camera</button>
                            <button type="button" id="captureBtn" class="btn btn-success" disabled>Capture Photo</button>
                            <button type="button" id="retakeBtn" class="btn btn-primary hidden">Retake</button>
                        </div>

                        <div id="capturedImageContainer" class="captured-image hidden">
                            <img id="capturedImage" src="" alt="Captured Photo">
                            <div id="locationInfo" class="location-info">
                                <strong>Location Data:</strong>
                                <div id="locationDetails">Waiting for location...</div>
                            </div>

                            <!-- HIDDEN FIELDS (names match entity properties exactly) -->
                            <input type="hidden" id="imageBase64" name="imageBase64">
                            <input type="hidden" id="imagePath" name="imagePath">
                            <input type="hidden" id="filesJson" name="filesJson">
                            <input type="hidden" id="latitude" name="latitude">
                            <input type="hidden" id="longitude" name="longitude">
                            <input type="hidden" id="locationAddress" name="locationAddress">
                            <input type="hidden" id="locationTimestamp" name="locationTimestamp">
                            <input type="hidden" id="locationTextHidden" name="locationText"> <!-- duplicate for JS convenience -->
                        </div>
                    </div>

                    <!-- File Upload -->
                    <div class="form-group">
                        <label>Upload Files (Optional)</label>
                        <div class="file-upload" onclick="document.getElementById('fileUpload').click()">
                            <div>📁</div>
                            <p>Click to upload photos or documents</p>
                            <small>Max file size: 5MB (JPG, PNG, PDF)</small>
                            <input type="file" id="fileUpload" name="files" multiple accept=".jpg,.jpeg,.png,.pdf" style="display: none;">
                        </div>
                        <div id="fileList"></div>
                    </div>
                </div>

                <!-- Address breakdown -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="area">Area</label>
                        <input type="text" id="area" name="area" placeholder="Area / Locality">
                    </div>
                    <div class="form-group">
                        <label for="village">Village</label>
                        <input type="text" id="village" name="village" placeholder="Village">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="taluka">Taluka / Block</label>
                        <input type="text" id="taluka" name="taluka" placeholder="Taluka / Block">
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" id="city" name="city" placeholder="City">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="pincode">PIN / Postal Code</label>
                        <input type="text" id="pincode" name="pincode" placeholder="Postal code">
                    </div>
                    <div class="form-group"><label style="visibility:hidden">.</label><div></div></div>
                </div>

                <button type="submit" class="submit-btn">Submit Complaint</button>
            </form>
        </div>

        <!-- Sidebar omitted for brevity -->
    </div>
</div>

<script>
    // Elements
    const video = document.getElementById('cameraVideo');
    const canvas = document.getElementById('cameraCanvas');
    const capturedImage = document.getElementById('capturedImage');
    const startCameraBtn = document.getElementById('startCamera');
    const captureBtn = document.getElementById('captureBtn');
    const retakeBtn = document.getElementById('retakeBtn');
    const capturedImageContainer = document.getElementById('capturedImageContainer');
    const locationDetails = document.getElementById('locationDetails');

    // Hidden inputs
    const imageBase64Input = document.getElementById('imageBase64');
    const imagePathInput = document.getElementById('imagePath');
    const filesJsonInput = document.getElementById('filesJson');
    const latitudeInput = document.getElementById('latitude');
    const longitudeInput = document.getElementById('longitude');
    const locationAddressInput = document.getElementById('locationAddress');
    const locationTimestampInput = document.getElementById('locationTimestamp');
    const locationTextHidden = document.getElementById('locationTextHidden');

    // Other address fields
    const areaInput = document.getElementById('area');
    const villageInput = document.getElementById('village');
    const talukaInput = document.getElementById('taluka');
    const cityInput = document.getElementById('city');
    const pincodeInput = document.getElementById('pincode');
    const locationTextInput = document.getElementById('locationText'); // visible text field (id changed earlier)

    let stream = null;

    // Start Camera
    startCameraBtn.addEventListener('click', async () => {
        try {
            stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment', width: { ideal: 1280 }, height: { ideal: 720 } } });
            video.srcObject = stream;
            video.classList.remove('hidden');
            captureBtn.disabled = false;
            startCameraBtn.disabled = true;
        } catch (err) {
            console.error('Error accessing camera:', err);
            alert('Error accessing camera. Please grant camera permissions.');
        }
    });

    // Capture Photo
    captureBtn.addEventListener('click', async () => {
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
        const imageDataUrl = canvas.toDataURL('image/jpeg', 0.8);

        // set visible and hidden fields
        capturedImage.src = imageDataUrl;
        imageBase64Input.value = imageDataUrl;
        imagePathInput.value = ''; // nothing yet; server might set later if you upload file
        if (stream) stream.getTracks().forEach(t => t.stop());

        video.classList.add('hidden');
        capturedImageContainer.classList.remove('hidden');
        captureBtn.classList.add('hidden');
        retakeBtn.classList.remove('hidden');

        // fetch location after capture
        await getCurrentLocation();
    });

    // Retake
    retakeBtn.addEventListener('click', () => {
        capturedImageContainer.classList.add('hidden');
        video.classList.remove('hidden');
        captureBtn.classList.remove('hidden');
        retakeBtn.classList.add('hidden');
        startCameraBtn.click();
    });

    // Get Location
    async function getCurrentLocation() {
        if (!navigator.geolocation) {
            locationDetails.textContent = 'Geolocation not supported';
            return;
        }
        locationDetails.textContent = 'Getting location...';
        try {
            const position = await new Promise((res, rej) => navigator.geolocation.getCurrentPosition(res, rej, { enableHighAccuracy: true, timeout: 10000 }));
            const loc = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude,
                accuracy: Math.round(position.coords.accuracy),
                timestamp: new Date(position.timestamp)
            };

            latitudeInput.value = loc.latitude;
            longitudeInput.value = loc.longitude;
            // ISO local "YYYY-MM-DDTHH:mm:ss" - easier to bind to LocalDateTime
            locationTimestampInput.value = loc.timestamp.toISOString().slice(0,19);

            try {
                const address = await reverseGeocode(loc.latitude, loc.longitude);

                locationAddressInput.value = address.fullAddress || address.simple || '';
                if (address.area) areaInput.value = address.area;
                if (address.village) villageInput.value = address.village;
                if (address.taluka) talukaInput.value = address.taluka;
                if (address.city) cityInput.value = address.city;
                if (address.postal) pincodeInput.value = address.postal;

                // fill visible locationText if blank
                if ((!locationTextInput.value || locationTextInput.value.trim() === '') && address.simple) {
                    locationTextInput.value = address.simple;
                    locationTextHidden.value = address.simple;
                } else {
                    // copy visible field to hidden so server receives it
                    locationTextHidden.value = locationTextInput.value;
                }

                let html = '<div><strong>Coordinates:</strong> ' + loc.latitude.toFixed(6) + ', ' + loc.longitude.toFixed(6) + '</div>';
                html += '<div><strong>Address:</strong> ' + (address.fullAddress || address.simple || 'Address not available') + '</div>';
                html += (address.area ? '<div><strong>Area:</strong> ' + address.area + '</div>' : '');
                html += (address.village ? '<div><strong>Village:</strong> ' + address.village + '</div>' : '');
                html += (address.taluka ? '<div><strong>Taluka:</strong> ' + address.taluka + '</div>' : '');
                html += (address.city ? '<div><strong>City:</strong> ' + address.city + '</div>' : '');
                html += (address.postal ? '<div><strong>PIN:</strong> ' + address.postal + '</div>' : '');
                html += '<div><strong>Accuracy:</strong> ±' + loc.accuracy + ' meters</div>';
                html += '<div><strong>Time:</strong> ' + loc.timestamp.toLocaleString() + '</div>';
                locationDetails.innerHTML = html;
            } catch (err) {
                locationDetails.innerHTML = '<div><strong>Coordinates:</strong> ' + loc.latitude.toFixed(6) + ', ' + loc.longitude.toFixed(6) + '</div>' +
                    '<div><strong>Accuracy:</strong> ±' + loc.accuracy + ' meters</div>' +
                    '<div><strong>Time:</strong> ' + loc.timestamp.toLocaleString() + '</div>';
            }
        } catch (err) {
            locationDetails.textContent = 'Location access denied or unavailable';
        }
    }

    // Reverse geocode helper (BigDataCloud)
    async function reverseGeocode(lat, lng) {
        const url = 'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=' + lat + '&longitude=' + lng + '&localityLanguage=en';
        const resp = await fetch(url);
        const data = await resp.json();

        let taluka = '', village = '';
        try {
            if (data.localityInfo && data.localityInfo.administrative && Array.isArray(data.localityInfo.administrative)) {
                const admin = data.localityInfo.administrative;
                for (let i = 0; i < admin.length; i++) {
                    const name = admin[i].name || '';
                    const level = admin[i].isoName || admin[i].adminLevel || admin[i].code || '';
                    if (!taluka && /taluka|tehsil|sub-district|block/i.test(name + level)) taluka = name;
                    if (!village && /village|town|hamlet/i.test(name + level)) village = name;
                }
                if (!taluka && admin.length >= 2) taluka = admin[admin.length - 2].name || '';
                if (!village && admin.length >= 1) village = admin[admin.length - 1].name || '';
            }
        } catch (e) { /* ignore */ }

        const area = data.locality || data.continent || '';
        const city = data.city || data.locality || data.principalSubdivision || '';
        const postal = data.postcode || data.postal || data.postalCode || '';
        const principalSubdivision = data.principalSubdivision || '';
        const simpleParts = [];
        if (data.locality) simpleParts.push(data.locality);
        if (data.city && data.city !== data.locality) simpleParts.push(data.city);
        if (principalSubdivision) simpleParts.push(principalSubdivision);
        if (postal) simpleParts.push(postal);
        const simple = simpleParts.join(', ');

        const fullAddress = data.localityInfo && data.localityInfo.info && data.localityInfo.info.formatAddress
            ? data.localityInfo.info.formatAddress
            : (data.locality || data.city ? simple : '');

        return {
            area: area || '',
            village: village || '',
            taluka: taluka || '',
            city: city || '',
            postal: postal || '',
            simple: simple,
            fullAddress: fullAddress
        };
    }

    // File input handler - fills filesJson hidden input
    document.getElementById('fileUpload').addEventListener('change', function (e) {
        const fileList = document.getElementById('fileList');
        fileList.innerHTML = '';
        const files = Array.from(e.target.files || []);
        const meta = files.map(f => ({ name: f.name, size: f.size, type: f.type }));
        filesJsonInput.value = JSON.stringify(meta);

        files.forEach(file => {
            const fileItem = document.createElement('div');
            fileItem.style.cssText = 'padding: 10px; margin: 5px 0; background: #edf2f7; border-radius: 5px; font-size: 14px;';
            const fileSize = (file.size / 1024 / 1024).toFixed(2);
            fileItem.textContent = '✓ ' + file.name + ' (' + fileSize + ' MB)';
            fileList.appendChild(fileItem);
        });
    });

    // Form submit handler: ensure hidden fields set
    document.getElementById('complaintForm').addEventListener('submit', function (e) {
        // copy visible locationText into hidden (so server receives it)
        locationTextHidden.value = locationTextInput.value || locationTextHidden.value || '';

        // if imageBase64 missing but capturedImage exists, copy
        if (!imageBase64Input.value && capturedImage && capturedImage.src) {
            imageBase64Input.value = capturedImage.src;
        }

        if (!filesJsonInput.value) filesJsonInput.value = '[]';

        // locationTimestamp fallback
        if (!locationTimestampInput.value) {
            locationTimestampInput.value = (new Date()).toISOString().slice(0,19);
        }

        // allow normal submit to occur
    });
</script>

<%@ include file="/WEB-INF/views/Footer.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>