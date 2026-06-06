<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");

Connection con;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM services WHERE id=?"
);

ps.setString(1,id);

ResultSet rs=ps.executeQuery();

rs.next();
%>

<html>

<head>

<title>Edit Service</title>

<style>

.container{
width:400px;
margin:80px auto;
padding:30px;
background:white;
border-radius:10px;
box-shadow:0 10px 20px rgba(0,0,0,0.1);
}

input{
width:100%;
padding:10px;
margin-bottom:15px;
border:1px solid #ccc;
border-radius:6px;
}

button{
padding:10px;
width:100%;
background:#2563eb;
color:white;
border:none;
border-radius:6px;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Service</h2>

<form action="updateService.jsp" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

Service Name

<input type="text" name="name"
value="<%=rs.getString("service_name")%>">

Price

<input type="text" name="price"
value="<%=rs.getInt("price")%>">

<button type="submit">Update</button>

</form>

</div>

</body>
</html>