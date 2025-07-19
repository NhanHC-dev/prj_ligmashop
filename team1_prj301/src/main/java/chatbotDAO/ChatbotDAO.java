package chatbotDAO;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.*;
import java.util.List;

public class ChatbotDAO {
    private EntityManager em;
    public ChatbotDAO() {
        em = DBConnection.getEntityManager();
    }

    public String getPrice(String productName) {
        try {
            Query query = em.createQuery("SELECT p FROM Products p WHERE p.productName LIKE :name AND p.status = TRUE");
            query.setParameter("name", "%" + productName + "%");
            Products product = (Products) query.setMaxResults(1).getSingleResult();

            // Convert BigDecimal price to double, handle null case
            double price = product.getPrice() != null ? product.getPrice().doubleValue() : 0.0;
            // Convert Integer discount to double, handle null case
            double discount = product.getDiscount() != null ? product.getDiscount() : 0;
            // Calculate final price as double
            double finalPrice = price * (1 - discount / 100.0);

            return "🛍️ Sản phẩm '" + product.getProductName() + "' có giá " + finalPrice + " VNĐ (đã giảm giá).";
        } catch (Exception e) {
            return "⚠️ Không tìm thấy sản phẩm '" + productName + "'.";
        }
    }

    public String getSizes(String productName) {
        try {
            Query query = em.createQuery(
                "SELECT DISTINCT s.sizeName FROM Productsizecolor psc " +
                "JOIN psc.productID p " +
                "JOIN psc.sizeID s " +
                "WHERE p.productName LIKE :name AND p.status = TRUE", 
                String.class
            );
            query.setParameter("name", "%" + productName + "%");
            List<String> sizes = query.getResultList();
            if (!sizes.isEmpty()) {
                return "📏 Sản phẩm có các kích cỡ: " + String.join(", ", sizes) + ".";
            }
            return "⚠️ Không tìm thấy kích cỡ cho '" + productName + "'.";
        } catch (Exception e) {
            return "⚠️ Lỗi khi tìm kích cỡ cho '" + productName + "': " + e.getMessage();
        }
    }

    public String getColors(String productName) {
        try {
            Query query = em.createQuery(
                "SELECT DISTINCT c.colorName FROM Productsizecolor psc " +
                "JOIN psc.productID p " +
                "JOIN psc.colorID c " +
                "WHERE p.productName LIKE :name AND p.status = TRUE", 
                String.class
            );
            query.setParameter("name", "%" + productName + "%");
            List<String> colors = query.getResultList();
            if (!colors.isEmpty()) {
                return "🎨 Sản phẩm có các màu: " + String.join(", ", colors) + ".";
            }
            return "⚠️ Không tìm thấy màu cho '" + productName + "'.";
        } catch (Exception e) {
            return "⚠️ Lỗi khi tìm màu cho '" + productName + "': " + e.getMessage();
        }
    }

    public String checkAvailabilityWithSizeAndColor(String productName, String size, String color) {
        try {
            String jpql = "SELECT psc FROM Productsizecolor psc JOIN psc.product p " +
                         "WHERE p.productName LIKE :name AND p.status = TRUE";
            if (size != null) jpql += " AND UPPER(TRIM(psc.size.sizeName)) = UPPER(:size)";
            if (color != null) jpql += " AND UPPER(TRIM(psc.color.colorName)) = UPPER(:color)";
            
            Query query = em.createQuery(jpql);
            query.setParameter("name", "%" + productName + "%");
            if (size != null) query.setParameter("size", size.trim());
            if (color != null) query.setParameter("color", color.trim());
            
            Productsizecolor psc = (Productsizecolor) query.setMaxResults(1).getSingleResult();
            Products product = psc.getProductID();
            double adjustedPrice = product.getPrice().doubleValue();
            if (size != null) {
                if (size.equalsIgnoreCase("XL")) adjustedPrice += 50000;
                else if (size.equalsIgnoreCase("XXL")) adjustedPrice += 80000;
            }
            StringBuilder response = new StringBuilder("✅ Sản phẩm '" + product.getProductName() + "' ");
            if (size != null) response.append("size ").append(psc.getSizeID().getSizeName()).append(" ");
            if (color != null) response.append("màu ").append(psc.getColorID().getColorName()).append(" ");
            response.append("có sẵn với giá ").append(adjustedPrice).append(" VNĐ!");
            return response.toString();
        } catch (Exception e) {
            StringBuilder response = new StringBuilder("❌ Sản phẩm '" + productName + "' ");
            if (size != null) response.append("size ").append(size).append(" ");
            if (color != null) response.append("màu ").append(color).append(" ");
            response.append("hiện không có sẵn hoặc không tồn tại.");
            return response.toString();
        }
    }

    public String getDiscount(String productName) {
        try {
            Query query = em.createQuery(
                "SELECT p FROM Products p WHERE p.productName LIKE :name AND p.status = TRUE",
                Products.class
            );
            query.setParameter("name", "%" + productName + "%");
            Products product = (Products) query.setMaxResults(1).getSingleResult();
            Integer discount = product.getDiscount();
            if (discount != null && discount > 0) {
                return "💰 Sản phẩm '" + product.getProductName() + "' có giảm giá " + discount + "%.";
            } else {
                return "⚠️ Sản phẩm '" + product.getProductName() + "' không có giảm giá.";
            }
        } catch (Exception e) {
            return "⚠️ Lỗi khi tìm giảm giá cho '" + productName + "': " + e.getMessage();
        }
    }

    public String getRating(String productName) {
        try {
            Query query = em.createQuery(
                "SELECT AVG(r.rating) FROM Reviews r JOIN r.productID p " +
                "WHERE p.productName LIKE :name AND p.status = TRUE",
                Double.class
            );
            query.setParameter("name", "%" + productName + "%");
            Double avgRating = (Double) query.getSingleResult();
            if (avgRating != null) {
                return "⭐ Sản phẩm '" + productName + "' có đánh giá trung bình: " + avgRating + "⭐.";
            }
            return "⚠️ Sản phẩm '" + productName + "' chưa có đánh giá.";
        } catch (Exception e) {
            return "⚠️ Lỗi khi tìm đánh giá cho '" + productName + "': " + e.getMessage();
        } finally {
            em.close();
        }
}

    public String getAllProducts() {
        try {
            Query query = em.createQuery("SELECT p.productName FROM Products p WHERE p.status = TRUE ORDER BY p.productName");
            List<String> products = query.getResultList();
            if (!products.isEmpty()) {
                return "🛒 Tất cả sản phẩm mà shop bán: " + String.join(", ", products) + ".";
            }
            return "⚠️ Hiện tại shop không có sản phẩm nào.";
        } finally {
            em.close();
        }
    }

    public String getProductsByCategory(String categoryName) {
        try {
            Query query = em.createQuery(
                "SELECT p.productName FROM Products p " +
                "JOIN p.productCategoriesCollection pc " +
                "JOIN pc.categoryID c " +
                "WHERE c.categoryName LIKE :name AND p.status = TRUE",
                String.class
            );
            query.setParameter("name", "%" + categoryName + "%");
            List<String> products = query.getResultList();
            if (!products.isEmpty()) {
                return "🛒 Sản phẩm trong danh mục '" + categoryName + "': " + String.join(", ", products) + ".";
            }
            return "⚠️ Không tìm thấy sản phẩm nào trong danh mục '" + categoryName + "'.";
        } catch (Exception e) {
            return "⚠️ Lỗi khi tìm sản phẩm trong danh mục '" + categoryName + "': " + e.getMessage();
        } finally {
            em.close();
        }
    }
}