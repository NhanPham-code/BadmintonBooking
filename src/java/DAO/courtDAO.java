/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Court;

/**
 *
 * @author PC
 */
public class courtDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Court> getCourtList(String stadiumID) {
        List<Court> courtList = new ArrayList<>();
        String sql = "select * from court where stadium_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Court c = new Court();
                c.setCourt_ID(rs.getString(1));
                c.setNumber(rs.getInt(2));
                c.setStadium_ID(rs.getString(3));
                courtList.add(c);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return courtList;
    }

    public List<Court> getCourtListByStadiumID(String stadiumID) {
        List<Court> courtList = new ArrayList<>();
        String sql = "select * from court where stadium_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Court c = new Court();
                c.setCourt_ID(rs.getString(1));
                c.setNumber(rs.getInt(2));
                c.setStadium_ID(rs.getString(3));
                courtList.add(c);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return courtList;
    }

    public Court getCourtByID(String courtID) {
        Court court = new Court();
        String sql = "Select * from Court where court_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, courtID);
            rs = ps.executeQuery();
            if (rs.next()) {
                court.setCourt_ID(rs.getString("court_ID"));
                court.setNumber(rs.getInt("number"));
                court.setStadium_ID(rs.getString("stadium_ID"));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return court;
    }

    public static void main(String[] args) {
        List<Court> courtList = new ArrayList<>();
        courtDAO cDAO = new courtDAO();
        courtList = cDAO.getCourtListByStadiumID("STD2");
        System.out.println(courtList.size());
    }
}
