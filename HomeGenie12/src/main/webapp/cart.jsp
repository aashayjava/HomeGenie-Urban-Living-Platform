<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Your Cart | HomeGenie</title>

<style>

body{
margin:0;
font-family:'Segoe UI',sans-serif;
background:#eef2f7;
}

.header{
background:#1e293b;
color:white;
padding:15px 40px;
font-size:22px;
font-weight:bold;
display:flex;
justify-content:space-between;
}

.title{
padding:25px 40px;
font-size:22px;
font-weight:600;
}

.cart-box{
background:white;
margin:0 40px 40px 40px;
padding:25px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.08);
}

table{
width:100%;
border-collapse:collapse;
}

th,td{
padding:12px;
text-align:left;
border-bottom:1px solid #ddd;
}

th{
background:#f3f4f6;
}

.total{
font-size:18px;
font-weight:bold;
color:#16a34a;
}

.btn{
margin-top:20px;
padding:10px 18px;
border:none;
border-radius:6px;
cursor:pointer;
font-size:15px;
}

.confirm{
background:#2563eb;
color:white;
}

.back{
background:#6b7280;
color:white;
margin-right:10px;
}

.clear{
background:#dc2626;
color:white;
margin-left:10px;
}

.empty{
text-align:center;
color:#888;
font-size:16px;
padding:20px;
}

</style>

</head>

<body>

<%

List<String[]> cart=(List<String[]>)session.getAttribute("cart");
int cartSize=0;

if(cart!=null){
cartSize=cart.size();
}

%>

<div class="header">

<span>🧞 HomeGenie</span>


<a href="cart.jsp" style="color:white;text-decoration:none;">
🛒 Cart (<%=cartSize%>)
</a>

</div>

<div class="title">🛒 Your Cart</div>

<div class="cart-box">

<table>

<tr>
<th>Service</th>
<th>Price</th>
</tr>

<%

int total=0;

if(cart!=null && cart.size()>0){

for(String[] item:cart){

String service=item[0];
int price=Integer.parseInt(item[1]);

/* Emergency extra charge */

if(service.equalsIgnoreCase("Electrician") ||
   service.equalsIgnoreCase("Plumbing") ||
   service.equalsIgnoreCase("Pest Control") ||
   service.equalsIgnoreCase("Door Lock Repair")){

price = price + 50;

}

total += price;

%>

<tr>
<td><%=service%></td>
<td>₹ <%=price%></td>
</tr>

<%
}
%>

<tr>
<td class="total">Total</td>
<td class="total">₹ <%=total%></td>
</tr>

<%
}else{
%>

<tr>
<td colspan="2" class="empty">
🛒 Your cart is empty
</td>
</tr>

<%
}
%>

</table>

<br>

<button class="btn back" onclick="history.back()">
⬅ Continue Services
</button>

<%
if(cart!=null && cart.size()>0){
%>

<form action="clearCart.jsp" style="display:inline;">
<button class="btn clear">🗑 Empty Cart</button>
</form>

<form action="payment.jsp" style="display:inline;">
<button class="btn confirm">Confirm Booking</button>
</form>

<%
}
%>

</div>

</body>
</html>