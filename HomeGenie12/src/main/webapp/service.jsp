<%@ page import="java.util.*,daoimpl.ServiceDAOImpl,model.Service" %>

<h2>Available Services</h2>

<%

ServiceDAOImpl dao=new ServiceDAOImpl();

List<Service> list=dao.getAllServices();

for(Service s:list){

%>

<div>

<h3><%=s.getServiceName()%></h3>

<p><%=s.getDescription()%></p>

<p>Price: ₹<%=s.getPrice()%></p>

<button>Book Now</button>

</div>

<%

}

%>