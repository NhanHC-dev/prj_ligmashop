package paymentDAO;

import cartDAO.CartDAO;
import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import model.Cart;
import model.Cartitems;
import model.Orderdetails;
import model.Orders;
import model.PaymentMethods;
import model.Users;
import productDAO.ProductDAO;

public class PaymentDAO implements IPaymentDAO {
    private EntityManager em;
    private ProductDAO productDAO;
    private CartDAO cartDAO;

    public PaymentDAO() {
        this.em = DBConnection.getEntityManager();
        this.productDAO = new ProductDAO();
        this.cartDAO = new CartDAO();
    }

    @Override
    public void processPayment(Map<String, String> pendingTransaction, String transactionId, BigDecimal totalAmount, Cart cart) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();

            Orders order = new Orders();
            order.setOrderDate(new Date());
            order.setTotalAmount(totalAmount);
            Users user = em.find(Users.class, getUserIdFromPendingTransaction(pendingTransaction));
            order.setUserID(user);
            PaymentMethods paymentMethod = em.find(PaymentMethods.class, 2);
            order.setPaymentMethodID(paymentMethod);
            em.persist(order);

            // Debug cart
            System.out.println("Cart object: " + (cart != null ? "Not null" : "Null"));
            if (cart != null) {
                System.out.println("Cart ID: " + cart.getCartID());
                System.out.println("Cart items collection: " + (cart.getCartitemsCollection() != null ? "Not null" : "Null"));
                if (cart.getCartitemsCollection() != null) {
                    System.out.println("Processing " + cart.getCartitemsCollection().size() + " cart items");
                    for (Cartitems item : cart.getCartitemsCollection()) {
                        Orderdetails detail = new Orderdetails();
                        detail.setOrderID(order);
                        detail.setProductSizeColorID(item.getProductSizeColorID());
                        detail.setQuantity(item.getQuantity());
                        // Nếu có Price trong Orderdetails, thêm vào đây
                        // detail.setPrice(item.getPrice());
                        em.persist(detail);
                        System.out.println("Saved Orderdetail for ProductSizeColorID: " + item.getProductSizeColorID().getProductSizeColorID());
                    }
                } else {
                    System.out.println("Cart items collection is null");
                }
                productDAO.updateStockFromCart(cart);
                cartDAO.clearCartItems(cart);
            } else {
                System.out.println("Cart is null, skipping order details creation");
            }

            transaction.commit();
            System.out.println("Order saved, stock updated, and cart cleared successfully. OrderID: " + order.getOrderID());
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new RuntimeException("Error processing payment: " + e.getMessage(), e);
        }
    }

    private int getUserIdFromPendingTransaction(Map<String, String> pendingTransaction) {
        String userIdStr = pendingTransaction.get("userId");
        return userIdStr != null ? Integer.parseInt(userIdStr) : 1;
    }
}