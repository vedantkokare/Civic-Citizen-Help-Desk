<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint History - Civic Citizen Help Desk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    
     <!-- keep your CSS/Bootstrap includes -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/image/Helpdesk_Logo-removebg-preview.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Dashboard.css">
    <link rel="stylesheet"href="${pageContext.request.contextPath}/assets/css/FileComplaint.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
   <style>
    :root{
        --navy-900: #0b3550;
        --navy-800: #0f3c5a;
        --navy-700: #153f5f;
        --accent-yellow: #ffc107;
        --accent-blue: #1e90ff;
        --card-white: #ffffff;
        --muted: #adb5bd;
        --glass: rgba(255,255,255,0.06);
        --shadow-1: 0 6px 18px rgba(2,6,23,0.35);
    }

    /* page background */
    body {
        background: linear-gradient(180deg, #072433 0%, #0f3c5a 40%, #092b3b 100%);
        font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        color: #f8fbff;
    }

    /* container area below header */
    .page-inner {
        padding: 30px 40px 80px;
        max-width: 1200px;
        margin: 0 auto;
    }

    /* Hero / welcome card */
    .dashboard-hero {
        background: linear-gradient(135deg, rgba(14,71,107,0.95), rgba(17,55,84,0.95));
        border-radius: 14px;
        padding: 34px;
        display: flex;
        gap: 24px;
        align-items: center;
        box-shadow: var(--shadow-1);
        margin-bottom: 28px;
        position: relative;
        overflow: visible;
    }

    .hero-left {
        flex: 1 1 60%;
    }

    .hero-left h1 {
        font-size: 40px;
        margin: 0 0 6px 0;
        font-weight: 700;
        line-height: 1.02;
        color: #ffffff;
        letter-spacing: -0.5px;
    }

    .hero-left .subtext {
        color: rgba(255,255,255,0.9);
        opacity: 0.9;
        margin-top: 6px;
        font-size: 14px;
    }

    .hero-left .summary {
        margin-top: 10px;
        font-size: 15px;
        color: rgba(255,255,255,0.9);
    }

    /* avatar circle and member badge on the right */
    .hero-right {
        width: 150px;
        text-align: center;
        margin-left: 8px;
    }

    .avatar-circle {
        width: 92px;
        height: 92px;
        border-radius: 50%;
        background: var(--accent-yellow);
        display: inline-block;
        box-shadow: 0 6px 20px rgba(4,20,40,0.4);
        margin-bottom: 8px;
    }

    .member-badge {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 12px;
        background: rgba(255,255,255,0.95);
        color: #0b3550;
        font-weight: 700;
        font-size: 12px;
    }

    .member-since {
        display:block;
        margin-top: 8px;
        font-size: 12px;
        color: rgba(255,255,255,0.85);
    }

    /* Big rounded stats area container */
    .stats-row {
        margin-top: 18px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
    }

    .stat-card {
        background: var(--card-white);
        color: #072433;
        border-radius: 10px;
        padding: 22px;
        box-shadow: 0 10px 30px rgba(2,6,23,0.12);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 120px;
        transition: transform .18s ease, box-shadow .18s ease;
    }

    .stat-card:hover{
        transform: translateY(-6px);
        box-shadow: 0 18px 40px rgba(2,6,23,0.18);
    }

    .stat-icon {
        font-size: 36px;
        opacity: 0.95;
        margin-bottom: 10px;
    }

    .stat-value {
        font-size: 28px;
        font-weight: 800;
        margin: 0;
    }

    .stat-label {
        margin: 5px 0 0;
        font-size: 14px;
        color: var(--muted);
        font-weight: 600;
    }

    /* small responsive tweaks */
    @media (max-width: 991px) {
        .dashboard-hero { flex-direction: column; align-items: flex-start; padding: 22px; }
        .hero-right { margin-left: 0; margin-top: 10px; width: 100%; display:flex; justify-content:flex-end; }
        .stats-row { grid-template-columns: repeat(2, 1fr); }
        .page-inner { padding: 20px; }
        .hero-left h1 { font-size: 28px; }
    }

    @media (max-width: 575px) {
        .stats-row { grid-template-columns: 1fr; }
        .hero-right { justify-content: flex-start; }
    }

    /* status badge overrides to work on white stat table rows */
    .status-badge {
        padding: 6px 12px;
        border-radius: 14px;
        font-weight: 700;
        font-size: 12px;
    }

    .status-NEW { background: #eaf6ff; color: #0b3550; border: 1px solid rgba(30,144,255,0.18); }
    .status-IN_PROGRESS { background: #fff4e6; color: #9a5b00; border: 1px solid rgba(243,156,18,0.15); }
    .status-RESOLVED { background: #ecf9ee; color: #1b6b33; border: 1px solid rgba(39,174,96,0.12); }
    .status-CLOSED { background: #fdecea; color: #7a1f1f; border: 1px solid rgba(231,76,60,0.12); }
    .status-PENDING { background: #f0f2f5; color: #36454f; border: 1px solid rgba(108,117,125,0.06); }

    /* small card header styling */
    .card .card-header {
        background: transparent;
        border-bottom: none;
        padding: 18px 22px;
        display: flex;
        align-items:center;
        justify-content:space-between;
    }

    .card .card-body { padding: 18px 22px 26px; color: #17262c; background: #fff; }

    /* ensure DataTable buttons/icons are visible */
    .table thead th { background: #0c3d57; color: #fff; border: none; font-weight: 600; }
    .table-hover tbody tr { background: #fff; color: #17262c; }

    .thumb { max-width: 120px; max-height: 90px; object-fit: cover; border-radius:6px; }
    .files-json { white-space: pre-wrap; word-break: break-word; max-width: 100%; }
</style>

</head>
<body>

<%@ include file="/WEB-INF/views/Header.jsp" %>

    <!-- Main Content -->
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4"><i class="fas fa-history me-2"></i>Complaint History</h2>
                
              <!-- HERO + STATS -->
<div class="page-inner">
    <!-- Hero -->
    <div class="dashboard-hero">
        <div class="hero-left">
            <!-- replace with your logged-in email / name -->
            <h1>Welcome back, <span style="opacity:.98;">${sessionScope.userEmail}</span></h1>

            <div class="subtext">Here's an overview of your civic complaints and activities.</div>
            <div class="summary">You have <strong style="color: var(--accent-yellow);">${pendingComplaints}</strong> pending complaints that need your attention.</div>
        </div>

        <div class="hero-right">
            <div style="text-align:center;">
                <div class="avatar-circle" aria-hidden="true"></div>
                <div class="member-badge">Citizen</div>
                <div class="member-since">Member since ${memberSince}</div>
            </div>
        </div>
    </div>

    <!-- Stats cards -->
    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-icon text-primary"><i class="fas fa-list"></i></div>
            <div class="stat-value">${totalComplaints}</div>
            <div class="stat-label">Total Complaints</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon" style="color:#e74c3c;"><i class="fas fa-clock"></i></div>
            <div class="stat-value">${newComplaints}</div>
            <div class="stat-label">New</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon" style="color:#17a2b8;"><i class="fas fa-sync-alt"></i></div>
            <div class="stat-value">${inProgressComplaints}</div>
            <div class="stat-label">In Progress</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon" style="color:#28a745;"><i class="fas fa-check-circle"></i></div>
            <div class="stat-value">${resolvedComplaints}</div>
            <div class="stat-label">Resolved</div>
        </div>
    </div>
</div>
<!-- end HERO + STATS -->

                
                <!-- Complaints Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>My Complaints</h5>
                        <div>
                            <span class="badge bg-primary">Total: ${totalComplaints}</span>
                            <a href="complaint_page" class="btn btn-success btn-sm ms-2">
                                <i class="fas fa-plus-circle me-1"></i> New Complaint
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="complaintsTable">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Complaint ID</th>
                                        <th>Date</th>
                                        <th>Subject</th>
                                        <th>Category</th>
                                        <th>Location</th>
                                        <th>Status</th>
                                        <th>Attachments</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="complaint" items="${complaints}">
                                        <tr>
                                            <td class="fw-bold">${complaint.complaintId}</td>
                                           <td>${complaint.createdAt != null ? complaint.createdAt.toString().replace('T',' ') : ''}</td>
                                           


                                            <td>${complaint.subject}</td>
                                            <td>
                                                <span class="badge bg-info">${complaint.category}</span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty complaint.ward}">
                                                        Ward ${complaint.ward}, ${complaint.area}
                                                    </c:when>
                                                    <c:when test="${not empty complaint.locationText}">
                                                        ${complaint.locationText}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${complaint.city}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <span class="status-badge status-${complaint.status}">
                                                    ${complaint.status}
                                                </span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                
                                                    <c:when test="${not empty complaint.filesJson}">
                                                        <span class="small text-muted">Files</span>
                                                        <pre class="files-json d-none">${complaint.filesJson}</pre>
                                                    </c:when>
                                                    
                                                   
                                                    
                                                    <c:otherwise>
                                                        <c:if test="${not empty complaint.imageBase64}">
                                                            <img src="data:image/*;base64,${complaint.imageBase64}" class="thumb" alt="img"/>
                                                        </c:if>
                                                        <c:if test="${not empty complaint.imagePath}">
                                                            <img src="${pageContext.request.contextPath}/${complaint.imagePath}" class="thumb" alt="img"/>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary action-btn view-details-btn" 
                                                        data-id="${complaint.id}">
                                                    <i class="fas fa-eye me-1"></i> View
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
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
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
        </div>
    </div>

    <!-- Complaint Details Modal -->
    <div class="modal fade" id="complaintDetailsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content complaint-details-modal">
                <div class="modal-header">
                    <h5 class="modal-title">Complaint Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
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

  

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        // Initialize DataTable
        $(document).ready(function() {
            // Initialize DataTable with search and pagination
            $('#complaintsTable').DataTable({
                "pageLength": 10,
                "lengthMenu": [10, 25, 50, 100],
                "order": [[1, 'desc']], // Sort by date descending
                "language": {
                    "search": "Search complaints:",
                    "lengthMenu": "Show _MENU_ entries",
                    "info": "Showing _START_ to _END_ of _TOTAL_ complaints",
                    "paginate": {
                        "previous": "<i class='fas fa-chevron-left'></i>",
                        "next": "<i class='fas fa-chevron-right'></i>"
                    }
                }
            });
            
            // View details button click (delegated to support DataTables redraw)
            $('#complaintsTable tbody').on('click', '.view-details-btn', function() {
                const complaintId = $(this).data('id');
                loadComplaintDetails(complaintId);
            });
            
       

            // Print details button
            $('#printDetailsBtn').click(function() {
                window.print();
            });
        });
        
        function loadComplaintDetails(complaintId) {
            // In a real application, this would be an AJAX call to fetch complaint details from server
            // We'll attempt to find the row in the DOM and extract available data to show in the modal.

            // find the table row with matching data-id
            const row = $('#complaintsTable tbody button[data-id="' + complaintId + '"]').closest('tr');
            if (!row || row.length === 0) {
                // fallback: show a message
                $('#complaintDetailsContent').html('<p class="text-muted">Complaint details not found on this page. Please reload or open from the complaint view.</p>');
                $('#complaintDetailsModal').modal('show');
                return;
            }

            // Extract basic fields from the row or from server-side attributes attached to the button (data-*) if you prefer
            const complaintIdText = row.find('td:eq(0)').text().trim();
            const dateText = row.find('td:eq(1)').text().trim();
            const subject = row.find('td:eq(2)').text().trim();
            const category = row.find('td:eq(3)').text().trim();
            const location = row.find('td:eq(4)').text().trim();
            const status = row.find('td:eq(5) .status-badge').text().trim();

            // Try to collect more details by making a server call. If you have an endpoint like /api/complaints/{id}, call it.
            // For this implementation we'll call a hypothetical endpoint and gracefully fallback to row-based values.

            $.ajax({
            	url: '/getComplaintDetails?id=' + complaintId,


                method: 'GET',
                dataType: 'json'
            }).done(function(data) {
                renderComplaintModal(data);
            }).fail(function() {
                // fallback to extracting whatever we can from the table row
                const fallback = {
                    complaintId: complaintIdText,
                    createdAt: dateText,
                    subject: subject,
                    category: category,
                    locationText: location,
                    status: status
                };
                renderComplaintModal(fallback);
            });
        }

        function renderComplaintModal(c) {
            // c is a JS object containing complaint fields (from AJAX) or fallback values
            // normalize property names (support snake_case or camelCase)
            function get(v1, v2) { return c[v1] !== undefined ? c[v1] : (c[v2] !== undefined ? c[v2] : ''); }

            const fullName = get('fullName', 'full_name');
            const email = get('email', 'email');
            const phone = get('phone', 'phone');
            const address = get('address', 'address');
            const subject = get('subject', 'subject');
            const description = get('description', 'description');
            const complaintId = get('complaintId', 'complaint_id');
            const createdAt = get('createdAt', 'created_at');
            const updatedAt = get('updatedAt', 'updated_at');
            const status = get('status', 'status');
            const category = get('category', 'category');
            const city = get('city', 'city');
            const pincode = get('pincode', 'pincode');
            const ward = get('ward', 'ward');
            const area = get('area', 'area');
            const village = get('village', 'village');
            const taluka = get('taluka', 'taluka');
            const locationText = get('locationText', 'location_text');
            const locationAddress = get('locationAddress', 'location_address');
            const latitude = get('latitude', 'latitude');
            const longitude = get('longitude', 'longitude');
            const imageBase64 = get('imageBase64', 'image_base64');
            const imagePath = get('imagePath', 'image_path');
            const filesJson = get('filesJson', 'files_json');

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
                        <p class="detail-value">${phone}</p>

                        <h6 class="detail-label">Category:</h6>
                        <p class="detail-value"><span class="badge bg-info">${category}</span></p>

                        <h6 class="detail-label">Subject:</h6>
                        <p class="detail-value">${subject}</p>

                        <h6 class="detail-label">Description:</h6>
                        <p class="detail-value">${description}</p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="detail-label">Status:</h6>
                        <p class="detail-value"><span class="status-badge status-${status}">${status}</span></p>

                        <h6 class="detail-label">Submission Date:</h6>
                        <p class="detail-value">${createdAt}</p>

                        <h6 class="detail-label">Last Updated:</h6>
                        <p class="detail-value">${updatedAt}</p>

                        <h6 class="detail-label">Location Details:</h6>
                        <div class="location-details">
                            <p><strong>Address:</strong> ${locationAddress || address || ''}</p>
                            <p><strong>Location Text:</strong> ${locationText}</p>
                            <p><strong>Ward:</strong> ${ward}</p>
                            <p><strong>Area:</strong> ${area}</p>
                            <p><strong>Village:</strong> ${village}</p>
                            <p><strong>Taluka:</strong> ${taluka}</p>
                            <p><strong>City:</strong> ${city}</p>
                            <p><strong>Pincode:</strong> ${pincode}</p>
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
                            <!-- In a real app, this would be a Google Maps or similar embed -->
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
        
    </script>
    
    <%@ include file="/WEB-INF/views/Footer.jsp" %>
    
</body>
</html>
