<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Civic Citizen HelpDesk</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/image/Helpdesk_Logo-removebg-preview.png">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- CSS -->
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
	href="${pageContext.request.contextPath}/assets/css/Register.css">
	<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {

    // Load Talukas on page load
    fetch("/getTaluka")
        .then(response => {
            if (!response.ok) throw new Error("Network response was not ok");
            return response.json();
        })
        .then(data => {
            const talukaSelect = document.getElementById("taluka");
            talukaSelect.innerHTML = '<option value="">Select Taluka</option>';
            
            data.forEach(taluka => {
                const option = document.createElement("option");
                option.value = taluka.id;
                option.textContent = taluka.name;
                talukaSelect.appendChild(option);
            });
        })
        .catch(error => {
            alert("Failed to load talukas: " + error.message);
        });

    
    document.getElementById("taluka").addEventListener("change", function () {
        const talukaId = this.value;
        const villageSelect = document.getElementById("village");

        
        villageSelect.innerHTML = '<option value="">Select Village</option>';

        if (talukaId) {
            fetch("/getVillageByTaluka/" + talukaId)
                .then(response => {
                    if (!response.ok) throw new Error("Network response was not ok");
                    return response.json();
                })
                .then(data => {
                    data.forEach(village => {
                        const option = document.createElement("option");
                        option.value = village.name;
                        option.textContent = village.name;
                        villageSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    alert("Failed to load villages: " + error.message);
                });
        }
    });

});
</script>
</head>

<body>
	<!-- Top Header -->
	<nav class="navbar border-bottom top-header py-2">
		<div class="container">
			<div class="Logo d-flex justify-content-center align-items-center">
				<img src="assets/image/Seal_of_Maharashtra-removebg-preview.png"
					alt="Maharashtra Logo" width="30" height="30">
				<p class="navbar nav-logo mb-0 text-light">Government of
					Maharashtra</p>
			</div>
			<div class="d-flex">
				<button class="btn format-btn" aria-label="Increase text size">
					A<sup>+</sup>
				</button>
				<button class="btn format-btn" aria-label="Reset text size">
					A<sup>=</sup>
				</button>
				<button class="btn format-btn" aria-label="Decrease text size">
					A<sup>-</sup>
				</button>
				<select class="format-btn form-select language-switcher"
					aria-label="Select language">
					<option value="en" selected>English</option>
					<option value="mr">Marathi</option>
					<option value="hi">Hindi</option>
				</select>
			</div>
		</div>
	</nav>

	<!-- Main Header -->
	<nav class="navbar bg-white border-bottom p-2 shadow-sm">
		<div class="container">
			<div class="Logo d-flex justify-content-between">
				<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
					alt="HelpDesk Logo" width="80" height="80">
				<div class="d-flex flex-column justify-content-center">
					<p class="logo-text ms-2 text-primary">Civic Citizen</p>
					<p class="logo-text ms-2 text-primary">HelpDesk</p>
				</div>
			</div>
			<div class="d-flex align-items-center">
				<a href="home_page">
					<button class="btn me-2 rounded-pill login-btn" type="button">
						<i class="bi bi-arrow-left me-2"></i> Back to Home
					</button>
				</a> <img src="assets/image/Ashok_Stamb-removebg-preview.png"
					alt="Ashok Stamb" width="55" height="55"
					class="ms-2 border-start ps-3 d-none d-md-block">
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container-fluid mb-4 p-0 main">
		<div
			class="container py-4 d-flex justify-content-center align-items-center">
			<div class="card shadow-lg register-card">
				<div class="card-header">
					<h2 class="mb-2">Create Your Account</h2>
					<p class="mb-0">Join Civic Citizen HelpDesk to report issues
						and track resolutions</p>
				</div>
				<div class="card-body">
					<!-- Progress Indicator -->
					<div class="step-indicator">
						<div class="step active">
							<div class="step-number">1</div>
							<div class="step-line"></div>
							<div class="step-label">Personal Info</div>
						</div>
						<div class="step">
							<div class="step-number">2</div>
							<div class="step-line"></div>
							<div class="step-label">Address</div>
						</div>
						<div class="step">
							<div class="step-number">3</div>
							<div class="step-line"></div>
							<div class="step-label">Verification</div>
						</div>
						<div class="step">
							<div class="step-number">4</div>
							<div class="step-label">Complete</div>
						</div>
					</div>

					<form action="register" method="POST"
						onsubmit="return validateForm()">
						<!-- Personal Information Section -->
						<div class="mb-4">
							<h5 class="text-primary mb-3">
								<i class="bi bi-person-circle me-2"></i>Personal Information
							</h5>

							<!-- Full Name -->
							<label class="form-label">Full Name</label>
							<div class="row mb-3">
								<div class="col-md-4 mb-2">
									<input type="text" class="form-control"
										placeholder="First Name" name="firstname" id="firstname"
										required>
								</div>
								<div class="col-md-4 mb-2">
									<input type="text" class="form-control"
										placeholder="Middle Name" name="middlename" id="middlename">
								</div>
								<div class="col-md-4 mb-2">
									<input type="text" class="form-control" placeholder="Last Name"
										name="lastname" id="lastname" required>
								</div>
							</div>

							<!-- Mobile & Aadhar -->
							<div class="row mb-3">
								<div class="col-md-6 mb-2">
									<label class="form-label">Mobile Number</label> <input
										type="text" class="form-control" maxlength="10"
										placeholder="Enter mobile number" name="mobile" id="mobile"
										required
										oninput="this.value = this.value.replace(/[^0-9]/g, '')">
									<div id="mobileValidation" class="validation-message"></div>
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label">Aadhar Number</label> <input
										type="text" class="form-control" maxlength="12"
										placeholder="Enter Aadhar number" name="aadhar" id="aadhar"
										required
										oninput="this.value = this.value.replace(/[^0-9]/g, '')">
									<div id="aadharValidation" class="validation-message"></div>
								</div>
							</div>
						</div>

						<!-- Address Section -->
						<div class="mb-4">
							<h5 class="text-primary mb-3">
								<i class="bi bi-geo-alt me-2"></i>Address Information
							</h5>

							<div class="row mb-3">
								<div class="col-md-6 mb-2">
									<label class="form-label">State</label> <select
										class="form-select" name="state" id="state" required>
										<option selected disabled value="">Select State</option>
										<option value="Maharashtra">Maharashtra</option>
										<!-- Add more states as needed -->
									</select>
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label">District</label> <select
										class="form-select" name="district" id="district">
										<option selected disabled value="">Select District</option>
										<option value="Solapur">Solapur</option>
										<!-- Districts will be populated based on state selection -->
									</select>
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label">Taluka</label> 
									<select id="taluka" name="taluka" class="form-select">
								        <option value="">Select Taluka</option>
								    </select>
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label">City / Village</label>
									 <select id="village" name="village" class="form-select">
								        <option value="">Select Village</option>
								     </select>
								</div>
								<div class="col-12">
									<label class="form-label">Pincode</label> <input type="text"
										class="form-control" placeholder="Enter pincode" maxlength="6"
										name="pincode" id="pincode" required
										oninput="this.value = this.value.replace(/[^0-9]/g, '')">
								</div>
							</div>
						</div>

						<!-- Email Verification Section -->
						<div class="mb-4">
							<h5 class="text-primary mb-3">
								<i class="bi bi-envelope me-2"></i>Email Verification
							</h5>

							<div class="mb-3">
								<label class="form-label">Email Address</label>
								<div class="input-group">
									<input type="email" id="email" class="form-control"
										placeholder="Enter your email address" name="email" required>
									<button type="button" id="sendOtpBtn" class="btn btn-primary">
										Send OTP</button>
								</div>
								<div id="emailValidation" class="validation-message"></div>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter OTP</label>
								<div class="input-group">
									<input type="text" id="emailOtp" class="form-control"
										placeholder="Enter the OTP sent to your email" maxlength="6">
									<button type="button" id="verifyOtpBtn" class="btn btn-success">
										Verify OTP</button>
								</div>
							</div>

							<div id="otpStatus" class="otp-status"></div>
						</div>

						<!-- Password Section -->
						<div class="mb-4">
							<h5 class="text-primary mb-3">
								<i class="bi bi-shield-lock me-2"></i>Security
							</h5>

							<div class="mb-3">
								<label class="form-label">Password</label>
								<div class="input-group">
									<input type="password" id="password" class="form-control"
										placeholder="Create a strong password" name="password"
										required onkeyup="checkPasswordStrength(this.value)">
									<button class="btn btn-outline-secondary" type="button"
										onclick="togglePassword('password', this)">
										<i class="bi bi-eye"></i>
									</button>
								</div>
								<div id="passwordStrength" class="password-strength"></div>
								<small class="form-text text-muted"> Password must be at
									least 8 characters with uppercase, lowercase, number and
									special character </small>
							</div>

							<div class="mb-3">
								<label class="form-label">Confirm Password</label>
								<div class="input-group">
									<input type="password" id="confirm-password"
										class="form-control" placeholder="Re-enter your password"
										name="confirmpassword" required>
									<button class="btn btn-outline-secondary" type="button"
										onclick="togglePassword('confirm-password', this)">
										<i class="bi bi-eye"></i>
									</button>
								</div>
								<div id="passwordMatch" class="mt-1"></div>
							</div>
						</div>

						<!-- Terms and Conditions -->
						<div class="mb-4">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="terms"
									required> <label class="form-check-label" for="terms">
									I agree to the <a href="#" class="text-primary">Terms of
										Service</a> and <a href="#" class="text-primary">Privacy
										Policy</a>
								</label>
							</div>
						</div>

						<!-- Register Button -->
						<div class="d-grid">
							<button type="submit" class="btn login-btn py-3" id="registerBtn">
								<i class="bi bi-person-plus me-2"></i> Create Account
							</button>
						</div>

						<!-- Login Link -->
						<div class="text-center mt-4">
							<p class="mb-0">
								Already have an account? <a href="login_page"
									class="text-primary fw-semibold text-decoration-none">Sign
									In</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-light py-4 border-top mt-auto">
		<div class="container text-center">
			<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
				alt="HelpDesk Logo" width="60" class="mb-2">
			<h5 class="mb-1">Civic Citizen HelpDesk</h5>
			<p class="small mb-0">An Initiative by Government of Maharashtra</p>
			<hr class="bg-light my-3">
			<p class="small mb-0">
				© 2025 Civic Citizen HelpDesk. All Rights Reserved. | <a href="#"
					class="text-decoration-none text-light">Privacy Policy</a> | <a
					href="#" class="text-decoration-none text-light">Terms of Use</a>
			</p>
		</div>
	</footer>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/Register.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>


</html>