<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Salon Services | HomeGenie</title>

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

.services{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;
padding:0 40px 40px 40px;
}

.card{
background:white;
padding:20px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,0.08);
text-align:center;
}

.price{
color:#16a34a;
font-weight:bold;
margin-bottom:10px;
}

.book-btn{
background:#2563eb;
color:white;
border:none;
padding:8px 15px;
border-radius:6px;
cursor:pointer;
}

.cart-controls{
display:flex;
justify-content:center;
align-items:center;
gap:10px;
margin-top:10px;
}

.cart-controls button{
width:30px;
height:30px;
border:none;
border-radius:50%;
background:#2563eb;
color:white;
font-size:18px;
cursor:pointer;
}

.cart-controls span{
font-size:16px;
font-weight:bold;
}

</style>

<script>

let cartCount=0;

function startCart(id,service,price){

document.getElementById("book"+id).style.display="none";
document.getElementById("cart"+id).style.display="flex";

document.getElementById("count"+id).innerText=1;

cartCount++;
document.getElementById("cartCount").innerText=cartCount;

fetch("addToCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)+"&price="+price
});

}

function add(service,price,id){

let count=document.getElementById("count"+id);
let val=parseInt(count.innerText);

val++;
count.innerText=val;

cartCount++;

document.getElementById("cartCount").innerText=cartCount;

fetch("addToCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)+"&price="+price
});

}

function minus(service,id){

let count=document.getElementById("count"+id);
let val=parseInt(count.innerText);

if(val>1){

val--;
count.innerText=val;

cartCount--;
document.getElementById("cartCount").innerText=cartCount;

}else{

document.getElementById("cart"+id).style.display="none";
document.getElementById("book"+id).style.display="inline-block";

cartCount--;
if(cartCount<0) cartCount=0;

document.getElementById("cartCount").innerText=cartCount;

}

fetch("removeFromCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)
});

}

</script>

</head>

<body>

<div class="header">

<span>🧞 HomeGenie</span>

<a href="cart.jsp" style="color:white;text-decoration:none;">
🛒 Cart (<span id="cartCount">0</span>)
</a>

</div>

<div class="title">💇 Salon Services</div>

<div class="services">

<%
String[][] services = {
{"Salon at Home","999"},
{"Haircut","299"},
{"Facial","799"},
{"Hair Spa","699"},
{"Massage","899"},
{"Manicure & Pedicure","599"}
};

for(int i=0;i<services.length;i++){
%>

<div class="card">

<h3><%=services[i][0]%></h3>

<div class="price">₹ <%=services[i][1]%></div>

<button class="book-btn"
id="book<%=i%>"
onclick="startCart(<%=i%>,'<%=services[i][0]%>','<%=services[i][1]%>')">

Book Now

</button>

<div class="cart-controls" id="cart<%=i%>" style="display:none;">

<button onclick="minus('<%=services[i][0]%>',<%=i%>)">-</button>

<span id="count<%=i%>">0</span>

<button onclick="add('<%=services[i][0]%>','<%=services[i][1]%>',<%=i%>)">+</button>

</div>

</div>

<%
}
%>

</div>
<a href="chatbot.jsp" style="position:fixed;bottom:25px;right:25px;text-decoration:none;">
<button class="chatbot-btn" style="width:60px;height:60px;border-radius:50%;background:#2563eb;color:white;border:none;font-size:30px;display:flex;align-items:center;justify-content:center;cursor:pointer;box-shadow:0 5px 15px rgba(0,0,0,0.3);">🧞</button>
</a>
</body>
</html>