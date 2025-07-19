package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;
import productDAO.ProductDAO;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("ProductServlet: Received request for /products");

        String query = (String) request.getAttribute("query");
        query = (query == null ? "" : query);
        if (query.equals("rong")) {
            query = "";
        }
        String weather = request.getParameter("weather");
        weather = (weather ==null ? "all" : weather);
        
        List<Products> list = productDAO.selectAllProducts();
        List<Categories> listCategory = productDAO.selectAllCategory();
        List<Products> listQuery=productDAO.searchProduct(query);
        //headline for debugging in tomcat log
//        System.out.println("THE LIST OF RETRIEVED PRODUCTS: \n"); 
        try {
            if (listQuery != null && !listQuery.isEmpty() && listCategory != null && !listCategory.isEmpty()) {
                // checking the list of category
                for (Categories cate : listCategory) {
                    System.out.println("Product name: " + cate.getCategoryName()
                            + "Description: " + cate.getDescription());
                }
                request.setAttribute("weather", weather);
                request.setAttribute("query", query);
                request.setAttribute("products", listQuery);             
                request.setAttribute("category", listCategory);
            } else {
                System.out.println("No products found!");
            }
        } catch (Exception e) {
            System.out.println("ProductServlet: Error - " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing products");
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("ligmaShop/login/guest.jsp");
        if (dispatcher == null) {
            System.out.println("ProductServlet: RequestDispatcher for 'ligmaShop/login/guest.jsp' is null!");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Cannot forward to guest.jsp");
            return;
        }
        System.out.println("ProductServlet: Forwarding to guest.jsp");
        dispatcher.forward(request, response);
        System.out.println("ProductServlet: Forward to guest.jsp completed"); // Won’t print if forward succeeds
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
