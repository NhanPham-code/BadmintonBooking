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

    /**
     * Author: NhiTCU
     * 
     * @param id
     * @return 
     */
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
                sto.setAcc_ID(rs.getString("acc_ID"));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return sto;
    }

    /**
     * Author: NhiTCU
     * 
     * @param accID
     * @return 
     */
    public StadiumOwner getStadiumOwnerByAccID(String accID) {
        StadiumOwner sto = null;
        accountDAO acDAO = new accountDAO();
        String sql = "select * from StadiumOwner where acc_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, accID);
            rs = ps.executeQuery();
            if (rs.next()) {
                sto = new StadiumOwner();
                sto.setOwner_ID(rs.getString("owner_ID"));
                sto.setOwner_name(rs.getString("owner_name"));
                sto.setOwner_phone(rs.getString("owner_phone"));
                sto.setAcc_ID(rs.getString("acc_ID"));
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return sto;
    }

    public List<StadiumOwner> getAllStadiumOwner() {
        List<StadiumOwner> ownerList = new ArrayList<>();
        String sql = "select * from StadiumOwner";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                StadiumOwner owner = new StadiumOwner();
                owner.setOwner_ID(rs.getString("owner_ID"));
                owner.setOwner_name(rs.getString("owner_name"));
                owner.setOwner_phone(rs.getString("owner_phone"));
                owner.setAcc_ID(rs.getString("acc_ID"));

                ownerList.add(owner);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return ownerList;
    }

    /**
     * Author: NhiTCU
     * 
     * @param owner
     * @return 
     */
    public int addNewOwner(StadiumOwner owner) {
        int check = 0;
        String getMaxOwnerID = "SELECT MAX(owner_ID) FROM StadiumOwner";
        int maxNumber = 0;
        String newOwnerID = null;

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(getMaxOwnerID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String maxOwnerID = rs.getString(1);
                // Extract the numeric part from the maximum account_ID
                maxNumber = Integer.parseInt(maxOwnerID.substring(5)); // Assuming "ACC" prefix
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (int i = 1; i <= maxNumber + 1; i++) {
            String proposedOwnerID = "OWNER" + i;
            boolean ownerIDExists = false;

            // Check if proposedStadiumID already exists in the database
            String checkOwnerIDExists = "SELECT COUNT(*) FROM StadiumOwner WHERE owner_ID = ?";
            try {
                ps = conn.prepareStatement(checkOwnerIDExists);
                ps.setString(1, proposedOwnerID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        ownerIDExists = true;
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (!ownerIDExists) {
                newOwnerID = proposedOwnerID;
                break;
            }
        }

        if (newOwnerID == null) {
            return check; //Không thể tạo mới Account_ID!
        }

        String sql = "INSERT INTO [dbo].[StadiumOwner]\n"
                + "           ([owner_ID]\n"
                + "           ,[owner_name]\n"
                + "           ,[owner_phone]\n"
                + "           ,[acc_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newOwnerID);
            ps.setString(2, owner.getOwner_name());
            ps.setString(3, owner.getOwner_phone());
            ps.setString(4, owner.getAcc_ID());
            check = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(stadiumOwnerDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return check;
    }
    
    /**
     * Author: TienHN
     * @param StdoID
     * @param name
     * @param phone
     */
    public void updateProfile(String StdoID, String name, String phone){
        String sql = "update StadiumOwner set owner_name = ?, owner_phone = ? where owner_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, StdoID);
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
    
    /**
     * Author: TienHN
     * @param accID
     */
    public void deleteStadiumOwner(String accID){
        String sql = "DELETE StadiumOwner WHERE acc_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, accID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
    }
    public static void main(String[] args) {
        stadiumOwnerDAO dao = new stadiumOwnerDAO();

        StadiumOwner sto = new StadiumOwner();
        sto.setOwner_ID("OWNER3");
        sto.setOwner_name("owner3");
        sto.setOwner_phone("0939740742");
        sto.setAcc_ID("ACC6");
        
        int check = dao.addNewOwner(sto);
        System.out.println(check);
    }

}
