package controller;

import cartDAO.CartDAO;
import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Cartitems;
import model.Products;
import model.Productsizecolor;
import model.Users;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

      private CartDAO cartDAO = new CartDAO();

      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");

            if (user == null) {
                  response.sendRedirect(request.getContextPath() + "/ligmaShop/login/signIn.jsp");
                  return;
            }
            if (session.getAttribute("csrfToken") == null) {
                  String csrfToken = UUID.randomUUID().toString();
                  session.setAttribute("csrfToken", csrfToken);
            }
            try {
//                  Cart cart = cartDAO.getCartByUser(user);
                  Cart cart = (Cart) session.getAttribute("cart");
                  if (cart == null) {
                        cart = cartDAO.getCartByUser(user);
                        if (cart == null) {
                              cart = new Cart();
                              cart.setUserID(user);
                              cart.setCreatedDate(new Date());
                              cart.setCartitemsCollection(new ArrayList<>());
                              cartDAO.saveCart(cart);
                        }
                        session.setAttribute("cart", cart);
                  }

                  Collection<Cartitems> cartItems = cart.getCartitemsCollection();
                  if (cartItems == null) {
                        cartItems = new ArrayList<>();
                        cart.setCartitemsCollection(cartItems);
                  }

                  double totalAmount = 0;
                  for (Cartitems item : cartItems) {
                        Productsizecolor productSizeColor = item.getProductSizeColorID();
                        if (productSizeColor == null) {
                              continue; // Bỏ qua nếu productSizeColor không tồn tại
                        }

                        Products product = productSizeColor.getProductID();
                        if (product == null) {
                              continue; // Bỏ qua nếu product không tồn tại
                        }

                        // Lấy giá gốc và discount từ product
                        BigDecimal basePrice = product.getPrice();
                        if (basePrice == null) {
                              continue; // Bỏ qua nếu giá không tồn tại
                        }

                        // Điều chỉnh giá theo kích thước (tương tự logic trong productDetail.jsp)
                        BigDecimal priceAdjustment = BigDecimal.ZERO;
                        String sizeName = productSizeColor.getSizeID() != null ? productSizeColor.getSizeID().getSizeName() : null;
                        if ("XL".equals(sizeName)) {
                              priceAdjustment = new BigDecimal("50000");
                        } else if ("XXL".equals(sizeName)) {
                              priceAdjustment = new BigDecimal("100000");
                        }

                        BigDecimal adjustedPrice = basePrice.add(priceAdjustment);

                        // Tính giá đã giảm
                        double discount = product.getDiscount() != null ? product.getDiscount() : 0.0;
                        BigDecimal discountedPrice = adjustedPrice.subtract(
                                adjustedPrice.multiply(BigDecimal.valueOf(discount)).divide(BigDecimal.valueOf(100))
                        );

                        // Tính tổng
                        totalAmount += discountedPrice.doubleValue() * item.getQuantity();
                  }

                  session.setAttribute("cartItems", cartItems);
//                  request.setAttribute("cartItems", cartItems);
                  request.setAttribute("totalAmount", totalAmount);
                  request.getRequestDispatcher("/ligmaShop/cart/cart.jsp").forward(request, response);
                  // response.sendRedirect(request.getContextPath()+"/ligmaShop/login/cart.jsp");
            } catch (Exception e) {
                  session.setAttribute("error", "Không thể tải giỏ hàng: " + e.getMessage());
                  response.sendRedirect(request.getContextPath() + "/ligmaShop/cart/error.jsp");
            }
      }

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");

            if (user == null) {
                  response.sendRedirect(request.getContextPath() + "/ligmaShop/login/signIn.jsp");
                  return;
            }

            try {
                  session.removeAttribute("cart");
                  Cart cart = cartDAO.getCartByUser(user);
                  if (cart == null) {
                        cart = new Cart();
                        cart.setUserID(user);
                        cart.setCreatedDate(new Date());
                        cart.setCartitemsCollection(new ArrayList<>());
                        cartDAO.saveCart(cart);
                  }

                  String action = request.getParameter("action");
                  if (action == null) {
                        action = "add";
                  }
//                  String csrfToken = request.getParameter("csrfToken");
//                  String sessionCsrfToken = (String) session.getAttribute("csrfToken");
//                  if (csrfToken == null || !csrfToken.equals(sessionCsrfToken)) {
//                        session.setAttribute("error", "Yêu cầu không hợp lệ. Vui lòng thử lại.");
//                        response.sendRedirect("cart");
//                        return;
//                  }

                  switch (action) {
                        case "add":
                              addToCart(request, cart);
                              break;
                        case "update":
                              updateCartItem(request, cart);
                              break;
                        case "remove":
                              removeCartItem(request, cart);
                              // cart = cartDAO.getCartByUser(user);
                              break;
                        default:
                              break;
                  }
//                  String newCsrfToken = UUID.randomUUID().toString();
//                  session.setAttribute("csrfToken", newCsrfToken);
//                  
                  cart = cartDAO.getCartByUser(user);
                  session.setAttribute("cart", cart);

                  response.sendRedirect(request.getContextPath() + "/cart");
            } catch (Exception e) {
                  session.setAttribute("error", "Có lỗi xảy ra khi xử lý giỏ hàng: " + e.getMessage());
                  response.sendRedirect("cart");
            }
      }

      private void addToCart(HttpServletRequest request, Cart cart) {
            try {
                  String productSizeColorIDStr = request.getParameter("productSizeColorID");
                  String quantityStr = request.getParameter("quantity");

                  int productSizeColorID = Integer.parseInt(productSizeColorIDStr);
                  int quantity = Integer.parseInt(quantityStr);

                  if (quantity <= 0) {
                        throw new IllegalArgumentException("Số lượng phải lớn hơn 0.");
                  }

                  EntityManager em = DBConnection.getEntityManager();
                  try {
                        Productsizecolor productSizeColor = em.find(Productsizecolor.class, productSizeColorID);
                        if (productSizeColor == null) {
                              throw new IllegalArgumentException("Sản phẩm không tồn tại.");
                        }

                        Cartitems cartItem = new Cartitems();
                        cartItem.setCartID(cart);
                        cartItem.setProductSizeColorID(productSizeColor);
                        cartItem.setQuantity(quantity);
                        cartItem.setAddedDate(new Date());

                        Collection<Cartitems> cartItems = cart.getCartitemsCollection();
                        if (cartItems == null) {
                              cartItems = new ArrayList<>();
                              cart.setCartitemsCollection(cartItems);
                        }

                        boolean itemExists = false;
                        for (Cartitems item : cartItems) {
                              if (item.getProductSizeColorID().getProductSizeColorID().equals(productSizeColorID)) {
                                    item.setQuantity(item.getQuantity() + quantity);
                                    cartDAO.saveCartItem(item);
                                    itemExists = true;
                                    break;
                              }
                        }

                        if (!itemExists) {
                              cartItems.add(cartItem);
                              cartDAO.saveCart(cart);
                        }
                  } finally {
                        em.close();
                  }
            } catch (NumberFormatException e) {
                  throw new IllegalArgumentException("Dữ liệu không hợp lệ: " + e.getMessage());
            } catch (Exception e) {
                  throw new RuntimeException("Lỗi khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
            }
      }

      private void updateCartItem(HttpServletRequest request, Cart cart) {
            try {
                  int cartItemId = Integer.parseInt(request.getParameter("cartItemID"));
                  int newQuantity = Integer.parseInt(request.getParameter("quantity"));

                  Collection<Cartitems> cartItems = cart.getCartitemsCollection();
                  if (cartItems == null) {
                        throw new IllegalStateException("Giỏ hàng trống.");
                  }

                  for (Cartitems item : cartItems) {
                        if (item.getCartItemID().equals(cartItemId)) {
                              if (newQuantity > 0) {
                                    item.setQuantity(newQuantity);
                                    cartDAO.saveCartItem(item);
                              } else {
                                    cartDAO.removeCartItem(cartItemId);
                              }
                              break;
                        }
                  }
            } catch (NumberFormatException e) {
                  throw new IllegalArgumentException("Dữ liệu không hợp lệ: " + e.getMessage());
            } catch (Exception e) {
                  throw new RuntimeException("Lỗi khi cập nhật giỏ hàng: " + e.getMessage());
            }
      }

      private void removeCartItem(HttpServletRequest request, Cart cart) {
            try {
                  int cartItemId = Integer.parseInt(request.getParameter("cartItemID"));
                  cartDAO.removeCartItem(cartItemId);
            } catch (NumberFormatException e) {
                  throw new IllegalArgumentException("Dữ liệu không hợp lệ: " + e.getMessage());
            } catch (Exception e) {
                  throw new RuntimeException("Lỗi khi xóa mục khỏi giỏ hàng: " + e.getMessage());
            }
      }
}
