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
import java.util.Comparator;
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

    /**
     * Author: NhiTCU
     *
     * @param stadiumID
     * @return
     */
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
        courtList.sort(Comparator.comparingInt(Court::getNumber));
        return courtList;
    }

    /**
     * Author: TienHN
     * @param courtID
     * @return Court
     */
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

    /**
     *
     * @Author Dang
     */
    public boolean addCourt(String stadiumID) throws Exception {
        String getMaxCourtID = "SELECT MAX(court_ID) FROM Court";
        String getMaxNumber = "SELECT MAX(number) FROM Court WHERE stadium_ID = ?";
        String insertCourt = "INSERT INTO Court (court_ID, number, stadium_ID) VALUES (?, ?, ?)";

        try {
            conn = db.getConnection();

            // Get the maximum court_ID and number for the stadium
            ps = conn.prepareStatement(getMaxCourtID);
            rs = ps.executeQuery();
            String maxCourtID = null;
            if (rs.next()) {
                maxCourtID = rs.getString(1);
            }

            ps = conn.prepareStatement(getMaxNumber);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            int maxNumber = 0;
            if (rs.next()) {
                maxNumber = rs.getInt(1);
            }

            // Create a new court_ID
            String newCourtID = "CRT1";

            // Find the next available number for the stadium
            int newNumber = 1;

            // Check and adjust the court_ID if necessary
            if (maxNumber > 0) {
                // Find the next available number
                for (int i = 1; i <= maxNumber + 1; i++) {
                    boolean numberExists = false;
                    String checkNumberExists = "SELECT COUNT(*) FROM Court WHERE stadium_ID = ? AND number = ?";
                    ps = conn.prepareStatement(checkNumberExists);
                    ps.setString(1, stadiumID);
                    ps.setInt(2, i);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        if (rs.getInt(1) > 0) {
                            numberExists = true;
                        }
                    }
                    if (!numberExists) {
                        newNumber = i;
                        break;
                    }
                }
            } else {
                // If maxNumber <= 0, start from number 1
                newNumber = 1;
            }

            // Check and adjust the court_ID if necessary
            if (maxCourtID != null) {
                int num = 1;
                while (true) {
                    String proposedCourtID = "CRT" + num;
                    boolean courtIDExists = false;
                    String checkCourtIDExists = "SELECT COUNT(*) FROM Court WHERE court_ID = ?";
                    ps = conn.prepareStatement(checkCourtIDExists);
                    ps.setString(1, proposedCourtID);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        if (rs.getInt(1) > 0) {
                            courtIDExists = true;
                        }
                    }
                    if (!courtIDExists) {
                        newCourtID = proposedCourtID;
                        break;
                    }
                    num++;
                }
            }

            // Insert the new court into Court
            ps = conn.prepareStatement(insertCourt);
            ps.setString(1, newCourtID);
            ps.setInt(2, newNumber);
            ps.setString(3, stadiumID);
            ps.executeUpdate();

            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

    /**
     * Author: Dang
     * @param courtID
     * @return 
     */
    public boolean deleteCourt(String courtID) {
        String deleteBookingDetails = "DELETE FROM BookingDetail WHERE court_ID = ?";
        String deleteCourt = "DELETE FROM Court WHERE court_ID = ?";
        try {
            conn = db.getConnection();

            // Start transaction
            conn.setAutoCommit(false);

            // Delete from BookingDetail
            ps = conn.prepareStatement(deleteBookingDetails);
            ps.setString(1, courtID);
            ps.executeUpdate();

            // Delete from Court
            ps = conn.prepareStatement(deleteCourt);
            ps.setString(1, courtID);
            ps.executeUpdate();

            // Commit transaction
            conn.commit();
            return true;
        } catch (Exception ex) {
            try {
                // Rollback transaction if any error occurs
                conn.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        List<Court> courtList = new ArrayList<>();
        courtDAO cDAO = new courtDAO();
        courtList = cDAO.getCourtListByStadiumID("STD2");
        System.out.println(courtList.size());
    }
}
