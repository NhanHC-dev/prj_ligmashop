
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Jigma Shop </title>
        <!-- plugins:css -->
        <link rel="stylesheet/less" type="text/css" href="styles.less" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/mdi/css/materialdesignicons.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
    <!--    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/select2/select2.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">-->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style1.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
    </head>
    <body>
        <div class="container-scroller">
          <!-- partial:${pageContext.request.contextPath}/${pageContext.request.contextPath}/partials/_navbar.html -->
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row" ">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                    <div class="me-3">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                            <span class="icon-menu"></span>
                        </button>
                    </div>
                    <div>
                        <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/ligmaShop/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/ligmaShop/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top">
                    <ul class="navbar-nav">
                        <li class="nav-item fw-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text">Good Morning, <span class="text-black fw-bold">${pageContext.request.contextPath}.</span></h1>
                            <h3 class="welcome-sub-text">Your performance summary this week </h3>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/images/user.jpg" alt="Profile image"> </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle" src="${pageContext.request.contextPath}/images/user.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 fw-semibold">pok</p>
                                    <p class="fw-light text-muted mb-0">${pageContext.request.contextPath}.@gmail.com</p>
                                </div>
                                <!--                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i>Trang Cá Nhân<span class="badge badge-pill badge-danger">1</span></a>
                                                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i> Hoạt Động</a>
                                                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-cog text-primary me-2"></i>Cài đặt</a>-->
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/authservlet" ><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng Xuất</a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
              <!-- partial:${pageContext.request.contextPath}/${pageContext.request.contextPath}/partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <!-- Thanh menu -->
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp ">
                                <i class="mdi mdi-grid-large menu-icon"></i>
                                <span class="menu-title">Trang chủ</span>
                            </a>
                        </li>
                        <li class="nav-item nav-category">Công Cụ</li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                                <i class="menu-icon mdi mdi-card-text-outline"></i>
                                <span class="menu-title">Quản Lý Cửa Hàng</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <!--                            <div class="collapse" id="form-elements">
                                                            <ul class="nav flex-column sub-menu">
                                                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/managerUser.jsp">Quản lý Người Dùng</a></li>
                                                            </ul>
                                                        </div>-->
                            <div class="collapse" id="form-elements">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/product/addNewProduct.jsp">Thêm Sản Phẩm</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/productManager">Danh sách sản phẩm</a></li>
                                </ul>
                            </div>

                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                                <span class="menu-title">Quản lý Khách Hàng</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/managerUser.jsp">Quản lý Người Dùng</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/addUser.jsp">Thêm người dùng mới</a></li>

                                </ul>
                            </div>

                        </li>

                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row"> 
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Sửa Sản Phẩm</h4>

                                        <form class="forms-sample" action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="id" value="${product.id}">

                                            <div class="form-group">
                                                <label for="productName">Tên Sản Phẩm</label>
                                                <input type="text" class="form-control" id="productName" name="name" value="${product.name}" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="description">Mô tả</label>
                                                <input type="text" class="form-control" id="description" name="description" value="${product.description}">
                                            </div>

                                            <div class="form-group">
                                                <label for="price">Giá tiền</label>
                                                <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="gender">Giới tính</label>
                                                <select class="form-select" id="gender" name="gender">
                                                    <option value="Nam" ${product.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                    <option value="Nữ" ${product.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="category">Loại Sản Phẩm</label>
                                                <input type="text" class="form-control" id="category" name="category" value="${product.category}">
                                            </div>

                                            <div class="form-group">
                                                <label>Tải Ảnh Lên</label>
                                                <input type="file" name="image" class="file-upload-default">
                                                <div class="input-group col-xs-12">
                                                    <input type="text" class="form-control file-upload-info" disabled value="${product.image}" placeholder="Thêm Ảnh">
                                                    <span class="input-group-append">
                                                        <button class="file-upload-browse btn btn-primary" type="button">Tải Lên</button>
                                                    </span>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary me-2">Lưu Sản Phẩm</button>
                                            <a href="adminPage.jsp" class="btn btn-light">Hủy Bỏ</a>
                                        </form>
                                    </div>
                                </div>
                            </div>   
                            <footer class="footer">
                                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                    <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Công Ty TNHH Ligma Shop</span>
                                </div>
                            </footer>
                        </div>
                    </div>
                </div>
                <!-- plugins:js -->
                <script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
                <!-- Plugin js for this page -->
                <script src="${pageContext.request.contextPath}/vendors/typeahead.js/typeahead.bundle.min.js"></script>

                <!-- End plugin js for this page -->
                <!-- inject:js -->
                <script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
                <script src="${pageContext.request.contextPath}/js/template.js"></script>
                <script src="${pageContext.request.contextPath}/js/settings.js"></script>
                <script src="${pageContext.request.contextPath}/js/hoverable-collapse.js"></script>
                <script src="${pageContext.request.contextPath}/js/todolist.js"></script>
                <!-- Custom js for this page-->
                <script src="${pageContext.request.contextPath}/js/file-upload.js"></script>
                <script src="${pageContext.request.contextPath}/js/typeahead.js"></script>
                <script src="${pageContext.request.contextPath}/js/select2.js"></script>
                <!-- End custom js for this page-->
                </body>
                </html>
