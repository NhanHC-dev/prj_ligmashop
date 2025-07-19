package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import model.OrderDayData;

import orderDAO.OrderDAO;

@WebServlet("/ordersDayData")
public class OrdersDayServlet extends HttpServlet {
    private OrderDAO orderDAO = new OrderDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrderDayData> ordersList = new ArrayList<>();
        double totalRevenue = 0.0; // Biến để lưu tổng doanh thu
        int totalBuyers = 0; // Biến để lưu tổng số người mua

        // Lấy tham số month từ request (mặc định là tháng 2 nếu không có)
        String monthParam = request.getParameter("month");
        int month = monthParam != null ? Integer.parseInt(monthParam) : 2; // Mặc định là tháng 2
        if (month < 1 || month > 12) {
            month = 2; // Đảm bảo tháng hợp lệ
        }

        // Tính ngày đầu và ngày cuối của tháng
        String year = "2025"; // Năm cố định
        String startDate = String.format("%s-%02d-01", year, month); // Ngày đầu tháng
        int daysInMonth = new java.util.GregorianCalendar(Integer.parseInt(year), month - 1, 1).getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        String endDate = String.format("%s-%02d-%02d", year, month, daysInMonth); // Ngày cuối tháng

        try {
            ordersList = orderDAO.getOrderCountsByDay(startDate, endDate);
            totalRevenue = orderDAO.getTotalRevenue(startDate, endDate);
            totalBuyers = orderDAO.getTotalBuyers(startDate, endDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // Log dữ liệu để debug
        System.out.println("ordersList for month " + month + ": " + ordersList);
        System.out.println("Total Revenue for month " + month + ": " + totalRevenue);
        System.out.println("Total Buyers for month " + month + ": " + totalBuyers);


        // Gán dữ liệu vào request attribute
        request.setAttribute("ordersList", ordersList);
        request.setAttribute("totalRevenue", totalRevenue); // Truyền tổng doanh thu sang JSP
        request.setAttribute("totalBuyers", totalBuyers);   // Truyền tổng số người mua sang JSP
        // Forward sang JSP để hiển thị
        request.getRequestDispatcher("/ligmaShop/admin/adminPage.jsp").forward(request, response);
    }
}