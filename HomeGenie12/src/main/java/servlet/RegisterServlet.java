package servlet;

import util.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String username = request.getParameter("username");
String password = request.getParameter("password");

try{

Connection con = DBConnection.getConnection();

PreparedStatement check = con.prepareStatement(
"SELECT * FROM users WHERE username=?");

check.setString(1, username);

ResultSet rs = check.executeQuery();

if(rs.next()){

request.setAttribute("msg","exists");

}else{

PreparedStatement ps = con.prepareStatement(
"INSERT INTO users(username,password,role) VALUES(?,?,?)");

ps.setString(1, username);
ps.setString(2, password);
ps.setString(3, "user");

ps.executeUpdate();

request.setAttribute("msg","registered");

}

RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
rd.forward(request,response);

}catch(Exception e){
e.printStackTrace();
}

}
}