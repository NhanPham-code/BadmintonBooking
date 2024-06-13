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
    
    public List<Feedback> getFeedbackList(String stadiumID){
        customerDAO cDAO =  new customerDAO();
        List<Feedback> FeedbackList = new ArrayList<>();
        String sql = "select * from Feedback where stadium_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setRatingScore(rs.getFloat(1));
                fb.setDescription(rs.getString(2));
                fb.setCustomer(cDAO.getCustomerNyID(rs.getString(3)));
                fb.setStadium_ID(rs.getString(4));
                FeedbackList.add(fb);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return FeedbackList;
    }
    
    public List<Feedback> getFeedbackFilterList(String stadiumID, int ratingScore){
        customerDAO cDAO =  new customerDAO();
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
                fb.setRatingScore(rs.getFloat(1));
                fb.setDescription(rs.getString(2));
                fb.setCustomer(cDAO.getCustomerNyID(rs.getString(3)));
                fb.setStadium_ID(rs.getString(4));
                FeedbackList.add(fb);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return FeedbackList;
    }
    
    public static void main(String[] args) {
        
    }
}
