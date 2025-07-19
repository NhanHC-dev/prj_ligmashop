<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String paymentUrl = (String) request.getAttribute("paymentUrl");
    if (paymentUrl != null) {
        response.sendRedirect(paymentUrl);
    } else {
        out.println("Lỗi: Không tạo được URL thanh toán.");
    }
%>