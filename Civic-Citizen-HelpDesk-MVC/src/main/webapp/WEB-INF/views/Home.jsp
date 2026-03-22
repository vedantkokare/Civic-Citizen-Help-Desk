<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home | Civic Citizen HelpDesk</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/image/Helpdesk_Logo-removebg-preview.png">

<!-- Bootstrap & Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/Home.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


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
	<!-- Top Header -->

	<!-- Main Header -->
	<nav class="navbar bg-white border-bottom p-2 shadow-sm">
		<div class="container">
			<div class="Logo d-flex justify-content-between">
				<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
					alt="HelpDesk Logo" width="80" height="80"
					class="d-inline-block align-text-top">
				<div
					class="d-inline-block d-flex flex-column justify-content-center">
					<p class="align-text-center ms-2 logo-text text-primary">Civic
						Citizen</p>
					<p class="align-text-center ms-2 logo-text text-primary">HelpDesk</p>
				</div>
			</div>
			
			<div class="d-flex align-items-center">
				<a href="login_page"
					class="btn btn-outline-primary quick-action-btn me-2 d-none d-md-block">
					<i class="fas fa-search me-1"></i> Track Complaint
				</a> <a href="faq"
					class="btn btn-outline-primary quick-action-btn me-2 d-none d-md-block">
					<i class="fas fa-question-circle me-1"></i> FAQ
					
				<a href="login_page">
    <button class="btn btn-warning me-2 quick-action-btn" type="button">
        <i class="fas fa-sign-in-alt me-1"></i> Login
    </button>
</a>

<a href="admin_login_page">
    <button class="btn btn-danger me-2 quick-action-btn" type="button">
        <i class="fas fa-user-shield me-1"></i> Admin Login
    </button>
