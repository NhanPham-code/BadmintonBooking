/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author nhanPH
 */
public class accountDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();
    
    public Account getAccountById(String id) {
        Account ac = new Account();
        
        String sql = "select * from Account where acc_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ac.setAcc_ID(rs.getString("acc_ID"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setRole(rs.getString("role"));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        
        return ac;
    }
    
    public static void main(String[] args) {
        accountDAO dao = new accountDAO();
        
        Account ac = dao.getAccountById("ACC002");
        
        System.out.println(ac.getAcc_ID() + ac.getEmail());
        
    }
}
