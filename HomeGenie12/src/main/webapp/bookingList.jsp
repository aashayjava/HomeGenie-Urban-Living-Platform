<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
String serviceSearch=request.getParameter("service");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

String sql="SELECT * FROM bookings";

if(serviceSearch!=null && !serviceSearch.trim().equals("")){
sql="SELECT * FROM bookings WHERE service_id=?";
ps=con.prepareStatement(sql);
ps.setString(1,serviceSearch);
}else{
ps=con.prepareStatement(sql);
}

rs=ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Booking List</title>

<style>

body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:linear-gradient(135deg,#eef2ff,#f8fafc);
}

/* Sidebar */

.sidebar{
width:230px;
height:100vh;
background:linear-gradient(180deg,#0f172a,#1e293b);
color:white;
position:fixed;
padding-top:25px;
box-shadow:4px 0 20px rgba(0,0,0,0.25);
}

.sidebar h2{
text-align:center;
margin-bottom:35px;
}

.sidebar a{
display:block;
padding:14px 22px;
color:#e2e8f0;
text-decoration:none;
font-size:15px;
transition:0.3s;
}

.sidebar a:hover{
background:#334155;
padding-left:28px;
color:white;
}

/* Main */

.main{
margin-left:230px;
padding:40px;
}

.title{
margin-bottom:20px;
color:#0f172a;
}

/* Search */

.search-box{
margin-bottom:20px;
}

.search-box input{
padding:8px;
border-radius:6px;
border:1px solid #ccc;
}

.search-box button{
padding:8px 12px;
border:none;
border-radius:6px;
background:#2563eb;
color:white;
cursor:pointer;
}

/* Table */

.table-box{
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

table{
width:100%;
border-collapse:collapse;
}

th{
background:#2563eb;
color:white;
padding:10px;
}

td{
padding:10px;
border-bottom:1px solid #eee;
text-align:center;
}

tr:hover{
background:#f1f5f9;
}

/* Status */

.pending{
color:#f59e0b;
font-weight:bold;
}

.confirmed{
color:#2563eb;
font-weight:bold;
}

.completed{
color:#16a34a;
font-weight:bold;
}

/* Buttons */

.btn{
padding:6px 10px;
border:none;
border-radius:6px;
cursor:pointer;
font-size:12px;
color:white;
text-decoration:none;
}

.edit{
background:#f59e0b;
}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2>🧞 HomeGenie</h2>

<a href="services">🏠 Dashboard</a>
<a href="addService.jsp">➕ Add Service</a>
<a href="booking.jsp">📅 Bookings</a>
<a href="bookingList.jsp">📋 Booking List</a>
<a href="workers">👷 Workers</a>
<a href="index.jsp">🚪 Logout</a>

</div>

<!-- Main -->

<div class="main">

<h2 class="title">📋 Booking List</h2>

<div class="search-box">

<form method="get">

Search Service ID :

<input type="text" name="service">

<button type="submit">Search</button>

</form>

</div>

<div class="table-box">

<table>

<tr>

<th>ID</th>
<th>Service</th>
<th>Customer</th>
<th>Date</th>
<th>Time</th>
<th>Worker</th>
<th>Status</th>
<th>Phone</th>
<th>Address</th>
<th>Edit</th>

</tr>

<%

while(rs.next()){

String status=rs.getString("status");

String statusClass="";

if(status.equals("Pending")) statusClass="pending";
if(status.equals("Confirmed")) statusClass="confirmed";
if(status.equals("Completed")) statusClass="completed";

%>

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getInt("service_id")%></td>
<td><%=rs.getString("customer_name")%></td>
<td><%=rs.getString("booking_date")%></td>
<td><%=rs.getString("booking_time")%></td>
<td><%=rs.getString("assigned_worker")%></td>

<td class="<%=statusClass%>"><%=status%></td>

<td><%=rs.getString("phone")%></td>
<td><%=rs.getString("address")%></td>

<td>

<a class="btn edit"
href="editBooking.jsp?id=<%=rs.getInt("id")%>">
Edit
</a>

</td>

</tr>

<%
}
%>

</table>

</div>

</div>

</body>
</html>