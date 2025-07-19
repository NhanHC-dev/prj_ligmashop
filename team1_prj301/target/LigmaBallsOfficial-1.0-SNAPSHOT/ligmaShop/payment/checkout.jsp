<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LigmaShop - Checkout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/thanhToan.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

<div class="app">
    <!-- Header (Giữ nguyên) -->
    <header class="header">
        <!-- Phần header giữ nguyên như cũ -->
        <div class="grid wide">
            <nav class="header__navbar hide-on-mobile-tablet">
                <ul class="header__navbar-list">
                    <li class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate">
                        Tải ứng dụng
                        <div class="header__qr">
                            <div class="header__qr-apps">
                                <a href="" class="header__qr-link">
                                    <img src="https://pageofme.github.io/team1_prj301/images/googleplay.png"
                                         alt="Google Play" class="header__qr-download-img">
                                </a>
                                <a href="" class="header__qr-link">
                                    <img src="https://pageofme.github.io/team1_prj301/images/appstore.png"
                                         alt="AppStore" class="header__qr-download-img">
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="header__navbar-item">
                        Kết nối
                        <a href="https://www.facebook.com/groups/836319625350559" class="header__navbar-icon-link"><i
                                class="fa-brands fa-facebook"></i></a>
                        <a href="https://www.instagram.com/ligmashop?igsh=anV5YnBwNXJkbW8x&utm_source=qr"
                           class="header__navbar-icon-link"><i class="fa-brands fa-instagram"></i></a>
                        <a href="https://www.tiktok.com/@ligmashop?_t=ZS-8ujjzch4geg&_r=1"
                           class="header__navbar-icon-link"><i class="fa-brands fa-tiktok"></i></a>
                    </li>
                </ul>
                <ul class="header__navbar-list">
                    <li class="header__navbar-item header__navbar-item-hasnotify">
                        <a href="" class="header__navbar-item-link header__navbar-icon-link"><i
                                class="fa-regular fa-bell icon-notice-help"></i> Thông báo</a>
                    </li>
                    <li class="header__navbar-item">
                        <a href="" class="header__navbar-item-link header__navbar-icon-link"><i
                                class="fa-duotone fa-solid fa-question icon-notice-help"></i> Trợ giúp</a>
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
                                <c:set var="user" value="${sessionScope.user}"/>
                                <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt=""
                                     class="header__navbar-user-img">
                                <span class="header__navbar-user-name">${user.name}</span>
                                <ul class="header__navbar-user-menu">
                                    <li class="header__navbar-user-item"><a
                                            href="${pageContext.request.contextPath}/ligmaShop/login/profilePage.jsp">Hồ
                                        sơ của tôi</a></li>
                                    <li class="header__navbar-user-item"><a
                                            href="${pageContext.request.contextPath}/authservlet">Đăng Xuất</a></li>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
            <div class="header-with-search">
                <label for="mobile-search-checkbox" class="header__mobile-search"><i
                        class="header__mobile-search-icon fas fa-search"></i></label>
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/test">
                        <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png"
                             alt="" class="header__logo-img">
                    </a>
                </div>
                <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                <div class="header__search">
                    <div class="header__search-input-wrap">
                        <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm">
                    </div>
                    <div class="header__search-select">
                        <span class="header__search-select-label">Trong Shop</span>
                        <i class="header__search-select-icon fa-solid fa-chevron-down"></i>
                    </div>
                    <button class="header__search-btn"><i
                            class="header__search-btn-icon fa-solid fa-magnifying-glass"></i></button>
                </div>
                <a href="${pageContext.request.contextPath}/cart">
                    <div class="header__cart">
                        <div class="header__cart-wrap">
                            <i class="header__cart-icon fa-solid fa-cart-plus"></i>
                            <span class="header__cart-notice">${sessionScope.cartItems != null ? sessionScope.cartItems.size() : 0}</span>
                            <div class="header__cart-list">
                                <c:choose>
                                    <c:when test="${empty sessionScope.cartItems}">
                                        <img src="${pageContext.request.contextPath}/resource/images/no-cart.jpg" alt=""
                                             class="header__cart-no-cart-img">
                                    </c:when>
                                    <c:otherwise>
                                        <h4 class="header__cart-heading">Sản Phẩm Đã Thêm</h4>
                                        <ul class="header__cart-list-item">
                                            <c:forEach var="item" items="${sessionScope.cartItems}">
                                                <li class="header__cart-item">
                                                    <c:choose>
                                                        <c:when test="${not empty item.productSizeColorID.productID.productimagesCollection}">
                                                            <img src="${item.productSizeColorID.productID.productimagesCollection[0].imageURL}"
                                                                 alt="" class="header__cart-img">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/resource/images/default-product.jpg"
                                                                 alt="" class="header__cart-img">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div class="header__cart-item-info">
                                                        <div class="header__cart-item-head">
                                                            <h5 class="header__cart-item-name">${item.productSizeColorID.productID.productName}</h5>
                                                            <div class="header__cart-item-price-wrap">
                                                                <c:set var="product"
                                                                       value="${item.productSizeColorID.productID}"/>
                                                                <c:set var="basePrice"
                                                                       value="${product.price - (product.price * product.discount / 100)}"/>
                                                                <c:set var="sizeName"
                                                                       value="${item.productSizeColorID.sizeID.sizeName}"/>
                                                                <c:set var="priceAdjustment" value="0"/>
                                                                <c:if test="${sizeName == 'XL'}"><c:set
                                                                        var="priceAdjustment" value="50000"/></c:if>
                                                                <c:if test="${sizeName == 'XXL'}"><c:set
                                                                        var="priceAdjustment" value="100000"/></c:if>
                                                                <c:set var="adjustedPrice"
                                                                       value="${basePrice + priceAdjustment}"/>
                                                                <span class="header__cart-item-price"><fmt:formatNumber
                                                                        value="${adjustedPrice}" type="number"
                                                                        groupingUsed="true"/> đ</span>
                                                                <span class="header__cart-item-multiply">x</span>
                                                                <span class="header__cart-item-qnt">${item.quantity}</span>
                                                            </div>
                                                        </div>
                                                        <div class="header__cart-item-body">
                                                            <span class="header__cart-item-description">Kích thước: ${item.productSizeColorID.sizeID.sizeName}</span>
                                                            <form action="${pageContext.request.contextPath}/cart"
                                                                  method="post" class="header__cart-remove-form">
                                                                <input type="hidden" name="action" value="remove">
                                                                <input type="hidden" name="cartItemID"
                                                                       value="${item.cartItemID}">
                                                                <input type="hidden" name="csrfToken"
                                                                       value="${sessionScope.csrfToken}">
                                                                <button type="submit" class="header__cart-item-remove">
                                                                    Xóa
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <a href="${pageContext.request.contextPath}/ligmaShop/login/cart.jsp"
                                           class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </header>

    <!-- Checkout Content -->
    <div class="app__container">
        <div class="grid wide">
            <div class="row app__content">
                <div class="col l-12 m-12 c-12">
                    <h2 class="cart__heading">Thanh Toán</h2>
                    <form id="checkoutForm" action="${pageContext.request.contextPath}/checkout" method="post">
                        <!-- Order Summary -->
                        <div class="cart__items">
                            <h3>Danh Sách Sản Phẩm</h3>
                            <table class="cart__table">
                                <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Kích thước</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalPrice" value="0"/>
                                <c:set var="productsList" value=""/>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.cartItems}">
                                        <c:forEach var="item" items="${sessionScope.cartItems}">
                                            <c:set var="product" value="${item.productSizeColorID.productID}"/>
                                            <c:set var="basePrice"
                                                   value="${product.price - (product.price * product.discount / 100)}"/>
                                            <c:set var="sizeName" value="${item.productSizeColorID.sizeID.sizeName}"/>
                                            <c:set var="priceAdjustment" value="0"/>
                                            <c:if test="${sizeName == 'XL'}"><c:set var="priceAdjustment"
                                                                                    value="50000"/></c:if>
                                            <c:if test="${sizeName == 'XXL'}"><c:set var="priceAdjustment"
                                                                                     value="100000"/></c:if>
                                            <c:set var="adjustedPrice" value="${basePrice + priceAdjustment}"/>
                                            <tr>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty item.productSizeColorID.productID.productimagesCollection}">
                                                            <img src="${item.productSizeColorID.productID.productimagesCollection[0].imageURL}"
                                                                 alt="" class="cart__item-img">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/resource/images/default-product.jpg"
                                                                 alt="" class="cart__item-img">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${item.productSizeColorID.productID.productName}</td>
                                                <td>${item.productSizeColorID.sizeID.sizeName}</td>
                                                <td>${item.quantity}</td>
                                                <td><fmt:formatNumber value="${adjustedPrice}" type="number"
                                                                      groupingUsed="true"/> đ
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${adjustedPrice * item.quantity}"
                                                                      type="number" groupingUsed="true"/> đ
                                                    <c:set var="totalPrice"
                                                           value="${totalPrice + (adjustedPrice * item.quantity)}"/>
                                                </td>
                                            </tr>
                                            <!-- Tạo chuỗi sản phẩm -->
                                            <c:set var="productsList"
                                                   value="${productsList}${productsList != '' ? ', ' : ''}${item.productSizeColorID.productID.productName} (Kích thước: ${sizeName}, Số lượng: ${item.quantity}, Giá: ${adjustedPrice})"/>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6">Giỏ hàng trống. Vui lòng thêm sản phẩm trước khi thanh
                                                toán.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>

                            <!-- Định dạng totalPrice -->
                            <fmt:formatNumber var="displayTotalPrice" value="${totalPrice}" type="number"
                                              groupingUsed="true"/>
                            <fmt:formatNumber var="rawTotalPrice" value="${totalPrice}" type="number"
                                              groupingUsed="false" maxFractionDigits="0"/>

                            <!-- Hidden inputs -->
                            <input type="hidden" name="amount" value="${rawTotalPrice}">
                            <input type="hidden" name="orderInfo"
                                   value="Thanh toan don hang - Tong tien: ${rawTotalPrice} VND - Ngay: <%= new java.util.Date() %>">
                            <input type="hidden" name="products" value="${productsList}">

                            <!-- Hiển thị tổng tiền -->
                            <div class="cart__total">
                                <span>Tổng cộng:</span>
                                <span class="cart__total-amount">${displayTotalPrice} đ</span>
                            </div>
                            <a href="${pageContext.request.contextPath}/cart" class="btn btn--secondary cart__back-btn">Quay
                                về giỏ hàng</a>

                        </div>

                        <!-- User Info -->
                        <div class="user-info">
                            <h3>Thông Tin Người Nhận</h3>
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <div class="form-group">
                                        <label for="fullName">Họ và tên:</label>
                                        <input type="text" id="fullName" name="fullName"
                                               value="${sessionScope.user.name}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" id="email" name="email" value="${sessionScope.user.email}"
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Số điện thoại:</label>
                                        <input type="text" id="phone" name="phone"
                                               value="${sessionScope.user.phoneNumber}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Địa chỉ giao hàng:</label>
                                        <input type="text" id="address" name="address"
                                               value="${sessionScope.user.address}" required>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-group">
                                        <label for="fullName">Họ và tên:</label>
                                        <input type="text" id="fullName" name="fullName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" id="email" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Số điện thoại:</label>
                                        <input type="text" id="phone" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Địa chỉ giao hàng:</label>
                                        <input type="text" id="address" name="address" required>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Payment Method -->
                        <div class="payment-method">
                            <h3>Phương Thức Thanh Toán</h3>
                            <div class="form-group payment-options">
                                <div class="payment-option">
                                    <input type="radio" id="vnpay" name="paymentMethod" value="vnpay" checked>
                                    <label for="vnpay">
                                        <img src="https://vnpay.vn/assets/images/logo-icon/logo-primary.svg"
                                             onerror="this.src='${pageContext.request.contextPath}/resource/images/default-logo.png'"
                                             alt="VNPay" class="payment-logo">
                                        Thanh toán qua VNPay
                                        <i class="fas fa-money-bill-wave payment-icon"></i>
                                    </label>
                                </div>
                                <div class="payment-option">
                                    <input type="radio" id="cod" name="paymentMethod" value="cod">
                                    <label for="cod">
                                        <i class="fas fa-truck payment-icon"></i>
                                        Thanh toán khi nhận hàng (COD)
                                        <i class="fas fa-money-bill-wave payment-icon"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- Nút submit -->
                        <button type="submit" class="btn btn--primary cart__checkout-btn">Xác nhận thanh toán</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer (Giữ nguyên) -->
    <footer class="footer">
        <div class="grid wide">
            <div class="row">
                <div class="col l-3 m-3 c-6">
                    <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                    <ul class="footer__list">
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Đinh Huy Hoàng</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Xuân Hoàng</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đức Huy
                            Hoàng</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Thành Đạt</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đình Duy</a>
                        </li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Minh Hiếu</a>
                        </li>
                    </ul>
                </div>
                <div class="col l-3 m-3 c-6">
                    <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                    <ul class="footer__list">
                        <li class="footer__list-item"><a href="" class="footer__list-item__link"><i
                                class="footer__list-item-icon fab fa-facebook"></i>Facebook</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link"><i
                                class="footer__list-item-icon fab fa-instagram"></i>Instagram</a></li>
                        <li class="footer__list-item"><a href="" class="footer__list-item__link"><i
                                class="footer__list-item-icon fab fa-tiktok"></i>Tiktok</a></li>
                    </ul>
                </div>
                <div class="col l-3 m-3 c-6">
                    <h3 class="footer__heading">Vào cửa hàng</h3>
                    <div class="footer__download">
                        <img src="${pageContext.request.contextPath}/resource/images/5b6e787c2e5ee052.png" alt=""
                             class="footer__download-qr">
                        <div class="footer__download-apps">
                            <a href="" class="footer__download-apps-link"><img
                                    src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png"
                                    alt="Google Play" class="footer__download-apps-img"></a>
                            <a href="" class="footer__download-apps-link"><img
                                    src="${pageContext.request.contextPath}/resource/images/135555214a82d8e1.png"
                                    alt="AppStore" class="footer__download-apps-img"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__bottom">
            <div class="grid wide">
                <p class="footer__text">2025 - Bản quyền thuộc về Công ti Những Vì Tinh Tú LigmaShop</p>
            </div>
        </div>
    </footer>
</div>


</body>
</html>