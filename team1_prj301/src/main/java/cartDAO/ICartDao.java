package cartDAO;

import java.util.List;
import model.Cart;
import model.Cartitems;
import model.Products;
import model.Productsizecolor;
import model.Users;

public interface ICartDao {

      void saveCart(Cart cart);

      Cart getCartByUser(Users user);

      void saveCartItem(Cartitems cartItem);

      void removeCartItem(int cartItemId);
}
