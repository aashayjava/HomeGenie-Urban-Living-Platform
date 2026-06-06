<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Booking" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Bookings</title>

<style>

body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:linear-gradient(135deg,#eef2ff,#f8fafc);
}


.header{
padding:25px;
font-size:24px;
font-weight:600;
color:#0f172a;
}


.container{
padding:20px 40px;
}



table{
width:100%;
border-collapse:collapse;
background:white;
border-radius:12px;
overflow:hidden;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

th{
background:linear-gradient(90deg,#6366f1,#2563eb);
color:white;
padding:12px;
font-size:14px;
}

td{
padding:12px;
border-bottom:1px solid #eee;
font-size:14px;
color:#333;
}

tr:hover{
background:#f8fafc;
}


.status{
padding:4px 10px;
border-radius:20px;
font-size:12px;
color:white;
}

.pending{
background:#f59e0b;
}

.completed{
background:#16a34a;
}

.cancelled{
background:#ef4444;
}

</style>

</head>

<body>

<div class="header">🧞 Service Bookings</div>

<div class="container">

<table>

<tr>
<th>ID</th>
<th>Customer</th>
<th>Phone</th>
<th>Address</th>
<th>Date</th>
<th>Time</th>
<th>Worker</th>
<th>Status</th>
</tr>

<%

List<Booking> bookings = (List<Booking>)request.getAttribute("bookings");

if(bookings!=null){

for(Booking b:bookings){

String status = b.getStatus();
String cls = "pending";

if("Completed".equalsIgnoreCase(status)) cls="completed";
if("Cancelled".equalsIgnoreCase(status)) cls="cancelled";

%>

<tr>

<td><%=b.getId()%></td>
<td><%=b.getCustomerName()%></td>
<td><%=b.getPhone()%></td>
<td><%=b.getAddress()%></td>
<td><%=b.getBookingDate()%></td>
<td><%=b.getBookingTime()%></td>
<td><%=b.getAssignedWorker()%></td>

<td>
<span class="status <%=cls%>">
<%=status%>
</span>
</td>

</tr>

<%
}
}
%>

</table>

</div>

</body>
</html>