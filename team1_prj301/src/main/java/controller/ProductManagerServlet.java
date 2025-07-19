package controller;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.Collection;
import model.Products;
import model.Productimages;
import org.hibernate.Hibernate;
import productDAO.ProductDAO;

@WebServlet("/productManager")
@MultipartConfig
public class ProductManagerServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        List<Products> products = productDAO.selectAllProducts();
        Map<Integer, List<String>> imageUrls = new HashMap<>();
        Map<Integer, Long> totalSoldMap = productDAO.getTotalSoldByProduct();
        Map<Integer, Double> avgRatingMap = productDAO.getAverageRatingByProduct();

        for (Products product : products) {
            Hibernate.initialize(product.getProductimagesCollection());
            List<String> productImageUrls = new ArrayList<>();
            if (product.getProductimagesCollection() != null && !product.getProductimagesCollection().isEmpty()) {
                for (Productimages image : product.getProductimagesCollection()) {
                    productImageUrls.add(image.getImageURL());
                }
            } else {
                productImageUrls.add("N/A");
            }
            imageUrls.put(product.getProductID(), productImageUrls);
        }

        request.setAttribute("products", products);
        request.setAttribute("imageUrls", imageUrls);
        request.setAttribute("totalSoldMap", totalSoldMap);
        request.setAttribute("avgRatingMap", avgRatingMap);

        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher("/ligmaShop/admin/managerProduct.jsp").forward(request, response);
        } else {
            String idParam = request.getParameter("id");
            int id;
            if (idParam == null || idParam.trim().isEmpty()) {
                request.setAttribute("error", "Mã sản phẩm không được để trống.");
                request.getRequestDispatcher("/ligmaShop/admin/managerProduct.jsp").forward(request, response);
                return;
            }

            try {
                id = Integer.parseInt(idParam);
                if (id <= 0) {
                    throw new NumberFormatException("Mã sản phẩm phải là số nguyên dương.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã sản phẩm không hợp lệ: " + idParam);
                request.getRequestDispatcher("/ligmaShop/admin/managerProduct.jsp").forward(request, response);
                return;
            }

            Products product = productDAO.selectProduct(id);
            if (product == null) {
                request.setAttribute("error", "Không tìm thấy sản phẩm với mã " + id);
                request.getRequestDispatcher("/ligmaShop/admin/managerProduct.jsp").forward(request, response);
                return;
            }

            switch (action) {
                case "deactivate":
                    product.setStatus(false);
                    productDAO.updateProduct(product);
                    request.setAttribute("message", "Đã vô hiệu hóa sản phẩm thành công.");
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    break;
                case "activate":
                    product.setStatus(true);
                    productDAO.updateProduct(product);
                    request.setAttribute("message", "Đã kích hoạt sản phẩm thành công.");
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    break;
                case "delete":
                    productDAO.updateProduct(product);
                    request.setAttribute("message", "Đã xóa sản phẩm thành công.");
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    break;
                case "edit":
                    Hibernate.initialize(product.getProductimagesCollection());
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/ligmaShop/product/editProduct.jsp").forward(request, response);
                    break;
                default:
                    request.setAttribute("error", "Hành động không hợp lệ: " + action);
                    response.sendRedirect(request.getContextPath() + "/productManager");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Tạo sản phẩm mới
            Products product = new Products();

            String productName = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String discountStr = request.getParameter("discount");
            String createdDateStr = request.getParameter("createdDate");
            String statusStr = request.getParameter("status");

            // Kiểm tra và gán tên sản phẩm
            if (productName == null || productName.trim().isEmpty()) {
                request.setAttribute("error", "Tên sản phẩm không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }
            product.setProductName(productName);

            // Gán mô tả (có thể để trống)
            product.setDescription(description);

            // Kiểm tra và gán giá tiền
            BigDecimal price;
            if (priceStr == null || priceStr.trim().isEmpty()) {
                request.setAttribute("error", "Giá tiền không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }
            try {
                price = new BigDecimal(priceStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Định dạng giá tiền không hợp lệ: " + priceStr);
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }
            product.setPrice(price);

            // Kiểm tra và gán giảm giá
            Integer discount = null;
            if (discountStr != null && !discountStr.trim().isEmpty()) {
                try {
                    discount = Integer.parseInt(discountStr);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Định dạng giảm giá không hợp lệ: " + discountStr);
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    return;
                }
            }
            product.setDiscount(discount);

            // Kiểm tra và gán ngày tạo
            if (createdDateStr != null && !createdDateStr.isEmpty()) {
                try {
                    product.setCreatedDate(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(createdDateStr).getTime()));
                } catch (Exception e) {
                    request.setAttribute("error", "Định dạng ngày tạo không hợp lệ: " + createdDateStr);
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    return;
                }
            } else {
                request.setAttribute("error", "Ngày tạo không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            // Gán trạng thái
            boolean status = Boolean.parseBoolean(statusStr);
            product.setStatus(status);

            // Khởi tạo collection hình ảnh
            product.setProductimagesCollection(new ArrayList<>());

            // Xử lý upload nhiều ảnh
            Collection<Part> fileParts = request.getParts();
            int newImageCount = 0;
            for (Part filePart : fileParts) {
                if (filePart.getName().equals("images") && filePart.getSize() > 0 && newImageCount < 3) {
                    String fileName = filePart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("") + "/uploads/" + fileName;
                    filePart.write(uploadPath);
                    String imageUrl = request.getContextPath() + "/uploads/" + fileName;

                    Productimages newImage = new Productimages();
                    newImage.setImageURL(imageUrl);
                    newImage.setProductID(product);
                    product.getProductimagesCollection().add(newImage);
                    newImageCount++;
                }
            }

            // Lưu sản phẩm vào cơ sở dữ liệu
            try {
                EntityManager em = DBConnection.getEntityManager();
                em.getTransaction().begin();
                em.persist(product);
                em.getTransaction().commit();
                em.close();
                request.setAttribute("message", "Thêm sản phẩm thành công.");
                response.sendRedirect(request.getContextPath() + "/productManager");
            } catch (Exception e) {
                request.setAttribute("error", "Thêm sản phẩm thất bại: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/productManager");
            }
        } else if ("update".equals(action)) {
            String idParam = request.getParameter("id");
            int productId;
            if (idParam == null || idParam.trim().isEmpty()) {
                request.setAttribute("error", "Mã sản phẩm không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            try {
                productId = Integer.parseInt(idParam);
                if (productId <= 0) {
                    throw new NumberFormatException("Mã sản phẩm phải là số nguyên dương.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã sản phẩm không hợp lệ: " + idParam);
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            Products product = productDAO.selectProduct(productId);
            if (product == null) {
                request.setAttribute("error", "Không tìm thấy sản phẩm với mã " + productId);
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            String productName = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String discountStr = request.getParameter("discount");
            String createdDateStr = request.getParameter("createdDate");
            String statusStr = request.getParameter("status");

            if (productName == null || productName.trim().isEmpty()) {
                request.setAttribute("error", "Tên sản phẩm không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            BigDecimal price;
            if (priceStr == null || priceStr.trim().isEmpty()) {
                request.setAttribute("error", "Giá tiền không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }
            try {
                price = new BigDecimal(priceStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Định dạng giá tiền không hợp lệ: " + priceStr);
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            Integer discount = null;
            if (discountStr != null && !discountStr.trim().isEmpty()) {
                try {
                    discount = Integer.parseInt(discountStr);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Định dạng giảm giá không hợp lệ: " + discountStr);
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    return;
                }
            }

            boolean status = Boolean.parseBoolean(statusStr);

            product.setProductName(productName);
            product.setDescription(description);
            product.setPrice(price);
            product.setDiscount(discount);
            product.setStatus(status);

            if (createdDateStr != null && !createdDateStr.isEmpty()) {
                try {
                    product.setCreatedDate(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(createdDateStr).getTime()));
                } catch (Exception e) {
                    request.setAttribute("error", "Định dạng ngày tạo không hợp lệ: " + createdDateStr);
                    response.sendRedirect(request.getContextPath() + "/productManager");
                    return;
                }
            } else {
                request.setAttribute("error", "Ngày tạo không được để trống.");
                response.sendRedirect(request.getContextPath() + "/productManager");
                return;
            }

            Hibernate.initialize(product.getProductimagesCollection());
            List<Productimages> existingImages = new ArrayList<>(product.getProductimagesCollection());
            product.getProductimagesCollection().clear();

            Collection<Part> fileParts = request.getParts();
            int newImageCount = 0;
            for (Part filePart : fileParts) {
                if (filePart.getName().equals("images") && filePart.getSize() > 0 && newImageCount < 3) {
                    String fileName = filePart.getSubmittedFileName();
                    String uploadPath = getServletContext().getRealPath("") + "/uploads/" + fileName;
                    filePart.write(uploadPath);
                    String imageUrl = request.getContextPath() + "/uploads/" + fileName;

                    Productimages newImage = new Productimages();
                    newImage.setImageURL(imageUrl);
                    newImage.setProductID(product);
                    product.getProductimagesCollection().add(newImage);
                    newImageCount++;
                }
            }

            if (newImageCount == 0 && !existingImages.isEmpty()) {
                product.getProductimagesCollection().addAll(existingImages);
            }

            try {
                productDAO.updateProduct(product);
                request.setAttribute("message", "Cập nhật sản phẩm thành công.");
                response.sendRedirect(request.getContextPath() + "/productManager");
            } catch (Exception e) {
                request.setAttribute("error", "Cập nhật sản phẩm thất bại: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/productManager");
            }
        }
    }
}