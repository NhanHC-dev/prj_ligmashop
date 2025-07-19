package productDAO;

import jakarta.persistence.NoResultException;
import productDAO.*;
import java.util.List;
import model.*;
import java.sql.SQLException;
import java.util.Map;

public interface IProductDAO {
//    public void insertProduct (Product pro) throws SQLException;

    public Products selectProduct(int id);
//

    public List<Products> selectAllProducts();

    public List<Products> searchProduct(String keyword);

    Map<Integer, Long> getTotalSoldByProduct() throws NoResultException;

    public Map<Integer, Double> getAverageRatingByProduct() throws NoResultException;

    public List<Products> getAllProductsSortedByPrice(String sortOrder) throws NoResultException;//    public boolean deleteProduct (int id) throws SQLException;
    //
    //    public boolean updateProduct (Product pro) throws SQLException;

}
