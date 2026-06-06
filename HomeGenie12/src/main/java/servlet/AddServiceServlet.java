package servlet;

import daoimpl.ServiceDAOImpl;
import model.Service;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addService")
public class AddServiceServlet extends HttpServlet {

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException{

try{

String name=request.getParameter("name");
String desc=request.getParameter("description");
int price=Integer.parseInt(
request.getParameter("price")
);

Service s=new Service();

s.setServiceName(name);
s.setDescription(desc);
s.setPrice(price);

ServiceDAOImpl dao=new ServiceDAOImpl();

dao.addService(s);

/* redirect to dashboard after insert */
response.sendRedirect("adminDashboard");

}
catch(Exception e){
e.printStackTrace();
response.getWriter().println(
"Error : "+e.getMessage()
);
}

}
}