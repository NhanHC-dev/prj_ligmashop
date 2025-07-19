<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi - Ligma Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css">
    <style>
        /* CSS cho trang lỗi */
        .error-container {
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ff4d4d;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .error-container h2 {
            color: #ff4d4d;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .error-container p {
            font-size: 16px;
            color: #333;
            margin-bottom: 20px;
        }

        .error-container .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .error-container .btn:hover {
            background-color: #0056b3;
        }

        .error-container img {
            max-width: 200px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <img src="${pageContext.request.contextPath}/resource/images/error-icon.png" alt="Error Icon">
        <h2>Có Lỗi Xảy Ra!</h2>
        
        <!-- Hiển thị thông báo lỗi từ session hoặc request -->
        <c:if test="${not empty sessionScope.error}">
            <p>${sessionScope.error}</p>
            <c:remove var="error" scope="session"/> <!-- Xóa lỗi sau khi hiển thị -->
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <p>${requestScope.error}</p>
        </c:if>
        <c:if test="${empty sessionScope.error && empty requestScope.error}">
            <p>Đã có lỗi xảy ra. Vui lòng thử lại sau.</p>
        </c:if>

        <!-- Nút quay lại -->
        <a href="${pageContext.request.contextPath}/products" class="btn">Quay Lại Trang Sản Phẩm</a>
        <a href="javascript:history.back()" class="btn" style="background-color: #6c757d; margin-left: 10px;">Quay Lại Trang Trước</a>
    </div>
</body>
</html>