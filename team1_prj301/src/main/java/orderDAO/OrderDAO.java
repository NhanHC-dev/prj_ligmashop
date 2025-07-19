/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package orderDAO;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import model.OrderDayData;
import model.Orders;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderDAO implements IOrderDAO {

    private EntityManager em;

    public OrderDAO() {
        em = DBConnection.getEntityManager();
    }

    @Override
    public int countUser() throws NoResultException {
        Long count = (Long) em.createNamedQuery("Orders.countUsers").getSingleResult();
        return count.intValue(); // hoặc return count nếu bạn muốn kiểu Long
    }
    public List<OrderDayData> getOrderCountsByDay(String startDateStr, String endDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startDateStr);
        Date endDate = sdf.parse(endDateStr);
        String jpql = "SELECT new model.OrderDayData(DAY(o.orderDate), COUNT(o)) " +
                "FROM Orders o " +
                "WHERE o.orderDate BETWEEN :startDate AND :endDate " +
                "GROUP BY DAY(o.orderDate) " +
                "ORDER BY DAY(o.orderDate)";
        TypedQuery<OrderDayData> query = em.createQuery(jpql, OrderDayData.class);
        query.setParameter("startDate", startDate);
        query.setParameter("endDate", endDate);
        return query.getResultList();
    }

    public double getTotalRevenue(String startDateStr, String endDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startDateStr);
        Date endDate = sdf.parse(endDateStr);
        String jpql = "SELECT SUM(o.totalAmount) FROM Orders o " +
                "WHERE o.orderDate BETWEEN :startDate AND :endDate";
        TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
        query.setParameter("startDate", startDate);
        query.setParameter("endDate", endDate);
        Double result = query.getSingleResult().doubleValue();
        return result != null ? result : 0.0;
    }

    public int getTotalBuyers(String startDateStr, String endDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startDateStr);
        Date endDate = sdf.parse(endDateStr);
        String jpql = "SELECT COUNT(DISTINCT o.userID) FROM Orders o " +
                "WHERE o.orderDate BETWEEN :startDate AND :endDate";
        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
        query.setParameter("startDate", startDate);
        query.setParameter("endDate", endDate);
        Long result = query.getSingleResult();
        return result != null ? result.intValue() : 0;
    }
}
