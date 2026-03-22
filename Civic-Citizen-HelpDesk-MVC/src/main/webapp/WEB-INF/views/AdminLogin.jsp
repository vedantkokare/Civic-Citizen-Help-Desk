<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login | Civic Citizen HelpDesk</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/image/Helpdesk_Logo-removebg-preview.png">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Login.css">
	
<style>
    /* Admin-specific styles */
    .admin-login-card {
        border-top: 4px solid #dc3545;
        border-radius: 12px;
    }
    
    .admin-btn {
        background-color: #dc3545;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .admin-btn:hover {
        background-color: #b02a37;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .admin-feature-icon {
        color: #dc3545;
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }
    
    .admin-alert {
        background-color: #f8d7da;
        border-left: 4px solid #dc3545;
        padding: 12px;
        border-radius: 4px;
        margin-bottom: 20px;
        display: none;
    }
    
    .security-level {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 20px;
        padding: 10px;
        background-color: #f8f9fa;
        border-radius: 6px;
    }
    
    .security-indicator {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        margin-right: 8px;
    }
    
    .security-high {
        background-color: #28a745;
    }
    
    .admin-info-box {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        border-radius: 12px;
        padding: 30px;
        height: 100%;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        border: 1px solid #e9ecef;
    }
    
    .admin-warning {
        color: #dc3545;
        font-weight: 600;
    }
</style>
</head>

