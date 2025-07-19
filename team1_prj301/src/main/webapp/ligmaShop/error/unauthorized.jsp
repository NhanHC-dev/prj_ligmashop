<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unauthorized Access</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
    <style>
        .error-container {
            text-align: center;
            margin-top: 50px;
        }
        .error-message {
            font-size: 24px;
            color: #ff0000;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-message">Unauthorized Access</h1>
        <p>You do not have permission to access this page.</p>
        <a href="${pageContext.request.contextPath}/test" class="back-link">Return to Home</a>
    </div>
</body>
</html>