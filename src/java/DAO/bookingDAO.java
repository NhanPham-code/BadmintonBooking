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
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import model.Court;
import model.Customer;
import model.Stadium;
import java.time.YearMonth;

/**
 *
 * @author nhanPH
 */
public class bookingDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Booking> getAcceptedBookingsByDateAndStadiumID(Date date, String stadium_ID) {
        List<Booking> bookList = new ArrayList<>();  // Khởi tạo bookList

        String sql = "SELECT * FROM Booking WHERE date = ? AND stadium_ID = ? AND bookingAccepted = 'accepted'";

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
                book.setBookingAccepted(rs.getString("bookingAccepted"));

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

    public List<Booking> getBookingByStadiumID(String stadiumID) {
        List<Booking> bookingList = new ArrayList<>();
        String sql = "select * from Booking where stadium_ID = ?";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadiumID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String bookingId = rs.getString(1);
                int courtQuantity = rs.getInt(2);
                Time startTime = rs.getTime(3);
                Time endTime = rs.getTime(4);
                Date date = rs.getDate(5);
                int total = rs.getInt(6);
                String bankingImage = rs.getString(7);
                String bookingAccepted = rs.getString(8);
                String customerID = rs.getString(9);
                stadiumID = rs.getString(10);

                customerDAO custDAO = new customerDAO();
                Customer cust = custDAO.getCustomerByID(customerID);

                stadiumDAO staDAO = new stadiumDAO();
                Stadium sta = staDAO.getStadiumByID(stadiumID);

                // Lấy danh sách Court từ bảng BookingDetail
                bookingDetailDAO bookDetailDAO = new bookingDetailDAO();
                List<Court> courtList = bookDetailDAO.getCourtListByBookingID(rs.getString("booking_ID"));

                bookingList.add(new Booking(bookingId, courtQuantity, startTime, endTime, date, total,
                        bankingImage, bookingAccepted, cust, sta, courtList));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }

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
                book.setBookingAccepted(rs.getString("bookingAccepted"));

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

