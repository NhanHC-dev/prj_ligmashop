package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

@WebFilter(filterName = "AuthFilter", urlPatterns =
{
    "/ligmaShop/admin/*"
})
public class AuthFilter implements Filter
{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // false = don’t create new session

        // Check if user is logged in and has admin role
        if (session != null && session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if ("admin".equals(user.getRole())) {
                // User is admin, allow access
                chain.doFilter(request, response);
                return;
            }
        }

        // User is not admin or not logged in, redirect to error page
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/ligmaShop/error/unauthorized.jsp");
    }
    
    @Override
    public void destroy() {}
}
