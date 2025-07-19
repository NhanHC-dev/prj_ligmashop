/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import service.GoogleLogin;
import entity.GoogleAccount;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author nkmq21   
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/logingg"})
public class GoogleServlet extends HttpServlet {

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
        HttpSession session = request.getSession();

        String error = request.getParameter("error");
        if (error != null) {
            if (error.equalsIgnoreCase("access_denied")) {
                request.setAttribute("message", "Login was cancelled");
                request.setAttribute("messageType", "warning");
            } else {
                request.setAttribute("message", "Login failed");
                request.setAttribute("messageType", "danger");
            }
            request.getRequestDispatcher("ligmaShop/login/register.jsp").forward(request, response);
            return;
        }

        try {
            String code = request.getParameter("code");
            if (code != null) {
                GoogleLogin gg = new GoogleLogin();
                String accessToken = gg.getToken(code);
                GoogleAccount acc = gg.getUserInfo(accessToken);
                if (acc != null) {
                    //1 line to store user infor in session

                    //redirect to homepage
                    session.setAttribute("userName", acc.getName());
                    response.sendRedirect("ligmaShop/login/user.jsp");
                } else {
                    request.setAttribute("message", "Failed to get user information");
                    request.setAttribute("messageType", "danger");
                    request.getRequestDispatcher("ligmaShop/login/register.jsp").forward(request, response);
                }
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("message", "An error has occured" + e.getMessage());
            request.getRequestDispatcher("ligmaShop/login/register.jsp").forward(request, response);
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
        processRequest(request, response);
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
