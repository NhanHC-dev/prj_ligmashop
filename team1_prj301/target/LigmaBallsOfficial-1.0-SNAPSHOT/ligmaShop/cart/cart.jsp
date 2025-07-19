<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigmaShop - Cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/cart.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    </head>
    <body>
        <div class="app">
            <!-- Header (Reused from User Page) -->
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
                                                <a href="${pageContext.request.contextPath}/ligmaShop/login/profilePage.jsp">Hồ sơ của tôi</a>
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
                    <div class="header-with-search">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo">
                            <a href="${pageContext.request.contextPath}/test">
                                <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img">
                            </a>
                        </div>
                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm">
                                <!-- Search history omitted for brevity -->
                            </div>
                            <div class="header__search-select">
                                <span class="header__search-select-label">Trong Shop</span>
                                <i class="header__search-select-icon fa-solid fa-chevron-down"></i>
                                <!-- Search options omitted for brevity -->
                            </div>
                            <button class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>



                        <div class="header__cart">

                            <div class="header__cart-wrap">

                                <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp">
                                    <i class="header__cart-icon fa-solid fa-cart-plus"></i></a>
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

<!--                                            <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</a>-->
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</a>
                                </div>

                            </div>    

                        </div>

                    </div>
                </div>
            </header>
            <!-- Cart Content -->
            <div class="app__container">
                <div class="grid wide">
                    <div class="row app__content">
                        <div class="col l-12 m-12 c-12">
                            <h2 class="cart__heading">Giỏ Hàng Của Bạn</h2>

                            <c:if test="${not empty sessionScope.error}">
                                <div class="alert alert-danger">
                                    ${sessionScope.error}
                                    <c:remove var="error" scope="session"/>
                                </div>
                            </c:if>

                            <c:if test="${empty cartItems}">
                                <div class="cart__empty">
                                    <img src="${pageContext.request.contextPath}/resource/images/no-cart.jpg" alt="No items" class="cart__empty-img">
                                    <!--                                    <p>Giỏ hàng của bạn đang trống!</p>-->
                                    <a href="${pageContext.request.contextPath}/products" class="btn btn--primary">Quay lại mua sắm</a>
                                </div>
                            </c:if>

                            <c:if test="${not empty cartItems}">
                                <div class="cart__items">
                                    <table class="cart__table">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Kích thước</th>
                                                <th>Giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="totalPrice" value="0"/>
                                            <c:forEach var="item" items="${cartItems}">
                                                <c:set var="product" value="${item.productSizeColorID.productID}" />
                                                <c:set var="basePrice" value="${product.price-(product.price*product.discount/100)}" />
                                                <c:set var="sizeName" value="${item.productSizeColorID.sizeID.sizeName}" />
                                                <c:set var="priceAdjustment" value="0" />
                                                <c:if test="${sizeName == 'XL'}">
                                                    <c:set var="priceAdjustment" value="50000" />
                                                </c:if>
                                                <c:if test="${sizeName == 'XXL'}">
                                                    <c:set var="priceAdjustment" value="100000" />
                                                </c:if>  
                                                <c:set var="adjustedPrice" value="${basePrice + priceAdjustment}" />                               
                                                <c:set var="discount" value="${product.discount != null ? product.discount : 0}" />
                                                <tr>
                                                    <td>
                                                        <div class="cart__item-info">
                                                            <c:choose>
                                                                <c:when test="${empty item.productSizeColorID || empty item.productSizeColorID.productID || empty item.productSizeColorID.productID.productimagesCollection}">
                                                                    <img src="${pageContext.request.contextPath}/resource/images/user.jpg" class="cart__item-img">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach var="image" items="${item.productSizeColorID.productID.productimagesCollection}" varStatus="imgStatus">
                                                                        <c:if test="${imgStatus.index == 0}">
                                                                            <img src="${image.imageURL}" alt="${item.productSizeColorID.productID.productName}" class="cart__item-img">
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <span>${item.productSizeColorID != null && item.productSizeColorID.productID != null ? item.productSizeColorID.productID.productName : 'Sản phẩm không xác định'}</span>
                                                        </div>
                                                    </td>
                                                    <td>${item.productSizeColorID != null && item.productSizeColorID.sizeID != null ? item.productSizeColorID.sizeID.sizeName : 'N/A'}</td>
                                                    <td>
                                                        <fmt:formatNumber value="${adjustedPrice}" type="number" groupingUsed="true" /> đ
                                                    </td>
                                                    <td>
                                                        <form action="${pageContext.request.contextPath}/cart" method="post" class="update-form">
                                                            <input type="hidden" name="action" value="update">
                                                            <input type="hidden" name="cartItemID" value="${item.cartItemID}">
                                                            <input type="number" name="quantity" min="1" value="${item.quantity}" class="cart__item-quantity" required>
                                                            <button type="submit" class="cart__update-btn btn">Cập nhật</button>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${adjustedPrice * item.quantity}" type="number" groupingUsed="true" /> đ
                                                        <c:set var="totalPrice" value="${totalPrice+adjustedPrice * item.quantity}"/>

                                                    </td>
                                                    <td>
                                                        <form action="${pageContext.request.contextPath}/cart" method="post" class="remove-form">
                                                            <input type="hidden" name="action" value="remove">
                                                            <input type="hidden" name="cartItemID" value="${item.cartItemID}">
                                                            <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                                                            <button type="submit" class="cart__item-remove btn btn--danger">Xóa</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="cart__total">
                                        <span>Tổng cộng:</span>
                                        <span class="cart__total-amount">
                                            <fmt:formatNumber value="${totalPrice != null ? totalPrice : 0}" type="number" groupingUsed="true" /> đ
                                        </span>
                                    </div>

                                    <a href="${pageContext.request.contextPath}/ligmaShop/payment/checkout.jsp" class="btn btn--primary cart__checkout-btn">Thanh Toán</a>
                                </div>
                            </c:if>

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    document.querySelectorAll('.update-form').forEach(form => {
                                        form.addEventListener('submit', function (event) {
                                            const quantityInput = this.querySelector('input[name="quantity"]');
                                            const quantity = parseInt(quantityInput.value);
                                            if (isNaN(quantity) || quantity < 1) {
                                                event.preventDefault();
                                                alert('Số lượng phải lớn hơn 0.');
                                                quantityInput.focus();
                                            }
                                        });
                                    });
                                    document.querySelectorAll('.remove-form').forEach(form => {
                                        console.log("Remove form found:", form); // Thêm log để kiểm tra
                                        form.addEventListener('submit', function (event) {
                                            console.log("Remove form submitted"); // Thêm log để kiểm tra
                                            setTimeout(() => {
                                                window.location.reload();
                                            }, 500);
                                        });
                                    });
                                });

                            </script>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Footer (Reused from User Page) -->
            <footer class="footer">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Đinh Huy Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Xuân Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đức Huy Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Thành Đạt</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đình Duy</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Minh Hiếu</a></li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-facebook"></i>Facebook</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-instagram"></i>Instagram</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-tiktok"></i>Tiktok</a></li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Vào cửa hàng</h3>
                            <div class="footer__download">
                                <img src="${pageContext.request.contextPath}/resource/images/5b6e787c2e5ee052.png" alt="" class="footer__download-qr">
                                <div class="footer__download-apps">
                                    <a href="" class="footer__download-apps-link"><img src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png" alt="Google Play" class="footer__download-apps-img"></a>
                                    <a href="" class="footer__download-apps-link"><img src="${pageContext.request.contextPath}/resource/images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img"></a>
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