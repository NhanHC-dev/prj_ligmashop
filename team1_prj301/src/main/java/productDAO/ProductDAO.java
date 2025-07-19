package productDAO;

import dao.DBConnection;
import java.util.List;
import model.*;
import jakarta.persistence.*;
import java.util.HashMap;
import java.util.Map;

public class ProductDAO implements IProductDAO {

      private EntityManager em;

      public ProductDAO() {
            em = DBConnection.getEntityManager();
      }

      @Override
      public List<Products> searchProduct(String keyword) throws NoResultException {
            TypedQuery<Products> query = em.createNamedQuery("Products.searchProducts", Products.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
      }

      @Override
      public Products selectProduct(int id) throws NoResultException {
            TypedQuery<Products> query = em.createNamedQuery("Products.selectByID", Products.class);
            query.setParameter("productID", id);
            return query.getSingleResult();
      }

      @Override
      public List<Products> selectAllProducts() throws NoResultException {
            TypedQuery<Products> query = em.createNamedQuery("Products.selectAll", Products.class);
            return query.getResultList();
      }

      public List<Categories> selectAllCategory() throws NoResultException {
            TypedQuery<Categories> query = em.createNamedQuery("Categories.findAll", Categories.class);
            return query.getResultList();
      }

      @Override
      public Map<Integer, Long> getTotalSoldByProduct() throws NoResultException {
            TypedQuery<Object[]> query = em.createQuery(
                    "SELECT psc.productID.productID, SUM(od.quantity) "
                    + "FROM Orderdetails od "
                    + "JOIN od.productSizeColorID psc "
                    + "GROUP BY psc.productID.productID",
                    Object[].class
            );
            List<Object[]> soldData = query.getResultList();

            Map<Integer, Long> soldMap = new HashMap<>();
            for (Object[] data : soldData) {
                  Integer productId = (Integer) data[0];
                  Long totalSold = (Long) data[1];
                  soldMap.put(productId, totalSold);
            }
            return soldMap;
      }

      @Override
      public Map<Integer, Double> getAverageRatingByProduct() throws NoResultException {
            TypedQuery<Object[]> query = em.createQuery(
                    "SELECT r.productID.productID, AVG(r.rating) "
                    + "FROM Reviews r "
                    + "GROUP BY r.productID.productID",
                    Object[].class
            );
            List<Object[]> ratingData = query.getResultList();

            Map<Integer, Double> ratingMap = new HashMap<>();
            for (Object[] data : ratingData) {
                  Integer productId = (Integer) data[0];
                  Double avgRating = (Double) data[1];
                  ratingMap.put(productId, avgRating);
            }
            return ratingMap;
      }

      @Override
      public List<Products> getAllProductsSortedByPrice(String sortOrder) throws NoResultException {
            try {
                  String jpql = "SELECT p FROM Products p ORDER BY (p.price - (p.price * p.discount / 100)) "
                          + (sortOrder != null && sortOrder.equals("desc") ? "DESC" : "ASC");
                  TypedQuery<Products> query = em.createQuery(jpql, Products.class);
                  List<Products> results = query.getResultList();

                  if (results == null || results.isEmpty()) {
                        throw new NoResultException("Không tìm thấy sản phẩm nào.");
                  }
                  return results;
            } catch (Exception e) {
                  throw new NoResultException("Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
            }
      }

      public void addProduct(Products product) {
            EntityManager em = DBConnection.getEntityManager();
            try {
                  em.getTransaction().begin();
                  em.persist(product);
                  em.getTransaction().commit();
            } catch (Exception e) {
                  em.getTransaction().rollback();
                  throw e;
            } finally {
                  em.close();
            }
      }

      public void updateProduct(Products product) {
            EntityManager em = DBConnection.getEntityManager();
            try {
                  em.getTransaction().begin();
                  em.merge(product);
                  em.getTransaction().commit();
            } catch (Exception e) {
                  em.getTransaction().rollback();
                  throw e;
            } finally {
                  em.close();
            }
      }

      public void updateInventoryQuantity(int productSizeColorId, int quantityPurchased) {
            EntityTransaction transaction = em.getTransaction();
            try {
                  transaction.begin();
                  TypedQuery<Inventory> query = em.createQuery(
                          "SELECT i FROM Inventory i WHERE i.productSizeColorID.productSizeColorID = :productSizeColorId",
                          Inventory.class);
                  query.setParameter("productSizeColorId", productSizeColorId);
                  Inventory inventory = query.getSingleResult();

                  if (inventory != null) {
                        int currentStock = inventory.getStock() != null ? inventory.getStock() : 0;
                        if (currentStock >= quantityPurchased) {
                              inventory.setStock(currentStock - quantityPurchased);
                              inventory.setLastUpdated(new java.util.Date());
                              em.merge(inventory);
                        } else {
                              throw new IllegalStateException("Số lượng trong kho không đủ cho ProductSizeColorID: " + productSizeColorId);
                        }
                  } else {
                        throw new NoResultException("Không tìm thấy Inventory cho ProductSizeColorID: " + productSizeColorId);
                  }
                  transaction.commit();
            } catch (Exception e) {
                  if (transaction.isActive()) {
                        transaction.rollback();
                  }
                  throw new RuntimeException("Lỗi khi cập nhật số lượng trong Inventory: " + e.getMessage(), e);
            }
      }

      public void updateStockFromCart(Cart cart) {
            if (cart == null || cart.getCartitemsCollection() == null) {
                  throw new IllegalArgumentException("Cart hoặc Cartitems rỗng");
            }
            for (Cartitems item : cart.getCartitemsCollection()) {
                  int productSizeColorId = item.getProductSizeColorID().getProductSizeColorID();
                  int quantity = item.getQuantity();
                  updateInventoryQuantity(productSizeColorId, quantity);
            }
      }
}
