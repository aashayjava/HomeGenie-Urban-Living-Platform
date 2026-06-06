<%@ page import="java.util.*" %>

<%

String service = request.getParameter("service_name");
String price = request.getParameter("price");

List<String[]> cart = (List<String[]>)session.getAttribute("cart");

if(cart == null){
cart = new ArrayList<>();
}

cart.add(new String[]{service,price});

session.setAttribute("cart",cart);

%>