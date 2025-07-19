<%@page import="orderDAO.OrderDAO" %>
<%@page import="listener.CountUser" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderDayData" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="listener.CountUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
    <%
        // Lấy danh sách orders từ request attribute
        List<OrderDayData> ordersList = (List<OrderDayData>) request.getAttribute("ordersList");
        Double totalRevenue = (Double) request.getAttribute("totalRevenue"); // Lấy tổng doanh thu
        Integer totalBuyers = (Integer) request.getAttribute("totalBuyers"); // Lấy tổng số người mua
        Gson gson = new Gson();
        String ordersJson = gson.toJson(ordersList);
        // Lấy tháng được chọn từ request parameter (nếu có)
        String selectedMonth = request.getParameter("month") != null ? request.getParameter("month") : "2"; // Mặc định là tháng 2
        // Định dạng số tiền
        DecimalFormat df = new DecimalFormat("#,###.00");
        String formattedRevenue = totalRevenue != null ? df.format(totalRevenue) : "0.00";
        // Định dạng số người mua (thêm dấu phẩy cho dễ đọc)
        DecimalFormat dfBuyers = new DecimalFormat("#,###");
        String formattedBuyers = totalBuyers != null ? dfBuyers.format(totalBuyers) : "0";
    %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Ligma Shop</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendors/feather/feather.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/resource/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style1.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logoLigma.png"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            #ordersChart {
                display: block !important;
                width: 600px !important;
                height: 300px !important;
                margin: 20px 0;
            }

            .card-body {
                overflow: visible !important;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .card-title-dash {
                font-size: 24px;
                font-weight: 600;
                color: #333;
                margin-bottom: 20px;
            }

            .dropdown {
                margin-bottom: 20px;
            }

            .dropdown-toggle {
                background-color: #007bff !important;
                color: white !important;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
            }

            .dropdown-toggle:hover {
                background-color: #0056b3 !important;
            }

            .dropdown-menu {
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .dropdown-item {
                font-size: 14px;
                padding: 8px 20px;
                color: #333;
            }

            .dropdown-item:hover {
                background-color: #007bff;
                color: white;
            }

            .statistics-details {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .statistics-title {
                font-size: 16px;
                color: #666;
            }

            .rate-percentage {
                font-size: 28px;
                font-weight: 700;
                color: #007bff;
            }
        </style>
    </head>

    <body class="with-welcome-text">
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
                            <img src="${pageContext.request.contextPath}/resource/images/LIGMA SHOP WHITE ON BLACK.png"
                                 alt="logo"/>
                        </a>
                        <a class="navbar-brand brand-logo-mini"
                           href="${pageContext.request.contextPath}/ligmaShop/admin/adminPage.jsp">
                            <img src="${pageContext.request.contextPath}/resource/images/logoLigma.png" alt="logo"/>
                        </a>
                    </div>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-top">
                    <ul class="navbar-nav">
                        <li class="nav-item fw-semibold d-none d-lg-block ms-0">
                            <h1 class="welcome-text">Xin Chào, ${sessionScope.user.getName()}</h1>
                            <h3 class="welcome-sub-text">Đây Là Tổng Doanh Thu Của Bạn</h3>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <form class="search-form" action="#">
                                <i class="icon-search"></i>
                                <input type="search" class="form-control" placeholder="Search Here" title="Search here">
                            </form>
                        </li>
                        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="img-xs rounded-circle"
                                     src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image"> </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                                <div class="dropdown-header text-center">
                                    <img class="img-md rounded-circle"
                                         src="${pageContext.request.contextPath}/resource/images/user.jpg" alt="Profile image">
                                    <p class="mb-1 mt-3 fw-semibold">${sessionScope.user.getName()}</p>
                                    <p class="fw-light text-muted mb-0">${sessionScope.user.getEmail()}</p>
                                </div>
                                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng Xuất</a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                            data-bs-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <div class="container-fluid page-body-wrapper">
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/ordersDayData">
                                <i class="mdi mdi-grid-large menu-icon"></i>
                                <span class="menu-title">Trang chủ</span>
                            </a>
                        </li>
                        <li class="nav-item nav-category">Công Cụ</li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
                               aria-controls="form-elements">
                                <i class="menu-icon mdi mdi-card-text-outline"></i>
                                <span class="menu-title">Quản Lý Cửa Hàng</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="form-elements">
                                <ul class="nav flex-column sub-menu">
                                    <!--                            <li class="nav-item"><a class="nav-link"
                                                                                        href="${pageContext.request.contextPath}/ligmaShop/admin/managerUser.jsp">Quản
                                                                    lí Người Dùng</a></li>-->
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/product/addNewProduct.jsp">Thêm Sản Phẩm</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/productManager">Danh Sách Sản Phẩm</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false"
                               aria-controls="auth">
                                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                                <span class="menu-title">Quản lý Khách hàng</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="auth">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/managerUser.jsp"> Quản Lý Người Dùng </a></li>
                                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ligmaShop/admin/addUser.jsp"> Thêm Người Dùng </a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="home-tab">
                                    <div class="d-sm-flex align-items-center justify-content-between border-bottom">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab"
                                                   href="#overview" role="tab" aria-controls="overview" aria-selected="true">Tổng
                                                    Quan</a>
                                            </li>
                                        </ul>
                                        <div>
                                            <div class="btn-wrapper">
                                                <a class="btn btn-otline-dark" onclick="window.print()"> <i
                                                        class="icon-printer"></i>In</a>
                                                <a href="#" class="btn btn-primary text-white me-0"><i
                                                        class="icon-download"></i> Tải Xuống</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-content tab-content-basic">
                                        <div class="tab-pane fade show active" id="overview" role="tabpanel"
                                             aria-labelledby="overview">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="statistics-details d-flex align-items-center justify-content-between">
                                                        <div>
                                                            <p class="statistics-title">Số Lượng Người Mua</p>
                                                            <h3 class="rate-percentage"><%= formattedBuyers %>
                                                            </h3>
                                                        </div>
                                                        <div>
                                                            <p class="statistics-title">Số Lượng Người Truy Cập Trang</p>
                                                            <h3 class="rate-percentage"><%=CountUser.activeUsers %>
                                                            </h3>
                                                        </div>
                                                        <div>
                                                            <p class="statistics-title">Tổng Doanh Thu
                                                                (Tháng <%= selectedMonth %>)</p>
                                                            <h3 class="rate-percentage"><%= formattedRevenue %> VNĐ</h3>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-8 d-flex flex-column">
                                                    <div class="row flex-grow">
                                                        <div class="col-12 grid-margin stretch-card">
                                                            <div class="card card-rounded">
                                                                <div class="card-body">
                                                                    <div class="d-sm-flex justify-content-between align-items-start">
                                                                        <div>
                                                                            <h4 class="card-title card-title-dash">Tổng Số Đơn
                                                                                Hàng Năm 2025</h4>
                                                                        </div>
                                                                        <div class="dropdown">
                                                                            <button class="btn btn-light dropdown-toggle toggle-dark btn-lg mb-0 me-0"
                                                                                    type="button" id="dropdownMenuButton2"
                                                                                    data-bs-toggle="dropdown"
                                                                                    aria-haspopup="true" aria-expanded="false">
                                                                                Tháng <%= selectedMonth %>
                                                                            </button>
                                                                            <div class="dropdown-menu"
                                                                                 aria-labelledby="dropdownMenuButton2">
                                                                                <h6 class="dropdown-header">Chọn Tháng</h6>
                                                                                <a class="dropdown-item" href="?month=1">Tháng
                                                                                    1</a>
                                                                                <a class="dropdown-item" href="?month=2">Tháng
                                                                                    2</a>
                                                                                <a class="dropdown-item" href="?month=3">Tháng
                                                                                    3</a>
                                                                                <a class="dropdown-item" href="?month=4">Tháng
                                                                                    4</a>
                                                                                <a class="dropdown-item" href="?month=5">Tháng
                                                                                    5</a>
                                                                                <a class="dropdown-item" href="?month=6">Tháng
                                                                                    6</a>
                                                                                <a class="dropdown-item" href="?month=7">Tháng
                                                                                    7</a>
                                                                                <a class="dropdown-item" href="?month=8">Tháng
                                                                                    8</a>
                                                                                <a class="dropdown-item" href="?month=9">Tháng
                                                                                    9</a>
                                                                                <a class="dropdown-item" href="?month=10">Tháng
                                                                                    10</a>
                                                                                <a class="dropdown-item" href="?month=11">Tháng
                                                                                    11</a>
                                                                                <a class="dropdown-item" href="?month=12">Tháng
                                                                                    12</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <canvas id="ordersChart" width="600"
                                                                                height="300"></canvas>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2023. All rights reserved.</span>
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
            <script>
                                                    window.addEventListener('DOMContentLoaded', function () {
                                                        const ordersData = <%= ordersJson %>;
                                                        console.log("ordersData:", ordersData);

                                                        if (!ordersData) {
                                                            console.error("ordersData is undefined or null");
                                                            return;
                                                        }
                                                        if (!Array.isArray(ordersData)) {
                                                            console.error("ordersData is not an array:", ordersData);
                                                            return;
                                                        }
                                                        if (ordersData.length === 0) {
                                                            console.warn("ordersData is empty");
                                                        }

                                                        // Tính số ngày trong tháng được chọn
                                                        const selectedMonth = <%= selectedMonth %>;
                                                        const daysInMonth = new Date(2025, selectedMonth, 0).getDate(); // Số ngày trong tháng
                                                        const days = Array.from({length: daysInMonth}, (_, i) => i + 1);

                                                        const orderCounts = days.map(day => {
                                                            const found = ordersData.find(item => item.orderDay === day);
                                                            return found ? Math.floor(found.orderCount) : 0;
                                                        });

                                                        console.log("days:", days);
                                                        console.log("orderCounts:", orderCounts);

                                                        const ctx = document.getElementById('ordersChart').getContext('2d');
                                                        if (!ctx) {
                                                            console.error("Không tìm thấy canvas với id 'ordersChart'");
                                                            return;
                                                        }

                                                        new Chart(ctx, {
                                                            type: 'bar',
                                                            data: {
                                                                labels: days,
                                                                datasets: [{
                                                                        label: 'Số đơn hàng',
                                                                        data: orderCounts,
                                                                        backgroundColor: 'rgba(75, 192, 192, 0.5)',
                                                                        borderColor: 'rgba(75, 192, 192, 1)',
                                                                        borderWidth: 1
                                                                    }]
                                                            },
                                                            options: {
                                                                responsive: true,
                                                                scales: {
                                                                    y: {
                                                                        beginAtZero: true,
                                                                        title: {
                                                                            display: true,
                                                                            text: 'Số đơn hàng'
                                                                        },
                                                                        ticks: {
                                                                            stepSize: 1,
                                                                            callback: function (value) {
                                                                                return Number.isInteger(value) ? value : null;
                                                                            }
                                                                        }
                                                                    },
                                                                    x: {
                                                                        title: {
                                                                            display: true,
                                                                            text: 'Ngày'
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    });
            </script>
        </div>
    </body>
</html>