<body>
	<!-- Top Header -->
	<nav class="navbar border-bottom top-header py-2">
		<div class="container">
			<div class="Logo d-flex justify-content-center align-items-center">
				<img src="assets/image/Seal_of_Maharashtra-removebg-preview.png"
					alt="Maharashtra Logo" width="30" height="30">
				<p class="navbar nav-logo mb-0 text-light">Government of Maharashtra</p>
			</div>
			<div class="d-flex">
				<button class="btn format-btn" aria-label="Increase text size">A<sup>+</sup></button>
				<button class="btn format-btn" aria-label="Reset text size">A<sup>=</sup></button>
				<button class="btn format-btn" aria-label="Decrease text size">A<sup>-</sup></button>
				<select class="format-btn form-select language-switcher" aria-label="Select language">
					<option value="en" selected>English</option>
					<option value="mr">Marathi</option>
					<option value="hi">Hindi</option>
				</select>
			</div>
		</div>
	</nav>
	<!-- /Top Header -->

	<!-- Main Header -->
	<nav class="navbar bg-white border-bottom p-2 shadow-sm">
		<div class="container">
			<div class="Logo d-flex justify-content-between">
				<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
					alt="HelpDesk Logo" width="80" height="80">
				<div class="d-flex flex-column justify-content-center">
					<p class="logo-text ms-2 text-primary">Civic Citizen</p>
					<p class="logo-text ms-2 text-primary">HelpDesk</p>
					<p class="logo-text ms-2 text-danger small fw-bold">Administration Portal</p>
				</div>
			</div>
			<div class="d-flex align-items-center">
				<a href="home_page">
					<button class="btn me-2 rounded-pill login-btn" type="button">
						<i class="bi bi-arrow-left me-2"></i> Back to Home
					</button>
				</a>
				<a href="login_page">
					<button class="btn me-2 rounded-pill btn-outline-primary" type="button">
						<i class="bi bi-person me-2"></i> User Login
					</button>
				</a>
				<img src="assets/image/Ashok_Stamb-removebg-preview.png"
					alt="Ashok Stamb" width="55" height="55"
					class="ms-2 border-start ps-3 d-none d-md-block">
			</div>
		</div>
	</nav>
	<!-- /Main Header -->

	<!-- Main Content -->
	<div class="container-fluid mb-4 p-0 main">
		<div class="container py-4">
			<div class="row justify-content-center align-items-center g-4">

				<!-- Left Security Info Box -->
				<div class="col-lg-4">
					<div class="admin-info-box text-center">
						<i class="bi bi-shield-lock admin-feature-icon"></i>
						<h4 class="admin-warning">Restricted Access</h4>
						<p class="mt-3">This portal is exclusively for authorized administrators of the Civic Citizen HelpDesk system. Unauthorized access is prohibited.</p>
						<div class="mt-4">
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-check-circle-fill text-danger me-2"></i>
								<span>Two-factor authentication</span>
							</div>
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-check-circle-fill text-danger me-2"></i>
								<span>Activity logging & monitoring</span>
							</div>
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-check-circle-fill text-danger me-2"></i>
								<span>IP-based access control</span>
							</div>
							<div class="d-flex align-items-center">
								<i class="bi bi-check-circle-fill text-danger me-2"></i>
								<span>Encrypted communication</span>
							</div>
						</div>
						<div class="security-level mt-4">
							<span>
								<span class="security-indicator security-high"></span>
								Security Level: HIGH
							</span>
							<i class="bi bi-shield-check text-success"></i>
						</div>
					</div>
				</div>

				<!-- Admin Login Section -->
				<div class="col-lg-4">
					<div class="card shadow-lg admin-login-card">
						<div class="card-header bg-light">
							<h2 class="mb-2 text-danger">
								<i class="bi bi-shield-lock me-2"></i>Admin Portal
							</h2>
							<p class="mb-0">Authorized personnel only</p>
						</div>
						<div class="card-body">
                            
                            <!-- Alert for login errors -->
                            <div class="admin-alert" id="login-alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                <span id="alert-message">Invalid credentials</span>
                            </div>

							<form action="adminLogin" method="POST" id="admin-login-form">
								<!-- Admin ID -->
								<div class="mb-4">
									<label for="adminId" class="form-label fw-semibold">
										<i class="bi bi-person-badge me-2"></i>Admin ID
									</label>
									<input type="text" class="form-control"
										id="adminId" name="adminId"
										placeholder="Enter your administrator ID" required>
									<div class="form-text">Use your assigned admin ID</div>
								</div>

								<!-- Password -->
								<div class="mb-4">
									<label for="adminPassword" class="form-label fw-semibold">
										<i class="bi bi-key me-2"></i>Administrator Password
									</label>
									<input type="password" class="form-control"
										id="adminPassword" name="adminPassword" 
										placeholder="Enter your secure password" required>
									<div class="form-text">Minimum 12 characters with special characters</div>
								</div>

								

								<!-- Captcha Section -->
								<div class="mb-4">
									<label class="form-label fw-semibold">
										<i class="bi bi-shield-check me-2"></i>Security Verification
									</label>
									
									<!-- Captcha Display -->
									<div class="d-flex align-items-center justify-content-between mb-3">
										<div class="captcha-box text-center flex-grow-1 me-3 p-2 bg-dark text-light rounded" 
                                             id="admin-captcha-value"></div>
										<button type="button"
											class="btn btn-outline-danger"
											id="refresh-admin-captcha" title="Refresh Captcha">
											<i class="bi bi-arrow-clockwise"></i>
										</button>
									</div>

									<!-- Hidden Captcha Value -->
									<input type="hidden" id="admin-captcha-hidden" name="captchaGenerated">

									<!-- Captcha Input -->
									<label for="admin-captcha-input" class="form-label small">Enter the code shown above</label>
									<input type="text" class="form-control"
										id="admin-captcha-input" name="captchaEntered"
										placeholder="Type the security code" required>
								</div>

								<!-- Login Button -->
								<div class="d-grid">
									<button type="submit" class="btn admin-btn py-3 fw-bold">
										<i class="bi bi-shield-check me-2"></i> Access Admin Dashboard
									</button>
								</div>

								<!-- Security Notice -->
								<div class="mt-4 p-3 bg-light rounded">
									<p class="small text-center mb-0">
										<i class="bi bi-info-circle text-danger me-1"></i>
										All login attempts are logged and monitored for security purposes.
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Right Admin Features Box -->
				<div class="col-lg-4">
					<div class="admin-info-box text-center">
						<i class="bi bi-speedometer2 admin-feature-icon"></i>
						<h4>Administrator Controls</h4>
						<p class="mt-3">Access comprehensive administrative tools to manage the Civic Citizen HelpDesk system efficiently.</p>
						<div class="mt-4">
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-gear-fill text-danger me-2"></i>
								<span>System configuration</span>
							</div>
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-people-fill text-danger me-2"></i>
								<span>User management</span>
							</div>
							<div class="d-flex align-items-center mb-3">
								<i class="bi bi-bar-chart-fill text-danger me-2"></i>
								<span>Analytics & reports</span>
							</div>
							<div class="d-flex align-items-center">
								<i class="bi bi-shield-fill-check text-danger me-2"></i>
								<span>Security settings</span>
							</div>
						</div>
						<div class="mt-4 pt-3 border-top">
							<p class="small text-muted">
								<i class="bi bi-exclamation-triangle me-1"></i>
								For assistance, contact system administrator
							</p>
							<a href="mailto:admin@civiccitizen.maharashtra.gov.in" 
                               class="text-decoration-none text-danger small fw-bold">
								<i class="bi bi-envelope me-1"></i>
								admin@civiccitizen.maharashtra.gov.in
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main Content -->

	<!-- Footer -->
	<footer class="bg-dark text-light py-4 border-top mt-auto">
		<div class="container text-center">
			<div class="mb-2">
				<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
					alt="HelpDesk Logo" width="60" class="mb-2">
				<h5 class="mb-1">Civic Citizen HelpDesk</h5>
				<p class="small mb-0">Administration Portal | Government of Maharashtra</p>
				<p class="small text-warning mt-1">
					<i class="bi bi-shield-exclamation"></i>
					Secure Access Only | All activities are monitored
				</p>
			</div>
			<hr class="bg-light my-3">
			<p class="small mb-0">
				© 2025 Civic Citizen HelpDesk. All Rights Reserved. | 
				<a href="#" class="text-decoration-none text-light">Privacy Policy</a> | 
				<a href="#" class="text-decoration-none text-light">Terms of Use</a> |
				<a href="#" class="text-decoration-none text-light">Security Guidelines</a>
			</p>
		</div>
	</footer>
	
	<!-- JavaScript for Admin Login -->
	<script>
		// Generate CAPTCHA for admin login
		function generateAdminCaptcha() {
			const chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
			let captcha = "";
			for (let i = 0; i < 6; i++) {
				captcha += chars.charAt(Math.floor(Math.random() * chars.length));
			}
			
			document.getElementById("admin-captcha-value").textContent = captcha;
			document.getElementById("admin-captcha-hidden").value = captcha;
			
			// Apply special styling to CAPTCHA
			const captchaElement = document.getElementById("admin-captcha-value");
			captchaElement.style.fontFamily = "'Courier New', monospace";
			captchaElement.style.fontSize = "24px";
			captchaElement.style.fontWeight = "bold";
			captchaElement.style.letterSpacing = "3px";
		}
		
		// Initialize CAPTCHA on page load
		document.addEventListener("DOMContentLoaded", function() {
			generateAdminCaptcha();
			
			// Add refresh CAPTCHA functionality
			document.getElementById("refresh-admin-captcha").addEventListener("click", generateAdminCaptcha);
			
			// Form submission validation
			document.getElementById("admin-login-form").addEventListener("submit", function(e) {
				const enteredCaptcha = document.getElementById("admin-captcha-input").value;
				const generatedCaptcha = document.getElementById("admin-captcha-hidden").value;
				const adminId = document.getElementById("adminId").value;
				const password = document.getElementById("adminPassword").value;
				
				// Basic validation
				if (enteredCaptcha !== generatedCaptcha) {
					e.preventDefault();
					showAlert("Security code does not match. Please try again.");
					generateAdminCaptcha();
					document.getElementById("admin-captcha-input").value = "";
					document.getElementById("admin-captcha-input").focus();
					return false;
				}
				
				if (adminId.trim() === "" || password.trim() === "") {
					e.preventDefault();
					showAlert("Please enter both Admin ID and password.");
					return false;
				}
				
				// Simulate login processing
				document.querySelector("button[type='submit']").innerHTML = 
					'<span class="spinner-border spinner-border-sm me-2"></span> Authenticating...';
				document.querySelector("button[type='submit']").disabled = true;
				
				// In a real application, this would be an AJAX call to the server
				// For demo purposes, we'll just show a message
				setTimeout(function() {
					document.querySelector("button[type='submit']").innerHTML = 
						'<i class="bi bi-shield-check me-2"></i> Access Admin Dashboard';
					document.querySelector("button[type='submit']").disabled = false;
				}, 2000);
			});
		});
		
		// Function to show alert messages
		function showAlert(message) {
			const alertDiv = document.getElementById("login-alert");
			const alertMessage = document.getElementById("alert-message");
			
			alertMessage.textContent = message;
			alertDiv.style.display = "block";
			
			// Hide alert after 5 seconds
			setTimeout(function() {
				alertDiv.style.display = "none";
			}, 5000);
		}
		
		// Format text size buttons
		document.querySelectorAll('.format-btn').forEach(btn => {
			btn.addEventListener('click', function() {
				if (this.textContent.includes('+')) {
					document.body.style.fontSize = 'larger';
				} else if (this.textContent.includes('-')) {
					document.body.style.fontSize = 'smaller';
				} else {
					document.body.style.fontSize = 'medium';
				}
			});
		});
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>