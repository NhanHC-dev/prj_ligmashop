////package controller;
////
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.HttpServlet;
////import jakarta.servlet.http.HttpServletRequest;
////import jakarta.servlet.http.HttpServletResponse;
////import jakarta.servlet.http.HttpSession;
////
////import java.io.IOException;
////import java.math.BigDecimal;
////import java.util.Enumeration;
////import java.util.HashMap;
////import java.util.Map;
////
////import model.Cart;
////import paymentDAO.PaymentDAO;
////import service.EmailService;
////
////@WebServlet("/vnpayreturn")
////public class VNPayReturnServlet extends HttpServlet {
////
////    private EmailService emailService;
////    private PaymentDAO paymentDAO;
////
////    @Override
////    public void init() throws ServletException {
////        try {
////            emailService = new EmailService();
////            paymentDAO = new PaymentDAO();
////        } catch (Exception e) {
////            throw new ServletException("Failed to initialize services", e);
////        }
////    }
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
////        response.setHeader("Pragma", "no-cache");
////        response.setDateHeader("Expires", 0);
////        // Xử lý callback từ VNPay (GET request)
////        Map<String, String> fields = new HashMap<>();
////        Enumeration<String> params = request.getParameterNames();
////        while (params.hasMoreElements()) {
////            String fieldName = params.nextElement();
////            String fieldValue = request.getParameter(fieldName);
////            if (fieldValue != null && !fieldValue.isEmpty()) {
////                fields.put(fieldName, fieldValue);
////            }
////        }
////        System.out.println("Parameters received from VNPay: " + fields);
////
////        // Lấy các thông tin cần thiết từ request
////        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
////        String vnp_Amount = request.getParameter("vnp_Amount");
////        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
////
////        // Lấy thông tin từ session
////        HttpSession session = request.getSession();
////        Map<String, String> pendingTransaction = (Map<String, String>) session.getAttribute("pendingTransaction");
////        Cart cart = (Cart) session.getAttribute("cart");
////        System.out.println("Cart from session: " + (cart != null ? cart : "null"));
////        if (cart != null && cart.getCartitemsCollection() != null) {
////            System.out.println("Cart items count: " + cart.getCartitemsCollection().size());
////        } else {
////            System.out.println("Cart or cart items is null or empty");
////        }
////
////        // Kiểm tra tính hợp lệ của giao dịch (không kiểm tra checksum)
////        boolean checkOrderId = pendingTransaction != null && vnp_TxnRef != null && vnp_TxnRef.equals(pendingTransaction.get("vnp_TxnRef"));
////        boolean checkAmount = pendingTransaction != null && vnp_Amount != null && vnp_Amount.equals(pendingTransaction.get("vnp_Amount"));
////
////        if (checkOrderId && checkAmount) {
////            if ("00".equals(vnp_ResponseCode)) {
////                // Xử lý thanh toán: lưu đơn hàng và cập nhật số lượng sản phẩm
////                try {
////                    BigDecimal totalAmount = new BigDecimal(vnp_Amount).divide(new BigDecimal(100));
////                    paymentDAO.processPayment(pendingTransaction, vnp_TxnRef, totalAmount, cart);
////                    if (cart != null) {
////                        cart.getCartitemsCollection().clear();
////                        session.removeAttribute("cart");
////                        System.out.println("Cart items count after clear: " + cart.getCartitemsCollection().size());
////                    }
////                } catch (Exception e) {
////                    System.out.println("Error processing payment: " + e.getMessage());
////                    request.setAttribute("dbError", "Không thể xử lý đơn hàng: " + e.getMessage());
////                }
////
///// /                // Gửi email
////                try {
////                    String customerEmail = pendingTransaction.get("email");
////                    String fullName = pendingTransaction.get("fullName");
////                    String phone = pendingTransaction.get("phone");
////                    String address = pendingTransaction.get("address");
////                    String products = pendingTransaction.get("products");
////                    int amount = Integer.parseInt(vnp_Amount) / 100;
////
////                    String subject = "Xác nhận thanh toán thành công - LigmaShop";
////                    String messageContent = "<h2>Xin chào " + fullName + ",</h2>" +
////                            "<p>Cảm ơn bạn đã mua sắm tại <strong>LigmaShop</strong>. Thanh toán của bạn đã được thực hiện thành công!</p>" +
////                            "<h3>Chi tiết hóa đơn</h3>" +
////                            "<p><strong>Mã đơn hàng:</strong> " + vnp_TxnRef + "</p>" +
////                            "<p><strong>Họ tên:</strong> " + fullName + "</p>" +
////                            "<p><strong>Số điện thoại:</strong> " + phone + "</p>" +
////                            "<p><strong>Địa chỉ:</strong> " + address + "</p>" +
////                            "<p><strong>Sản phẩm:</strong> " + products + "</p>" +
////                            "<p><strong>Tổng tiền:</strong> " + amount + " VNĐ</p>" +
////                            "<p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ qua email <a href='mailto:hoangndhde180637@fpt.edu.vn'>hoangndhde180637@fpt.edu.vn</a>.</p>" +
////                            "<p>Trân trọng,<br>LigmaShop Team</p>";
////
////                    boolean emailSent = emailService.send(customerEmail, subject, messageContent);
////                    if (emailSent) {
////                        System.out.println("Email sent successfully to: " + customerEmail);
////                    } else {
////                        System.out.println("Failed to send email to: " + customerEmail);
////                        request.setAttribute("emailError", "Không thể gửi email xác nhận!");
////                    }
////                } catch (Exception e) {
////                    System.out.println("Error sending email: " + e.getMessage());
////                    request.setAttribute("emailError", "Không thể gửi email xác nhận: " + e.getMessage());
////                }
////                // Thanh toán thành công
////                request.setAttribute("message", "✅ Thanh toán thành công!");
////                request.setAttribute("transactionId", vnp_TxnRef);
////                request.setAttribute("amount", Integer.parseInt(vnp_Amount) / 100);
////                request.setAttribute("fullName", pendingTransaction.get("fullName"));
////                request.setAttribute("email", pendingTransaction.get("email"));
////                request.setAttribute("phone", pendingTransaction.get("phone"));
////                request.setAttribute("address", pendingTransaction.get("address"));
////                request.setAttribute("products", pendingTransaction.get("products"));
////
////            } else {
////                // Thanh toán thất bại
////                request.setAttribute("message", "❌ Thanh toán thất bại! Mã lỗi: " + vnp_ResponseCode);
////                request.setAttribute("transactionId", vnp_TxnRef);
////                request.setAttribute("errorCode", vnp_ResponseCode);
////            }
////        } else {
////            request.setAttribute("message", "⚠️ Lỗi: Thông tin giao dịch không hợp lệ!");
////        }
////
////        // Chuyển thẳng sang result.jsp mà không kiểm tra checksum
////        request.getRequestDispatcher("/ligmaShop/payment/result.jsp").forward(request, response);
////    }
////
////    @Override
////    protected void doPost(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        // Xử lý COD (POST request từ CheckoutServlet)
////        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
////        response.setHeader("Pragma", "no-cache");
////        response.setDateHeader("Expires", 0);
////        HttpSession session = request.getSession();
////        Map<String, String> pendingTransaction = (Map<String, String>) session.getAttribute("pendingTransaction");
////        Cart cart = (Cart) session.getAttribute("cart");
////
////        System.out.println("CART");
////        if (cart == null) System.out.println("remained");
////
////        String paymentMethod = pendingTransaction != null ? pendingTransaction.get("paymentMethod") : null;
////
////        if (pendingTransaction == null || cart == null) {
////            request.setAttribute("message", "⚠️ Lỗi: Không tìm thấy thông tin giao dịch hoặc giỏ hàng!");
////            request.getRequestDispatcher("/ligmaShop/payment/result.jsp").forward(request, response);
////            return;
////        }
////
////        if ("cod".equals(paymentMethod)) {
////            try {
////                // Xử lý thanh toán COD: lưu đơn hàng và cập nhật số lượng sản phẩm
////                String orderId = String.valueOf(System.currentTimeMillis());
////                BigDecimal totalAmount = new BigDecimal(pendingTransaction.get("totalAmount"));
////                paymentDAO.processPayment(pendingTransaction, orderId, totalAmount, cart);
////                if (cart != null) {
////                    cart.getCartitemsCollection().clear();
////
////                    System.out.println("Cart items count after clear: " + cart.getCartitemsCollection().size());
////
////                }
////                session.removeAttribute("cart");
////                session.removeAttribute("cart");
////                System.out.println("Cart removed from session: " + (session.getAttribute("cart") == null ? "Yes" : "No"));
////                if (session.getAttribute("cart") == null) {
////                    System.out.println("✅ Giỏ hàng đã được xóa khỏi session.");
////                } else {
////                    System.out.println("❌ Giỏ hàng vẫn còn trong session!");
////                }
////
////                // Gửi email xác nhận
////                try {
////                    String customerEmail = pendingTransaction.get("email");
////                    String fullName = pendingTransaction.get("fullName");
////                    String phone = pendingTransaction.get("phone");
////                    String address = pendingTransaction.get("address");
////                    String products = pendingTransaction.get("products");
////                    int amount = Integer.parseInt(pendingTransaction.get("totalAmount"));
////
////                    String subject = "Xác nhận đặt hàng thành công - LigmaShop";
////                    String messageContent = "<h2>Xin chào " + fullName + ",</h2>" +
////                            "<p>Cảm ơn bạn đã mua sắm tại <strong>LigmaShop</strong>. Đơn hàng của bạn đã được đặt thành công với phương thức thanh toán khi nhận hàng (COD)!</p>" +
////                            "<h3>Chi tiết hóa đơn</h3>" +
////                            "<p><strong>Mã đơn hàng:</strong> " + orderId + "</p>" +
////                            "<p><strong>Họ tên:</strong> " + fullName + "</p>" +
////                            "<p><strong>Số điện thoại:</strong> " + phone + "</p>" +
////                            "<p><strong>Địa chỉ:</strong> " + address + "</p>" +
////                            "<p><strong>Sản phẩm:</strong> " + products + "</p>" +
////                            "<p><strong>Tổng tiền:</strong> " + amount + " VNĐ</p>" +
////                            "<p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ qua email <a href='mailto:hoangndhde180637@fpt.edu.vn'>hoangndhde180637@fpt.edu.vn</a>.</p>" +
////                            "<p>Trân trọng,<br>LigmaShop Team</p>";
////
////                    boolean emailSent = emailService.send(customerEmail, subject, messageContent);
////                    if (emailSent) {
////                        System.out.println("Email sent successfully to: " + customerEmail);
////                    } else {
////                        System.out.println("Failed to send email to: " + customerEmail);
////                        request.setAttribute("emailError", "Không thể gửi email xác nhận!");
////                    }
////                } catch (Exception e) {
////                    System.out.println("Error sending email: " + e.getMessage());
////                    request.setAttribute("emailError", "Không thể gửi email xác nhận: " + e.getMessage());
////                }
////                // Đặt hàng thành công
////                request.setAttribute("message", "✅ Đặt hàng thành công với phương thức COD!");
////                request.setAttribute("transactionId", orderId);
////                request.setAttribute("amount", Integer.parseInt(pendingTransaction.get("totalAmount")));
////                request.setAttribute("fullName", pendingTransaction.get("fullName"));
////                request.setAttribute("email", pendingTransaction.get("email"));
////                request.setAttribute("phone", pendingTransaction.get("phone"));
////                request.setAttribute("address", pendingTransaction.get("address"));
////                request.setAttribute("products", pendingTransaction.get("products"));
////
////            } catch (Exception e) {
////                System.out.println("Error processing COD payment: " + e.getMessage());
////                request.setAttribute("message", "❌ Lỗi: Không thể xử lý đơn hàng COD!");
////                request.setAttribute("dbError", "Không thể xử lý đơn hàng: " + e.getMessage());
////            }
////
////            // Xóa pendingTransaction và cart sau khi xử lý
////            session.removeAttribute("cart");
////            session.removeAttribute("pendingTransaction");
////
////            // Chuyển hướng đến trang kết quả
////            request.getRequestDispatcher("/ligmaShop/payment/result.jsp").forward(request, response);
////            return;
////        } else {
////            request.setAttribute("message", "⚠️ Lỗi: Phương thức thanh toán không hợp lệ!");
////            request.getRequestDispatcher("/ligmaShop/payment/result.jsp").forward(request, response);
////        }
////    }
////}
//
//package controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import service.EmailService;
//import model.Cart;
//import paymentDAO.PaymentDAO;
//
//import java.io.IOException;
//import java.math.BigDecimal;
//import java.text.NumberFormat;
//import java.util.Locale;
//import java.util.Map;
//
//@WebServlet(name = "VNPayReturnServlet", urlPatterns = {"/vnpayreturn"})
//public class VNPayReturnServlet extends HttpServlet {
//
//    private EmailService emailService;
//    private PaymentDAO paymentDAO;
//
//    @Override
//    public void init() throws ServletException {
//        emailService = new EmailService();
//        paymentDAO = new PaymentDAO();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Map<String, String> pendingTransaction = (Map<String, String>) session.getAttribute("pendingTransaction");
//
//        if (pendingTransaction == null) {
//            request.setAttribute("message", "Không tìm thấy thông tin giao dịch");
//            request.getRequestDispatcher("ligmaShop/payment/result.jsp").forward(request, response);
//            return;
//        }
//
//        String paymentMethod = pendingTransaction.get("paymentMethod");
//        String fullName = pendingTransaction.get("fullName");
//        String email = pendingTransaction.get("email");
//        String phone = pendingTransaction.get("phone");
//        String address = pendingTransaction.get("address");
//        String products = pendingTransaction.get("products");
//
//        if ("cod".equals(paymentMethod)) {
//            processCodPayment(request, response, pendingTransaction, session);
//        } else {
//            processVnpayPayment(request, response, pendingTransaction, session);
//        }
//    }
//
//    private void processCodPayment(HttpServletRequest request, HttpServletResponse response,
//                                   Map<String, String> pendingTransaction, HttpSession session)
//            throws ServletException, IOException {
//        try {
//            String transactionId = "COD" + System.currentTimeMillis();
//            String amount = pendingTransaction.get("totalAmount");
//            String fullName = pendingTransaction.get("fullName");
//            String email = pendingTransaction.get("email");
//            String phone = pendingTransaction.get("phone");
//            String address = pendingTransaction.get("address");
//            String products = pendingTransaction.get("products");
//
//            // Process payment in database
//            Cart cart = (Cart) session.getAttribute("cart");
//            if (cart != null) {
//                BigDecimal totalAmount = new BigDecimal(amount);
//                paymentDAO.processPayment(pendingTransaction, transactionId, totalAmount, cart);
//                session.removeAttribute("cartItems");
//            } else {
//                System.out.println("Cart is null - cannot process order in database");
//            }
//
//            // Send confirmation email
//            boolean emailSent = sendOrderConfirmationEmail(email, fullName, transactionId, products, amount, address, "COD");
//
//            // Set attributes for result page
//            request.setAttribute("message", "Đặt hàng thành công! Bạn sẽ thanh toán khi nhận hàng.");
//            request.setAttribute("transactionId", transactionId);
//            request.setAttribute("amount", formatCurrency(amount));
//            request.setAttribute("fullName", fullName);
//            request.setAttribute("email", email);
//            request.setAttribute("phone", phone);
//            request.setAttribute("address", address);
//            request.setAttribute("products", products);
//
//            // Clean up session
//            session.removeAttribute("pendingTransaction");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("message", "Đặt hàng thất bại: " + e.getMessage());
//        }
//
//        request.getRequestDispatcher("ligmaShop/payment/result.jsp").forward(request, response);
//    }
//
//    private void processVnpayPayment(HttpServletRequest request, HttpServletResponse response,
//                                     Map<String, String> pendingTransaction, HttpSession session)
//            throws ServletException, IOException {
//        try {
//            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
//
//            String fullName = pendingTransaction.get("fullName");
//            String email = pendingTransaction.get("email");
//            String phone = pendingTransaction.get("phone");
//            String address = pendingTransaction.get("address");
//            String products = pendingTransaction.get("products");
//            String amount = pendingTransaction.get("totalAmount");
//            String transactionId = request.getParameter("vnp_TransactionNo");
//
//            if ("00".equals(vnp_ResponseCode)) {
//                // Payment successful
//                Cart cart = (Cart) session.getAttribute("cart");
//                if (cart != null) {
//                    BigDecimal totalAmount = new BigDecimal(amount);
//                    paymentDAO.processPayment(pendingTransaction, transactionId, totalAmount, cart);
//                    session.removeAttribute("cartItems");
//                } else {
//                    System.out.println("Cart is null - cannot process order in database");
//                }
//
//                // Send confirmation email
//                boolean emailSent = sendOrderConfirmationEmail(email, fullName, transactionId, products, amount, address, "VNPay");
//
//                // Set attributes for result page
//                request.setAttribute("message", "Thanh toán thành công!");
//            } else {
//                // Payment failed
//                request.setAttribute("message", "Thanh toán thất bại! Mã lỗi: " + vnp_ResponseCode);
//                request.setAttribute("errorCode", vnp_ResponseCode);
//            }
//
//            // Set common attributes
//            request.setAttribute("transactionId", transactionId);
//            request.setAttribute("amount", formatCurrency(amount));
//            request.setAttribute("fullName", fullName);
//            request.setAttribute("email", email);
//            request.setAttribute("phone", phone);
//            request.setAttribute("address", address);
//            request.setAttribute("products", products);
//
//            // Clean up session
//            session.removeAttribute("pendingTransaction");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("message", "Xử lý thanh toán thất bại: " + e.getMessage());
//        }
//
//        request.getRequestDispatcher("ligmaShop/payment/result.jsp").forward(request, response);
//    }
//
//    /**
//     * Sends an order confirmation email with HTML formatting
//     */
//    private boolean sendOrderConfirmationEmail(String email, String fullName, String transactionId,
//                                               String products, String amount, String address, String paymentMethod) {
//        try {
//            String subject = "Xác nhận đơn hàng #" + transactionId + " từ LigmaShop";
//
//            // Create HTML email content
//            String htmlContent = createOrderConfirmationHtml(fullName, transactionId, products, amount, address, paymentMethod);
//
//            // Send email
//            if (emailService != null) {
//                return emailService.send(email, subject, htmlContent);
//            } else {
//                System.err.println("Error sending email: emailService is null");
//                return false;
//            }
//        } catch (Exception e) {
//            System.err.println("Error sending email: " + e.getMessage());
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    /**
//     * Creates HTML content for order confirmation email
//     */
//    private String createOrderConfirmationHtml(String fullName, String transactionId,
//                                               String products, String amount, String address, String paymentMethod) {
//        return "<!DOCTYPE html>"
//                + "<html>"
//                + "<head>"
//                + "    <meta charset='UTF-8'>"
//                + "    <style>"
//                + "        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 20px; }"
//                + "        .container { max-width: 600px; margin: 0 auto; border: 1px solid #ddd; border-radius: 5px; padding: 20px; }"
//                + "        .header { text-align: center; padding-bottom: 15px; border-bottom: 1px solid #eee; }"
//                + "        .logo { max-width: 150px; }"
//                + "        h1 { color: #444; margin-top: 20px; }"
//                + "        .details { margin: 20px 0; }"
//                + "        .details table { width: 100%; border-collapse: collapse; }"
//                + "        .details th, .details td { padding: 10px; text-align: left; border-bottom: 1px solid #eee; }"
//                + "        .details th { width: 30%; }"
//                + "        .footer { margin-top: 20px; text-align: center; color: #777; font-size: 12px; border-top: 1px solid #eee; padding-top: 20px; }"
//                + "        .thank-you { font-weight: bold; font-size: 18px; margin: 20px 0; text-align: center; }"
//                + "        .order-number { font-weight: bold; color: #0066cc; }"
//                + "    </style>"
//                + "</head>"
//                + "<body>"
//                + "    <div class='container'>"
//                + "        <div class='header'>"
//                + "            <h1>LigmaShop</h1>"
//                + "            <p>Xác nhận đơn hàng của bạn</p>"
//                + "        </div>"
//                + "        <p>Xin chào <strong>" + fullName + "</strong>,</p>"
//                + "        <p>Cảm ơn bạn đã đặt hàng tại LigmaShop. Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>"
//                + "        <div class='details'>"
//                + "            <h2>Chi tiết đơn hàng:</h2>"
//                + "            <table>"
//                + "                <tr><th>Mã đơn hàng:</th><td class='order-number'>" + transactionId + "</td></tr>"
//                + "                <tr><th>Phương thức thanh toán:</th><td>" + paymentMethod + "</td></tr>"
//                + "                <tr><th>Tổng tiền:</th><td>" + formatCurrency(amount) + " VNĐ</td></tr>"
//                + "                <tr><th>Địa chỉ giao hàng:</th><td>" + address + "</td></tr>"
//                + "            </table>"
//                + "            <h2>Sản phẩm:</h2>"
//                + "            <p>" + formatProductsList(products) + "</p>"
//                + "        </div>"
//                + "        <p class='thank-you'>Cảm ơn bạn đã mua hàng tại LigmaShop!</p>"
//                + "        <div class='footer'>"
//                + "            <p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi tại <a href='mailto:support@ligmashop.com'>support@ligmashop.com</a></p>"
//                + "            <p>© 2024 LigmaShop. Tất cả các quyền được bảo lưu.</p>"
//                + "        </div>"
//                + "    </div>"
//                + "</body>"
//                + "</html>";
//    }
//
//    /**
//     * Format product list for better display in email
//     */
//    private String formatProductsList(String products) {
//        // Replace comma separators with HTML break tags
//        return products.replace("), ", ")<br>");
//    }
//
//    /**
//     * Format currency values
//     */
//    private String formatCurrency(String amount) {
//        try {
//            double amountValue = Double.parseDouble(amount);
//            NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
//            return formatter.format(amountValue);
//        } catch (NumberFormatException e) {
//            return amount;
//        }
//    }
//}
