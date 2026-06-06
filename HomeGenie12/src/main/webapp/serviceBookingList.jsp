<%@ page import="java.sql.*" %>

<%
String serviceId=request.getParameter("id");

Connection con;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM bookings WHERE service_id=?"
);

ps.setString(1,serviceId);

ResultSet rs=ps.executeQuery();
%>

<html>

<head>

<title>Service Bookings</title>

<style>

table{
width:80%;
margin:auto;
border-collapse:collapse;
}

th,td{
padding:10px;
border:1px solid #ccc;
text-align:center;
}

th{
background:#2563eb;
color:white;
}

</style>

</head>

<body>

<h2 style="text-align:center;">Bookings for Service ID : <%=serviceId%></h2>

<table>

<tr>
<th>ID</th>
<th>Customer</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
</tr>

<%

while(rs.next()){
%>

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("customer_name")%></td>
<td><%=rs.getString("booking_date")%></td>
<td><%=rs.getString("booking_time")%></td>
<td><%=rs.getString("status")%></td>

</tr>

<%
}
%>

</table>

</body>
</html>