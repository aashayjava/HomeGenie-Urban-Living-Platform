<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");

String serviceIdStr=request.getParameter("service_id");
String serviceName=request.getParameter("service_name");
String price=request.getParameter("price");

String customer=request.getParameter("customer");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String date=request.getParameter("date");
String time=request.getParameter("time");
String worker=request.getParameter("worker");

String messageStatus="";

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/homegenie",
"root",
"root"
);

PreparedStatement ps=con.prepareStatement(
"INSERT INTO bookings(service_id,customer_name,booking_date,booking_time,assigned_worker,status,phone,address) VALUES(?,?,?,?,?,?,?,?)"
);

ps.setInt(1,1);
ps.setString(2,customer);
ps.setString(3,date);
ps.setString(4,time);
ps.setString(5,worker);
ps.setString(6,"Confirmed");
ps.setString(7,phone);
ps.setString(8,address);

ps.executeUpdate();

final String senderEmail="homegenie31@gmail.com";
final String senderPassword="rxaa pkwu xhpy fbym";

Properties props=new Properties();

props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.port","587");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.starttls.enable","true");

Session mailSession=Session.getInstance(props,
new Authenticator(){
protected PasswordAuthentication getPasswordAuthentication(){
return new PasswordAuthentication(senderEmail,senderPassword);
}
});

MimeMessage message=new MimeMessage(mailSession);

message.setFrom(new InternetAddress(senderEmail));
message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));

message.setSubject("HomeGenie Booking Confirmed","UTF-8");

String mailContent=
"<h2 style='color:#2563eb'>HomeGenie Booking Confirmation</h2>"
+"<p>Hello <b>"+customer+"</b></p>"
+"<p>Your booking is confirmed.</p>"
+"<table border='1' cellpadding='10'>"
+"<tr><th>Service</th><td>"+serviceName+"</td></tr>"
+"<tr><th>Date</th><td>"+date+"</td></tr>"
+"<tr><th>Time</th><td>"+time+"</td></tr>"
+"<tr><th>Worker</th><td>"+worker+"</td></tr>"
+"<tr><th>Amount</th><td>&#8377;"+price+"</td></tr>"
+"<tr><th>Address</th><td>"+address+"</td></tr>"
+"</table>";

message.setContent(mailContent,"text/html; charset=UTF-8");

Transport.send(message);

messageStatus="Email sent successfully";

}catch(Exception e){

messageStatus="Error: "+e.getMessage();

}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<style>

body{
font-family:"Segoe UI",Arial;
background:#f1f5f9;
display:flex;
align-items:center;
justify-content:center;
height:100vh;
}

.box{
background:white;
padding:40px;
border-radius:12px;
text-align:center;
width:500px;
}

.success{
font-size:60px;
color:#22c55e;
}

a{
display:inline-block;
margin-top:20px;
padding:12px 20px;
background:#2563eb;
color:white;
text-decoration:none;
border-radius:6px;
}

</style>

</head>

<body>

<div class="box">

<div class="success">✔</div>

<h2>Booking Successful</h2>

<p>Your booking has been confirmed.</p>

<p><%=messageStatus%></p>

<a href="index.jsp">Go Home</a>

</div>

</body>
</html>