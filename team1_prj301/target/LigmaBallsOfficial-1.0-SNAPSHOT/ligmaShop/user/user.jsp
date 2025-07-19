<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

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
                                    <img src="images/5b6e787c2e5ee052.png" alt="QR code" class="header__qr-img">
                                    <div class="header__qr-apps">
                                        <a href="" class="header__qr-link">
                                            <img src="images/1fddd5ee3e2ead84.png" alt="Google Play" class="header__qr-download-img">
                                        </a>
                                        <a href="" class="header__qr-link">
                                            <img src="images/135555214a82d8e1.png" alt="AppStore" class="header__qr-download-img">
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
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Thông báo mới nhận</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">
                                                <img src="https://i.pinimg.com/236x/91/1e/0d/911e0d2eb3a94ba7647fe761a822f8a0.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">Đầm Maxi Dài Dáng Xòe Vải Voan Hoa Nhẹ Nhàng Phong Cách Bohemian Mùa Hè</span>
                                                    <span class="header__notify-decription">Mô tả sản phẩm</span>
                                                </div>
                                            </a>
                                        </li>

                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">
                                                <img src="https://i.pinimg.com/236x/c5/29/2d/c5292d47493a51507e0c15b8ffb04a65.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">Bộ Suit Nam Lịch Lãm Phong Cách Công Sở Cao Cấp Phù Hợp Đi Làm, Dự Tiệc, Ký Kết Hợp Đồng</span>
                                                    <span class="header__notify-decription">Mô tả sản phẩm</span>
                                                </div>
                                            </a>
                                        </li>

                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">
                                                <img src="https://i.pinimg.com/236x/08/08/71/0808718ad3ac8ebaa9640a1e0e4e3602.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">Set Đồ Nữ Áo Tay Phồng Kết Hợp Chân Váy Xòe Dự Tiệc Sang Trọng Cuối Tuần</span>
                                                    <span class="header__notify-decription">Mô tả sản phẩm</span>
                                                </div>
                                            </a>
                                        </li>

                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">
                                                <img src="https://i.pinimg.com/736x/ac/44/51/ac44515b4a5106a8b6769e6dc8008f5e.jpg" alt="" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">Quần áo Gucci chính hãng</span>
                                                    <span class="header__notify-decription">Mô tả sản phẩm</span>
                                                </div>
                                            </a>
                                        </li>


                                    </ul>
                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Xem tất cả</a>
                                    </footer>
                                </div>
                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-duotone fa-solid fa-question icon-notice-help"></i>
                                    Trợ giúp
                                </a>
                            </li>


                            <!--Người dùng đã đăng nhập-->
                            <li class="header__navbar-item header__navbar-user">
                                <img src="images/user.jpg" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name">LigmaShop</span>
                                <ul class="header__navbar-user-menu">
