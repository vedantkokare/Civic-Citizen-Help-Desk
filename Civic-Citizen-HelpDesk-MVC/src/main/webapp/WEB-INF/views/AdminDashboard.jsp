<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<script>
    const ctx = '${pageContext.request.contextPath}';
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Civic Citizen HelpDesk</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/image/Helpdesk_Logo-removebg-preview.png">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <style>
        :root {
            --primary-red: #dc3545;
            --primary-dark-red: #b02a37;
            --secondary-blue: #0d6efd;
            --dark-blue: #2c3e50;
            --light-bg: #f8f9fa;
            --success-green: #28a745;
            --warning-orange: #ffc107;
            --info-cyan: #17a2b8;
        }

        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .admin-header {
            background: linear-gradient(135deg, #1a237e 0%, #283593 100%);
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .admin-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-logo-section {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-logo {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            background-color: white;
            padding: 5px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .admin-title h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .admin-title p {
            font-size: 14px;
            opacity: 0.9;
            margin: 0;
        }

        .admin-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-btn {
            background-color: var(--primary-red);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .admin-btn:hover {
            background-color: var(--primary-dark-red);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3);
        }

        .admin-btn-outline {
            background-color: transparent;
            border: 2px solid white;
            color: white;
        }

        .admin-btn-outline:hover {
            background-color: white;
            color: var(--primary-red);
        }

        .quick-stats-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }

        .stat-card {
            text-align: center;
            padding: 25px;
            border-radius: 10px;
            background: white;
            border: 1px solid #e9ecef;
            transition: all 0.3s ease;
            height: 100%;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            border-color: var(--primary-red);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin: 0 auto 20px;
        }

        .stat-icon.red {
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            color: var(--primary-red);
        }

        .stat-icon.blue {
            background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
            color: var(--secondary-blue);
        }

        .stat-icon.green {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
            color: var(--success-green);
        }

        .stat-icon.orange {
            background: linear-gradient(135deg, #fdfd96 0%, #f9f586 100%);
            color: var(--warning-orange);
        }

        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: var(--dark-blue);
            margin-bottom: 5px;
        }

        .stat-label {
            color: #6c757d;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .stat-trend {
            font-size: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .trend-up {
            color: var(--success-green);
        }

        .trend-down {
            color: var(--primary-red);
        }

        .dashboard-card {
            background: white;
            border-radius: 12px;
            border: 1px solid #e9ecef;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            overflow: hidden;
        }

        .card-header-custom {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 20px 25px;
            border-bottom: 2px solid var(--primary-red);
        }

        .card-header-custom h3 {
            color: var(--dark-blue);
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card-body-custom {
            padding: 25px;
        }

        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }

        .status-new {
            background-color: #e3f2fd;
            color: #1565c0;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-processing {
            background-color: #d1ecf1;
            color: #0c5460;
        }

        .status-resolved {
            background-color: #d4edda;
            color: #155724;
        }

        .status-rejected {
            background-color: #f8d7da;
            color: #721c24;
        }

        .recent-tickets-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .recent-tickets-table th {
            background-color: #f8f9fa;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            color: var(--dark-blue);
            border-bottom: 2px solid #dee2e6;
        }

        .recent-tickets-table td {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }

        .recent-tickets-table tr:hover {
            background-color: #f8f9fa;
        }

        .ticket-id {
            font-weight: 600;
            color: var(--primary-red);
        }

        .admin-alert {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border-left: 4px solid #ffc107;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-alert i {
            font-size: 24px;
            color: #ffc107;
        }

        .admin-alert-content h4 {
            margin: 0 0 5px 0;
            color: #856404;
        }

        .admin-alert-content p {
            margin: 0;
            color: #856404;
            font-size: 14px;
        }

        .user-profile-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }

        .user-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            color: var(--primary-red);
            font-weight: bold;
            margin: 0 auto 20px;
            border: 4px solid white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .user-info h4 {
            color: var(--dark-blue);
            margin-bottom: 10px;
        }

        .user-role {
            display: inline-block;
            background: linear-gradient(135deg, #dc3545 0%, #b02a37 100%);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .user-stats {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e9ecef;
        }

        .user-stat {
            text-align: center;
        }

        .user-stat-number {
            font-size: 20px;
            font-weight: 700;
            color: var(--dark-blue);
            display: block;
        }

        .user-stat-label {
            font-size: 12px;
            color: #6c757d;
        }

        /* Complaint Table Styles */
        .thumb { 
            max-width: 120px; 
            max-height: 90px; 
            object-fit: cover; 
            border-radius: 6px; 
        }
        
        .files-json { 
            white-space: pre-wrap; 
            word-break: break-word; 
            max-width: 100%; 
        }
        
        /* Complaint status badges for admin view */
        .status-NEW { 
            background: #eaf6ff; 
            color: #0b3550; 
            border: 1px solid rgba(30,144,255,0.18); 
        }
        
        .status-IN_PROGRESS { 
            background: #fff4e6; 
            color: #9a5b00; 
            border: 1px solid rgba(243,156,18,0.15); 
        }
        
        .status-RESOLVED { 
            background: #ecf9ee; 
            color: #1b6b33; 
            border: 1px solid rgba(39,174,96,0.12); 
        }
        
        .status-CLOSED { 
            background: #fdecea; 
            color: #7a1f1f; 
            border: 1px solid rgba(231,76,60,0.12); 
        }
        
        .status-PENDING { 
            background: #f0f2f5; 
            color: #36454f; 
            border: 1px solid rgba(108,117,125,0.06); 
        }

        @media (max-width: 768px) {
            .admin-header-content {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .admin-actions {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .recent-tickets-table {
                display: block;
                overflow-x: auto;
            }
        }

        .admin-footer {
            background: linear-gradient(135deg, #1a237e 0%, #283593 100%);
            color: white;
            padding: 30px 0;
            margin-top: 50px;
            border-top: 4px solid var(--primary-red);
        }

        .admin-footer-content {
            text-align: center;
        }

        .admin-footer-logo {
            width: 80px;
            margin-bottom: 20px;
        }

        .admin-footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .admin-footer-link {
            color: white;
            text-decoration: none;
            opacity: 0.8;
            transition: opacity 0.3s ease;
        }

        .admin-footer-link:hover {
            opacity: 1;
            color: white;
            text-decoration: underline;
        }

        .admin-copyright {
            opacity: 0.7;
            font-size: 14px;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- Admin Header -->
    <header class="admin-header">
        <div class="container">
            <div class="admin-header-content">
                <div class="admin-logo-section">
                    <img src="assets/image/Helpdesk_Logo-removebg-preview.png" 
                         alt="HelpDesk Logo" class="admin-logo">
                    <div class="admin-title">
                        <h1>Civic Citizen HelpDesk</h1>
                        <p>Administration Dashboard | Government of Maharashtra</p>
                    </div>
                </div>
                
                <div class="admin-actions">
                    <a href="home_page" class="admin-btn admin-btn-outline">
                        <i class="bi bi-house-door"></i> Public Site
                    </a>
                    <a href="login_page" class="admin-btn admin-btn-outline">
                        <i class="bi bi-person"></i> User Login
                    </a>
                      <!-- Dashboard -->
                    <a href="adminComplaintDashboard" class="admin-btn admin-btn-outline">
                          <i class="bi bi-speedometer2"></i> Dashboard
                    </a>
                    <a href="adminLogin" class="admin-btn">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                    
                   
                    
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container-fluid py-4">
        <div class="container">
            
            <!-- Welcome Alert -->
            <div class="admin-alert">
                <i class="bi bi-shield-check"></i>
                <div class="admin-alert-content">
                    <h4>Welcome, System Administrator!</h4>
                    <p>You are logged into the Civic Citizen HelpDesk Administration Panel. All activities are being monitored and logged.</p>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="quick-stats-container">
                <div class="row g-4">
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="stat-icon red">
                                <i class="bi bi-ticket-detailed"></i>
                            </div>
                            <div class="stat-number" id="totalTickets"><c:out value="${totalComplaints}" default="0"/></div>
                            <div class="stat-label">Total Complaints</div>
                            <div class="stat-trend trend-up">
                                <i class="bi bi-arrow-up"></i> 12.5% increase
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="stat-icon blue">
                                <i class="bi bi-clock-history"></i>
                            </div>
                            <div class="stat-number" id="pendingTickets"><c:out value="${pendingComplaints}" default="0"/></div>
                            <div class="stat-label">Pending Review</div>
                            <div class="stat-trend trend-down">
                                <i class="bi bi-arrow-down"></i> 8.2% decrease
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="stat-icon green">
                                <i class="bi bi-check-circle"></i>
                            </div>
                            <div class="stat-number" id="resolvedToday"><c:out value="${resolvedComplaints}" default="0"/></div>
                            <div class="stat-label">Resolved</div>
                            <div class="stat-trend trend-up">
                                <i class="bi bi-arrow-up"></i> 15.3% increase
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="stat-card">
                            <div class="stat-icon orange">
                                <i class="bi bi-people"></i>
                            </div>
                            <div class="stat-number" id="activeUsers"><c:out value="${totalUsers}" default="0"/></div>
                            <div class="stat-label">Active Users</div>
                            <div class="stat-trend trend-up">
                                <i class="bi bi-arrow-up"></i> 5.1% increase
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Dashboard Content -->
              
                    <!-- Complaints Table -->
                    <div class="dashboard-card">
                        <div class="card-header-custom d-flex justify-content-between align-items-center">
                            <h3 class="mb-0"><i class="fas fa-list me-2"></i>All Complaints</h3>
                            <div>
                                <span class="badge bg-primary">Total: <c:out value="${totalComplaints}" default="0"/></span>
                               
                            </div>
                        </div>
                        <div class="card-body-custom">
                            <div class="table-responsive">
                                <table class="table table-hover" id="complaintsTable">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Complaint ID</th>
                                            <th>Date</th>
                                            <th>Subject</th>
                                            <th>Category</th>
                                            <th>User</th>
                                            <th>Status</th>
                                            <th>Attachments</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                  
  <tbody>
<c:forEach var="complaint" items="${complaints}">
    <tr>
        <td>${complaint.complaintId}</td>
        <td>${complaint.createdAt}</td>
        <td>${complaint.subject}</td>
        <td><span class="badge bg-info">${complaint.category}</span></td>
        <td>${complaint.email}</td>
        <td>
            <span class="status-badge status-${complaint.status}">
                ${complaint.status}
            </span>
        </td>
        <td>
            <c:choose>
                <c:when test="${not empty complaint.filesJson}">Files</c:when>
                <c:when test="${not empty complaint.imageBase64}">Image</c:when>
                <c:when test="${not empty complaint.imagePath}">Image</c:when>
                <c:otherwise>No Attachment</c:otherwise>
            </c:choose>
        </td>
        <td>
      <button class="btn btn-sm btn-outline-primary view-details-btn"
        data-complaint-id="${complaint.complaintId}">
    View
</button>

            
             <button class="btn btn-sm btn-outline-success update-btn"
            data-id="${complaint.id}">
        Update
    </button>

    <button class="btn btn-sm btn-outline-danger delete-btn"
            data-id="${complaint.id}">
        Delete
    </button>
            
        </td>
    </tr>
</c:forEach>
</tbody>


                                  
                                  
                                </table>
                            </div>
                            
                            <!-- Pagination -->
                            <c:if test="${totalPages > 1}">
                                <nav aria-label="Complaints pagination" class="mt-4">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item <c:if test='${currentPage == 1}'>disabled</c:if>'">
                                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        
                                        <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                            <li class="page-item ${currentPage == pageNum ? 'active' : ''}">
                                                <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                            </li>
                                        </c:forEach>
                                        
                                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                            <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- Right Column - User Profile -->
                <div class="col-lg-4">
                    <!-- User Profile Card -->
                    <div class="user-profile-card">
                        <div class="user-avatar" id="adminAvatar">
                            AK
                        </div>
                        <div class="user-info">
                            <h4>Admin Kumar</h4>
                            <span class="user-role">System Administrator</span>
                            <p class="text-muted">Civic Citizen HelpDesk</p>
                            <p class="small">
                                <i class="bi bi-envelope me-1"></i>
                                admin@civiccitizen.maharashtra.gov.in
                            </p>
                        </div>
                        <div class="user-stats">
                            <div class="user-stat">
                                <span class="user-stat-number">24</span>
                                <span class="user-stat-label">Today's Actions</span>
                            </div>
                            <div class="user-stat">
                                <span class="user-stat-number">156</span>
                                <span class="user-stat-label">This Week</span>
                            </div>
                            <div class="user-stat">
                                <span class="user-stat-number"><c:out value="${totalComplaints}" default="0"/></span>
                                <span class="user-stat-label">Total Complaints</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Statistics -->
            <div class="row mt-4 g-4">
                <div class="col-md-6">
                    <div class="dashboard-card">
                        <div class="card-header-custom">
                            <h3><i class="bi bi-pie-chart"></i> Complaint Categories</h3>
                        </div>
                        <div class="card-body-custom">
                            <canvas id="categoryChart" height="200"></canvas>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="dashboard-card">
                        <div class="card-header-custom">
                            <h3><i class="bi bi-clock-history"></i> Response Time Analytics</h3>
                        </div>
                        <div class="card-body-custom">
                            <canvas id="responseTimeChart" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Complaint Details Modal -->
    <div class="modal fade" id="complaintDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Complaint Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="complaintDetailsContent">
                    <!-- Content will be loaded dynamically -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="printDetailsBtn">
                        <i class="fas fa-print me-1"></i> Print
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="admin-footer">
        <div class="container">
            <div class="admin-footer-content">
                <img src="assets/image/Helpdesk_Logo-removebg-preview.png" 
                     alt="HelpDesk Logo" class="admin-footer-logo">
                <h4>Civic Citizen HelpDesk</h4>
                <p class="mb-4">Government of Maharashtra Administration Portal</p>
                
                <div class="admin-footer-links">
                    <a href="#" class="admin-footer-link">System Manual</a>
                    <a href="#" class="admin-footer-link">API Documentation</a>
                    <a href="#" class="admin-footer-link">Support</a>
                    <a href="#" class="admin-footer-link">Privacy Policy</a>
                    <a href="#" class="admin-footer-link">Terms of Service</a>
                </div>
                
                <div class="admin-copyright">
                    <p>© 2025 Civic Citizen HelpDesk. All Rights Reserved. | Government of Maharashtra</p>
                    <p class="small">
                        <i class="bi bi-shield-lock me-1"></i>
                        Secure Admin Access | All activities are monitored and logged for security purposes.
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript -->
    <script>
        // Initialize charts
        document.addEventListener('DOMContentLoaded', function() {
            // Set admin initials based on name
            const adminName = "Admin Kumar";
            const initials = adminName.split(' ').map(n => n[0]).join('');
            document.getElementById('adminAvatar').textContent = initials;

            // Pie Chart - Complaint Categories
            const categoryCtx = document.getElementById('categoryChart').getContext('2d');
            new Chart(categoryCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Road & Infrastructure', 'Water Supply', 'Electricity', 'Waste Management', 'Sanitation', 'Others'],
                    datasets: [{
                        data: [30, 25, 20, 15, 5, 5],
                        backgroundColor: [
                            '#dc3545',
                            '#28a745',
                            '#ffc107',
                            '#17a2b8',
                            '#6f42c1',
                            '#6c757d'
                        ],
                        borderWidth: 0,
                        hoverOffset: 10
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'right',
                            labels: {
                                padding: 20,
                                usePointStyle: true
                            }
                        }
                    }
                }
            });

            // Bar Chart - Response Time
            const responseTimeCtx = document.getElementById('responseTimeChart').getContext('2d');
            new Chart(responseTimeCtx, {
                type: 'bar',
                data: {
                    labels: ['Roads', 'Water Supply', 'Electricity', 'Waste', 'Sanitation'],
                    datasets: [{
                        label: 'Average Response Time (hours)',
                        data: [4.2, 2.8, 6.5, 3.1, 5.4],
                        backgroundColor: [
                            'rgba(220, 53, 69, 0.7)',
                            'rgba(40, 167, 69, 0.7)',
                            'rgba(255, 193, 7, 0.7)',
                            'rgba(23, 162, 184, 0.7)',
                            'rgba(111, 66, 193, 0.7)'
                        ],
                        borderColor: [
                            '#dc3545',
                            '#28a745',
                            '#ffc107',
                            '#17a2b8',
                            '#6f42c1'
                        ],
                        borderWidth: 1,
                        borderRadius: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Hours'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });

            // Update stats periodically (simulated)
            setInterval(updateStats, 30000);
            
            // Initialize DataTable
            initializeDataTable();
        });

        // Initialize DataTable
        function initializeDataTable() {
        	$('#complaintsTable').DataTable({
        	    pageLength: 10,
        	    order: [[1, 'desc']],
        	    language: {
        	        emptyTable: "No complaints found",
        	        search: "Search complaints:",
        	        lengthMenu: "Show _MENU_ entries",
        	        info: "Showing _START_ to _END_ of _TOTAL_ complaints"
        	    }
        	});
        	


            
            // View details button click (delegated to support DataTables redraw)
    $('#complaintsTable tbody').on('click', '.view-details-btn', function () {
    const complaintId = $(this).data('id');
    loadComplaintDetails(complaintId);
});


            
            // Edit button click
            $('#complaintsTable tbody').on('click', '.update-btn', function() {
                const complaintId = $(this).data('id');
                window.location.href = 'admin-complaints?action=edit&id=' + complaintId;
            });
            
            // Delete button click
          $('#complaintsTable tbody').on('click', '.delete-btn', function() {
    const complaintId = $(this).data('id');
    if (confirm('Are you sure?')) {
        deleteComplaint(complaintId);
    }
});


            // Print details button
            $('#printDetailsBtn').click(function() {
                window.print();
            });
        }

        // Update dashboard stats
        function updateStats() {
            const stats = {
                totalTickets: Math.floor(Math.random() * 50) + 1240,
                pendingTickets: Math.floor(Math.random() * 20) + 75,
                resolvedToday: Math.floor(Math.random() * 30) + 140,
                activeUsers: Math.floor(Math.random() * 100) + 2800
            };

            // Animate number updates
            animateValue('totalTickets', stats.totalTickets);
            animateValue('pendingTickets', stats.pendingTickets);
            animateValue('resolvedToday', stats.resolvedToday);
            animateValue('activeUsers', stats.activeUsers);
        }

        // Animate number counting
        function animateValue(id, targetValue) {
            const element = document.getElementById(id);
            if (!element) return;
            
            const current = parseInt(element.textContent.replace(/,/g, ''));
            const increment = targetValue > current ? 1 : -1;
            const duration = 1000;
            const stepTime = Math.abs(Math.floor(duration / (targetValue - current)));
            
            let currentValue = current;
            const timer = setInterval(function() {
                currentValue += increment;
                element.textContent = currentValue.toLocaleString();
                if (currentValue === targetValue) {
                    clearInterval(timer);
                }
            }, stepTime);
        }

        // Logout confirmation
        document.querySelector('a[href="adminLogin"]')?.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm('Are you sure you want to logout from the admin dashboard?')) {
                // Add logout animation
                document.body.style.opacity = '0.7';
                setTimeout(() => {
                    window.location.href = 'adminLogin';
                }, 500);
            }
        });
        
        function loadComplaintDetails(complaintId) {
            $.ajax({
                url: ctx + '/getComplaintDetails',
                type: 'GET',
                data: { id: complaintId },
                success: function (data) {
                    renderComplaintModal(data);
                },
                error: function () {
                    alert("Failed to load complaint details");
                }
            });
        }

        function renderComplaintModal(c) {
            // c is a JS object containing complaint fields
       function get(key) {
    const val = c[key];

    if (
        val === null ||
        val === undefined ||
        val === "" ||
        val === false
    ) {
        return "N/A";
    }
    return val;
}


          const phone = get('phone');
          const address = get('address');
          const fullName = get('fullName');
          const email = get('email');
          const subject = get('subject');
          const description = get('description');
          const complaintId = get('complaintId');
          const createdAt = get('createdAt');
          const updatedAt = get('updatedAt');
          const status = get('status');
          const category = get('category');
          const city = get('city');
          const pincode = get('pincode');
          const ward = get('ward');
          const area = get('area');
          const village = get('village');
          const taluka = get('taluka');
          const locationText = get('locationText');
          const locationAddress = get('locationAddress');
          const latitude = get('latitude');
          const longitude = get('longitude');
          const imageBase64 = get('imageBase64');
          const imagePath = get('imagePath');
          const filesJson = get('filesJson');


            // build attachments html
            let attachmentsHtml = '';
            if (filesJson) {
                try {
                    const parsed = typeof filesJson === 'string' ? JSON.parse(filesJson) : filesJson;
                    if (Array.isArray(parsed)) {
                        attachmentsHtml += '<ul class="mb-0">';
                        parsed.forEach(function(it, idx) {
                            if (typeof it === 'string') {
                                attachmentsHtml += '<li><a href="' + it + '" target="_blank">Attachment ' + (idx+1) + '</a></li>';
                            } else if (it.url) {
                                attachmentsHtml += '<li><a href="' + it.url + '" target="_blank">' + (it.name || ('Attachment ' + (idx+1))) + '</a></li>';
                            } else {
                                attachmentsHtml += '<li>' + JSON.stringify(it) + '</li>';
                            }
                        });
                        attachmentsHtml += '</ul>';
                    } else if (typeof parsed === 'object') {
                        attachmentsHtml = '<pre class="files-json">' + JSON.stringify(parsed, null, 2) + '</pre>';
                    }
                } catch (e) {
                    attachmentsHtml = '<pre class="files-json">' + filesJson + '</pre>';
                }
            } else if (imageBase64) {
                attachmentsHtml = '<img src="data:image/*;base64,' + imageBase64 + '" class="img-fluid" alt="image"/>';
            } else if (imagePath) {
                attachmentsHtml = '<img src="${pageContext.request.contextPath}/' + imagePath + '" class="img-fluid" alt="image"/>';
            } else {
                attachmentsHtml = '<span class="text-muted">No attachments</span>';
            }

            const detailsHtml = `
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="detail-label">Complaint ID:</h6>
                        <p class="detail-value">${complaintId}</p>

                        <h6 class="detail-label">Submitted By:</h6>
                        <p class="detail-value">${fullName} ${email ? '(' + email + ')' : ''}</p>

                        <h6 class="detail-label">Phone:</h6>
                        <p class="detail-value">${phone || 'N/A'}</p>

                        <h6 class="detail-label">Category:</h6>
                        <p class="detail-value"><span class="badge bg-info">${category}</span></p>

                        <h6 class="detail-label">Subject:</h6>
                        <p class="detail-value">${subject}</p>

                        <h6 class="detail-label">Description:</h6>
                        <p class="detail-value">${description || 'No description provided'}</p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="detail-label">Status:</h6>
                        <p class="detail-value"><span class="status-badge status-${status}">${status}</span></p>

                        <h6 class="detail-label">Submission Date:</h6>
                        <p class="detail-value">${createdAt}</p>

                        <h6 class="detail-label">Last Updated:</h6>
                        <p class="detail-value">${updatedAt || 'N/A'}</p>

                        <h6 class="detail-label">Location Details:</h6>
                        <div class="location-details">
                            <p><strong>Address:</strong> ${locationAddress || address || 'N/A'}</p>
                            <p><strong>Location Text:</strong> ${locationText || 'N/A'}</p>
                            <p><strong>Ward:</strong> ${ward || 'N/A'}</p>
                            <p><strong>Area:</strong> ${area || 'N/A'}</p>
                            <p><strong>Village:</strong> ${village || 'N/A'}</p>
                            <p><strong>Taluka:</strong> ${taluka || 'N/A'}</p>
                            <p><strong>City:</strong> ${city || 'N/A'}</p>
                            <p><strong>Pincode:</strong> ${pincode || 'N/A'}</p>
                            <p><strong>Coordinates:</strong> ${latitude ? latitude + ' , ' + longitude : 'N/A'}</p>
                        </div>

                        <h6 class="detail-label">Attachments:</h6>
                        <div class="detail-value">${attachmentsHtml}</div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <h6 class="detail-label">Location Map:</h6>
                        <div class="map-container">
                            <div style="width:100%;height:200px;background-color:#e9ecef;display:flex;align-items:center;justify-content:center;color:#6c757d;">
                                <i class="fas fa-map-marked-alt fa-3x me-3"></i>
                                <span>Interactive Map Would Appear Here</span>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            $('#complaintDetailsContent').html(detailsHtml);
            $('#complaintDetailsModal').modal('show');
        }
        
       
        function deleteComplaint(id) {
            fetch(ctx + '/admincomplaint/delete?id=' + id, {
                method: 'POST',
                credentials: 'same-origin'   // 🔥 REQUIRED
            })
            .then(res => {
                if (!res.ok) {
                    if (res.status === 401) {
                        alert("Session expired. Please login again.");
                    }
                    throw new Error("Delete failed");
                }
                return res.text();
            })
            .then(() => {
                alert("Complaint deleted successfully");
                location.reload();
            })
            .catch(err => {
                console.error(err);
                alert("Delete failed");
            });
        }







    </script>
</body>
</html>