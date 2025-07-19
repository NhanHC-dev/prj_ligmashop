<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- XỬ LÍ DỮ LIỆU THANH TOÁN Ở DÒNG 182 -->


<html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/thanhToan.css">
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

            <title>Thanh Toán Đơn Hàng</title>

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


                                <!--Người dùng đã đăng nhập-->
                                <!--                        <li class="header__navbar-item header__navbar-user">
                                                            <img src="images/user.jpg" alt="" class="header__navbar-user-img">
                                                            <span class="header__navbar-user-name">LigmaShop</span>-->
                                <li class="header__navbar-item header__navbar-user">
                                    <img src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="hello" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name">LigmaShop</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="${pageContext.request.contextPath}/resource/ligmaShop/adminPage.jsp">Quản lý sản phẩm</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="">Hồ sơ của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="">Vip</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="">Cài Đặt</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="${pageContext.request.contextPath}/resource/ligmaShop/guest.jsp">Đăng Xuất</a>
                                        </li>
                                    </ul>
                                </li>

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




                <div class="checkout-container">
                    <h2>Thanh Toán</h2>
                    <form action="#" method="post">

                        <div class="order-summary">
                            <h3>Danh Sách Sản Phẩm</h3>
                            <table>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng</th>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/product1.jpg" alt="Sản phẩm 1" class="product-img"></td>
                                    <td>Sản phẩm 1</td>
                                    <td><input type="number" class="quantity-input" value="2" min="1"></td>
                                    <td>500,000 VND</td>
                                    <td>1,000,000 VND</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/product2.jpg" alt="Sản phẩm 2" class="product-img"></td>
                                    <td>Sản phẩm 2</td>
                                    <td><input type="number" class="quantity-input" value="1" min="1"></td>
                                    <td>700,000 VND</td>
                                    <td>700,000 VND</td>
                                </tr>
                            </table>
                            <h3>Tổng tiền: 1,700,000 VND</h3>
                        </div>

                        <div class="user-info">
                            <h3>Thông Tin Người Nhận</h3>
                            <label>Tên:</label>
                            <input type="text" name="name" value="Nguyễn Văn A" readonly>

                            <label>Email:</label>
                            <input type="email" name="email" value="email@example.com" readonly>

                            <label>Số điện thoại:</label>
                            <input type="text" name="phone" value="0123456789" required>

                            <label>Địa chỉ giao hàng:</label>
                            <input type="text" name="address" value="123 Đường ABC, Hà Nội" required>
                        </div>

                        <div class="payment-method">
                            <h3>Phương Thức Thanh Toán</h3>
                            <label for="payment">Chọn phương thức thanh toán:</label>
                            <select name="payment" id="payment" required>
                                <option value="cod">Thanh toán khi nhận hàng</option>
                                <option value="bank">Chuyển khoản</option>
                                <option value="wallet">Ví điện tử</option>
                            </select>
                        </div>
                        <button type="submit">Xác nhận thanh toán</button>
                    </form>
                </div>
                <script>
                    function updateTotal() {
                        let rows = document.querySelectorAll("table tr");
                        let grandTotal = 0;
                        for (let i = 1; i < rows.length; i++) {
                            let quantity = rows[i].querySelector("input").value;
                            let price = rows[i].cells[2].textContent.replace(" VND", "").replace(/,/g, "");
                            let total = quantity * parseInt(price);
                            rows[i].cells[3].textContent = total.toLocaleString() + " VND";
                            grandTotal += total;
                        }
                        document.getElementById("grand-total").textContent = grandTotal.toLocaleString() + " VND";
                    }
                </script>

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
                                    <img src="${pageContext.request.contextPath}/images/qr.png" alt="" class="footer__download-qr">                            
                                    <div class="footer__download-apps">
                                        <a href="" class="footer__download-apps-link">
                                            <img src="${pageContext.request.contextPath}/images/1fddd5ee3e2ead84.png" alt="Goggle play" class="footer__download-apps-img">
                                        </a>
                                        <a href="" class="footer__download-apps-link">
                                            <img src="${pageContext.request.contextPath}/images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img">
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
