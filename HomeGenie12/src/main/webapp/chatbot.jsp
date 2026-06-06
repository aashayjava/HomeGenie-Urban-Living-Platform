<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>HomeGenie Assistant</title>

<style>

body{
margin:0;
font-family:Segoe UI;
background:#ece5dd;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

.chat-box{
width:420px;
height:600px;
background:white;
display:flex;
flex-direction:column;
border-radius:10px;
overflow:hidden;
box-shadow:0 5px 20px rgba(0,0,0,0.2);
}


.chat-header{
background:#075E54;
color:white;
padding:15px;
font-size:18px;
font-weight:bold;
}


.chat-body{
flex:1;
padding:15px;
overflow-y:auto;
display:flex;
flex-direction:column;
gap:10px;
background:#efeae2;
}


.bot{
background:white;
padding:10px 15px;
border-radius:10px;
max-width:70%;
box-shadow:0 1px 3px rgba(0,0,0,0.1);
}


.user{
background:#dcf8c6;
padding:10px 15px;
border-radius:10px;
max-width:70%;
align-self:flex-end;
}


.options{
display:flex;
flex-direction:column;
gap:8px;
margin-top:10px;
}

.options button{
padding:10px;
border:none;
border-radius:20px;
background:#25D366;
color:white;
cursor:pointer;
font-size:14px;
}

.options button:hover{
background:#1ebe5d;
}

</style>

<script>

function selectService(service,page){

let chat=document.getElementById("chatBody");


let userMsg=document.createElement("div");
userMsg.className="user";
userMsg.innerText=service;
chat.appendChild(userMsg);


let botMsg=document.createElement("div");
botMsg.className="bot";
botMsg.innerHTML="✅ Thanks for selecting <b>"+service+"</b>.<br>Now redirecting you to the service page...";
chat.appendChild(botMsg);


chat.scrollTop=chat.scrollHeight;


setTimeout(function(){
window.location.href=page;
},2000);

}

</script>

</head>

<body>

<div class="chat-box">

<div class="chat-header">
🧞 HomeGenie Customer Support
</div>

<div class="chat-body" id="chatBody">

<div class="bot">
Hi 👋 <br>
How can I help you today?
</div>

<div class="options">

<button onclick="selectService('Home Cleaning','homecleaning.jsp')">
🧹 Home Cleaning
</button>

<button onclick="selectService('Repairing','repairing.jsp')">
🔧 Repairing
</button>

<button onclick="selectService('Maintenance','maintenance.jsp')">
🏠 Maintenance
</button>

<button onclick="selectService('Emergency','emergency.jsp')">
🚨 Emergency
</button>

<button onclick="selectService('Salon Services','salon.jsp')">
💇 Salon Services
</button>

</div>

</div>

</div>

</body>
</html>