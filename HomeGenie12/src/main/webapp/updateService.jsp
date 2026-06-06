<%@ page import="java.sql.*" %>

<%

String id=request.getParameter("id");
String name=request.getParameter("name");
String price=request.getParameter("price");

Connection con;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"UPDATE services SET service_name=?,price=? WHERE id=?"
);

ps.setString(1,name);
ps.setString(2,price);
ps.setString(3,id);

ps.executeUpdate();

response.sendRedirect("services");

%>