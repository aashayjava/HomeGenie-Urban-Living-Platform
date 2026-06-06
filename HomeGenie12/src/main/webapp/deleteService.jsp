<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"DELETE FROM services WHERE id=?"
);

ps.setString(1,id);

ps.executeUpdate();

response.sendRedirect("services");
%>