</a>

					
					 
					
				</a> <a href="register_page">
					<button class="btn btn-warning me-2 quick-action-btn" type="button">
						<i class="fas fa-user-plus me-1"></i> Register
					</button>
				</a> <img src="assets/image/Ashok_Stamb-removebg-preview.png"
					alt="HelpDesk Logo" width="55" height="55"
					class="d-inline-block align-text-top ms-2 border-start ps-3 d-none d-md-block">
			</div>
		</div>
	</nav>
	<!-- Main Header -->

	<!-- Hero Section (Replacing Carousel) -->
	<section class="hero-section">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 hero-content">
					<h1 class="hero-title">Your Voice Matters</h1>
					<p class="hero-subtitle">Report civic issues, track
						resolutions, and contribute to a better Maharashtra. Our platform
						connects citizens directly with government departments for quick
						problem-solving.</p>

					<div class="d-flex flex-wrap gap-3 mb-4">
						<a href="login_page"
							class="btn btn-warning btn-lg quick-action-btn"> <i
							class="fas fa-edit me-2"></i> File a Complaint
						</a> <a href="services"
							class="btn btn-outline-light btn-lg quick-action-btn"> <i
							class="fas fa-concierge-bell me-2"></i> Browse Services
						</a>
					</div>

					<div class="hero-stats">
						<div class="hero-stat">
							<div class="hero-stat-number">1,25,647</div>
							<div class="hero-stat-label">Issues Resolved</div>
						</div>
						<div class="hero-stat">
							<div class="hero-stat-number">24H</div>
							<div class="hero-stat-label">Avg. Response Time</div>
						</div>
						<div class="hero-stat">
							<div class="hero-stat-number">94%</div>
							<div class="hero-stat-label">Satisfaction Rate</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6 hero-image">
					<div class="quick-report-card">
						<h4 class="mb-4 text-primary">Quick Report</h4>

						<div class="report-option" onclick="location.href='road_issues'">
							<i class="fas fa-road"></i>
							<div>
								<h6 class="mb-1 text-dark">Road & Infrastructure</h6>
								<p class="mb-0 small text-muted">Potholes, damaged roads,
									traffic signals</p>
							</div>
						</div>

						<div class="report-option" onclick="location.href='water_issues'">
							<i class="fas fa-tint"></i>
							<div>
								<h6 class="mb-1 text-dark">Water Supply</h6>
								<p class="mb-0 small text-muted">Water quality, pipeline
									leaks, supply issues</p>
							</div>
						</div>

						<div class="report-option"
							onclick="location.href='electricity_issues'">
							<i class="fas fa-bolt"></i>
							<div>
								<h6 class="mb-1 text-dark">Electricity</h6>
								<p class="mb-0 small text-muted">Power outages, street
									lights, wiring problems</p>
							</div>
						</div>

						<div class="report-option" onclick="location.href='waste_issues'">
							<i class="fas fa-trash"></i>
							<div>
								<h6 class="mb-1 text-dark">Waste Management</h6>
								<p class="mb-0 small text-muted">Garbage collection,
									sanitation, recycling</p>
							</div>
						</div>

						<div class="text-center mt-3">
							<a href="all_services" class="btn btn-outline-primary btn-sm">View
								All Services</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Features Section -->
	<section class="py-5 bg-white">
		<div class="container">
			<div class="row text-center mb-5">
				<div class="col-12">
					<h2 class="text-primary">How It Works</h2>
					<p class="text-muted">Simple steps to get your civic issues
						resolved</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4 mb-4">
					<div class="feature-icon-circle">
						<i class="fas fa-edit text-primary" style="font-size: 1.8rem;"></i>
					</div>
					<h4 class="text-center mb-3">Report Issue</h4>
					<p class="text-center text-muted">Describe your civic issue
						with details and location. You can also upload photos for better
						understanding.</p>
				</div>

				<div class="col-md-4 mb-4">
					<div class="feature-icon-circle">
						<i class="fas fa-tasks text-primary" style="font-size: 1.8rem;"></i>
					</div>
					<h4 class="text-center mb-3">Track Progress</h4>
					<p class="text-center text-muted">Monitor the status of your
						complaint in real-time. Get notifications at each step of the
						resolution process.</p>
				</div>

				<div class="col-md-4 mb-4">
					<div class="feature-icon-circle">
						<i class="fas fa-check-circle text-primary"
							style="font-size: 1.8rem;"></i>
					</div>
					<h4 class="text-center mb-3">Issue Resolved</h4>
					<p class="text-center text-muted">Receive confirmation when
						your issue is resolved. Provide feedback to help us improve our
						services.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Service Categories -->
	<div class="container mt-5">
		<div class="row text-center mb-4">
			<h2 class="text-primary">Report Common Issues</h2>
			<p class="text-light">Select a category to file your complaint</p>
		</div>
		<div class="row g-4">
			<div class="col-md-2 col-4">
				<a href="road_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-road text-warning mb-3" style="font-size: 2rem;"></i>
							<h6 class="card-title">Road Problems</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2 col-4">
				<a href="electricity_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-bolt text-warning mb-3" style="font-size: 2rem;"></i>
							<h6 class="card-title">Electricity</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2 col-4">
				<a href="water_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-tint text-warning mb-3" style="font-size: 2rem;"></i>
							<h6 class="card-title">Water Supply</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2 col-4">
				<a href="waste_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-trash text-warning mb-3"
								style="font-size: 2rem;"></i>
							<h6 class="card-title">Waste Management</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2 col-4">
				<a href="drainage_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-water text-warning mb-3"
								style="font-size: 2rem;"></i>
							<h6 class="card-title">Drainage</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2 col-4">
				<a href="other_issues" class="text-decoration-none">
					<div class="card service-card shadow-sm text-center h-100">
						<div class="card-body py-4">
							<i class="fas fa-ellipsis-h text-warning mb-3"
								style="font-size: 2rem;"></i>
							<h6 class="card-title">Other Issues</h6>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Statistics Section -->
	<div class="container-fluid bg-light py-5 mt-5">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-3 col-6 mb-4">
					<div class="stats-counter" id="complaintsCount">1,25,647</div>
					<p class="text-muted">Complaints Resolved</p>
				</div>
				<div class="col-md-3 col-6 mb-4">
					<div class="stats-counter" id="citiesCount">56</div>
					<p class="text-muted">Cities Covered</p>
				</div>
				<div class="col-md-3 col-6 mb-4">
					<div class="stats-counter" id="responseTime">24H</div>
					<p class="text-muted">Average Response Time</p>
				</div>
				<div class="col-md-3 col-6 mb-4">
					<div class="stats-counter" id="satisfactionRate">94%</div>
					<p class="text-muted">Citizen Satisfaction</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Emergency Contact Section -->
	<div class="container mt-5">
		<div class="row">
			<div class="col-12">
				<div class="card emergency-card shadow-sm">
					<div class="card-body py-4">
						<div class="d-flex flex-column flex-md-row align-items-center">
							<div class="d-flex align-items-center mb-3 mb-md-0">
								<i class="fas fa-exclamation-triangle fa-2x text-danger me-3"></i>
								<div>
									<h4 class="card-title mb-1">Emergency Contacts</h4>
									<p class="card-text mb-0">For urgent issues requiring
										immediate attention</p>
								</div>
							</div>
							<div class="ms-md-auto">
								<button class="btn btn-danger quick-action-btn">
									<i class="fas fa-phone-alt me-1"></i> View Emergency Numbers
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Updates Section -->
	<div class="container mt-5">
		<div class="row">
			<div class="col-12">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h3 class="text-primary">Latest Updates</h3>
					<a href="#" class="btn btn-outline-primary quick-action-btn">View
						All</a>
				</div>
				<div class="row">
					<div class="col-md-4 mb-4">
						<div class="card update-card shadow-sm h-100">
							<div class="card-body">
								<span class="badge bg-warning text-dark mb-2">Update</span>
								<h5 class="card-title">New Grievance Portal Launch</h5>
								<p class="card-text text-muted">Enhanced features for better
									citizen experience with real-time tracking and SMS alerts.</p>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted">Posted on: 15 Jan 2025</small> <a
										href="#" class="btn btn-sm btn-outline-primary">Read More</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card update-card shadow-sm h-100">
							<div class="card-body">
								<span class="badge bg-success text-white mb-2">Notice</span>
								<h5 class="card-title">Maintenance Schedule</h5>
								<p class="card-text text-muted">Scheduled maintenance on
									20th January. Portal may be unavailable from 2 AM to 4 AM.</p>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted">Posted on: 12 Jan 2025</small> <a
										href="#" class="btn btn-sm btn-outline-primary">Read More</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card update-card shadow-sm h-100">
							<div class="card-body">
								<span class="badge bg-info text-white mb-2">Achievement</span>
								<h5 class="card-title">1 Lakh+ Complaints Resolved</h5>
								<p class="card-text text-muted">Milestone achieved in public
									service delivery with 94% citizen satisfaction rate.</p>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted">Posted on: 10 Jan 2025</small> <a
										href="#" class="btn btn-sm btn-outline-primary">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Testimonials Section -->
	<div class="container-fluid bg-light py-5 mt-5">
		<div class="container">
			<h3 class="text-primary text-center mb-4">What Citizens Say</h3>
			<div class="row">
				<div class="col-md-4 mb-4">
					<div class="card testimonial-card shadow-sm h-100">
						<div class="card-body">
							<div class="text-warning mb-3">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i>
							</div>
							<p class="card-text fst-italic">"My road repair complaint was
								resolved within 2 days. The tracking feature kept me updated
								throughout the process. Excellent service!"</p>
							<div class="d-flex align-items-center mt-3">
								<div class="flex-shrink-0">
									<i class="fas fa-user-circle fa-2x text-primary"></i>
								</div>
								<div class="flex-grow-1 ms-3">
									<h6 class="mb-0">Akash Kumbhar</h6>
									<small class="text-muted">Pune</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4">
					<div class="card testimonial-card shadow-sm h-100">
						<div class="card-body">
							<div class="text-warning mb-3">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
							<p class="card-text fst-italic">"The water supply issue in
								our area was fixed promptly after I filed a complaint. The
								officials even called to confirm the resolution. Great
								initiative!"</p>
							<div class="d-flex align-items-center mt-3">
								<div class="flex-shrink-0">
									<i class="fas fa-user-circle fa-2x text-primary"></i>
								</div>
								<div class="flex-grow-1 ms-3">
									<h6 class="mb-0">Vedant Kokare</h6>
									<small class="text-muted">Nagpur</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4">
					<div class="card testimonial-card shadow-sm h-100">
						<div class="card-body">
							<div class="text-warning mb-3">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i>
							</div>
							<p class="card-text fst-italic">"I reported a street light
								outage in my locality, and it was fixed within 24 hours. The
								portal is user-friendly and the process is transparent."</p>
							<div class="d-flex align-items-center mt-3">
								<div class="flex-shrink-0">
									<i class="fas fa-user-circle fa-2x text-primary"></i>
								</div>
								<div class="flex-grow-1 ms-3">
									<h6 class="mb-0">Shankar Dudhal</h6>
									<small class="text-muted">Mumbai</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-light py-4 border-top mt-auto">
		<div class="container">
			<div class="row">
				<div class="col-md-4 text-center text-md-start mb-3 mb-md-0">
					<img src="assets/image/Helpdesk_Logo-removebg-preview.png"
						alt="HelpDesk Logo" width="60" class="mb-2">
					<h5 class="mb-1">Civic Citizen HelpDesk</h5>
					<p class="small mb-0">An Initiative by Government of
						Maharashtra</p>
				</div>
				
				
				<div class="col-md-4 text-center mb-3 mb-md-0">
					<h6>Quick Links</h6>
					<div class="d-flex flex-column">
						<a href="#" class="text-light text-decoration-none small py-1">Home</a>
						<a href="#" class="text-light text-decoration-none small py-1">Services</a>
						<a href="#" class="text-light text-decoration-none small py-1">Track
							Complaint</a> <a href="#"
							class="text-light text-decoration-none small py-1">Contact Us</a>
					</div>
				</div>
				<div class="col-md-4 text-center text-md-end">
					<h6>Contact Information</h6>
					<p class="small mb-1">
						<i class="fas fa-phone-alt me-2"></i> Helpline: 1800-123-4567
					</p>
					<p class="small mb-1">
						<i class="fas fa-envelope me-2"></i> Email:
						helpdesk@maharashtra.gov.in
					</p>
					<p class="small mb-0">
						<i class="fas fa-clock me-2"></i> Mon-Sat: 9:00 AM - 6:00 PM
					</p>
					
					
				</div>
			</div>
			<hr class="bg-light my-3">
			<div class="row">
				<div class="col-12 text-center">
					<p class="small mb-0">
						© 2025 Civic Citizen HelpDesk. All Rights Reserved. | <a href="#"
							class="text-decoration-none text-light">Privacy Policy</a> | <a
							href="#" class="text-decoration-none text-light">Terms of Use</a>
						| <a href="#" class="text-decoration-none text-light">Accessibility
							Statement</a> <a href="#" class="text-decoration-none text-light">Accessibility
							Statement</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/Login.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

</body>
</html>