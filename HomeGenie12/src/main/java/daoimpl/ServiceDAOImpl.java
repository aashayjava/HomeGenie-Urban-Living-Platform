package daoimpl;

import dao.ServiceDAO;
import model.Service;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAOImpl implements ServiceDAO {

    // GET ALL SERVICES
    public List<Service> getAllServices(){

        List<Service> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String query = "select * from services";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Service s = new Service();

                s.setId(rs.getInt("id"));
                s.setServiceName(rs.getString("service_name"));
                s.setDescription(rs.getString("description"));
                s.setPrice(rs.getInt("price"));

                list.add(s);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // ADD SERVICE
    public boolean addService(Service s){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String query="insert into services(service_name,description,price) values(?,?,?)";

            PreparedStatement ps=con.prepareStatement(query);

            ps.setString(1,s.getServiceName());
            ps.setString(2,s.getDescription());
            ps.setInt(3,s.getPrice());

            int i=ps.executeUpdate();

            if(i>0){
                status=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    // DELETE SERVICE
    public boolean deleteService(int id){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String query="delete from services where id=?";

            PreparedStatement ps=con.prepareStatement(query);

            ps.setInt(1,id);

            int i=ps.executeUpdate();

            if(i>0){
                status=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

    // UPDATE SERVICE
    public boolean updateService(Service s){

        boolean status=false;

        try{

            Connection con=DBConnection.getConnection();

            String query="update services set service_name=?, description=?, price=? where id=?";

            PreparedStatement ps=con.prepareStatement(query);

            ps.setString(1,s.getServiceName());
            ps.setString(2,s.getDescription());
            ps.setInt(3,s.getPrice());
            ps.setInt(4,s.getId());

            int i=ps.executeUpdate();

            if(i>0){
                status=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }

	@Override
	public Service getServiceById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}