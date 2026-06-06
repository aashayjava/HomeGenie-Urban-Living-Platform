package dao;

import java.util.*;
import java.sql.*;
import model.Booking;

public class BookingDAO {

    private Connection conn;

    public BookingDAO(Connection conn){
        this.conn = conn;
    }

    // Get bookings by service id
    public List<Booking> getBookingsByService(int serviceId) {

        List<Booking> list = new ArrayList<>();

        String sql = "SELECT * FROM bookings WHERE service_id=?";

        try(PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, serviceId);

            try(ResultSet rs = ps.executeQuery()){

                while(rs.next()){

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

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }


    // Delete booking
    public boolean deleteBooking(int id){

        boolean f = false;

        String sql = "DELETE FROM bookings WHERE id=?";

        try(PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if(rows > 0){
                f = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }

}