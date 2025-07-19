<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Product Management</title>
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
        <!-- Đặt managerProduct.css cuối cùng -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/managerProduct.css">
    </head>
    <body class="with-welcome-text">

        <c:set var="recordsPerPage" value="10" />
        <c:set var="totalProducts" value="${fn:length(products)}" />
        <c:set var="totalPages" value="${(totalProducts / recordsPerPage) + (totalProducts % recordsPerPage > 0 ? 1 : 0)}" />

        <c:choose>
            <c:when test="${not empty param.page}">
                <c:set var="currentPage" value="${param.page}" />
            </c:when>
            <c:otherwise>
                <c:set var="currentPage" value="1" />
            </c:otherwise>
        </c:choose>

        <c:set var="startIndex" value="${(currentPage - 1) * recordsPerPage}" />
        <c:set var="endIndex" value="${startIndex + recordsPerPage}" />
        <c:if test="${endIndex > totalProducts}">
            <c:set var="endIndex" value="${totalProducts}" />
        </c:if>



        <div class="container-scroller">
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                    <div class="me-3">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                            <span class="icon-menu"></span>
                        </button>
                    </div>
                    <div>
                        <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/test">
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
                        </a>
                    </div>
                </div> <!-- các logo header -->
                <div class="navbar-menu-wrapper d-flex align-items-top">
                    <ul class="navbar-nav">
                        <li class="nav-item fw-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text">Xin Chào, ${sessionScope.user.getName()}</h1>
                            <h3 class="welcome-sub-text">Đây Là Tổng Doanh Thu Của Bạn</h3>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item"><!<!-- icon search -->
                            <form class="search-form" action="#">
                                <i class="icon-search"></i>
                                <input type="search" class="form-control" placeholder="Search Here" title="Search here">
                            </form>
                        </li>


                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image"> </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle" src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 fw-semibold">${sessionScope.user.getName()}</p>
                                    <p class="fw-light text-muted mb-0">${sessionScope.user.getEmail()}</p>
                                </div>
                                <a href="${pageContext.request.contextPath}/authservlet" class="dropdown-item" ><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng Xuất</a>
                            </div>
                        </li> <!<!-- quản lý account -->
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/ordersDayData">
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
                                <div class="card"><!--/*thêm servlet ở đây*/-->
                                    <div class="card-body">

                                        <%-- Xác định trang hiện tại --%>
                                        <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
                                        <c:set var="productsPerPage" value="10" />
                                        <c:set var="start" value="${(currentPage - 1) * productsPerPage}" />
                                        <c:set var="end" value="${start + productsPerPage}" />

                                        <div class="container-product">
                                            <h1>Product Management</h1>
                                            <div style="text-align: center;">
                                                <a href="${pageContext.request.contextPath}/ligmaShop/product/addNewProduct.jsp" class="action-btn add-btn">Thêm Sản Phẩm Mới</a>
                                            </div>

                                            <!-- Hiển thị thông báo -->
                                            <c:if test="${not empty message}">
                                                <p class="success">${message}</p>
                                            </c:if>
                                            <c:if test="${not empty error}">
                                                <p class="error">${error}</p>
                                            </c:if>

                                            <!-- Bảng danh sách sản phẩm -->
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Product Name</th>
                                                        <th>Images</th>
                                                        <th>Description</th>
                                                        <th>Price</th>
                                                        <th>Discount (%)</th>
                                                        <th>Created Date</th>
                                                        <th>Status</th>
                                                        <th>Company</th>
                                                        <th>Average Rating</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${not empty products}">
                                                            <c:forEach var="product" items="${products}" varStatus="status">
                                                                <c:if test="${status.index >= start && status.index < end}">
                                                                    <c:set var="productId" value="${product.productID}" />
                                                                    <c:set var="productImageUrls" value="${imageUrls[productId]}" />
                                                                    <tr>
                                                                        <td>${product.productID}</td>
                                                                        <td>${product.productName}</td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${not empty productImageUrls}">
                                                                                    <c:forEach var="imageUrl" items="${productImageUrls}">
                                                                                        <img src="${imageUrl}" alt="Product Image" class="product-image">
                                                                                    </c:forEach>
                                                                                </c:when>
                                                                                <c:otherwise>No images</c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td class="description">${not empty product.description ? product.description : 'N/A'}</td>
                                                                        <td>${product.price}</td>
                                                                        <td>${not empty product.discount ? product.discount : '0'}%</td>
                                                                        <td><fmt:formatDate value="${product.createdDate}" pattern="dd/MM/yyyy" /></td>
                                                                        <td>${product.status ? 'Active' : 'Inactive'}</td>
                                                                        <td>${not empty product.companyID ? product.companyID.companyName : 'N/A'}</td>
                                                                        <td><fmt:formatNumber value="${avgRatingMap[productId]}" maxFractionDigits="1"/></td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${product.status}">
                                                                                    <a href="productManager?action=deactivate&id=${product.productID}" class="action-btn delete-btn"
                                                                                       onclick="return confirm('Deactivate this product?');">DACT</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="productManager?action=activate&id=${product.productID}" class="action-btn activate-btn"
                                                                                       onclick="return confirm('Activate this product?');">ACT</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <a href="productManager?action=edit&id=${product.productID}" class="action-btn update-btn">Edit</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr><td colspan="11">No products found.</td></tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tbody>
                                            </table>

                                            <!-- Phân trang -->
                                            <div class="pagination">
                                                <c:set var="totalPages" value="${(products.size() / productsPerPage) + (products.size() % productsPerPage == 0 ? 0 : 1)}" />

                                                <c:if test="${totalPages > 1}">
                                                    <c:forEach begin="1" end="${totalPages}" var="page">
                                                        <a href="?page=${page}" class="${page == currentPage ? 'active' : ''}">${page}</a>
                                                    </c:forEach>
                                                </c:if>
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
            </div>
        </div>
        <!-- plugins:js -->
        <script src="${pageContext.request.contextPath}/resource/vendors/js/vendor.bundle.base.js"></script>
        <script src="${pageContext.request.contextPath}/resource/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="${pageContext.request.contextPath}/resource/js/off-canvas.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/template.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/settings.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/hoverable-collapse.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="${pageContext.request.contextPath}/resource/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resource/js/dashboard.js"></script>
        <!-- End custom js for this page-->
    </body>
</html>