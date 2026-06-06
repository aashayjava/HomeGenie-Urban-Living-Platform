package daoimpl;

import dao.UserDAO;
import model.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO{

    public User login(User user){

        User u=null;

        try{

            Connection con=DBConnection.getConnection();

            String query="select * from users where username=? and password=?";

            PreparedStatement ps=con.prepareStatement(query);

            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                u=new User();

                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return u;
    }
    public int register(User user) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "insert into user(username,password,role) values(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, "user");

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public boolean checkUser(String username) {

        boolean exists = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "select * from users where username=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                exists = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
}