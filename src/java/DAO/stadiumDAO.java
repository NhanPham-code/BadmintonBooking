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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    /**
     * Author: NhiTCU
     *
     * @param ownerID
     * @return
     */
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
     * Author: NhanNQT
     *
     * @param stadium_name
     * @param stadium_address
     * @param stadium_phone
     * @param opentime
     * @param relativeStadiumPath
     * @param pricePerHour
     * @param relativeQRCodePath
     * @param stadium_ID
     */
    public void updateStadium(String stadium_name, String stadium_address, String stadium_phone, String opentime, String relativeStadiumPath, int pricePerHour, String relativeQRCodePath, String stadium_ID) {
        String sql = "UPDATE Stadium SET stadium_name=?, stadium_address=?, stadium_phone=?, opentime=?, stadium_image=?,  pricePerHour=?, QRCode=? WHERE stadium_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            // Set parameters for the prepared statement
            ps.setString(1, stadium_name);
            ps.setString(2, stadium_address);
            ps.setString(3, stadium_phone);
            ps.setString(4, opentime);
            ps.setString(5, relativeStadiumPath);
            ps.setInt(6, pricePerHour);
            ps.setString(7, relativeQRCodePath);
            ps.setString(8, stadium_ID);
            // Execute the update statemen
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
     * Author: NhanNQT
     *
     * @param stadium
     * @return
     */
    public int addNewStadium(Stadium stadium) {
        String getMaxStadiumID = "SELECT MAX(stadium_ID) FROM Stadium";
        int maxNumber = 0;
        String newStadiumID = null;

        int check = 0;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(getMaxStadiumID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String maxStadiumID = rs.getString(1);
                // Extract the numeric part from the maximum stadium_ID
                maxNumber = Integer.parseInt(maxStadiumID.substring(3)); // Assuming "STD" prefix
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (int i = 1; i <= maxNumber + 1; i++) {
            String proposedStadiumID = "STD" + i;
            boolean stadiumIDExists = false;

            // Check if proposedStadiumID already exists in the database
            String checkStadiumIDExists = "SELECT COUNT(*) FROM Stadium WHERE stadium_ID = ?";
            try {
                ps = conn.prepareStatement(checkStadiumIDExists);
                ps.setString(1, proposedStadiumID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        stadiumIDExists = true;
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (!stadiumIDExists) {
                newStadiumID = proposedStadiumID;
                break;
            }
        }

        if (newStadiumID == null) {
            return check; //Không thể tạo mới stadium_ID!
        }

        String sql = "INSERT INTO [dbo].[Stadium]\n"
                + "           ([stadium_ID]\n"
                + "           ,[stadium_name]\n"
                + "           ,[stadium_address]\n"
                + "           ,[stadium_phone]\n"
                + "           ,[opentime]\n"
                + "           ,[stadium_image]\n"
                + "           ,[avg_ratingScore]\n"
                + "           ,[pricePerHour]\n"
                + "           ,[QRCode]\n"
                + "           ,[owner_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newStadiumID);
            ps.setString(2, stadium.getStadium_name());
            ps.setString(3, stadium.getStadium_address());
            ps.setString(4, stadium.getStadium_phone());
            ps.setString(5, stadium.getOpentime());
            ps.setString(6, stadium.getStadium_image());
            ps.setDouble(7, stadium.getAvg_ratingScore());
            ps.setInt(8, stadium.getPricePerHour());
            ps.setString(9, stadium.getQRcode());
            ps.setString(10, stadium.getOwner().getOwner_ID());
            check = ps.executeUpdate();
            courtDAO courtDAO = new courtDAO();
            courtDAO.addCourt(newStadiumID);

        } catch (Exception ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return check;
    }

    /**
     * Author: PhuocDH
     *
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

    //PhuocDH
    //Lấy độ dài của list thời gian
    public int getTimeScheduleByStadiumID(String stadium_ID) {
        String sql = "select opentime from Stadium where stadium_ID = ?";
        String openTime = null;
        int timeSchedule = 0;

        try {
            conn = db.getConnection();
            if (conn == null) {
                System.out.println("Connection is null");
                return 0;
            }

            ps = conn.prepareStatement(sql);
            ps.setString(1, stadium_ID);
            //System.out.println("Executing query for stadium_ID: " + stadium_ID);

            rs = ps.executeQuery();

            //get opentime (open-close) in database
            if (rs.next()) {
                openTime = rs.getString("opentime");
            }

            //get number element of list 
            if (openTime != null && !openTime.isEmpty()) {
                String[] times = openTime.split("-");
                int openedTime = Integer.parseInt(times[0].split(":")[0]);
                int closedTime = Integer.parseInt(times[1].split(":")[0]);

                timeSchedule = closedTime - openedTime;

            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            // Đóng các resource
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
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return timeSchedule;
    }

    //PhuocDH
    //list of each time slot
    public ArrayList<String> convertToSlot(String stadium_ID) {
        ArrayList<String> slotList = new ArrayList<>();
        int schedule = getTimeOpenByStadiumID(stadium_ID);
        for (int i = 0; i < getTimeScheduleByStadiumID(stadium_ID); i++) {
            //add time and it's increment to list
            slotList.add(i, schedule + ":00 - " + ++schedule + ":00");
        }
        return slotList;
    }

    /**
     * Author: NhiTCU
     *
     * @return
     */
    public List<Stadium> sortStadiumByRating() {
        stadiumDAO staDAO = new stadiumDAO();
        List<Stadium> stadiumList = staDAO.getAllStadium();
        Collections.sort(stadiumList, new Comparator<Stadium>() {
            @Override
            public int compare(Stadium s1, Stadium s2) {
                // Sắp xếp giảm dần theo avg_ratingScore
                return Double.compare(s2.getAvg_ratingScore(), s1.getAvg_ratingScore());
            }
        });
        int index = 6;
        // lấy 6 phần tử đầu tiên của stadiumList
        //Math.min(numberOfStadiumsToTake, stadiumList.size()). Math.min() không vượt quá số lượng phần tử có trong danh sách
        List<Stadium> popularStadium = stadiumList.subList(0, Math.min(index, stadiumList.size()));

        return popularStadium;
    }
    
    public void Feedback(float ratingScore, String stadiumID){
        String sql = "UPDATE Stadium SET avg_ratingScore = ? WHERE stadium_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            // Set parameters for the prepared statement
            ps.setFloat(1, ratingScore);
            ps.setString(2, stadiumID);
            // Execute the update statemen
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
