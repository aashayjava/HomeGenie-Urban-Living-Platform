<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Add Service - HomeGenie</title>

<style>

body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:linear-gradient(135deg,#eef2ff,#f1f5f9);
}

/* Sidebar */

.sidebar{
width:230px;
height:100vh;
background:linear-gradient(180deg,#0f172a,#1e293b);
color:white;
position:fixed;
padding-top:25px;
box-shadow:4px 0 20px rgba(0,0,0,0.2);
}

.sidebar h2{
text-align:center;
margin-bottom:40px;
letter-spacing:1px;
font-weight:600;
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
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

/* Card */

.form-card{
background:white;
width:430px;
padding:35px;
border-radius:16px;
box-shadow:0 15px 40px rgba(0,0,0,0.15);
position:relative;
overflow:hidden;
}

/* Genie glow */

.form-card::before{
content:"";
position:absolute;
top:-50%;
left:-50%;
width:200%;
height:200%;
background:radial-gradient(circle,rgba(99,102,241,0.15),transparent 60%);
animation:rotate 8s linear infinite;
}

@keyframes rotate{
0%{transform:rotate(0deg);}
100%{transform:rotate(360deg);}
}

.form-card h2{
text-align:center;
margin-bottom:25px;
color:#0f172a;
position:relative;
}

/* Labels */

label{
font-size:14px;
font-weight:600;
color:#374151;
position:relative;
}

/* Inputs */

input, textarea{
width:100%;
padding:12px;
margin-top:6px;
margin-bottom:18px;
border-radius:8px;
border:1px solid #d1d5db;
font-size:14px;
outline:none;
transition:0.25s;
position:relative;
background:#f9fafb;
}

input:focus, textarea:focus{
border-color:#6366f1;
box-shadow:0 0 0 3px rgba(99,102,241,0.2);
background:white;
}

textarea{
resize:none;
height:90px;
}

/* Button */

.btn{
width:100%;
padding:12px;
border:none;
background:linear-gradient(90deg,#6366f1,#2563eb);
color:white;
border-radius:8px;
font-size:15px;
font-weight:600;
cursor:pointer;
transition:0.3s;
box-shadow:0 6px 15px rgba(37,99,235,0.4);
}

.btn:hover{
transform:translateY(-2px);
box-shadow:0 10px 25px rgba(37,99,235,0.5);
}

/* Genie sparkle */

.sparkle{
position:absolute;
top:15px;
right:20px;
font-size:20px;
opacity:0.6;
animation:float 3s ease-in-out infinite;
}

@keyframes float{
0%{transform:translateY(0px);}
50%{transform:translateY(-6px);}
100%{transform:translateY(0px);}
}

</style>

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<h2>🧞 HomeGenie</h2>

<a href="services">🏠 Dashboard</a>
<a href="addService.jsp">➕ Add Service</a>
<a href="#">📅 Bookings</a>
<a href="#">👷 Workers</a>
<a href="logout">🚪 Logout</a>

</div>

<!-- Main -->

<div class="main">

<div class="form-card">

<div class="sparkle">✨</div>

<h2>Add Cleaning Service</h2>

<form action="addService" method="post">

<label>Service Name</label>
<input type="text" name="name" placeholder="Kitchen Deep Cleaning" required>

<label>Description</label>
<textarea name="description" placeholder="Describe the cleaning service..." required></textarea>

<label>Price (₹)</label>
<input type="number" name="price" placeholder="Enter service price" required>

<button class="btn" type="submit">Add Service</button>

</form>

</div>

</div>

</body>
</html>