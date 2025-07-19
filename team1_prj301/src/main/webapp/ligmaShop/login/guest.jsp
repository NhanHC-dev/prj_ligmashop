<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="productDAO" class="productDAO.ProductDAO" scope="request" />
<!-- Kept as is, assumes ProductDAO is correctly implemented -->
<jsp:useBean id="categoryDAO" class="categoryDAO.CategoryDAO" scope="page" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigmaShop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/chat.css">
        <script src="${pageContext.request.contextPath}/resource/js/chatbox.js" defer></script>
        
        <!-- Commented out Dialogflow messenger integration -->
        <!--
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
        <df-messenger
            intent="WELCOME"
            chat-title="LigmaShop"
            agent-id="42e42aa4-d213-4073-8915-61238c1db98f"
            language-code="vi">
        </df-messenger>
        -->
    </head>
    <body>
        <!-- Chatbox -->
        <div id="chat-toggle">💬</div>
        <div id="chatbox" class="minimized">
            <div id="messages">
                <div class="message bot-message">Chào bạn! Hỏi mình về sản phẩm nhé!</div>
            </div>
            <div id="input-container">
                <input id="input" type="text" placeholder="Nhập câu hỏi..." onkeydown="if (event.key === 'Enter')
                            sendMessage()">
                <button id="sendButton" onclick="sendMessage()">Gửi</button>
            </div>
        </div>

        <!-- Pagination settings -->
        <c:set var="pageSize" value="10" /> <!-- Number of products per page -->
        <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
        <c:set var="start" value="${(currentPage - 1) * pageSize}" />
        <c:set var="end" value="${start + pageSize}" />
        <c:set var="totalProducts" value="${fn:length(products)}" />
        <c:set var="totalPages" value="${totalProducts > 0 ? (totalProducts + pageSize - 1) / pageSize : 1}" />

        <div class="app">
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
                                    <c:choose>
                                        <c:when test="${sessionScope.user.getRole()=='admin'}" >
                                            <li class="header__navbar-item header__navbar-user">
                                                <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="" class="header__navbar-user-img">
                                                <span class="header__navbar-user-name">${sessionScope.user.getName()}</span>
                                                <ul class="header__navbar-user-menu">
                                                    <li class="header__navbar-user-item">
                                                        <a href="${pageContext.request.contextPath}/ordersDayData">Quản lý trang</a>
                                                    </li>
                                                    <li class="header__navbar-user-item">
                                                        <a href="${pageContext.request.contextPath}/ligmaShop/user/profilePage.jsp">Hồ sơ của tôi</a>
                                                    </li>
                                                    <li class="header__navbar-user-item">
                                                        <a href="${pageContext.request.contextPath}/authservlet">Đăng Xuất</a>
                                                    </li>
                                                </ul>
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
                                                        <a href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">ADMIN</a>
                                                    </li>
                                                    <li class="header__navbar-user-item">
                                                        <a href="${pageContext.request.contextPath}/authservlet">Đăng Xuất</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>

                    <!-- Search bar -->
                    <div class="header-with-search">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo">
                            <a href="${pageContext.request.contextPath}/test">
                                <img src="https://pageofme.github.io/team1_prj301/images/logo.png" alt="" class="header__logo-img">
                            </a>
                        </div>
                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm" id="searchQuery">
                            </div>
                            <form action="<%=request.getContextPath()%>/search" method="POST" id="submitSearch">
                                <input hidden name="query" id="hiddenQuery" />
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
                            
                                <div class="header__cart-wrap">
                                    <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp"> <i class="header__cart-icon fa-solid fa-cart-plus"></i></a>
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

                                                <a href="${pageContext.request.contextPath}/ligmaShop/cart/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</a>
                                                </c:otherwise>
                                            </c:choose>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </header>

            <!-- Main content -->
            <div class="app__container">
                <div class="grid wide">
                    <div class="row sm-gutter app__content">
                        <div class="col l-2 m-0 c-0">
                            <nav class="category">
                                <h3 class="category__heading">
                                    <i class="category__heading-icon fa-solid fa-list"></i>
                                    Danh mục
                                </h3>
                                <ul class="category-list">
                                    <c:forEach items="${category}" var="o">
                                        <li class="category-item ${param.cID == o.categoryID ? 'category-item--active' : ''}">
                                            <a href="category?cID=${o.categoryID}&page=1&query=rong&weather=all" class="category-item__link">${o.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <div class="weather-form">
                                    <form method="get" action="weather" class="weather-form__container">
                                        <h3 class="weather-form__title">Gợi ý đồ mặc theo thời tiết</h3>
                                        <div class="weather-form__input-group">
                                            <input type="text" name="location" placeholder="Nhập thành phố của bạn" class="weather-form__input" required />
                                            <button type="submit" class="weather-form__btn">Tìm</button>
                                        </div>
                                    </form>
                                </div>
                            </nav>
                        </div>
                        <div class="col l-10 m-12 c-12">
                            <div class="home-filter hide-on-mobile-tablet">
                                <span class="home-filter__label">Sắp xếp theo</span>
                                <div class="select-input">
                                    <span class="select-input__label">Giá</span>
                                    <i class="select-input__icon fas fa-angle-down"></i>
                                    <ul class="select-input__list">
                                        <li class="select-input__item">
                                            <a href="" class="select-input__link">Giá thấp đến cao</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="" class="select-input__link">Giá cao đến thấp</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="home-filter__page">
                                    <span class="home-filter__page-num">
                                        <span class="home-filter__page-current">${currentPage}</span>/${totalPages}
                                    </span>
                                </div>
                            </div>

                            <!-- Products -->
                            <div class="home-product">
                                <div class="row sm-gutter">
                                    <c:if test="${empty products}">
                                        <p style="text-align: center; color: red;">No products available.</p>
                                    </c:if>
                                    <c:forEach var="product" items="${products}" varStatus="status">
                                        <c:if test="${status.index >= start && status.index < end}">
                                            <div class="col l-2-4 m-4 c-6">
                                                <a class="home-product-item" href="productDetail?pID=${product.productID}">
                                                    <c:if test="${empty product.productimagesCollection}">
                                                        <div class="home-product-item__img" style="background-image: url('images/user.jpg');"></div>
                                                    </c:if>
                                                    <c:forEach var="image" items="${product.productimagesCollection}" varStatus="imgStatus">
                                                        <c:if test="${imgStatus.index == 0}">
                                                            <div class="home-product-item__img" style="background-image: url('${image.imageURL}');"></div>
                                                        </c:if>
                                                    </c:forEach>
                                                    <h4 class="home-product-item__name">${product.productName}</h4>
                                                    <div class="home-product-item__price">
                                                        <span class="home-product-item__price-old">${product.price}</span>
                                                        <span class="home-product-item__price-current">${product.price - (product.price * product.discount / 100)}</span>
                                                    </div>
                                                    <div class="home-product-item__action">
                                                        <span class="home-product-item__like home-product-item__like--liked">
                                                            <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                            <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                        </span>
                                                        <c:set var="ratingMap" value="${productDAO.getAverageRatingByProduct()}" />
                                                        <div class="home-product-item__rating">
                                                            <c:set var="avgRating" value="${ratingMap[product.productID] != null ? ratingMap[product.productID] : 0}" />
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <c:choose>
                                                                    <c:when test="${i <= avgRating}">
                                                                        <i class="home-product-item__star-gold fas fa-star"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="fa-regular fa-star"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                        <c:set var="soldMap" value="${productDAO.getTotalSoldByProduct()}" />
                                                        <span class="home-product-item__sold">${soldMap[product.productID] != null ? soldMap[product.productID] : 0} đã bán</span>
                                                    </div>
                                                    <div class="home-product-item__origin">
                                                        <span class="home-product-item__brand">${product.companyID.companyName}</span>
                                                    </div>
                                                    <div class="home-product-item__favourite">
                                                        <i class="fa-solid fa-check"></i> Yêu thích
                                                    </div>
                                                    <div class="home-product-item__sale-off">
                                                        <span class="home-product-item__sale-off-percent">${product.discount}%</span>
                                                        <span class="home-product-item__sale-off-label">GIẢM</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <!-- Pagination -->
                                <div class="pagination-wrapper">
                                    <ul class="pagination home-product__pagination">
                                        <li class="pagination-item">
                                            <c:if test="${currentPage > 1}">
                                                <a href="category?page=${currentPage - 1}&cID=${param.cID}&query=${param.query}&weather=${requestScope.weather}" class="pagination-item__link">
                                                    <i class="pagination-item__icon fas fa-angle-left"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${currentPage <= 1}">
                                                <span class="pagination-item__link pagination-item__link--disabled">
                                                    <i class="pagination-item__icon fas fa-angle-left"></i>
                                                </span>
                                            </c:if>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="pagination-item ${currentPage == i ? 'pagination-item--active' : ''}">
                                                <a href="category?page=${i}&cID=${param.cID != null ? param.cID : 1}&query=${param.query}&weather=${requestScope.weather}" class="pagination-item__link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="pagination-item">
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="category?page=${currentPage + 1}&cID=${param.cID != null ? param.cID : 1}&query=${param.query}&weather=${requestScope.weather}" class="pagination-item__link">
                                                    <i class="pagination-item__icon fas fa-angle-right"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${currentPage >= totalPages}">
                                                <span class="pagination-item__link pagination-item__link--disabled">
                                                    <i class="pagination-item__icon fas fa-angle-right"></i>
                                                </span>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <footer class="footer">
                    <div class="grid wide">
                        <div class="row">
                            <div class="col l-3 m-3 c-6">
                                <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                                <ul class="footer__list">
                                    <li class="footer__list-item">
                                        <a href="https://www.facebook.com/profile.php?id=100024348281258" class="footer__list-item__link">Đinh Huy Hoàng</a>
                                    </li>
                                    <li class="footer__list-item">
                                        <a href="https://www.facebook.com/le.xuan.hoang.107822" class="footer__list-item__link">Lê Xuân Hoàng</a>
                                    </li>
                                    <li class="footer__list-item">
                                        <a href="https://www.facebook.com/hoang.nguyen.209793#" class="footer__list-item__link">Nguyễn Đức Huy Hoàng</a>
                                    </li>
                                    <li class="footer__list-item">
                                        <a href="https://www.facebook.com/levy090523" class="footer__list-item__link">Lê Thành Đạt</a>
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
                                        <a href="https://www.facebook.com/groups/836319625350559" class="footer__list-item__link">
                                            <i class="footer__list-item-icon fab fa-facebook"></i>
                                            Facebook
                                        </a>
                                    </li>
                                    <li class="footer__list-item">
                                        <a href="https://www.instagram.com/ligmashop?igsh=anV5YnBwNXJrbW8x&utm_source=qr" class="footer__list-item__link">
                                            <i class="footer__list-item-icon fab fa-instagram"></i>
                                            Instagram
                                        </a>
                                    </li>
                                    <li class="footer__list-item">
                                        <a href="https://www.tiktok.com/@ligmashop?_t=ZS-8ujjzch4geg&_r=1" class="footer__list-item__link">
                                            <i class="footer__list-item-icon fab fa-tiktok"></i>
                                            Tiktok
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col l-3 m-3 c-6">
                                <h3 class="footer__heading">Vào cửa hàng</h3>
                                <div class="footer__download">
                                    <img src="https://pageofme.github.io/team1_prj301/images/qrcode.png" alt="" class="footer__download-qr">
                                    <div class="footer__download-apps">
                                        <a href="" class="footer__download-apps-link">
                                            <img src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png" alt="Google Play" class="footer__download-apps-img">
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
        </div>
    </body>
</html>