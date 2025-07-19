<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Jigma Shop</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendors/feather/feather.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style1.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />
        <style>
            .product-image {
                max-width: 100px;
                height: auto;
                border-radius: 5px;
                margin-right: 10px;
                margin-bottom: 10px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .image-container {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }
            .image-upload-group {
                margin-top: 10px;
            }
        </style>
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
                    <ul class="navbar-nav">
                        <li class="nav-item fw-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text">Good Morning, <span class="text-black fw-bold">Admin</span></h1>
                            <h3 class="welcome-sub-text">Your performance summary this week</h3>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 fw-semibold">pok</p>
                                    <p class="fw-light text-muted mb-0">admin@gmail.com</p>
                                </div>
                                <a class="dropdown-item"href="${pageContext.request.contextPath}/authservlet" ><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng Xuất</a>
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


                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <c:if test="${not empty product}">
                                            <h4 class="card-title">Sửa Sản Phẩm</h4>
                                            <form class="forms-sample" action="${pageContext.request.contextPath}/productManager" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="id" value="${product.productID}">

                                                <div class="form-group">
                                                    <label for="productName">Tên Sản Phẩm</label>
                                                    <input type="text" class="form-control" id="productName" name="name" value="${product.productName}" required>
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
                                                    <label for="discount">Giảm giá (%)</label>
                                                    <input type="number" class="form-control" id="discount" name="discount" value="${product.discount != null ? product.discount : 0}">
                                                </div>

                                                <div class="form-group">
                                                    <label for="createdDate">Ngày tạo</label>
                                                    <input type="date" class="form-control" id="createdDate" name="createdDate" value="${product.createdDate != null ? product.createdDate.toString().substring(0, 10) : ''}" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="status">Trạng thái</label>
                                                    <select class="form-control" id="status" name="status">
                                                        <option value="true" ${product.status ? 'selected' : ''}>Active</option>
                                                        <option value="false" ${!product.status ? 'selected' : ''}>Inactive</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label>Hình ảnh hiện tại</label>
                                                    <div class="image-container">
                                                        <c:choose>
                                                            <c:when test="${not empty product.productimagesCollection}">
                                                                <c:forEach var="image" items="${product.productimagesCollection}">
                                                                    <img src="${image.imageURL}" alt="Product Image" class="product-image" onerror="this.src='default-image.jpg';">
                                                                    <input type="hidden" name="existingImages" value="${image.imageURL}">
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>Không có hình ảnh nào.</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>

                                                <div class="form-group image-upload-group">
                                                    <label>Tải ảnh mới lên (tối đa 3 ảnh)</label>
                                                    <div class="input-group col-xs-12">
                                                        <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                    </div>
                                                    <div class="input-group col-xs-12">
                                                        <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                    </div>
                                                    <div class="input-group col-xs-12">
                                                        <input type="file" name="images" class="form-control file-upload-info" accept="image/*">
                                                    </div>
                                                    <small>Chọn ảnh mới để thay thế (bỏ trống để giữ nguyên ảnh hiện tại).</small>
                                                </div>

                                                <button type="submit" class="btn btn-primary me-2">Lưu Sản Phẩm</button>
                                                <a href="${pageContext.request.contextPath}/productManager" class="btn btn-light">Hủy Bỏ</a>
                                            </form>
                                        </c:if>
                                        <c:if test="${empty product}">
                                            <p class="text-danger">Không tìm thấy sản phẩm để chỉnh sửa.</p>
                                            <a href="${pageContext.request.contextPath}/productManager" class="btn btn-primary">Quay lại</a>
                                        </c:if>
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
            <script src="${pageContext.request.contextPath}/resource/vendors/typeahead.js/typeahead.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/off-canvas.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/template.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/settings.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/hoverable-collapse.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/todolist.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/file-upload.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/typeahead.js"></script>
            <script src="${pageContext.request.contextPath}/resource/js/select2.js"></script>
    </body>
</html>