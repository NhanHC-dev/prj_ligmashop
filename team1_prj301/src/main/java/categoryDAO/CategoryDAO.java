package categoryDAO;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import jakarta.xml.soap.SOAPFault;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.ProductCategories;
import model.Products;

public class CategoryDAO {

    private EntityManager em;

    public CategoryDAO() {
        em = DBConnection.getEntityManager();
    }

    public List<ProductCategories> categorizeProductWithWeather(int categoryID, String condition) throws NoResultException {
        String[] hotKeywords
                = {
                    "ngắn", "sơ", "jean", "kaki", "thể thao", "croptop", "sát", "nắng"
                };
        String[] coldKeywords
                = {
                    "khoác", "jean", "kaki", "len", "hoodie", "dài", "cổ"
                };

        // Base query with parameter placeholders
        StringBuilder query = new StringBuilder("SELECT p FROM ProductCategories p WHERE p.categoryID.categoryID = :categoryID AND (");

        // Select keywords based on condition
        String[] keywords = condition.equalsIgnoreCase("hot") ? hotKeywords : coldKeywords;

        // Build LIKE clauses for each keyword with parameters
        for (int i = 0; i < keywords.length; i++) {
            query.append("p.productID.productName LIKE :keyword").append(i);
            if (i < keywords.length - 1) {
                query.append(" OR ");
            }
        }
        query.append(")");

        // Create and parameterize the query
        TypedQuery<ProductCategories> typedQuery = em.createQuery(query.toString(), ProductCategories.class);
        typedQuery.setParameter("categoryID", categoryID);
        for (int i = 0; i < keywords.length; i++) {
            typedQuery.setParameter("keyword" + i, "%" + keywords[i] + "%");
        }

        // Debugging
        System.out.println("Generated Query: " + query.toString());
        return typedQuery.getResultList();
    }

    public List<Products> categorizeProductWithWeather(List<Products> products, String condition) {
        String[] hotKeywords
                = {
                    "ngắn", "sơ", "jean", "kaki", "thể thao", "croptop", "sát", "nắng"
                };
        String[] coldKeywords
                = {
                    "khoác", "jean", "kaki", "len", "hoodie", "dài", "cổ"
                };
        List<Products> newProducts = new ArrayList<>();
        for (Products p : products) {
            if (condition.equals("hot")) {
                for (String hotKeyword : hotKeywords) {
                    if (p.getProductName().toLowerCase().contains(hotKeyword)) {
                        newProducts.add(p);
                    }
                }
            } else if (condition.equals("cold")) {
                for (String coldKeyword : coldKeywords) {
                    if (p.getProductName().toLowerCase().contains(coldKeyword)) {
                        newProducts.add(p);
                    }
                }
            }
        }
        return newProducts;
    }

    public List<Products> categorizeProducts(int categoryID, String keyword) {
        TypedQuery<Products> query = em.createNamedQuery("ProductCategories.categorizeProducts", Products.class);
        query.setParameter("categoryID", categoryID);
        query.setParameter("keyword", "%" + keyword + "%"); // Thêm dấu % để tìm kiếm LIKE
        return query.getResultList();
    }   

//    public static void main(String[] args) {
//        CategoryDAO cata = new CategoryDAO();
//        List<Products> list = cata.categorizeProducts(1);
//        System.out.println("MORE  NIGGA LIST");
//        List<Products> niggaList = cata.categorizeProductWithWeather(list, "hot");
//        niggaList.forEach(System.out::println);
//    }
}
