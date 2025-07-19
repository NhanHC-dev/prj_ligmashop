<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <header class="header">
        <div class="grid wide">
            <nav class="header__navbar hide-on-mobile-tablet">
                <ul class="header__navbar-list">
                    <li class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate">
                        Tải ứng dụng
                        <div class="header__qr">
                            <div class="header__qr-apps">
                                <a href="" class="header__qr-link">
                                    <img src="https://pageofme.github.io/team1_prj301/images/googleplay.png" alt="Google Play" class="header__qr-download-img">
                                </a>
                                <a href="" class="header__qr-link">
                                    <img src="https://pageofme.github.io/team1_prj301/images/appstore.png" alt="AppStore" class="header__qr-download-img">
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="header__navbar-item">
                        Kết nối
                        <a href="https://www.facebook.com/groups/836319625350559" class="header__navbar-icon-link">
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                        <a href="https://www.instagram.com/ligmashop?igsh=anV5YnBwNXJrbW8x&utm_source=qr" class="header__navbar-icon-link">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                        <a href="https://www.tiktok.com/@ligmashop?_t=ZS-8ujjzch4geg&_r=1" class="header__navbar-icon-link">
                            <i class="fa-brands fa-tiktok"></i>
                        </a>
                    </li>
                </ul>
                <ul class="header__navbar-list">
                    <li class="header__navbar-item header__navbar-item-hasnotify">
                        <a href="" class="header__navbar-item-link header__navbar-icon-link">
                            <i class="fa-regular fa-bell icon-notice-help"></i> Thông báo
                        </a>
                        <!-- Notification content omitted for brevity -->
                    </li>
                    <li class="header__navbar-item">
                        <a href="" class="header__navbar-item-link header__navbar-icon-link">
                            <i class="fa-duotone fa-solid fa-question icon-notice-help"></i> Trợ giúp
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
                                <c:set var="user" value="${user}"/>
                                <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name">${user.getName()}</span>
                                <ul class="header__navbar-user-menu">
                                    <li class="header__navbar-user-item">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/user/profilePage.jsp">Hồ sơ của tôi</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="${pageContext.request.contextPath}/authservlet">Đăng Xuất</a>
                                    </li>
                                    <c:if test="${sessionScope.user.role == 'admin'}">
                                        <li class="header__navbar-user-item">
                                            <a href="${pageContext.request.contextPath}/ordersDayData">Truy cập admin</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
            <!--Thanh tìm kiếm-->
            <div class="header-with-search">
                <label for="mobile-search-checkbox" class="header__mobile-search">
                    <i class="header__mobile-search-icon fas fa-search"></i>
                </label>
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/test">
                        <img src="https://pageofme.github.io/team1_prj301/images/logo.png" alt=""
                             class="header__logo-img">
                    </a>
                </div>
                <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                <div class="header__search">
                    <div class="header__search-input-wrap">
                        <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm"
                               id="searchQuery" onkeydown="if (event.key === 'Enter')
                            sendMessage()">
                    </div>
                    <form action="<%=request.getContextPath()%>/category?cID=1&page=1&weather=all" method="GET" id="submitSearch">
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

                <!-- Cart -->
                <div class="header__cart">
                    <a href="${pageContext.request.contextPath}/cart">
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
                                        <!--<a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</a>-->
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </header>
</html>