    public Booking getBookingByBookingID(String bookingID) {
        bookingDetailDAO bookDetailDAO = new bookingDetailDAO();
        customerDAO cusDAO = new customerDAO();
        stadiumDAO staDAO = new stadiumDAO();
        Booking booking = new Booking();
        String sql = "Select * from Booking where booking_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingID);
            rs = ps.executeQuery();
            if (rs.next()) {
                booking.setBooking_ID(rs.getString("booking_ID"));
                booking.setCourtQuantity(rs.getInt("courtQuantity"));
                booking.setStartTime(rs.getTime("startTime"));
                booking.setEndTime(rs.getTime("endTime"));
                booking.setDate(rs.getDate("date"));
                booking.setTotal(rs.getInt("total"));
                booking.setBankingImage(rs.getString("bankingImage"));
                booking.setBookingAccepted(rs.getString("bookingAccepted"));
                booking.setCustomer(cusDAO.getCustomerByID(rs.getString("customer_ID")));
                booking.setStadium(staDAO.getStadiumByID(rs.getString("stadium_ID")));

                // Lấy danh sách Court từ bảng BookingDetail
                List<Court> courtList = bookDetailDAO.getCourtListByBookingID(bookingID);
                booking.setCourtList(courtList);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return booking;
    }

    public List<Booking> getBookingByCustomerID(String customerID) {
        List<Booking> bookingList = new ArrayList<>();
        String sql = "select * from Booking where customer_ID = ?";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String bookingId = rs.getString(1);
                int courtQuantity = rs.getInt(2);
                Time startTime = rs.getTime(3);
                Time endTime = rs.getTime(4);
                Date date = rs.getDate(5);
                int total = rs.getInt(6);
                String bankingImage = rs.getString(7);
                String bookingAccepted = rs.getString(8);
                customerID = rs.getString(9);
                String stadiumID = rs.getString(10);

                customerDAO custDAO = new customerDAO();
                Customer cust = custDAO.getCustomerByID(customerID);

                stadiumDAO staDAO = new stadiumDAO();
                Stadium sta = staDAO.getStadiumByID(stadiumID);

                courtDAO crtDAO = new courtDAO();
                List<Court> crtList = new ArrayList<>();
                crtList = crtDAO.getCourtList(stadiumID);

                bookingList.add(new Booking(bookingId, courtQuantity, startTime, endTime, date, total,
                        bankingImage, bookingAccepted, cust, sta, crtList));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    public List<Booking> getAllBooking() {
        List<Booking> bookList = new ArrayList<>();  // Khởi tạo bookList

        String sql = "select * from Booking";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
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
                book.setBookingAccepted(rs.getString("bookingAccepted"));

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

    public int AddNewBooking(Booking book) {
        int index = 0;

        String sql = "INSERT INTO [dbo].[Booking]\n"
                + "           ([booking_ID]\n"
                + "           ,[courtQuantity]\n"
                + "           ,[startTime]\n"
                + "           ,[endTime]\n"
                + "           ,[date]\n"
                + "           ,[total]\n"
                + "           ,[bankingImage]\n"
                + "           ,[bookingAccepted]\n"
                + "           ,[customer_ID]\n"
                + "           ,[stadium_ID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, book.getBooking_ID());
            ps.setInt(2, book.getCourtList().size());
            ps.setTime(3, book.getStartTime());
            ps.setTime(4, book.getEndTime());
            ps.setDate(5, (Date) book.getDate());
            ps.setInt(6, book.getTotal());
            ps.setString(7, book.getBankingImage());
            ps.setString(8, book.getBookingAccepted());
            ps.setString(9, book.getCustomer().getCustomer_ID());
            ps.setString(10, book.getStadium().getStadium_ID());

            index = ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
            try {
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

        return index;
    }

    public void acceptBooking(String bookingID) {
        String sql = " update Booking set bookingAccepted = 'accepted' where booking_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }

    }

    public void rejectBooking(String bookingID) {
        String sql = " update Booking set bookingAccepted = 'rejected' where booking_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, bookingID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }

    }

    //PhuocDH
    public List<Integer> getBookingTimeByStadiumIDandSelectedFactor(String stadiumId, int year, int month) {
        List<Integer> bookingHours = new ArrayList<>();
        LocalDate date;
        StringBuilder sqlBuilder = new StringBuilder("SELECT startTime, endTime, courtQuantity, date "
                + "FROM Booking WHERE stadium_ID = ? AND bookingAccepted = 'accepted'");
        if (month != -1 && year != -1) {
            sqlBuilder.append(" AND YEAR(date) = ? AND MONTH(date) = ?");
        } else if (year != -1) {
            sqlBuilder.append(" AND YEAR(date) = ?");
        }
        String sql = sqlBuilder.toString();

        try ( Connection conn = db.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, stadiumId);
            int paramIndex = 2;
            if (year != -1) {
                ps.setInt(paramIndex++, year);
            }
            if (month != -1) {
                ps.setInt(paramIndex, month);
            }

            try ( ResultSet rs = ps.executeQuery()) {
                if (month == -1) {
                    bookingHours = new ArrayList<>(Collections.nCopies(12, 0));
                } else {
                    int daysInMonth = YearMonth.of(year, month).lengthOfMonth();
                    bookingHours = new ArrayList<>(Collections.nCopies(daysInMonth, 0));
                }

                while (rs.next()) {
                    String startTime = rs.getString("startTime");
                    String endTime = rs.getString("endTime");
                    int courtQuantity = rs.getInt("courtQuantity");
                    date = rs.getDate("date").toLocalDate();

                    int bookingHour = (Integer.parseInt(endTime.split(":")[0]) - Integer.parseInt(startTime.split(":")[0]))
                            * courtQuantity;

                    if (month == -1) {
                        int monthIndex = date.getMonthValue() - 1;
                        bookingHours.set(monthIndex, bookingHours.get(monthIndex) + bookingHour);
                    } else {
                        int dayIndex = date.getDayOfMonth() - 1;
                        bookingHours.set(dayIndex, bookingHours.get(dayIndex) + bookingHour);
                    }
                }
            }
        } catch (SQLException ex) {
            // Xử lý ngoại lệ một cách cụ thể hơn
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Error querying booking data", ex);
            throw new RuntimeException("Error querying booking data", ex);
        } catch (Exception ex) {
            Logger.getLogger(bookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookingHours;
    }

    //get day with year and month
    public int getDaysInMonth(int year, int month) {
        YearMonth yearMonth = YearMonth.of(year, month);
        return yearMonth.lengthOfMonth();
    }

    //PhuocDH
    public List<Integer> getBookingOfEachHourByStadiumIDandSelectedFactor(String stadium_ID, int year, int month, int day) {
        stadiumDAO staDAO = new stadiumDAO();
        List<Integer> freqList = Arrays.asList(new Integer[staDAO.getTimeScheduleByStadiumID(stadium_ID)]);
        Collections.fill(freqList, 0);
        int openTime = staDAO.getTimeOpenByStadiumID(stadium_ID);

        String startTime = null;
        String endTime = null;
        int courtQuantity = 0;
        Date date;

        StringBuilder sqlBuilder = new StringBuilder("SELECT startTime, endTime, courtQuantity, date "
                + "FROM Booking WHERE stadium_ID = ? AND bookingAccepted = 'accepted'");

        if (day != -1 && month != -1 && year != -1) {
            sqlBuilder.append(" AND YEAR(date) = ? AND MONTH(date) = ? AND DAY(date) = ?");
        } else if (month != -1 && year != -1) {
            sqlBuilder.append(" AND YEAR(date) = ? AND MONTH(date) = ?");
        } else if (year != -1) {
            sqlBuilder.append(" AND YEAR(date) = ?");
        }

        String sql = sqlBuilder.toString();

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, stadium_ID);
            int paramIndex = 2;
            if (year != -1) {
                ps.setInt(paramIndex, year);
                paramIndex++;
            }
            if (month != -1) {
                ps.setInt(paramIndex, month);
                paramIndex++;
            }
            if (day != -1) {
                ps.setInt(paramIndex, day);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                startTime = rs.getString("startTime");
                endTime = rs.getString("endTime");
                courtQuantity = rs.getInt("courtQuantity");
                date = rs.getDate("date");

                int startTimeInList = Integer.parseInt(startTime.split(":")[0]) - openTime;
                int endTimeInList = Integer.parseInt(endTime.split(":")[0]) - openTime;

                for (int i = startTimeInList; i < endTimeInList; i++) {
                    freqList.set(i, freqList.get(i) + courtQuantity);
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return freqList;
    }

    public static void main(String[] args) {
        bookingDAO bDAO = new bookingDAO();

        int month = -1;
        List<Integer> freqList = bDAO.getBookingTimeByStadiumIDandSelectedFactor("STD3", 2024, month);
        System.out.println(freqList);
    }
}