<!--                                    <li class="header__navbar-user-item">
                                        <a href="">Quản lý sản phẩm</a>
                                    </li>-->
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
                                        <a href="">Đăng Xuất</a>
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
                            <img src="images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img">
                        </div>

                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">

                        <div class="header__search">
                            <div class="header__search-input-wrap">

                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm">

                                <div class="header__search-history">
                                    <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                    <ul class="header__search-history-list">
                                        <li class="header__search-history-item">
                                            <a href="">Quần áo phù hợp đi học</a>
                                        </li>
                                        <li class="header__search-history-item">
                                            <a href="">Quần đi dư tiệc</a>
                                        </li>
                                        <li class="header__search-history-item">
                                            <a href="">Đồ thương mặc khi đi dạ hội</a>
                                        </li>
                                        <li class="header__search-history-item">
                                            <a href="">Phong cách thời trang đẳng cấp dẫn đầu xu hướng </a>
                                        </li>
                                        <li class="header__search-history-item">
                                            <a href="">Quần áo sang trọng, thanh lịch và cuốn hút</a>
                                        </li>
                                    </ul>
                                </div>
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
                            <button class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <!--Shopping Cart-->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-plus"></i>
                                <span class="header__cart-notice">3</span>

                                <!--No cart: header__cart--no-cart-->
                                <div class="header__cart-list">
                                    <img src="images/no-cart.jpg" alt="" class="header__cart-no-cart-img">
                                    <h4 class="header__cart-heading">Sản Phẩm Đã Thêm</h4>
                                    <ul class="header__cart-list-item">
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/736x/62/84/83/62848394449bb6acd97e2196d14ce51b.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Áo Sơ Mi Trắng Tay Dài Vải Lụa Cao Cấp Kết Hợp Quần Tây Ống Suông Cạp Cao Sang Trọng
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">800.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">3</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Louis Vuitton
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/cc/4a/2c/cc4a2c9529543cbe9f3839fe3c4ad70a.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Đầm Maxi Dài Dáng Xòe Vải Voan Hoa Nhẹ Nhàng Phong Cách Bohemian
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">2.000.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">2</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Gucci
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/ad/6f/6c/ad6f6c884b264127c5cee5294d43149d.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Đầm Bodycon Cổ Vuông Tay Dài Ôm Sát Tôn Dáng Vải Gân Co Giãn Màu Be Thanh Lịch
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">3.000.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">6</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Ralph Lauren
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/d5/81/7a/d5817ae90579a13b123db32ec4187918.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Bộ Đồ Nữ Đi Làm Cực Chanh Sả: Sơ Mi Trắng Tay Dài Kèm Quần Tây Cạp Cao Form Đẹp Giúp Tôn Vóc Dáng
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">5.000.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">1</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Dolce & Gabbana
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/83/3a/ca/833acaea9c1b1fe0d87d269d734e54a9.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Bộ Đồ Nam Áo Hoodie Unisex In Chữ Cá Tính, Chất Nỉ Dày Ấm Áp Phối Quần Jogger Màu Xám Cho Ngày Đông Năng Động
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">700.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">1</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Chanel
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/7c/ae/05/7cae05a315de5bab7cfbf0f93dfd0c7f.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Bộ Đồ Mặc Nhà Siêu Đáng Yêu: Áo Thun Form Rộng In Hình Gấu Kèm Quần Short Cotton Mềm Mịn
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">100.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">3</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Hermès
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/b3/e8/8b/b3e88bb40ef303d209542ae33a9acf7e.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Set Váy Maxi Hai Dây Xếp Ly Tầng Chất Voan Nhẹ Nhàng Phong Cách Tiểu Thư Sang Trọng Cho Mùa Hè
                                                    </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">1.999.999đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">1</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Dior
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img src="https://i.pinimg.com/236x/18/23/32/182332505dc89d4c5e3b73f8c39d9e5c.jpg" alt="" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">
                                                        Set Suit Nam Phong Cách Hàn Quốc: Áo Vest Slim-fit + Quần Âu Cạp Cao Màu Kem Cực Thời Thượng                                                </h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">500.000đ</span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-qnt">4</span>

                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Thương hiệu: Acmé De La Vie
                                                    </span>
                                                    <span class="header__cart-item-remove">Xóa</span>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                    <button class="header__cart-view-cart btn btn--primary">Xem Giỏ Hàng</button>
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
                                    <li class="category-item category-item--active">
                                        <a href="" class="category-item__link">Tất cả sản phẩm</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Quần áo nam</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Quần áo nữ</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Unisex</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Áo</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Quần</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Áo khoác</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Đồ ngủ và đồ lót</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Đồ thể thao</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Thời trang mùa hè</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Thời trang mùa đông</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col l-10 m-12 c-12">
                            <div class="home-filter hide-on-mobile-tablet">
                                <span class="home-filter__label">Sắp xếp theo</span>
                                <button class="home-filter__btn btn">Phổ biến</button>
                                <button class="home-filter__btn btn">Mới nhất</button>
                                <button class="home-filter__btn btn">Bán chạy</button>

                                <div class="select-input">
                                    <span class="select-input__label">Giá</span>
                                    <i class="select-input__icon fas fa-angle-down"></i>
                                    <!--List option-->
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
                                        <span class="home-filter__page-current">1</span>
                                        /18
                                    </span>
                                    <div class="home-filter__page-control">
                                        <a href="" class="home-filter__page-btn home-filter__page-btn-disable">
                                            <i class="home-filter__page-icon fas fa-angle-left"></i>
                                        </a>
                                        <a href="" class="home-filter__page-btn">
                                            <i class="home-filter__page-icon fas fa-angle-right"></i>
                                        </a>

                                    </div>
                                </div>                   
                            </div>
                            <div class="home-product">
                                <div class="row sm-gutter">
                                    <!--Product item-->
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://resource.nhuahvt.com/0x0/tmp/anh-san-pham-nam-phang-1596647478.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo Polo Thêu Logo Tròn 4M Form Slimfit PO153 Màu Xanh Biển</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">1.200.000</span>
                                                <span class="home-product-item__price-current">1.080.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">102 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Gucci</span>
                                                <span class="home-product-item__origin-name">America</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">10%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/a7/d7/02/a7d702d10a18d57e95eb4381d0517b2b.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo khoác bomber nam cá tính – Chống gió, chống nước, phối đồ cực chất</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">700.000</span>
                                                <span class="home-product-item__price-current">560.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">52 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Zara</span>
                                                <span class="home-product-item__origin-name">Tây Ban Nha</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">20%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/1f/dd/d7/1fddd7ab8b860bdc8bb2cda401a8307e.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo sơ mi nam công sở dáng slim fit – Chất vải cao cấp, thoáng mát</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">2.200.000</span>
                                                <span class="home-product-item__price-current">1.540.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">52 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Louis Vuitton</span>
                                                <span class="home-product-item__origin-name">Pháp</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">30%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/45/22/71/452271a67ec28b49ed2af9cbad36728a.jpg);"></div>    
                                            <h4 class="home-product-item__name">Đầm babydoll form rộng – Dễ thương, thoải mái, giấu dáng hiệu quả</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">890.000</span>
                                                <span class="home-product-item__price-current">667.500</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">700 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Uniqlo</span>
                                                <span class="home-product-item__origin-name"> Nhật Bản</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">25%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/77/44/ed/7744ed464e44e036ef5599b92d0f4ce6.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo âu nam Hàn Quốc – Dáng ôm vừa phải, chất vải mềm, không nhăn</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">1.500.000</span>
                                                <span class="home-product-item__price-current">1.050.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">78 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">New Balance</span>
                                                <span class="home-product-item__origin-name">America</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">30%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/90/3f/06/903f060526f7f446ccea09ea39c6b613.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo Vest nam form rộng – Chất nỉ dày dặn, giữ ấm tốt, phong cách streetwear</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">1.800.000</span>
                                                <span class="home-product-item__price-current">1.170.999</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">56 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Prada</span>
                                                <span class="home-product-item__origin-name">Ý</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">35%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/69/89/0c/69890cb2899cb3f8b7875ffa608f15f5.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo blazer nữ oversize – Chất vải dạ cao cấp, sang trọng, hack dáng đỉnh cao
                                            </h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">1.300.000</span>
                                                <span class="home-product-item__price-current">1.105.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">38 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Chanel</span>
                                                <span class="home-product-item__origin-name">Pháp</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">15%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/ed/9d/e8/ed9de842a5ef9b15d4a36c171be1a926.jpg);"></div>    
                                            <h4 class="home-product-item__name">Đầm body ôm sát quyến rũ – Chất vải cao cấp, tôn dáng hoàn hảo!</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">1.000.000</span>
                                                <span class="home-product-item__price-current">500.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">302 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Fila </span>
                                                <span class="home-product-item__origin-name">Hàn Quốc</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">50%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/cd/8a/d5/cd8ad5a9bcdd71838efeb4f4f723c533.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo polo nam thể thao – Co giãn 4 chiều, thấm hút mồ hôi tốt</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">500.000</span>
                                                <span class="home-product-item__price-current">350.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">702 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Under Armour</span>
                                                <span class="home-product-item__origin-name">Mỹ </span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">30%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>
                                    <div class="col l-2-4 m-4 c-6">
                                        <a class="home-product-item" href="#">
                                            <div class="home-product-item__img" style="background-image: url(https://i.pinimg.com/236x/25/f6/cc/25f6cca205389dddc35d339fefb5d766.jpg);"></div>    
                                            <h4 class="home-product-item__name">Áo croptop nữ ôm body – Tôn dáng gợi cảm, chất thun co giãn thoải mái</h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__price-old">2.500.000</span>
                                                <span class="home-product-item__price-current">1.500.000</span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="home-product-item__star-gold fas fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                </div>
                                                <span class="home-product-item__sold">256 Đã bán</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">Shein</span>
                                                <span class="home-product-item__origin-name">Trung Quốc</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <i class="fa-solid fa-check"></i>
                                                Yêu thích
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">40%</span>
                                                <span class="home-product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>

                                    </div>                             

                                </div>
                            </div>

                            <ul class="pagination home-product__pagination">
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">
                                        <i class="pagination-item__icon fas fa-angle-left"></i>
                                    </a>
                                </li>
                                <li class="pagination-item pagination-item--active">
                                    <a href="" class="pagination-item__link">1</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">2</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">3</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">4</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">5</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">...</a>
                                </li>
                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">17</a>
                                </li>

                                <li class="pagination-item">
                                    <a href="" class="pagination-item__link">
                                        <i class="pagination-item__icon fas fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>

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
                                <img src="images/5b6e787c2e5ee052.png" alt="" class="footer__download-qr">                            
                                <div class="footer__download-apps">
                                    <a href="" class="footer__download-apps-link">
                                        <img src="images/1fddd5ee3e2ead84.png" alt="Goggle play" class="footer__download-apps-img">
                                    </a>
                                    <a href="" class="footer__download-apps-link">
                                        <img src="images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img">
                                    </a>
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
