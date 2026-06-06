<%@ page import="java.util.*" %>

<%

String service=request.getParameter("service_name");

List<String[]> cart=(List<String[]>)session.getAttribute("cart");

if(cart!=null){

for(int i=0;i<cart.size();i++){

if(cart.get(i)[0].equals(service)){
cart.remove(i);
break;
}

}

session.setAttribute("cart",cart);

}

%>