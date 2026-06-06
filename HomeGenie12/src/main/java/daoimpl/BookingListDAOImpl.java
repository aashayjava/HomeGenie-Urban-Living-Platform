package daoimpl;

import dao.BookingListDAO;
import model.BookingList;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingListDAOImpl implements BookingListDAO {

    public List<BookingList> getAllBookings() {

        List<BookingList> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BookingList b = new BookingList();

                b.setId(rs.getInt("id"));
                b.setServiceName(rs.getString("service_name"));
                b.setCustomer(rs.getString("customer"));
                b.setPhone(rs.getString("phone"));
                b.setWorker(rs.getString("worker"));
                b.setDate(rs.getString("date"));
                b.setTime(rs.getString("time"));
                b.setPrice(rs.getInt("price"));
                b.setStatus(rs.getString("status"));

                list.add(b);
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