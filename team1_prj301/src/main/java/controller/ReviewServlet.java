package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reviews;
import model.Users;
import model.Products;
import reviewDAO.ReviewDAO;
import java.io.IOException;
import java.util.List;
import java.util.Date;

@WebServlet("/reviewservlet")
public class ReviewServlet extends HttpServlet {

      private static final long serialVersionUID = 1L;
      private ReviewDAO reviewDAO;

      @Override
      public void init() throws ServletException {
            reviewDAO = new ReviewDAO(); // Khởi tạo DAO
      }

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");

            if (action == null) {
                  response.sendRedirect("error.jsp");
                  return;
            }

            switch (action) {
                  case "add":
                        addReview(request, response);
                        break;
                  case "update":
                        updateReview(request, response);
                        break;
                  case "delete":
                        deleteReview(request, response);
                        break;
                  default:
                        response.sendRedirect("error.jsp");
                        break;
            }
      }

      private void addReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");

            if (user == null) {
                  response.sendRedirect("ligmaShop/login/signIn.jsp?error=notLoggedIn");
                  return;
            }

            try {
                  int productID = Integer.parseInt(request.getParameter("productID"));
                  int rating = Integer.parseInt(request.getParameter("rating"));
                  String comment = request.getParameter("comment");

                  System.out.println("Adding Review:");
                  System.out.println("User ID: " + user.getUserID());
                  System.out.println("Product ID: " + productID);
                  System.out.println("Rating: " + rating);
                  System.out.println("Comment: " + comment);

                  Reviews review = new Reviews();
                  review.setProductID(new Products(productID));
                  review.setUserID(user); // Lấy từ session, không từ request
                  review.setRating(rating);
                  review.setComment(comment);
                  review.setReviewDate(new Date());

                  reviewDAO.addReview(review);
                  System.out.println("Review added successfully!");
                  response.sendRedirect("productDetail?pID=" + productID);
            } catch (Exception e) {
                  e.printStackTrace();
                  System.out.println("Error while adding review!");
                  response.sendRedirect("ligmaShop/error/error.jsp");
            }
      }

      private void updateReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
            try {
                  int reviewID = Integer.parseInt(request.getParameter("reviewID"));
                  int rating = Integer.parseInt(request.getParameter("rating"));
                  String comment = request.getParameter("comment");

                  Reviews review = reviewDAO.getReviewById(reviewID);
                  if (review != null) {
                        review.setRating(rating);
                        review.setComment(comment);
                        review.setReviewDate(new Date());

                        reviewDAO.updateReview(review);
                  }

                  response.sendRedirect("productDetail?pID=" + review.getProductID().getProductID());
            } catch (Exception e) {
                  e.printStackTrace();
                  response.sendRedirect("ligmaShop/error/error.jsp");
            }
      }

      private void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
            try {
                  int reviewID = Integer.parseInt(request.getParameter("reviewID"));
                  Reviews review = reviewDAO.getReviewById(reviewID);

                  if (review != null) {
                        reviewDAO.deleteReview(reviewID);
                        response.sendRedirect("productDetail?pID=" + review.getProductID().getProductID());
                  } else {
                        response.sendRedirect("ligmaShop/error/error.jsp");
                  }
            } catch (Exception e) {
                  e.printStackTrace();
                  response.sendRedirect("ligmaShop/error/error.jsp");
            }
      }
}
