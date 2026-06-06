<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<title>HomeGenie | Service Booking</title>

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
}

/* Main */

.main{
margin-left:230px;
padding:40px;
}

/* Card */

.card{
width:420px;
margin:auto;
background:white;
padding:28px;
border-radius:16px;
box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

.card h2{
margin-top:0;
text-align:center;
color:#0f172a;
}

/* Inputs */

label{
font-size:13px;
color:#444;
}

input,select{
width:100%;
padding:10px;
margin-top:5px;
margin-bottom:15px;
border:1px solid #ddd;
border-radius:6px;
font-size:14px;
}

/* Button */

button{
width:100%;
padding:12px;
border:none;
border-radius:8px;
background:linear-gradient(90deg,#6366f1,#2563eb);
color:white;
font-size:15px;
cursor:pointer;
transition:0.3s;
}

button:hover{
transform:translateY(-2px);
box-shadow:0 8px 18px rgba(37,99,235,0.4);
}

</style>

</head>

<body>

<div class="sidebar">

<h2>🧞 HomeGenie</h2>

<a href="services">🏠 Dashboard</a>
<a href="addService.jsp">➕ Add Service</a>
<a href="#">📅 Bookings</a>
<a href="workers.jsp">👷 Workers</a>
<a href="logout">🚪 Logout</a>

</div>

<div class="main">

<div class="card">

<h2>✨ Book Service</h2>

<form action="BookingServlet" method="post">

<label>Select Service</label>

<select name="serviceId" required>

<option value="">-- Select Service --</option>

<%

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("SELECT * FROM services");

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<option value="<%=rs.getInt("id")%>">
<%=rs.getString("service_name")%> - ₹<%=rs.getInt("price")%>
</option>

<%

}

}catch(Exception e){
e.printStackTrace();
}

%>

</select>


<label>Customer Name</label>
<input type="text" name="customer" required>

<label>Phone</label>
<input type="text" name="phone" required>

<label>Address</label>
<input type="text" name="address" required>

<label>Date</label>
<input type="date" name="date" required>

<label>Time</label>
<input type="time" name="time" required>

<label>Assign Worker</label>
<input type="text" name="worker">

<button type="submit">Confirm Booking</button>

</form>

</div>

</div>

</body>
</html>