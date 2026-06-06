package dao;

import java.sql.*;
import java.util.*;
import model.Worker;

public class WorkerDAO {

    private Connection conn;

    public WorkerDAO(Connection conn){
        this.conn = conn;
    }

    public List<Worker> getAllWorkers(){

        List<Worker> list = new ArrayList<>();

        try{

            String sql = "SELECT * FROM workers";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Worker w = new Worker();

                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setPhone(rs.getString("phone"));
                w.setServiceId(rs.getInt("service_id"));
                w.setExperience(rs.getInt("experience"));
                w.setStatus(rs.getString("status"));

                list.add(w);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

}