package cartDAO;

import Utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.Cartitems;
import model.Cart;
import model.Productsizecolor;
import java.util.Date;
import java.util.List;
import Utils.JpaUtil;
import dao.DBConnection;
import jakarta.persistence.NoResultException;
import model.Users;

public class CartDAO implements ICartDao {

      private EntityManager em;

      public CartDAO() {
            em = DBConnection.getEntityManager();
      }

      @Override
      public void saveCart(Cart cart) {
            try {
                  em.getTransaction().begin();
                  if (cart.getCartID() == null) {
                        em.persist(cart); // Thêm mới
                  } else {
                        em.merge(cart); // Cập nhật
                  }
                  em.getTransaction().commit();
            } catch (Exception e) {
                  em.getTransaction().rollback();
                  e.printStackTrace();
            }
//            finally {
//            em.close();
//        }
      }

      @Override
      public Cart getCartByUser(Users user) {
            EntityManager em = DBConnection.getEntityManager();
            try {
                  em.clear(); // Xóa first-level cache
                  TypedQuery<Cart> query = em.createQuery(
                          "SELECT c FROM Cart c LEFT JOIN FETCH c.cartitemsCollection WHERE c.userID = :user", Cart.class);
                  query.setParameter("user", user);
                  return query.getSingleResult();
            } catch (NoResultException e) {
                  return null;
            } catch (Exception e) {
                  e.printStackTrace();
                  return null;
            }
      }

      @Override
      public void saveCartItem(Cartitems cartItem) {
            try {
                  em.getTransaction().begin();
                  if (cartItem.getCartItemID() == null) {
                        em.persist(cartItem); // Thêm mới
                  } else {
                        em.merge(cartItem); // Cập nhật
                  }
                  em.getTransaction().commit();
            } catch (Exception e) {
                  em.getTransaction().rollback();
                  e.printStackTrace();
            }
//            finally {
//            em.close();
//        }
      }

      @Override
      public void removeCartItem(int cartItemId) {
            EntityManager em = DBConnection.getEntityManager();
            try {
                  em.getTransaction().begin();
                  Cartitems item = em.find(Cartitems.class, cartItemId);
                  if (item == null) {
                        throw new IllegalArgumentException("Không tìm thấy mục với ID: " + cartItemId);
                  }

                  // Kiểm tra quyền sở hữu
                  Cart cart = item.getCartID();
                  if (cart == null) {
                        throw new IllegalStateException("Mục không thuộc về giỏ hàng nào.");
                  }

                  // Lấy userID từ cart để kiểm tra (cần truyền userID từ CartServlet)
                  // Vì userID không được truyền trực tiếp, chúng ta sẽ dựa vào CartServlet để kiểm tra
                  // Do đó, chúng ta sẽ bỏ kiểm tra quyền sở hữu ở đây và để CartServlet xử lý
                  em.remove(item);
                  em.getTransaction().commit();
            } catch (Exception e) {
                  if (em.getTransaction().isActive()) {
                        em.getTransaction().rollback();
                  }
                  throw new RuntimeException("Lỗi khi xóa Cartitems: " + e.getMessage(), e);
            } finally {
                  em.close();
            }
      }

      public void clearCartItems(Cart cart) {
            EntityManager em = DBConnection.getEntityManager();
            EntityTransaction transaction = em.getTransaction();
            try {
                  transaction.begin();
                  int deletedCount = em.createQuery("DELETE FROM Cartitems ci WHERE ci.cartID = :cart")
                          .setParameter("cart", cart)
                          .executeUpdate();
                  transaction.commit();
                  System.out.println("Deleted " + deletedCount + " cart items for cart ID: " + cart.getCartID());
            } catch (Exception e) {
                  if (transaction.isActive()) {
                        transaction.rollback();
                  }
                  throw new RuntimeException("Error clearing cart items: " + e.getMessage(), e);
            }
      }
}
