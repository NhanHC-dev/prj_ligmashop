package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Config;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {

      @Override
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();

            // Lấy các tham số từ request
            String paymentMethod = req.getParameter("paymentMethod");
            if (paymentMethod != null) {
                  paymentMethod = paymentMethod.trim(); // Loại bỏ khoảng trắng
            }
            // Kiểm tra phương thức thanh toán
            JsonObject error = new JsonObject();
            if (!"vnpay".equalsIgnoreCase(paymentMethod)) {
                  error.addProperty("code", "02");
                  error.addProperty("message", "Phương thức thanh toán không được hỗ trợ");
                  out.write(new Gson().toJson(error));
                  out.flush();
                  return;
            }

            // Đặt giá trị tiền cố định (100,000 VND)
            int amount = 10000000; // 100,000 VND (nhân 100)

            // Xử lý thanh toán VNPay
            try {
                  // Cấu hình tham số VNPay
                  String vnp_Version = "2.1.0";
                  String vnp_Command = "pay";
                  String vnp_TxnRef = Config.getRandomNumber(8);
                  String vnp_IpAddr = Config.getIpAddress(req);
                  String vnp_TmnCode = Config.vnp_TmnCode;
                  String vnp_OrderInfo = "Thanh toan don hang";
                  String orderType = "other";

                  // Tạo map tham số VNPay
                  Map<String, String> vnp_Params = new HashMap<>();
                  vnp_Params.put("vnp_Version", vnp_Version);
                  vnp_Params.put("vnp_Command", vnp_Command);
                  vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                  vnp_Params.put("vnp_Amount", String.valueOf(amount));
                  vnp_Params.put("vnp_CurrCode", "VND");
                  vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                  vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                  vnp_Params.put("vnp_OrderType", orderType);
                  vnp_Params.put("vnp_Locale", "vn");
                  vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
                  vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                  Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                  SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                  String vnp_CreateDate = formatter.format(cld.getTime());
                  vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
                  cld.add(Calendar.MINUTE, 15);
                  String vnp_ExpireDate = formatter.format(cld.getTime());
                  vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                  // Tạo chuỗi hash và URL thanh toán
                  List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
                  Collections.sort(fieldNames);
                  StringBuilder hashData = new StringBuilder();
                  StringBuilder query = new StringBuilder();
                  for (String fieldName : fieldNames) {
                        String fieldValue = vnp_Params.get(fieldName);
                        if (fieldValue != null && !fieldValue.isEmpty()) {
                              hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                              query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII)).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                              if (!fieldName.equals(fieldNames.get(fieldNames.size() - 1))) {
                                    hashData.append('&');
                                    query.append('&');
                              }
                        }
                  }

                  String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
                  String paymentUrl = Config.vnp_PayUrl + "?" + query.toString() + "&vnp_SecureHash=" + vnp_SecureHash;

                  // Trả về URL thanh toán
                  resp.sendRedirect(paymentUrl);
            } catch (Exception e) {
                  error.addProperty("code", "99");
                  error.addProperty("message", "Lỗi xử lý thanh toán: " + e.getMessage());
                  out.write(new Gson().toJson(error));
                  out.flush();
            }
      }
}
