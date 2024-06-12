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
import model.StadiumOwner;

/**
 *
 * @author nhanPH
 */
public class stadiumOwnerDAO {
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();
    
    public StadiumOwner getStadiumOwnerById(String id) {
        StadiumOwner sto = new StadiumOwner();
        accountDAO acDAO = new accountDAO();
        String sql = "select * from StadiumOwner where owner_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                sto.setOwner_ID(rs.getString("owner_ID"));
                sto.setOwner_name(rs.getString("owner_name"));
                sto.setOwner_phone(rs.getString("owner_phone"));
                
                // get account of stadium owner to set for owner
                Account ac = acDAO.getAccountById(rs.getString("acc_ID"));
                sto.setAccount(ac);
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return sto;
    }
    
    public static void main(String[] args) {
        stadiumOwnerDAO dao = new stadiumOwnerDAO();
        
        StadiumOwner sto = dao.getStadiumOwnerById("OWNER002");
        
        System.out.println(sto.getOwner_name());
        System.out.println(sto.getAccount().getEmail());
    }
}
