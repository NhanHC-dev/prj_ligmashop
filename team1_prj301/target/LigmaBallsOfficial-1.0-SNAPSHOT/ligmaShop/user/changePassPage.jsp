<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>LigmaShop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
        <!--        <style>
                            .container-pass {
                            width: 350px;
                            padding: 30px;
                            background: white;
                            border-radius: 8px;
                            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                            border: 2px solid #007BFF;
                            }
                            .message {
                                color: red;
                                margin-top: 10px;
                            }
                        </style>-->
    </head>
    <body>
        <div class="app">
            <header class="header">
                <div class="grid wide">
                    <nav class="header__navbar hide-on-mobile-tablet">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate">
                                Tải ứng dụng
                                <!--Header QR Code-->
                                <div class="header__qr">
                                    <img src="${pageContext.request.contextPath}/resource/images/qr.png" alt="QR code" class="header__qr-img">
                                    <div class="header__qr-apps">
                                        <a href="" class="header__qr-link">
                                            <img src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png" alt="Google Play" class="header__qr-download-img">
                                        </a>
                                        <a href="" class="header__qr-link">
                                            <img src="${pageContext.request.contextPath}/resource/images/135555214a82d8e1.png" alt="AppStore" class="header__qr-download-img">
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="header__navbar-item">
                                Kết nối
                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa-brands fa-facebook"></i>
                                </a>

                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-hasnotify">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-regular fa-bell icon-notice-help"></i>
                                    Thông báo
                                </a>

                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-duotone fa-solid fa-question icon-notice-help"></i>
                                    Trợ giúp
                                </a>
                            </li>


                            <c:choose>

                                <c:when test="${empty sessionScope.user}">
                                    <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/login/register.jsp">Đăng kí</a>
                                    </li>
                                    <li class="header__navbar-item header__navbar-item--strong">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/login/signIn.jsp">Đăng nhập</a>
                                    </li>
                                </c:when>

                                <c:otherwise>
                                    <li class="header__navbar-item header__navbar-user">
                                        <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="" class="header__navbar-user-img">
                                        <span class="header__navbar-user-name">${sessionScope.user.getName()}</span>

                                        <ul class="header__navbar-user-menu">

                                            <li class="header__navbar-user-item">
                                                <a href="${pageContext.request.contextPath}/ligmaShop/user/profilePage.jsp">Hồ sơ của tôi</a>
                                            </li>
                                            <li class="header__navbar-user-item">
                                                <a href="${pageContext.request.contextPath}/authservlet">Đăng Xuất</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>



                        </ul>
                    </nav>
                    <!--LoGo Search Cart-->
                    <div class="header-with-search">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo">
                            <a href="${pageContext.request.contextPath}/test" ><img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img"></a>
                        </div>

                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">

                        <div class="header__search">
                            <div class="header__search-input-wrap">

                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm" id="searchQuery">


                            </div>
                            <div class="header__search-select">
                                <span class="header__search-select-label">Trong Shop</span>
                                <i class="header__search-select-icon fa-solid fa-chevron-down"></i>

                                <ul class="header__search-option">
                                    <li class="header__search-option-item header__search-option-item--active">
                                        <span>Trong Shop</span> 
                                        <i class="fa-solid fa-check"></i>
                                    </li>
                                    <li class="header__search-option-item">
                                        <span>Ngoài Shop</span> 
                                        <i class="fa-solid fa-check"></i>
                                    </li>
                                </ul>


                            </div>
                            <form action="search" method="POST" id="submitSearch">
                                <input hidden name="query" id="hiddenQuery"/>
                                <button type="submit" class="header__search-btn" onClick="submitSearch()">
                                    <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                            <script>
                                function submitSearch() {
                                    document.getElementById('hiddenQuery').value = document.getElementById('searchQuery').value;
                                }
                            </script>

                        </div>
                        <!--Shopping Cart-->
                        <div class="header__cart">
                            <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp">
                                <div class="header__cart-wrap">
                                    <i class="header__cart-icon fa-solid fa-cart-plus"></i>
                                    <span class="header__cart-notice">${sessionScope.cartItems != null ? sessionScope.cartItems.size() : 0}</span>
                                    <div class="header__cart-list">
                                        <c:choose>
                                            <c:when test="${empty sessionScope.cartItems}">
                                                <img src="${pageContext.request.contextPath}/resource/images/no-cart.jpg" alt="" class="header__cart-no-cart-img">
                                            </c:when>
                                            <c:otherwise>
                                                <h4 class="header__cart-heading">Sản Phẩm Đã Thêm</h4>
                                                <ul class="header__cart-list-item">
                                                    <c:forEach var="item" items="${sessionScope.cartItems}">
                                                        <li class="header__cart-item">
                                                            <c:choose>
                                                                <c:when test="${not empty item.productSizeColorID.productID.productimagesCollection}">
                                                                    <img src="${item.productSizeColorID.productID.productimagesCollection[0].imageURL}" alt="" class="header__cart-img">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="${pageContext.request.contextPath}/resource/images/default-product.jpg" alt="" class="header__cart-img">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <div class="header__cart-item-info">
                                                                <div class="header__cart-item-head">
                                                                    <h5 class="header__cart-item-name">${item.productSizeColorID.productID.productName}</h5>
                                                                    <div class="header__cart-item-price-wrap">
                                                                        <c:set var="product" value="${item.productSizeColorID.productID}" />
                                                                        <c:set var="basePrice" value="${product.price - (product.price * product.discount / 100)}" />
                                                                        <c:set var="sizeName" value="${item.productSizeColorID.sizeID.sizeName}" />
                                                                        <c:set var="priceAdjustment" value="0" />
                                                                        <c:if test="${sizeName == 'XL'}">
                                                                            <c:set var="priceAdjustment" value="50000" />
                                                                        </c:if>
                                                                        <c:if test="${sizeName == 'XXL'}">
                                                                            <c:set var="priceAdjustment" value="100000" />
                                                                        </c:if>
                                                                        <c:set var="adjustedPrice" value="${basePrice + priceAdjustment}" />
                                                                        <span class="header__cart-item-price">
                                                                            <fmt:formatNumber value="${adjustedPrice}" type="number" groupingUsed="true" /> đ
                                                                        </span>
                                                                        <span class="header__cart-item-multiply">x</span>
                                                                        <span class="header__cart-item-qnt">${item.quantity}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="header__cart-item-body">
                                                                    <span class="header__cart-item-description">
                                                                        Kích thước: ${item.productSizeColorID.sizeID.sizeName}
                                                                    </span>
                                                                    <form action="${pageContext.request.contextPath}/cart" method="post" class="header__cart-remove-form">
                                                                        <input type="hidden" name="action" value="remove">
                                                                        <input type="hidden" name="cartItemID" value="${item.cartItemID}">
                                                                        <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                                                                        <button type="submit" class="header__cart-item-remove">Xóa</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>

                                                <botton href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</botton>
                                                </c:otherwise>
                                            </c:choose>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>

                </div>
                <ul class="header__sort-bar">
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Liên quan</a>
                    </li>    
                    <li class="header__sort-item header__sort-item--active">
                        <a href="" class="header__sort-link">Mới Nhất</a>
                    </li>    
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Bán chạy</a>
                    </li>    
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Giá</a>
                    </li>    
                </ul>
            </header>
            <div class="app__container">
                <div class="grid wide">
                    <div class="row sm-gutter app__content">
                        <div class="col l-2 m-0 c-0">
                            <nav class="category">
                                <h3 class="category__heading">
                                    <i class="category__heading-icon fa-solid fa-list"></i>
                                    Tài Khoản Của Tôi
                                </h3>
                                <ul class="category-list">
                                    <li class="category-item category-item--active">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/user/profilePage.jsp" class="category-item__link">Hồ Sơ Cá Nhân</a>
                                    </li>
                                    <!--                                    <li class="category-item">
                                                                            <a href="" class="category-item__link">Sản Phẩm Đã Mua</a>
                                                                        </li>-->
                                    <li class="category-item">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/user/changePassPage.jsp" class="category-item__link">Đổi Mật Khẩu</a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                // Lấy đường dẫn hiện tại, chỉ lấy phần pathname để tránh lỗi so khớp URL đầy đủ
                                let currentPath = window.location.pathname;

                                // Lấy tất cả các thẻ <a> trong menu
                                let links = document.querySelectorAll(".category-item__link");

                                links.forEach(link => {
                                    // Lấy đường dẫn của link (chỉ phần pathname)
                                    let linkPath = new URL(link.href, window.location.origin).pathname;

                                    // Kiểm tra nếu đường dẫn trang hiện tại khớp với đường dẫn của link
                                    if (currentPath === linkPath) {
                                        // Xóa class active của tất cả
                                        document.querySelectorAll(".category-item").forEach(item => {
                                            item.classList.remove("category-item--active");
                                        });

                                        // Thêm class active vào <li> chứa link hiện tại
                                        link.parentElement.classList.add("category-item--active");
                                    }
                                });
                            });


                        </script>


                        <div class="container-password">
                            <div class="pass-container">
                                <!-- Phần nội dung form -->
                                <div class="pass-content">
                                    <h2>Đổi Mật Khẩu</h2>
                                    <form action="changePassword" method="post">

                                        <div class="pass-group">
                                            <label class="text-form-pass" for="oldPassword">Mật khẩu cũ</label>
                                            <input type="password" id="oldPassword" name="oldPassword" placeholder="Nhập mật khẩu cũ" required>
                                        </div>

                                        <div class="pass-group">
                                            <label class="text-form-pass" for="newPassword">Mật khẩu mới</label>
                                            <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required>
                                        </div>

                                        <div class="pass-group">
                                            <label class="text-form-pass" for="confirmPassword">Xác nhận mật khẩu</label>
                                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu mới" required>
                                        </div>

                                        <div class="pass-group">
                                            <button type="submit">Đổi mật khẩu</button>
                                        </div>
                                    </form>

                                    <% if (request.getAttribute("message") != null) { %>
                                    <p class="success"><%= request.getAttribute("message") %></p>
                                    <% } %>
                                    <% if (request.getAttribute("error") != null) { %>
                                    <p class="error"><%= request.getAttribute("error") %></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Đinh Huy Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Lê Xuân Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Đức Huy Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Lê Thành Đạt</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Đình Duy</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Minh Hiếu</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-facebook"></i>
                                        Facebook
                                    </a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-instagram"></i>
                                        Instagram
                                    </a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-tiktok"></i>
                                        Tiktok
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Vào cửa hàng</h3>
                            <div class="footer__download">
                                <img src="${pageContext.request.contextPath}/resource/images/qr.png" alt="" class="footer__download-qr">                            
                                <div class="footer__download-apps">
                                    <a href="" class="footer__download-apps-link">
                                        <img src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png" alt="Goggle play" class="footer__download-apps-img">
                                    </a>
                                    <a href="" class="footer__download-apps-link">
                                        <img src="${pageContext.request.contextPath}/resource/images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__bottom">
                    <div class="grid wide">
                        <p class="footer__text">2025 - Bản quyền thuộc về Công ti Những vì Tinh Tú LigmaShop</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
