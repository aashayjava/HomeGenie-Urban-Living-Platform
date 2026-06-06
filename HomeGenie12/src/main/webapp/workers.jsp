<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.Worker" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Workers | HomeGenie</title>

<style>

body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:#f1f5f9;
}

.sidebar{
width:220px;
height:100vh;
background:#1e293b;
color:white;
position:fixed;
}

.sidebar h2{
text-align:center;
padding:20px 0;
}

.sidebar a{
display:block;
padding:14px 20px;
color:#e2e8f0;
text-decoration:none;
}

.sidebar a:hover{
background:#334155;
}

.main{
margin-left:220px;
padding:40px;
}

h2{
margin-bottom:20px;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
border-radius:8px;
overflow:hidden;
}

th{
background:#2563eb;
color:white;
padding:12px;
}

td{
padding:12px;
border-bottom:1px solid #eee;
}

tr:hover{
background:#f8fafc;
}

.status-available{
color:green;
font-weight:bold;
}

.status-busy{
color:orange;
font-weight:bold;
}

</style>

</head>

<body>

<div class="sidebar">

<h2>HomeGenie</h2>

<a href="services">Dashboard</a>
<a href="addService.jsp">Add Service</a>
<a href="booking.jsp">Bookings</a>
<a href="workers">Workers</a>
<a href="logout">Logout</a>

</div>


<div class="main">

<h2>Workers List</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Phone</th>
<th>Service ID</th>
<th>Experience</th>
<th>Status</th>
</tr>

<%

List<Worker> workers = (List<Worker>) request.getAttribute("workers");

if(workers != null && !workers.isEmpty()){

for(Worker w : workers){

String statusClass="";

if("Available".equalsIgnoreCase(w.getStatus())){
statusClass="status-available";
}else if("Busy".equalsIgnoreCase(w.getStatus())){
statusClass="status-busy";
}

%>

<tr>

<td><%=w.getId()%></td>
<td><%=w.getName()%></td>
<td><%=w.getPhone()%></td>
<td><%=w.getServiceId()%></td>
<td><%=w.getExperience()%> Years</td>
<td class="<%=statusClass%>"><%=w.getStatus()%></td>

</tr>

<%
}

}else{
%>

<tr>
<td colspan="6" style="text-align:center;color:red;padding:20px;">
No Workers Found
</td>
</tr>

<%
}
%>

</table>

</div>

</body>
</html>