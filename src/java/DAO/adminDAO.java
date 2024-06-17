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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Admin;

/**
 *
 * @author nhanPH
 */
public class adminDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();
    
    public Admin getAdminByAccID(String accID) {
        Admin ad = null;
        accountDAO acDAO = new accountDAO();
        String sql = "select * from Admin where acc_ID = ?";
         try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, accID);
            rs = ps.executeQuery();
            if (rs.next()) {
                ad = new Admin();
                ad.setAdmin_ID(rs.getString("admin_ID"));
                ad.setAdmin_name(rs.getString("admin_name"));
                ad.setAdmin_phone(rs.getString("admin_phone"));
                ad.setAcc_ID(accID);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return ad;
    }
    
    public void updateProfile(String AdID, String name, String phone){
        String sql = "update customer set admin_name = ?, admin_phone = ? where admin_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, AdID);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
    public static void main(String[] args) {
        adminDAO aDAO = new adminDAO();
        
        Admin ad = aDAO.getAdminByAccID("ACC001");
        
        System.out.println(ad.getAdmin_name());
        
    }
}
