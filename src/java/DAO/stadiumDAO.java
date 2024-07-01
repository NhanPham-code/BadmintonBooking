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
import model.Stadium;
import model.StadiumOwner;

/**
 *
 * @author nhanPH
 */
public class stadiumDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Stadium> getAllStadium() {
        stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
        List<Stadium> stadiumList = new ArrayList<>();
        String sql = "select * from Stadium";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Stadium st = new Stadium();
                st.setStadium_ID(rs.getString("stadium_ID"));
                st.setStadium_name(rs.getString("stadium_name"));
                st.setStadium_address(rs.getString("stadium_address"));
                st.setStadium_phone(rs.getString("stadium_phone"));
                st.setOpentime(rs.getString("opentime"));
                st.setStadium_image(rs.getString("stadium_image"));
                st.setAvg_ratingScore(rs.getDouble("avg_ratingScore"));
                st.setPricePerHour(rs.getInt("pricePerHour"));
                st.setQRcode(rs.getString("QRCode"));
                // get stadium owner of stadium
                StadiumOwner sto = stoDAO.getStadiumOwnerById(rs.getString("owner_ID"));
                st.setOwner(sto);

                stadiumList.add(st);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return stadiumList;
    }

    public List<Stadium> searchStadiumByKey(String key) {
        stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
        List<Stadium> stList = new ArrayList<>();
        String sql = "SELECT * FROM stadium WHERE stadium_name LIKE ? OR stadium_address LIKE ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Stadium st = new Stadium();
                st.setStadium_ID(rs.getString("stadium_ID"));
                st.setStadium_name(rs.getString("stadium_name"));
                st.setStadium_address(rs.getString("stadium_address"));
                st.setStadium_phone(rs.getString("stadium_phone"));
                st.setOpentime(rs.getString("opentime"));
                st.setStadium_image(rs.getString("stadium_image"));
                st.setAvg_ratingScore(rs.getDouble("avg_ratingScore"));
                st.setPricePerHour(rs.getInt("pricePerHour"));
                st.setQRcode(rs.getString("QRCode"));
                // get stadium owner of stadium
                StadiumOwner sto = stoDAO.getStadiumOwnerById(rs.getString("owner_ID"));
                st.setOwner(sto);

                stList.add(st);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return stList;
    }

    public Stadium getStadiumByID(String stadiumID) {
        stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
        Stadium stadium = null;
        String sql = "SELECT * FROM Stadium WHERE stadium_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            if (rs.next()) {
                stadium = new Stadium();
                stadium.setStadium_ID(rs.getString("stadium_ID"));
                stadium.setStadium_name(rs.getString("stadium_name"));
                stadium.setStadium_address(rs.getString("stadium_address"));
                stadium.setStadium_phone(rs.getString("stadium_phone"));
                stadium.setOpentime(rs.getString("opentime"));
                stadium.setStadium_image(rs.getString("stadium_image"));
                stadium.setAvg_ratingScore(rs.getDouble("avg_ratingScore"));
                stadium.setPricePerHour(rs.getInt("pricePerHour"));
                stadium.setQRcode(rs.getString("QRCode"));
                // get stadium owner of stadium
                StadiumOwner sto = stoDAO.getStadiumOwnerById(rs.getString("owner_ID"));
                stadium.setOwner(sto);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return stadium;
    }

    public boolean deleteStadium(String stadium_ID) {
        String deleteFeedbacksSql = "DELETE FROM Feedback WHERE stadium_ID = ?";
        String deleteBookingDetailsSql = "DELETE FROM BookingDetail WHERE booking_ID IN (SELECT booking_ID FROM Booking WHERE stadium_ID = ?)";
        String deleteBookingsSql = "DELETE FROM Booking WHERE stadium_ID = ?";
        String deleteCourtsSql = "DELETE FROM Court WHERE stadium_ID = ?";
        String deleteStadiumSql = "DELETE FROM Stadium WHERE stadium_ID = ?";

        try {
            conn = db.getConnection();

            // Bắt đầu transaction
            conn.setAutoCommit(false);

            // Xóa các hàng trong bảng Feedback
            ps = conn.prepareStatement(deleteFeedbacksSql);
            ps.setString(1, stadium_ID);
            ps.executeUpdate();

            // Xóa các hàng trong bảng BookingDetail
            ps = conn.prepareStatement(deleteBookingDetailsSql);
            ps.setString(1, stadium_ID);
            ps.executeUpdate();

            // Xóa các hàng trong bảng Booking
            ps = conn.prepareStatement(deleteBookingsSql);
            ps.setString(1, stadium_ID);
            ps.executeUpdate();

            // Xóa các hàng trong bảng Court
            ps = conn.prepareStatement(deleteCourtsSql);
            ps.setString(1, stadium_ID);
            ps.executeUpdate();

            // Xóa sân vận động
            ps = conn.prepareStatement(deleteStadiumSql);
            ps.setString(1, stadium_ID);

            int affectedRows = ps.executeUpdate();

            // Commit transaction
            conn.commit();

            return affectedRows > 0;

        } catch (Exception ex) {
            try {
                // Rollback transaction nếu có lỗi xảy ra
                conn.rollback();
            } catch (Exception rollbackEx) {
                System.out.println(rollbackEx);
            }
            System.out.println(ex);
            return false;
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (Exception autoCommitEx) {
                System.out.println(autoCommitEx);
            }
        }

    }

    public List<Stadium> getStadiumByStadiumOwnerID(String ownerID) {
        stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
        List<Stadium> stadiumList = new ArrayList<>();
        String sql = "select * from Stadium where owner_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ownerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Stadium st = new Stadium();
                st.setStadium_ID(rs.getString("stadium_ID"));
                st.setStadium_name(rs.getString("stadium_name"));
                st.setStadium_address(rs.getString("stadium_address"));
                st.setStadium_phone(rs.getString("stadium_phone"));
                st.setOpentime(rs.getString("opentime"));
                st.setStadium_image(rs.getString("stadium_image"));
                st.setAvg_ratingScore(rs.getDouble("avg_ratingScore"));
                st.setPricePerHour(rs.getInt("pricePerHour"));
                st.setQRcode(rs.getString("QRCode"));
                // get stadium owner of stadium
                StadiumOwner sto = stoDAO.getStadiumOwnerById(rs.getString("owner_ID"));
                st.setOwner(sto);

                stadiumList.add(st);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return stadiumList;
    }
    
    /**
     * Author: PhuocDH
     * @param stadium_ID
     * @return 
     */
    
    public int getTimeOpenByStadiumID(String stadium_ID) {
        String sql = "select opentime from Stadium where stadium_ID = ?";
        String openTime = null;
        int time = 0;
        
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadium_ID);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                openTime = rs.getString("opentime");
            }
            
            time = Integer.parseInt(openTime.split("-")[0].split(":")[0]);

        } catch (Exception ex) {
            System.out.println();
        }
        return time;
    }

    public static void main(String[] args) {
        stadiumDAO stDAO = new stadiumDAO();
//        String ownerID = "OWNER1";
//        List<Stadium> stList = new ArrayList<>();
//        stList = stDAO.getStadiumByStadiumOwnerID(ownerID);
//
//        for (int i = 0; i < stList.size(); i++) {
//            Stadium st = stList.get(i);
//            System.out.println(st.getStadium_ID());
//            System.out.println(st.getAvg_ratingScore());
//        }

        String stadium_ID = "STD3";
        int time = stDAO.getTimeOpenByStadiumID(stadium_ID);
        System.out.println(time);
    }

}
