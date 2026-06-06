package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import dao.BookingDAO;
import model.Booking;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/serviceBookings")
public class ServiceBookingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;

        try {

            // get service id
            String idParam = request.getParameter("id");

            if(idParam == null || idParam.isEmpty()){
                response.sendRedirect("services");
                return;
            }

            int serviceId = Integer.parseInt(idParam);

            conn = DBConnection.getConnection();

            BookingDAO dao = new BookingDAO(conn);

            List<Booking> bookings = dao.getBookingsByService(serviceId);

            request.setAttribute("bookings", bookings);
            request.setAttribute("serviceId", serviceId);

            request.getRequestDispatcher("serviceBookings.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();
            request.setAttribute("error", "Unable to load bookings");

            request.getRequestDispatcher("error.jsp")
                   .forward(request, response);
        }
    }
}