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

    public StadiumOwner getStadimOwnerByAccID(String accID) {
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

    public int addNewOwner(StadiumOwner owner) {
        int check = 0;
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
            ps.setString(1, owner.getOwner_ID());
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

    public static void main(String[] args) {
        stadiumOwnerDAO dao = new stadiumOwnerDAO();

        StadiumOwner sto = dao.getStadimOwnerByAccID("ACC7");

        System.out.println(sto.getOwner_name());

    }

}
