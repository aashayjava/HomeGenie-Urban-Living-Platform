package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import daoimpl.WorkerDAOImpl;
import model.Worker;

@WebServlet("/workers")
public class WorkerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            WorkerDAOImpl dao = new WorkerDAOImpl();

            List<Worker> workers = dao.getAllWorkers();

            System.out.println("Workers size = " + workers.size());

            request.setAttribute("workers", workers);

            RequestDispatcher rd = request.getRequestDispatcher("workers.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}