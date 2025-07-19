package controller;

import jakarta.persistence.NoResultException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users; // Adjust to your model
import userDAO.UserDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

      private static final long serialVersionUID = 1L;
      private UserDAO userDAO;

      public void init() {
            userDAO = new UserDAO();
      }

      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            String action = request.getParameter("action");
            if (action == null) {
                  action = "list";
            }

            try {
                  switch (action) {
                        case "add":
                              RequestDispatcher dispatcher = request.getRequestDispatcher("ligmaShop/admin/addUser.jsp");
                              dispatcher.forward(request, response);
                              break;
                        case "edit":
                              showEditForm(request, response);
                              break;
                        case "delete":
                              deleteUser(request, response);
                              break;
                        default:
                              listUsers(request, response);
                              break;
                  }
            } catch (Exception e) {
                  throw new ServletException(e);
            }
      }

      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            String action = request.getParameter("action");
            switch (action) {
                  case "add":
                        addUser(request, response);
                        break;
                  case "edit":
                        updateUser(request, response);
                        break;
                  case "delete":
                        deleteUser(request, response);
                        break;
                  default:
                        listUsers(request, response);
                        break;
            }
      }

      private void listUsers(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            List<Users> users = userDAO.selectAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/ligmaShop/admin/managerUser.jsp").forward(request, response);
      }

      private void deleteUser(HttpServletRequest request, HttpServletResponse response)
              throws IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            userDAO.deleteUser(id);
            response.sendRedirect("users");
      }

      private void showEditForm(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            Users existingUser = userDAO.selectUser(id);
            request.setAttribute("user", existingUser);
            request.getRequestDispatcher("/ligmaShop/admin/editUser.jsp").forward(request, response);
      }

      private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                  // Lấy thông tin từ form
                  String name = request.getParameter("fullName");
                  String email = request.getParameter("email");
                  String phone = request.getParameter("phoneNumber");
                  String address = request.getParameter("address");
                  String password = request.getParameter("password");
                  String role = request.getParameter("role");
                  boolean status = request.getParameter("status") != null;

                  // Kiểm tra dữ liệu hợp lệ
                  if (name == null || email == null || password == null || phone == null || address == null || role == null) {
                        request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
                        listUsers(request, response);
                        return;
                  }

                  // Kiểm tra email đã tồn tại chưa
                  if (userDAO.isEmailExists(email)) {
                        request.setAttribute("error", "Email đã tồn tại!");
                        request.getRequestDispatcher("/addUser.jsp").forward(request, response);
                        return;
                  }

                  // Kiểm tra số điện thoại đã tồn tại chưa
                  if (userDAO.isPhoneExists(phone)) {
                        request.setAttribute("error", "Số điện thoại đã tồn tại!");
                        request.getRequestDispatcher("/addUser.jsp").forward(request, response);
                        return;
                  }

                  // Tạo user mới
                  Users newUser = new Users(name, email, address, phone, role, status, password);

                  // Thêm vào database
                  userDAO.insertUser(newUser);

                  // Thông báo thành công
                  request.setAttribute("message", "Thêm người dùng thành công!");
                  response.sendRedirect(request.getContextPath() + "/users");

            } catch (Exception e) {
                  request.setAttribute("error", "Lỗi khi thêm người dùng: " + e.getMessage());
                  request.getRequestDispatcher("/addUser.jsp").forward(request, response);
            }
      }

      private void updateUser(HttpServletRequest request, HttpServletResponse response)
              throws IOException {
            try {
                  int id = Integer.parseInt(request.getParameter("id"));

                  String name = request.getParameter("fullName");
                  String email = request.getParameter("email");
                  String phone = request.getParameter("phoneNumber");
                  String address = request.getParameter("address");
                  String role = request.getParameter("role");
                  boolean status = request.getParameter("status") != null;

                  // Lấy user từ database bằng selectUser()
                  Users existingUser;
                  try {
                        existingUser = userDAO.selectUser(id);
                  } catch (NoResultException e) {
                        response.sendRedirect("users?error=notfound");
                        return;
                  }

                  // Giữ nguyên mật khẩu nếu không nhập mới
                  String password = request.getParameter("password");
                  if (password == null || password.trim().isEmpty()) {
                        password = existingUser.getPassword();
                  }

                  // Cập nhật thông tin mới
                  existingUser.setName(name);
                  existingUser.setEmail(email);
                  existingUser.setPhoneNumber(phone);
                  existingUser.setAddress(address);
                  existingUser.setRole(role);
                  existingUser.setStatus(status);
                  existingUser.setPassword(password);

                  // Cập nhật vào database
                  userDAO.updateUser(existingUser);
                  response.sendRedirect("users?success=updated");

            } catch (NumberFormatException e) {
                  response.sendRedirect("users?error=invalidID");
            } catch (Exception e) {
                  response.sendRedirect("users?error=updateFailed");
            }
      }

}
