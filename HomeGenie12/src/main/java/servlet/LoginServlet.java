package servlet;

import daoimpl.UserDAOImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);

        UserDAOImpl dao = new UserDAOImpl();

        User u = dao.login(user);

        if (u != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", u);

            // ROLE CHECK
            if (u.getRole() != null && u.getRole().equalsIgnoreCase("admin")) {

                response.sendRedirect(request.getContextPath()+"/adminDashboard.jsp");

            } else {

                response.sendRedirect(request.getContextPath()+"/chatbot.jsp");

            }

        } else {

            response.sendRedirect("login.jsp?error=1");

        }
    }
}