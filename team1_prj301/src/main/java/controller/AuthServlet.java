package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Users;
import userDAO.*;

@WebServlet(name = "AuthServlet", urlPatterns = {"/authservlet"})

public class AuthServlet extends HttpServlet {

      UserDAO userDAO = new UserDAO();

      private boolean isValidEmail(String email) {
            String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
            return email.matches(regex);
      }

      private boolean isValidPassword(String password) {
            String regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}$";
            return password.matches(regex);
      }

      protected void handleLogin(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String rememberMe = request.getParameter("rememberMe");
            Users user = userDAO.checkLogin(email, password);

            if (user != null) {
                  HttpSession session = request.getSession();
                  session.setAttribute("email", email);
                  session.setAttribute("user", user);

                  Cookie cEmail, cPassword, cRememberMe;

                  if (rememberMe != null && rememberMe.equals("true")) {
                        cEmail = new Cookie("email", email);
                        cPassword = new Cookie("password", password);
                        cRememberMe = new Cookie("rememberMe", rememberMe);
                  } else {
                        cEmail = new Cookie("email", "");
                        cPassword = new Cookie("password", "");
                        cRememberMe = new Cookie("rememberMe", "");
                  }

                  // chỉnh thời gian sống của cookie tại đây (đơn vị: giây)
                  cEmail.setMaxAge(60);
                  cPassword.setMaxAge(60);
                  cRememberMe.setMaxAge(60);

                  response.addCookie(cRememberMe);
                  response.addCookie(cPassword);
                  response.addCookie(cEmail);

                  // Check if response is committed
                  if (response.isCommitted()) {
                        System.out.println("Response already committed, cannot forward!");
                        response.sendRedirect(request.getContextPath() + "/test"); // Fallback
                        return;
                  }

                  // Debug the RequestDispatcher
                  RequestDispatcher dispatcher = request.getRequestDispatcher("/test");
                  if (dispatcher == null) {
                        System.out.println("RequestDispatcher for '/test' is null!");
                        response.sendRedirect(request.getContextPath() + "/test"); // Fallback to redirect
                  } else {
                        System.out.println("Forwarding to /test");
                        dispatcher.forward(request, response);
                  }
            } else {
                  request.setAttribute("wrong_login_message", "Wrong username or password!");
                  request.getRequestDispatcher("ligmaShop/login/signIn.jsp?error=wrong_login").forward(request, response);
            }
      }

      protected void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            if (!isValidEmail(email)) {
                  response.sendRedirect("ligmaShop/login/register.jsp?error=invalid_email");
                  return;
            } else if (!password.equals(confirmPassword)) {
                  response.sendRedirect("ligmaShop/login/register.jsp?error=invalid_confirm_password");
                  return;
            }
            boolean check = userDAO.checkRegister(fullname, email, phone, password);
            if (!check) {
                  request.setAttribute("user_existed_message", "Email hoặc số điện thoại dã tồn tại trong hệ thống!");
                  request.getRequestDispatcher("ligmaShop/login/register.jsp?error=user_existed").forward(request, response);
                  return;
            } else {
                  response.sendRedirect("ligmaShop/login/signIn.jsp?success=registered");
            }
      }

      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            // handle logout
            HttpSession session = request.getSession();
            session.invalidate();
            request.getRequestDispatcher("/ligmaShop/login/signIn.jsp").forward(request, response);
      }

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            String action = request.getParameter("action");
            if (action == null) {
                  action = "";
                  System.out.println("action empty");
            } else {
                  System.out.println(action);
            }
            switch (action) {
                  case "login":
                        handleLogin(request, response);
                        break;
                  case "register":
                        handleRegister(request, response);
                        break;
            }
      }
}
