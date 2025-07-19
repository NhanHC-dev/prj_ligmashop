<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="productDAO" class="productDAO.ProductDAO" scope="page"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--Xử lí ảnh và thông sản phẩm chính ở dòng 182 đến 248-->
<!--nếu muốn thay đổi giá cả theo size thì file js tên productDetails.js
hiện tại đang để giá tăng giảm 5% cho mỗi size-->
<!--hiện đang thiếu ảnh màu sắc khác của từng sản phẩm nên là gắn đại ảnh với giá cả các thứ đọ-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigMa Shop</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/styleProductDetails.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reviewCSS.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            .home-product-item__img{
                height: 20px;
                aspect-ratio: 1 / 1;
                background-size: cover;
                background-position: center;
                border-radius: 5px;
            }
        </style>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/chat.css"> 
        <script src="${pageContext.request.contextPath}/resource/js/chatbox.js" defer></script>
        <!--        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>-->
    <df-messenger
        intent="WELCOME"
        chat-title="LigmaShop"
        agent-id="42e42aa4-d213-4073-8915-61238c1db98f"
        language-code="vi">
    </df-messenger>
</head>

<body>
    <!--chatbox-->
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

                        <!--Người dùng chưa đăng kí và đăng nhập tài khoản-->

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
                                    <span class="header__navbar-user-name">${sessionScope.user.getName()}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="${pageContext.request.contextPath}/ligmaShop/user/profilePage.jsp">Hồ sơ của tôi</a>
                                        </li>
                                        <!--                                        <li class="header__navbar-user-item">
                                                                                    <a href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">ADMIN</a>
                                                                                </li>-->
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
                        <a href="${pageContext.request.contextPath}/test">
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img">
                        </a>
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

        <!--Body-->
        <%
            request.setAttribute("products", productDAO.selectAllProducts());
            
        %>
        <!-- Thông tin sản phẩm -->
        <c:set var="product" value="${singleProduct}" />
        <div class="container1">
            <div class="product-container">
                <!-- Ảnh sản phẩm -->
                <div class="image-container-box">
                    <div class="product-image-container">
                        <div class="product-image">
                            <img id="mainImage" src="${product.productimagesCollection[0].imageURL}" alt="Backrest Biotec Dental Equipment">
                        </div>
                        <div class="image-overlay">
                            <span class="close-btn">&times;</span>
                            <img class="full-image" src="" alt="Ảnh đầy đủ">
                        </div>
                        <!-- Ảnh nhỏ bên dưới -->
                        <div class="image-box">
                            <div class="additional-images">
                                <c:forEach var="image" items="${product.productimagesCollection}" varStatus="status">
                                    <image class="thumbnail" src="${image.imageURL}" >                                                                              
                                </c:forEach>

                            </div>               
                        </div>
                    </div>

                </div>

                <div class="product-info">
                    <div class="labels">
                        <span class="label-sale">SALE</span>
                        <span class="label-hot">HOT</span>
                        <span class="label-in-stock">IN STOCK</span>
                    </div>
                    <h1 >${product.productName}</h1>    
                    <c:set var="ratingMap" value="${productDAO.getAverageRatingByProduct()}" />
                    <div class="rating" >
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
                    <div class="features">
                        <ul>
                            <li>${product.description}</li>

                        </ul>
                    </div>

                    <!-- Chuyển đổi product.price thành chuỗi số hợp lệ -->
                    <fmt:formatNumber var="formattedPriceOriginal" value="${product.price}" type="number" groupingUsed="false"/>
                    <fmt:formatNumber var="formattedPrice" value="${product.price-(product.price*product.discount/100)}" type="number" groupingUsed="false" />


                    <!-- Lưu formattedPrice vào một phần tử ẩn để JavaScript lấy -->
                    <span id="formattedPrice" style="display: none;">${formattedPrice}</span>
                    <span id="formattedPriceOriginal" style="display: none;">${formattedPriceOriginal}</span>

                    <!-- Kiểm tra product.price có phải là số hợp lệ không -->
                    <c:set var="isPriceValid" value="true" />
                    <c:catch var="exception">
                        <c:set var="testPrice" value="${product.price + 0}" />
                    </c:catch>
                    <c:if test="${exception != null}">
                        <c:set var="isPriceValid" value="false" />
                    </c:if>

                    <!-- Tính toán giá mặc định trước -->
                    <c:if test="${not empty product.productsizecolorCollection && isPriceValid}">
                        <c:set var="uniqueSizes" value="" />
                        <c:set var="firstSize" value="true" />
                        <c:set var="foundSizeL" value="false" />

                        <c:forEach var="sizeColor" items="${product.productsizecolorCollection}">
                            <c:if test="${not fn:contains(uniqueSizes, sizeColor.sizeID.sizeName)}">
                                <c:set var="uniqueSizes" value="${uniqueSizes},${sizeColor.sizeID.sizeName}" />

                                <!-- Tính giá điều chỉnh -->
                                <c:set var="priceAdjustment" value="0" />
                                <c:if test="${sizeColor.sizeID.sizeName == 'XL'}">
                                    <c:set var="priceAdjustment" value="50000" />
                                </c:if>
                                <c:if test="${sizeColor.sizeID.sizeName == 'XXL'}">
                                    <c:set var="priceAdjustment" value="100000" />
                                </c:if>

                                <!-- Tính giá cuối cùng dựa trên product.price -->
                                <c:if test="${product.price != null}">
                                    <c:set var="adjustedPrice" value="${product.price + priceAdjustment}" />
                                </c:if>
                                <c:if test="${product.price == null}">
                                    <c:set var="adjustedPrice" value="0" />
                                </c:if>

                                <!-- Ưu tiên kích thước L làm mặc định -->
                                <c:if test="${sizeColor.sizeID.sizeName == 'L' && !foundSizeL}">
                                    <c:set var="defaultSize" value="${sizeColor.sizeID.sizeName}" />
                                    <c:set var="defaultPrice" value="${adjustedPrice}" />
                                    <c:set var="defaultProductSizeColorID" value="${sizeColor.productSizeColorID}" />
                                    <c:set var="foundSizeL" value="true" />
                                    <c:set var="firstSize" value="false" />
                                </c:if>

                                <!-- Nếu không tìm thấy L, dùng kích thước đầu tiên làm mặc định -->
                                <c:if test="${firstSize}">
                                    <c:set var="defaultSize" value="${sizeColor.sizeID.sizeName}" />
                                    <c:set var="defaultPrice" value="${adjustedPrice}" />
                                    <c:set var="defaultProductSizeColorID" value="${sizeColor.productSizeColorID}" />
                                    <c:set var="firstSize" value="false" />
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty product.productsizecolorCollection && isPriceValid}">
                        <!-- Nếu không có kích thước, dùng product.price làm giá mặc định -->
                        <c:if test="${product.price != null}">
                            <c:set var="defaultPrice" value="${product.price}" />
                            <c:set var="defaultSize" value="N/A" />
                            <c:set var="defaultProductSizeColorID" value="0" />
                        </c:if>
                    </c:if>

                    <div class="price">
                        <c:if test="${product.price != null && defaultPrice != null && isPriceValid}">
                            <c:set var="discount" value="${product.discount != null ? product.discount : 0}" />
                            <c:set var="discountedPrice" value="${defaultPrice - (defaultPrice * discount / 100)}" />
                            <span class="price">
                                <fmt:formatNumber value="${discountedPrice}" type="number" groupingUsed="true" /> ₫
                                <span id="displayPrice" style="display: none;">${discountedPrice}</span>
                            </span>
                            <!--                            <span class="original-price">
                            <fmt:formatNumber value="${defaultPrice}" type="number" groupingUsed="true" /> đ
                            <span id="displayOriginalPrice" style="display: none;">${defaultPrice}</span>
                        </span>-->
                        </c:if>
                        <c:if test="${product.price == null || defaultPrice == null || !isPriceValid}">
                            <p>Không có giá hợp lệ cho sản phẩm này. Vui lòng kiểm tra lại dữ liệu.</p>
                        </c:if>
                    </div>

                    <div class="size-selector">
                        <c:if test="${not empty product.productsizecolorCollection && isPriceValid}">
                            <c:set var="uniqueSizes" value="" />
                            <c:set var="uniqueColors" value=""/>
                            <c:forEach var="sizeColor" items="${product.productsizecolorCollection}">
                                <c:if test="${not fn:contains(uniqueSizes, sizeColor.sizeID.sizeName)}">
                                    <c:set var="uniqueSizes" value="${uniqueSizes},${sizeColor.sizeID.sizeName}" />

                                    <!-- Tính giá điều chỉnh (lặp lại để tạo button) -->
                                    <c:set var="priceAdjustment" value="0" />
                                    <c:if test="${sizeColor.sizeID.sizeName == 'XL'}">
                                        <c:set var="priceAdjustment" value="50000" />
                                    </c:if>
                                    <c:if test="${sizeColor.sizeID.sizeName == 'XXL'}">
                                        <c:set var="priceAdjustment" value="100000" />
                                    </c:if>

                                    <c:if test="${product.price != null}">
                                        <c:set var="adjustedPrice" value="${product.price + priceAdjustment}" />
                                    </c:if>
                                    <c:if test="${product.price == null}">
                                        <c:set var="adjustedPrice" value="0" />
                                    </c:if>

                                    <button class="size-option ${sizeColor.sizeID.sizeName == defaultSize ? 'selected' : ''}"
                                            data-size="${sizeColor.sizeID.sizeName}" 
                                            data-price="${adjustedPrice}" 
                                            data-product-size-color-id="${sizeColor.productSizeColorID}">
                                        ${sizeColor.sizeID.sizeName}
                                    </button>

                                </c:if>
                            </c:forEach>
                            <%--
                            <c:forEach var="sizeColor" items="${product.productsizecolorCollection}">
                                <c:if test="${not fn:contains(uniqueColors, sizeColor.colorID.colorName)}">
                                    <c:set var="uniqueColors" value="${uniqueColors},${sizeColor.colorID.colorName}" />
                                    
                                    <button class="size-option ${sizeColor.colorID.colorName == defaultSize ? 'selected' : ''}"
                                            data-size="${sizeColor.colorID.colorName}" >
                                            data-product-size-color-id="${sizeColor.productSizeColorID}">
                                            ${uniqueColors}
                                </button>
                            </c:if>
                        </c:forEach> 
                            --%>
                        </c:if>
                        <c:if test="${empty product.productsizecolorCollection || !isPriceValid}">
                            <p>Không có kích thước nào cho sản phẩm này hoặc giá không hợp lệ.</p>
                        </c:if>
                    </div>

                    <div class="quantity-box">
                        <button class="decrease">-</button>
                        <input type="text" id="displayQuantity" value="1" required>
                        <button class="increase">+</button>
                    </div>


                    <div class="button-container">
                        <c:if test="${not empty defaultPrice}">
                            <c:if test="${product.price != null && defaultPrice != null}">
                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="imageURL" id="selectedImageURL" value="${product.productimagesCollection[0].imageURL}">
                                    <input type="hidden" name="productName" value="${product.productName}">
                                    <input type="hidden" name="productSizeColorID" id="selectedProductSizeColorID" value="${defaultProductSizeColorID}">
                                    <input type="hidden" name="price" id="selectedPrice" value="${defaultPrice}">
                                    <input type="hidden" name="discountedPrice" id="selectedDiscountedPrice" value="${discountedPrice}">
                                    <input type="hidden" name="size" id="selectedSize" value="${defaultSize}">
                                    <input type="hidden" name="quantity" id="selectedQuantity" value="1">
                                    <button type="submit" class="btn-add">
                                        <i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ
                                    </button>
                                </form>

                            </c:if>
                        </c:if>
                        <button class="btn-add1">Mua Ngay</button>
                    </div>
                </div>
            </div>

            <hr class="separator">

            <div class="review-container">
                <h2>Đánh Giá Sản Phẩm</h2>
                <form action="reviewservlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productID" value="${product.productID}">
                    <input type="hidden" name="userID" value="${sessionScope.user.userID}">

                    <div class="stars">
                        <input type="radio" name="rating" value="5" id="star5"><label for="star5">★</label>
                        <input type="radio" name="rating" value="4" id="star4"><label for="star4">★</label>
                        <input type="radio" name="rating" value="3" id="star3"><label for="star3">★</label>
                        <input type="radio" name="rating" value="2" id="star2"><label for="star2">★</label>
                        <input type="radio" name="rating" value="1" id="star1"><label for="star1">★</label>
                    </div>

                    <div class="review-user">
                        <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Avatar" class="avatar">
                        <textarea name="comment" placeholder="Viết đánh giá..." required></textarea>
                    </div>

                    <button type="submit" class="btn">Gửi Đánh Giá</button>
                </form>     



                <br>
                <div class="review-list">
                    <h2>Đánh giá của người dùng</h2>
                    <c:if test="${empty reviews}">
                        <p>Chưa có đánh giá nào.</p>
                    </c:if>

                    <c:forEach var="review" items="${reviews}">
                        <div class="review-item">
                            <img src="${pageContext.request.contextPath}/resource/images/avtKhachHang.jpg" alt="Avatar" class="avatar">
                            <p>${review.userID.getName()}</p>
                            <p>
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= review.rating}">
                                            <i class="fas fa-star"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="far fa-star"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </p>
                            <p>${review.comment}</p>
                            <p>${review.reviewDate}</p>
                        </div>

                    </c:forEach>

                </div>
            </div>


            <hr class="separator">


            <div class="container2">
                <h2>Có thể bạn sẽ thích</h2>
                <div class="suggested-products-wrapper">
                    <button class="scroll-btn left" onclick="scrollLeft()">&#10094;</button>
                    <div class="suggested-products">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <!--Sản phẩm gợi ý-->
                                <a href="productDetail?pID=${product.productID}">
                                    <img src="${product.productimagesCollection[0].imageURL}" alt="${product.productName}">                                                 
                                    <p class="product-name">${product.productName}</p>
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
                                    <p class="product-categories">${product.description}</p>
                                    <p class="product-price">${product.price}</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="scroll-btn right" onclick="scrollRight()">&#10095;</button>
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
    <script src="${pageContext.request.contextPath}/resource/js/productDetails.js"></script>
</body>
</html>