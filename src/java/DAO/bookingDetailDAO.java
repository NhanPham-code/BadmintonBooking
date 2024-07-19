/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Court;

/**
 *
 * @author nhanPH
 */
public class bookingDetailDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    /**
     * Author: NhiTCU
     * @param bookingID
     * @return 
     */
    public List<Court> getCourtListByBookingID(String bookingID) {
        List<Court> courtList = new ArrayList<>();

        String sql = "select * from BookingDetail where booking_ID = ? ";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingID);
            rs = ps.executeQuery();
            while (rs.next()) {

                // get court
                courtDAO courtDAO = new courtDAO();
                Court crt = courtDAO.getCourtByID(rs.getString("court_ID"));

                // add to court list
                courtList.add(crt);
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return courtList;
    }

    
    /**
     * Author: TienHN
     * @param customerID
     */
    public void deleteBookingDetailCustomer(String customerID ){
        String sql = "DELETE BookingDetail FROM BookingDetail JOIN Booking ON BookingDetail.booking_ID= Booking.booking_ID WHERE Booking.customer_ID=?"; 
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public List<String> getAllBookingDetailID() {
        List<String> bookDetID = new ArrayList<>();

        String sql = "select bookingDetail_ID from BookingDetail";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                bookDetID.add(rs.getString("bookingDetail_ID"));
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bookDetID;
    }

    public int AddNewBookingDetail(String bookingDetail_ID, String booking_ID, String court_ID) {
        int index = 0;
        String sql = "INSERT INTO [dbo].[BookingDetail]\n"
                + "           ([bookingDetail_ID]\n"
                + "           ,[booking_ID]\n"
                + "           ,[court_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingDetail_ID);
            ps.setString(2, booking_ID);
            ps.setString(3, court_ID);
            index = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return index;
    }

    public static void main(String[] args) {
        bookingDetailDAO detDAO = new bookingDetailDAO();
        List<String> bookDetID = detDAO.getAllBookingDetailID();
        
        System.out.println(bookDetID.size());
    }
}
