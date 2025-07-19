<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Ligma Shop</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendors/feather/feather.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style1.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
<!--        <style>
            .form-group {
                margin-bottom: 20px;
            }
            .image-upload-group {
                margin-top: 10px;
            }
        </style>-->
    </head>
    <body>
        <div class="container-scroller">
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                    <div class="me-3">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                            <span class="icon-menu"></span>
                        </button>
                    </div>
                    <div>
                        <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 fw-semibold">${sessionScope.user.getName()}</p>
                                    <p class="fw-light text-muted mb-0">${sessionScope.user.getEmail()}</p>
                                </div>
<!--                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i>Trang Cá Nhân<span class="badge badge-pill badge-danger">1</span></a>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>Hoạt Động</a>
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
            <div class="container-fluid page-body-wrapper">
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <!-- Thanh menu -->
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/ordersDayData ">
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
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Thêm Sản Phẩm</h4>
                                        <form class="forms-sample" action="${pageContext.request.contextPath}/productManager" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="add">

                                            <div class="form-group">
                                                <label for="productName">Tên Sản Phẩm</label>
                                                <input type="text" class="form-control" id="productName" name="name" placeholder="Nhập tên sản phẩm" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="description">Mô tả</label>
                                                <input type="text" class="form-control" id="description" name="description" placeholder="Nhập mô tả sản phẩm">
                                            </div>

                                            <div class="form-group">
                                                <label for="price">Giá tiền</label>
                                                <input type="number" class="form-control" id="price" name="price" step="0.01" placeholder="Nhập giá tiền" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="discount">Giảm giá (%)</label>
                                                <input type="number" class="form-control" id="discount" name="discount" step="0.01" placeholder="Nhập % giảm giá">
                                            </div>

                                            <div class="form-group">
                                                <label for="createdDate">Ngày tạo</label>
                                                <input type="date" class="form-control" id="createdDate" name="createdDate" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="status">Trạng thái</label>
                                                <select class="form-control" id="status" name="status">
                                                    <option value="true">Hoạt động</option>
                                                    <option value="false">Không hoạt động</option>
                                                </select>
                                            </div>

                                            <div class="form-group image-upload-group">
                                                <label>Tải ảnh lên (tối đa 3 ảnh)</label>
                                                <div class="input-group col-xs-12">
                                                    <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                </div>
                                                <div class="input-group col-xs-12">
                                                    <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                </div>
                                                <div class="input-group col-xs-12">
                                                    <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                </div>
                                                <small>Chọn ảnh để tải lên (bỏ trống nếu không cần).</small>
                                            </div>

                                            <button type="submit" class="btn btn-primary me-2">Lưu Sản Phẩm</button>
                                            <a href="${pageContext.request.contextPath}/productManager" class="btn btn-light">Hủy Bỏ</a>
                                        </form>
                                    </div>
                                </div>
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

        <script src="${pageContext.request.contextPath}/resource/vendors/js/vendor.bundle.base.js"></script>
        <script src="${pageContext.request.contextPath}/resource/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/off-canvas.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/template.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/settings.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/hoverable-collapse.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/todolist.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resource/js/dashboard.js"></script>
    
    </body>
</html>