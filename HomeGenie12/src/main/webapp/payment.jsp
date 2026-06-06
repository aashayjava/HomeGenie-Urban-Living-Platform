<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");

List<String[]> cart = (List<String[]>) session.getAttribute("cart");

int total = 0;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HomeGenie Payment</title>

<style>

body{
margin:0;
font-family:"Segoe UI","Noto Sans",Arial,sans-serif;
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

.service-box{
background:#f1f5f9;
padding:15px;
border-radius:8px;
margin-bottom:20px;
}

input,select{
width:100%;
padding:10px;
margin-top:5px;
margin-bottom:15px;
border:1px solid #ddd;
border-radius:6px;
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

</style>

</head>

<body>

<div class="header">
HomeGenie
</div>

<div class="container">

<h2>Complete Your Booking</h2>

<div class="service-box">

<%
if(cart != null && cart.size() > 0){
    for(String[] item : cart){

        String service = item[0];
        int price = Integer.parseInt(item[1]);
        total += price;
%>

<b><%=service%></b> — &#8377;<%=price%><br>

<%
    }
}else{
%>

No service selected.

<%
}
%>

<br>
<b>Total: &#8377;<%=total%></b>

</div>

<form action="qrpayment.jsp" method="post">

<input type="hidden" name="service_id" value="1">

<%
if(cart != null){
for(String[] item : cart){

String service = item[0];
String price = item[1];
%>

<input type="hidden" name="service_name" value="<%=service%>">
<input type="hidden" name="price" value="<%=price%>">

<%
}
}
%>

<label>Name</label>
<input type="text" name="customer" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Phone</label>
<input type="text" name="phone" required>

<label>Address</label>
<input type="text" name="address" required>

<label>Date</label>
<input type="date" name="date" required>

<label>Time</label>
<input type="time" name="time" required>

<label>Payment Method</label>
<select name="payment">
<option value="UPI">UPI</option>
<option value="Cash">Cash</option>
</select>

<input type="hidden" name="worker" value="Worker1">

<button type="submit">Proceed to Payment</button>

</form>

</div>

</body>
</html>