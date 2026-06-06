<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String serviceId = request.getParameter("service_id");

String[] serviceNames = request.getParameterValues("service_name");
String[] prices = request.getParameterValues("price");

String customer = request.getParameter("customer");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String date = request.getParameter("date");
String time = request.getParameter("time");
String worker = request.getParameter("worker");

int total = 0;

if(prices != null){
    for(int i = 0; i < prices.length; i++){
        try{
            total += Integer.parseInt(prices[i]);
        }catch(Exception e){
            total += 0;
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>UPI Payment</title>

<style>

body{
margin:0;
font-family:"Segoe UI","Noto Sans",Arial;
background:#f1f5f9;
text-align:center;
}

.box{
width:450px;
margin:80px auto;
background:white;
padding:40px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

.qr{
width:220px;
margin:20px auto;
}

button{
padding:12px 20px;
background:#22c55e;
color:white;
border:none;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

.services{
margin:15px 0;
}

</style>

</head>

<body>

<div class="box">

<h2>Scan & Pay</h2>

<div class="services">

<b>Selected Services:</b><br><br>

<%
if(serviceNames != null && prices != null){
for(int i=0;i<serviceNames.length;i++){
%>

<p><%=serviceNames[i]%> — ₹<%=prices[i]%></p>

<%
}
}else{
%>

<p>No services found.</p>

<%
}
%>

</div>

<p><b>Total Amount:</b> ₹<%=total%></p>

<img class="qr"
src="https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=PAYMENT-<%=total%>">

<p>Scan using any UPI app</p>

<form action="bookingSuccess.jsp" method="post">

<%
if(serviceNames != null && prices != null){
for(int i=0;i<serviceNames.length;i++){
%>

<input type="hidden" name="service_name" value="<%=serviceNames[i]%>">
<input type="hidden" name="price" value="<%=prices[i]%>">

<%
}
}
%>

<input type="hidden" name="service_id" value="<%=serviceId%>">
<input type="hidden" name="customer" value="<%=customer%>">
<input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="phone" value="<%=phone%>">
<input type="hidden" name="address" value="<%=address%>">
<input type="hidden" name="date" value="<%=date%>">
<input type="hidden" name="time" value="<%=time%>">
<input type="hidden" name="worker" value="<%=worker%>">

<br><br>

<button type="submit">Payment Done</button>

</form>

</div>

</body>
</html>