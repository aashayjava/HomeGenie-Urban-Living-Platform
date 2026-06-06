package servlet;

import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String serviceIdStr = request.getParameter("service_id");
String customer = request.getParameter("customer");
String date = request.getParameter("date");
String time = request.getParameter("time");
String worker = request.getParameter("worker");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

try{

int serviceId = Integer.parseInt(serviceIdStr);

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"INSERT INTO bookings(service_id, customer_name, booking_date, booking_time, assigned_worker, status) VALUES(?,?,?,?,?,?)"
);

ps.setInt(1, serviceId);
ps.setString(2, customer);
ps.setString(3, date);
ps.setString(4, time);
ps.setString(5, worker);
ps.setString(6, "Pending");

ps.executeUpdate();

response.sendRedirect("bookingSuccess.jsp");

}catch(Exception e){
e.printStackTrace();
}

}

}