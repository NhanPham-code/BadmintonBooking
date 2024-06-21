/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import model.Court;
import model.Customer;
import model.Stadium;

/**
 *
 * @author nhanPH
 */
public class bookingDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Booking> getBookingByDateAndStadiumID(Date date, String stadium_ID) {

        List<Booking> bookList = new ArrayList<>();  // Khởi tạo bookList

        String sql = "select * from Booking where date = ? and stadium_ID = ? ";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setString(2, stadium_ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Booking book = new Booking();
                book.setBooking_ID(rs.getString("booking_ID"));
                book.setCourtQuantity(rs.getInt("courtQuantity"));
                book.setStartTime(rs.getTime("startTime"));
                book.setEndTime(rs.getTime("endTime"));
                book.setDate(rs.getDate("date"));
                book.setTotal(rs.getInt("total"));
                book.setBankingImage(rs.getString("bankingImage"));
                book.setBookingAccepted(rs.getBoolean("bookingAccepted"));

                // get customer of booking
                customerDAO cusDAO = new customerDAO();
                Customer cus = cusDAO.getCustomerByID(rs.getString("customer_ID"));
                book.setCustomer(cus);

                // get stadium of booking
                stadiumDAO staDAO = new stadiumDAO();
                Stadium stadium = staDAO.getStadiumByID(rs.getString("stadium_ID"));
                book.setStadium(stadium);

                // get list court of booking by booking_ID in BookingDetail
                bookingDetailDAO bookDetailDAO = new bookingDetailDAO();
                List<Court> courtList = bookDetailDAO.getCourtListByBookingID(rs.getString("booking_ID"));
                book.setCourtList(courtList);

                // Thêm Booking vào bookList
                bookList.add(book);
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
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

        return bookList;
    }

    public static void main(String[] args) {
        bookingDAO bookDAO = new bookingDAO();

        // Tạo đối tượng Date giả lập
        Date date = Date.valueOf("2024-06-21"); // Thay đổi ngày phù hợp

        // Tạo stadium_ID giả lập
        String stadium_ID = "STD2"; // Thay đổi ID phù hợp

        // Gọi phương thức getBookingByDateAndStadiumID
        List<Booking> bookList = bookDAO.getBookingByDateAndStadiumID(date, stadium_ID);

        System.out.println(bookList.size());
        System.out.println(bookList.get(0).getBooking_ID());
        List<Court> courtInBook = bookList.get(0).getCourtList();
        for (Court c : courtInBook) {
            System.out.println(c.getCourt_ID());
        }

        Booking book = bookList.get(0);

        System.out.println(book.getStartTime());
        System.out.println(book.getEndTime());

        courtDAO cDAO = new courtDAO();
        List<Court> clist = cDAO.getCourtListByStadiumID(stadium_ID);

        Time startTime = Time.valueOf("17:00:00");
        Time endTime = Time.valueOf("19:00:00");

        Iterator<Court> iterator = clist.iterator();
        while (iterator.hasNext()) {
            Court c = iterator.next();
            boolean check = false;
            for (Court cInBook : courtInBook) {
                if (c.getCourt_ID().equals(cInBook.getCourt_ID())) {
                    check = true;
                    break;
                }
            }
            if (check) {
                iterator.remove();
            }
        }

        System.out.println("List sau khi xoas");
        for (Court c : clist) {
            System.out.println(c.getCourt_ID());
            System.out.println(c.getNumber());
        }
    }
}
