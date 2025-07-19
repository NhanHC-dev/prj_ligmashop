/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Products;
import model.Reviews;
import productDAO.ProductDAO;
import reviewDAO.ReviewDAO;

@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/productDetail"})
public class ProductDetailServlet extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
       * methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                  /* TODO output your page here. You may use following sample code. */
                  out.println("<!DOCTYPE html>");
                  out.println("<html>");
                  out.println("<head>");
                  out.println("<title>Servlet ProductDetailServlet</title>");
                  out.println("</head>");
                  out.println("<body>");
                  out.println("<h1>Servlet ProductDetailServlet at " + request.getContextPath() + "</h1>");
                  out.println("</body>");
                  out.println("</html>");
            }
      }

      // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
      /**
       * Handles the HTTP <code>GET</code> method.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            String productIDStr = request.getParameter("pID");

            if (productIDStr != null && !productIDStr.isEmpty()) {
                  try {
                        int productID = Integer.parseInt(productIDStr);
                        ProductDAO productDAO = new ProductDAO();
                        ReviewDAO reviewDAO = new ReviewDAO();

                        Products product = productDAO.selectProduct(productID);
                        List<Reviews> reviews = reviewDAO.getReviewsByProductId(productID);

                        System.out.println("Product: " + product.getProductName()); // Debug
                        //System.out.println("Reviews: " + reviews.size()); // Debug

                        request.setAttribute("singleProduct", product);
                        request.setAttribute("reviews", reviews);
                        request.getRequestDispatcher("ligmaShop/product/ProductDetail.jsp").forward(request, response);
                  } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID.");
                  }
            } else {
                  response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is missing.");
            }
      }

      /**
       * Handles the HTTP <code>POST</code> method.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            processRequest(request, response);
      }

      /**
       * Returns a short description of the servlet.
       *
       * @return a String containing servlet description
       */
      @Override
      public String getServletInfo() {
            return "Short description";
      }// </editor-fold>

}
