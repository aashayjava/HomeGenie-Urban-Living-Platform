<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>

<title>HomeGenie Login</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#1e3c72,#2a5298);
}

.container{
width:380px;
background:rgba(255,255,255,0.1);
backdrop-filter:blur(10px);
padding:40px;
border-radius:15px;
box-shadow:0 0 20px rgba(0,0,0,0.3);
color:white;
}

h2{
text-align:center;
margin-bottom:25px;
}

.input-box{
margin-bottom:20px;
}

.input-box input{
width:100%;
padding:12px;
border:none;
border-radius:8px;
outline:none;
}

.remember{
display:flex;
justify-content:space-between;
font-size:14px;
margin-bottom:20px;
align-items:center;
}

.remember a{
color:#00c6ff;
cursor:pointer;
text-decoration:none;
}

button{
width:100%;
padding:12px;
border:none;
border-radius:8px;
background:#00c6ff;
color:white;
font-size:16px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#0072ff;
}

.switch{
text-align:center;
margin-top:15px;
}

.switch a{
color:#00c6ff;
cursor:pointer;
text-decoration:none;
}

.msg{
text-align:center;
margin-top:10px;
font-weight:bold;
}

</style>

<script>

function showRegister(){
document.getElementById("loginForm").style.display="none";
document.getElementById("registerForm").style.display="block";
}

function showLogin(){
document.getElementById("loginForm").style.display="block";
document.getElementById("registerForm").style.display="none";
}

</script>

</head>

<body>

<div class="container">

<!-- LOGIN FORM -->

<div id="loginForm" 
<% if(msg!=null){ %> style="display:none;" <% } %> >

<h2>HomeGenie Login</h2>

<form action="<%=request.getContextPath()%>/LoginServlet" method="post">

<div class="input-box">
<input type="text" name="username" placeholder="Username" required>
</div>

<div class="input-box">
<input type="password" name="password" placeholder="Password" required>
</div>

<div class="remember">

<label>
<input type="checkbox" name="remember"> Remember Me
</label>

<a href="#" onclick="showRegister()">New User?</a>

</div>

<button type="submit">Login</button>

</form>

</div>

<!-- REGISTER FORM -->

<div id="registerForm"
<% if(msg==null){ %> style="display:none;" <% } %> >

<h2>Register</h2>

<form action="<%=request.getContextPath()%>/RegisterServlet" method="post">

<div class="input-box">
<input type="text" name="username" placeholder="Username" required>
</div>

<div class="input-box">
<input type="password" name="password" placeholder="Password" required>
</div>

<button type="submit">Register</button>

</form>

<%
if(msg!=null){

if(msg.equals("registered")){
%>

<p class="msg" style="color:lightgreen;">
Registered Successfully! Please Login.
</p>

<%
}

if(msg.equals("exists")){
%>

<p class="msg" style="color:red;">
Account already exists. Please Login.
</p>

<%
}

}
%>

<div class="switch">

Already have account?  
<a href="#" onclick="showLogin()">Login</a>

</div>

</div>

</div>

</body>
</html>