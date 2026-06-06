<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,model.Service"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HomeGenie Admin Dashboard</title>

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
letter-spacing:1px;
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
margin-bottom:30px;
color:#0f172a;
}

/* Grid */

.grid{
display:grid;
grid-template-columns:repeat(5,1fr);
gap:22px;
}

/* Service Card */

.card{
background:white;
padding:18px;
border-radius:14px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
transition:0.35s;
position:relative;
overflow:hidden;
}



.card::before{
content:"";
position:absolute;
top:-50%;
left:-50%;
width:200%;
height:200%;
background:radial-gradient(circle,rgba(99,102,241,0.15),transparent 60%);
opacity:0;
transition:0.4s;
pointer-events:none;
}

.card:hover::before{
opacity:1;
}

.card:hover{
transform:translateY(-6px) scale(1.02);
box-shadow:0 18px 40px rgba(0,0,0,0.2);
}

.card h3{
margin-top:0;
font-size:18px;
color:#111827;
}

.desc{
font-size:13px;
color:#555;
margin:8px 0;
}

.price{
color:#16a34a;
font-weight:bold;
margin-bottom:12px;
}

/* Button Group */

.btn-group{
display:flex;
gap:8px;
}


.btn{
padding:6px 10px;
border-radius:6px;
cursor:pointer;
font-size:12px;
transition:0.25s;
display:inline-block;
text-decoration:none;
color:white;
}

.view{
background:linear-gradient(90deg,#6366f1,#2563eb);
color:white;
box-shadow:0 4px 12px rgba(37,99,235,0.3);
}

.edit{
background:#f59e0b;
color:white;
}

.delete{
background:#ef4444;
color:white;
}

.btn:hover{
transform:translateY(-2px);
opacity:0.9;
}

/* sparkle */

.sparkle{
position:absolute;
top:8px;
right:12px;
font-size:14px;
opacity:0.6;
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

<!-- Main Content -->

<div class="main">

<div class="welcome-box">

<div class="welcome-left">

<h1>Welcome Admin 👋</h1>

<p class="subtitle">
Manage HomeGenie efficiently from one powerful dashboard.
Monitor services, bookings, workers and keep operations running smoothly.
</p>

<div class="quick-actions">

<div class="info-card">
<h3>📋 Manage Bookings</h3>
<p>Track customer requests and booking activity.</p>
</div>

<div class="info-card">
<h3>🛠 Service Control</h3>
<p>Add, edit or organize available services.</p>
</div>

<div class="info-card">
<h3>👷 Worker Management</h3>
<p>Assign and supervise workers with ease.</p>
</div>

<div class="info-card">
<h3>🚀 Platform Growth</h3>
<p>Improve service quality and grow faster.</p>
</div>

</div>

</div>


<div class="welcome-right">

<div class="quote-box">
<h2>✨ Admin Panel</h2>

<p>
“Great service starts with great management.”
</p>

<ul>
<li>✔ Monitor Operations</li>
<li>✔ Control Services</li>
<li>✔ Manage Workforce</li>
<li>✔ Improve Customer Experience</li>
</ul>

</div>

</div>

</div>

<h2 class="title">✨ Available Service</h2>

<div class="grid">

<%

List<Service> services =
(List<Service>)request.getAttribute("services");

if(services!=null){

for(Service s:services){

%>

<div class="card">

<div class="sparkle">✨</div>

<h3><%=s.getServiceName()%></h3>

<p class="desc"><%=s.getDescription()%></p>

<p class="price">&#8377; <%=s.getPrice()%></p>

<div class="btn-group">

<a class="btn view"
href="serviceBookingList.jsp?id=<%=s.getId()%>">
Bookings
</a>

<a class="btn edit"
href="editService.jsp?id=<%=s.getId()%>">
Edit
</a>

<a class="btn delete"
href="deleteService.jsp?id=<%=s.getId()%>"
onclick="return confirm('Delete this service?')">
Delete
</a>

</div>

</div>

<%
}
}
%>

</div>

</div>

</body>
</html>