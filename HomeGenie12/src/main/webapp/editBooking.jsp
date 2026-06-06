<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");

Connection con;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM bookings WHERE id=?"
);

ps.setString(1,id);

ResultSet rs=ps.executeQuery();
rs.next();

String status=rs.getString("status");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Edit Booking</title>

<style>

body{
margin:0;
font-family:"Segoe UI",Arial,sans-serif;
background:#eef2f7;
}

.header{
background:#1e293b;
color:white;
padding:15px 40px;
font-size:22px;
font-weight:bold;
}

.container{
width:500px;
margin:60px auto;
background:white;
padding:35px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

h2{
margin-top:0;
color:#1e293b;
}

label{
font-weight:600;
font-size:14px;
}

input,select{
width:100%;
padding:10px;
margin-top:5px;
margin-bottom:18px;
border:1px solid #ddd;
border-radius:6px;
font-size:14px;
}

button{
width:100%;
padding:12px;
background:#2563eb;
color:white;
border:none;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

button:hover{
background:#1d4ed8;
}

.back{
display:block;
text-align:center;
margin-top:20px;
color:#2563eb;
text-decoration:none;
font-weight:500;
}

.back:hover{
text-decoration:underline;
}

</style>

</head>

<body>

<div class="header">
HomeGenie Admin
</div>

<div class="container">

<h2>Edit Booking</h2>

<form action="updateBooking.jsp" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<label>Customer Name</label>
<input type="text" name="customer"
value="<%=rs.getString("customer_name")%>" required>

<label>Date</label>
<input type="date" name="date"
value="<%=rs.getString("booking_date")%>" required>

<label>Time</label>
<input type="text" name="time"
value="<%=rs.getString("booking_time")%>" required>

<label>Assigned Worker</label>
<input type="text" name="worker"
value="<%=rs.getString("assigned_worker")%>" required>

<label>Status</label>

<select name="status">

<option value="Pending"
<%=status.equals("Pending")?"selected":""%>>
Pending
</option>

<option value="Confirmed"
<%=status.equals("Confirmed")?"selected":""%>>
Confirmed
</option>

<option value="Completed"
<%=status.equals("Completed")?"selected":""%>>
Completed
</option>

</select>

<button type="submit">Update Booking</button>

</form>

<a class="back" href="bookingList.jsp">← Back to Booking List</a>

</div>

</body>
</html>