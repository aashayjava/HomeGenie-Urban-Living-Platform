<%@ page import="java.sql.*" %>

<%

String id=request.getParameter("id");

String customer=request.getParameter("customer");
String date=request.getParameter("date");
String time=request.getParameter("time");
String worker=request.getParameter("worker");
String status=request.getParameter("status");

Connection con;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(

"UPDATE bookings SET customer_name=?,booking_date=?,booking_time=?,assigned_worker=?,status=? WHERE id=?"

);

ps.setString(1,customer);
ps.setString(2,date);
ps.setString(3,time);
ps.setString(4,worker);
ps.setString(5,status);
ps.setString(6,id);

ps.executeUpdate();

response.sendRedirect("bookingList.jsp");

%>