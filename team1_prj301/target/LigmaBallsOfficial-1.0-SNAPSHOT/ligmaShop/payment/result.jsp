<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả thanh toán - LigmaShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
    <style>
        .result-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .result-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .success {
            color: #28a745;
            font-weight: bold;
            font-size: 18px;
        }

        .error {
            color: #dc3545;
            font-weight: bold;
            font-size: 18px;
        }

        .warning {
            color: #ffc107;
            font-weight: bold;
            font-size: 18px;
        }

        .order-details {
            margin-top: 20px;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: left;
        }

        .order-details p {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }

        .order-details strong {
            color: #333;
            font-weight: 600;
        }

        .back-home {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .back-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="result-container">
        <h2 class="result-title">Kết quả thanh toán</h2>
        <c:choose>
            <c:when test="${message.contains('thành công')}">
                <p class="success">${message}</p>
                <div class="order-details">
                    <p><strong>Họ tên:</strong> ${fullName}</p>
                    <p><strong>Gmail:</strong> ${email}</p>
                    <p><strong>Số điện thoại:</strong> ${phone}</p>
                    <p><strong>Địa chỉ:</strong> ${address}</p>
                    <p><strong>Mã đơn hàng:</strong> ${transactionId}</p>
                    <p><strong>Sản phẩm:</strong> ${products}</p>
                    <p><strong>Tổng tiền:</strong> ${amount} VNĐ</p>
                </div>
            </c:when>
            <c:when test="${message.contains('thất bại')}">
                <p class="error">${message}</p>
                <div class="order-details">
                    <c:if test="${not empty transactionId}">
                        <p><strong>Mã giao dịch:</strong> ${transactionId}</p>
                    </c:if>
                    <c:if test="${not empty errorCode}">
                        <p><strong>Mã lỗi:</strong> ${errorCode}</p>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <p class="warning">${message}</p>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/test" class="back-home">🏠 Quay về trang chủ</a>
    </div>
</div>
</body>
</html>