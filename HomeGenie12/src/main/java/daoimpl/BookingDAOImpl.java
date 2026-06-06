package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.BookingDAO;
import model.Booking;
import util.DBConnection;

public class BookingDAOImpl {

    public List<Booking> getBookingsByService(int serviceId) {

        List<Booking> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings WHERE service_id=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, serviceId);

            rs = ps.executeQuery();

            while (rs.next()) {

                Booking b = new Booking();

                b.setId(rs.getInt("id"));
                b.setServiceId(rs.getInt("service_id"));
                b.setCustomerName(rs.getString("customer_name"));
                b.setBookingDate(rs.getDate("booking_date"));
                b.setBookingTime(rs.getString("booking_time"));
                b.setAssignedWorker(rs.getString("assigned_worker"));
                b.setStatus(rs.getString("status"));
                b.setPhone(rs.getString("phone"));
                b.setAddress(rs.getString("address"));

                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return list;
    }
}