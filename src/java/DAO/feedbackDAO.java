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
import model.Feedback;

/**
 *
 * @author ADMIN
 */
public class feedbackDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Feedback> getFeedbackList(String stadiumID) {
        customerDAO cDAO = new customerDAO();
        List<Feedback> FeedbackList = new ArrayList<>();
        String sql = "select * from Feedback where stadium_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setRatingScore(rs.getInt(1));
                fb.setDescription(rs.getString(2));
                fb.setCustomer(cDAO.getCustomerByID(rs.getString(3)));
                fb.setStadium_ID(rs.getString(4));
                FeedbackList.add(fb);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return FeedbackList;
    }

    public List<Feedback> getFeedbackFilterList(String stadiumID, int ratingScore) {
        customerDAO cDAO = new customerDAO();
        List<Feedback> FeedbackList = new ArrayList<>();
        String sql = "select * from Feedback where stadium_ID = ? AND ratingScore = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            ps.setInt(2, ratingScore);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setRatingScore(rs.getInt(1));
                fb.setDescription(rs.getString(2));
                fb.setCustomer(cDAO.getCustomerByID(rs.getString(3)));
                fb.setStadium_ID(rs.getString(4));
                FeedbackList.add(fb);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return FeedbackList;
    }

    public Feedback getFeedback(String stadiumID, String customerID) {
        customerDAO cDAO = new customerDAO();
        Feedback fb = new Feedback();
        String sql = "select * from Feedback where stadium_ID = ? AND customer_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            ps.setString(2, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {

                fb.setRatingScore(rs.getInt(1));
                fb.setDescription(rs.getString(2));
                fb.setCustomer(cDAO.getCustomerByID(rs.getString(3)));
                fb.setStadium_ID(rs.getString(4));
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return fb;
    }

    public void addNewFeedback(String description, int ratingScore, String customer_ID, String stadium_ID) {
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([ratingScore]\n"
                + "           ,[description]\n"
                + "           ,[customer_ID]\n"
                + "           ,[stadium_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setFloat(1, ratingScore);
            ps.setString(2, description);
            ps.setString(3, customer_ID);
            ps.setString(4, stadium_ID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }

    }

    public void updateFeedback(String description, int ratingScore, String customer_ID, String stadium_ID) {
        String sql = "UPDATE Feedback SET ratingScore = ?, description = ? WHERE stadium_ID=? AND customer_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setFloat(1, ratingScore);
            ps.setString(2, description);
            ps.setString(3, stadium_ID);
            ps.setString(4, customer_ID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }

    }

    public void deleteFeedback(String customer_ID, String stadium_ID) {
        String sql = "DELETE Feedback WHERE stadium_ID=? AND customer_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadium_ID);
            ps.setString(2, customer_ID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }

    }

    public static void main(String[] args) {
        Feedback cusFeedback = new Feedback();
        feedbackDAO fbDAO = new feedbackDAO();
        cusFeedback = fbDAO.getFeedback("STD001", "CUST2");
        System.out.println(cusFeedback.getDescription());
    }
}
