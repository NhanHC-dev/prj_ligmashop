<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
        <style>
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            a {
                text-decoration: none;
                color: #007bff;
            }
            a:hover {
                text-decoration: underline;
            }
            .empty-message {
                text-align: center;
                color: #666;
            }
        </style>
    </head>
    <body>
        <h2 style="text-align: center;">Product List</h2>

        <!-- Display Products -->
        <c:choose>
            <c:when test="${not empty list}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Created Date</th>
                            <th>Company</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${list}">
                            <tr>
                                <td>${product.productID}</td>
                                <td>${product.productName}</td>
                                <td>${product.description != null ? product.description : 'N/A'}</td>
                                <td>
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$" />
                                </td>
                                <td>
                                    <fmt:formatDate value="${product.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty product.companyID}">
                                            ${product.companyID.companyID} <!-- Adjust based on your Company class -->
                                        </c:when>
                                        <c:otherwise>N/A</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="addToCart?productId=${product.productID}">Add to Cart</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="empty-message">No products available at this time.</p>
            </c:otherwise>
        </c:choose>

        <!-- Display Cart Summary -->
        <h3 style="text-align: center;">Your Cart</h3>
        <c:set var="cart" value="${sessionScope.cart}" />
        <c:choose>
            <c:when test="${not empty cart and not empty cart.items1}">
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cart.items1}">
                            <tr>
                                <td>${item.product.productName}</td>
                                <td>${item.quantity}</td>
                                <td>
                                    <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="empty-message">Your cart is empty.</p>
            </c:otherwise>
        </c:choose>

        <!-- Navigation Links -->
        <div style="text-align: center; margin-top: 20px;">
            <c:if test="${empty sessionScope.userId}">
                <a href="login.jsp">Login</a> | 
            </c:if>
            <c:if test="${not empty sessionScope.userId}">
                <a href="logout">Logout</a> | 
            </c:if>
            <a href="cart/cart.jsp">View Full Cart</a> | 
            <a href="checkout">Checkout</a>
        </div>
    </body>
</html>