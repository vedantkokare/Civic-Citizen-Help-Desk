<!-- Header.jsp (fragment) - no page directive here -->
<!-- Only header/navigation markup. CSS/JS should be declared in the parent page head. -->

<!-- Top Header -->
<nav class="navbar border-bottom top-header py-2">
    <div class="container">
        <div class="Logo d-flex justify-content-center align-items-center">
            <img src="${pageContext.request.contextPath}/assets/image/Seal_of_Maharashtra-removebg-preview.png"
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

<!-- Main Header -->
<nav class="navbar bg-white border-bottom p-2 shadow-sm">
    <div class="container">
        <div class="Logo d-flex justify-content-between">
            <img src="${pageContext.request.contextPath}/assets/image/Helpdesk_Logo-removebg-preview.png"
                 alt="HelpDesk Logo" width="80" height="80" class="d-inline-block align-text-top">
            <div class="d-inline-block d-flex flex-column justify-content-center">
                <p class="align-text-center ms-2 logo-text text-primary">Civic Citizen</p>
                <p class="align-text-center ms-2 logo-text text-primary">HelpDesk</p>
            </div>
        </div>
        <div class="d-flex align-items-center">
            <div class="dropdown me-3 position-relative">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="userDropdown"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user me-1"></i> ${username}
                </button>
                <ul class="dropdown-menu" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="fas fa-user-circle me-2"></i> My Profile</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notifications"><i class="fas fa-bell me-2"></i> Notifications</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/settings"><i class="fas fa-cog me-2"></i> Settings</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                </ul>
            </div>
            <img src="${pageContext.request.contextPath}/assets/image/Ashok_Stamb-removebg-preview.png"
                 alt="Ashok Stamb" width="55" height="55"
                 class="d-inline-block align-text-top ms-2 border-start ps-3 d-none d-md-block">
        </div>
    </div>
</nav>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg main-navbar py-2">
    <div class="container nav-container">
        <button class="navbar-toggler text-white border-0" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-custom active" href="${pageContext.request.contextPath}/dashboard">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/complaint_page">
                        <i class="fas fa-edit"></i> New Complaint
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/complaint_history">
                        <i class="fas fa-search"></i> Track Complaint
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/complaint_history">
                        <i class="fas fa-history"></i> Complaint History
                    </a>
                </li>
                
                  <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/mail">
                        <i class="fas fa-envelope-open-text"></i> Mail
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/services">
                        <i class="fas fa-concierge-bell"></i> All Services
                    </a>
                </li>
                

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/emergency">
                        <i class="fas fa-ambulance"></i> Emergency
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="${pageContext.request.contextPath}/faq">
                        <i class="fas fa-question-circle"></i> FAQ & Help
                    </a>
                </li>
                
                
                
            </ul>
        </div>
    </div>
</nav>
