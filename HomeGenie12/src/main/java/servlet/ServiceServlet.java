package servlet;

import dao.ServiceDAO;
import daoimpl.ServiceDAOImpl;
import model.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/services")
public class ServiceServlet extends HttpServlet {

    private ServiceDAO dao;

    @Override
    public void init() {
        dao = new ServiceDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Service> services = dao.getAllServices();

        request.setAttribute("services", services);

        RequestDispatcher rd =
                request.getRequestDispatcher("adminDashboard.jsp");

        rd.forward(request, response);
    }
}