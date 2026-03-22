<!-- Footer.jsp (fragment) - no page directive here -->
<footer class="bg-dark text-light py-4 border-top mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 text-center text-md-start mb-3 mb-md-0">
                <img src="${pageContext.request.contextPath}/assets/image/Helpdesk_Logo-removebg-preview.png"
                     alt="HelpDesk Logo" width="60" class="mb-2">
                <h5 class="mb-1">Civic Citizen HelpDesk</h5>
                <p class="small mb-0">An Initiative by Government of Maharashtra</p>
            </div>
            <div class="col-md-4 text-center mb-3 mb-md-0">
                <h6>Quick Links</h6>
                <div class="d-flex flex-column">
                    <a href="${pageContext.request.contextPath}/dashboard" class="text-light text-decoration-none small py-1">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/complaint_page" class="text-light text-decoration-none small py-1">File Complaint</a>
                    <a href="${pageContext.request.contextPath}/complaint_status" class="text-light text-decoration-none small py-1">Track Complaint</a>
                    <a href="${pageContext.request.contextPath}/contact" class="text-light text-decoration-none small py-1">Contact Us</a>
                </div>
            </div>
            <div class="col-md-4 text-center text-md-end">
                <h6>Contact Information</h6>
                <p class="small mb-1"><i class="fas fa-phone-alt me-2"></i> Helpline: 1800-123-4567</p>
                <p class="small mb-1"><i class="fas fa-envelope me-2"></i> Email: helpdesk@maharashtra.gov.in</p>
                <p class="small mb-0"><i class="fas fa-clock me-2"></i> Mon-Sat: 9:00 AM - 6:00 PM</p>
            </div>
        </div>
        <hr class="bg-light my-3">
        <div class="row">
            <div class="col-12 text-center">
                <p class="small mb-0">
                    © 2025 Civic Citizen HelpDesk. All Rights Reserved. |
                    <a href="${pageContext.request.contextPath}/privacy" class="text-decoration-none text-light">Privacy Policy</a> |
                    <a href="${pageContext.request.contextPath}/terms" class="text-decoration-none text-light">Terms of Use</a> |
                    <a href="${pageContext.request.contextPath}/accessibility" class="text-decoration-none text-light">Accessibility Statement</a>
                </p>
            </div>
        </div>
    </div>
</footer>
