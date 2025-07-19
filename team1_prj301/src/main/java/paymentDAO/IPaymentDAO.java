
package paymentDAO;

import java.math.BigDecimal;
import java.util.Map;
import model.Cart;

public interface IPaymentDAO {
 public void processPayment(Map<String, String> pendingTransaction, String transactionId, BigDecimal totalAmount, Cart cart);    
}
