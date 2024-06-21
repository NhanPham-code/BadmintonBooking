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
    
    public List<Court> getCourtListByBookingID(String bookingID) {
        List<Court> courtList = new ArrayList<>();
        
        String sql = "select * from BookingDetail where booking_ID = ? ";
        
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingID);
            rs = ps.executeQuery();
            while(rs.next()) {

                
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
    
    public static void main(String[] args) {
        
    }
}
