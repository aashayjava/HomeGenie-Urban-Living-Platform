package daoimpl;

import model.Worker;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WorkerDAOImpl {

    public List<Worker> getAllWorkers() {

        List<Worker> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM workers";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Worker w = new Worker();

                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setPhone(rs.getString("phone"));
                w.setServiceId(rs.getInt("service_id"));
                w.setExperience(rs.getInt("experience"));
                w.setStatus(rs.getString("status"));

                list.add(w);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}