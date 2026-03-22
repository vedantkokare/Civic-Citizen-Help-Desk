<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Compose Email</title>
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

        /* SEND EMAIL BUTTON STYLE (Correct placement) */
        .send-email-btn {
            background-color: #035397; /* Dark blue theme */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease-in-out;
            margin-top: 15px;
        }

        .send-email-btn:hover {
            background-color: #022c43; /* Dark hover */
            transform: translateY(-2px);
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

    <!-- Keep your CSS/Bootstrap includes -->
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
    <h2>Compose Email</h2>

    <form action="sendEmail" method="post">

    <label>To:</label>
    <input type="email" name="to" value="${toEmail}" required>

    <label>Subject:</label>
    <input type="text" name="subject" value="${subject}" required>

    <label>Message:</label>
    <textarea name="message" rows="7">${message}</textarea>

    <input type="hidden" name="base64Image" value="${imageBase64}">

    <button type="submit" class="send-email-btn">Send Email</button>
</form>

</div>

<%@ include file="/WEB-INF/views/Footer.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
