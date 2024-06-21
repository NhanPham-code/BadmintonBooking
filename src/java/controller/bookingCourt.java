package controller;

import DAO.accountDAO;
import DAO.bookingDAO;
import DAO.courtDAO;
import DAO.customerDAO;
import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Booking;
import model.Court;
import model.Customer;
import model.Stadium;

/**
 *
 * @author Admin
 */
@WebServlet(name = "bookingCourt", urlPatterns = {"/bookingCourt"})
public class bookingCourt extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(bookingCourt.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookingCourt</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingCourt at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = getEmailFromCookies(request);

            accountDAO accDAO = new accountDAO();
            Account ac = accDAO.getAccountByEmail(email);

            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
            request.setAttribute("name", cus.getCustomer_Name());

            String stadium_ID = request.getParameter("stadium_ID");

            String date = request.getParameter("date");
            Date bookDate;
            if (date != null) {
                bookDate = Date.valueOf(date);
            } else {
                request.setAttribute("error", "Please enter a date for booking!!!");
                request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
                return;
            }

            String[] times = request.getParameterValues("time");
            if (times == null || times.length == 0) {
                request.setAttribute("error", "Please select a time for booking!!!");
                request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
                return;
            }

            List<Time> selectedTime = getSelectedTimes(times, request, response);
            if (selectedTime.isEmpty()) {
                request.setAttribute("error", "Please select a valid time for booking!!!");
                request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
                return;
            }

            Collections.sort(selectedTime);
            Time startTimeOfCus = selectedTime.get(0);
            Time endTimeOfCus = selectedTime.get(selectedTime.size() - 1);

            bookingDAO bookDAO = new bookingDAO();
            List<Booking> bookList = bookDAO.getBookingByDateAndStadiumID(bookDate, stadium_ID);

            // delete court not free
            courtDAO courtDAO = new courtDAO();
            List<Court> freeCourt = courtDAO.getCourtListByStadiumID(stadium_ID);

            for (Booking book : bookList) {
                if ((startTimeOfCus.before(book.getEndTime()) && startTimeOfCus.after(book.getStartTime()))
                        || (endTimeOfCus.before(book.getEndTime()) && endTimeOfCus.after(book.getStartTime()))
                        || (startTimeOfCus.before(book.getStartTime()) && endTimeOfCus.after(book.getEndTime()))) {

                    // Sử dụng Iterator để duyệt và xóa phần tử
                    Iterator<Court> iterator = freeCourt.iterator();
                    while (iterator.hasNext()) {
                        Court crt = iterator.next();
                        for (Court bookedCourt : book.getCourtList()) {
                            if (crt.getCourt_ID().equals(bookedCourt.getCourt_ID())) {
                                iterator.remove();
                                break;
                            }
                        }
                    }
                }
            }

            request.setAttribute("stadium_ID", stadium_ID);
            request.setAttribute("startTime", startTimeOfCus);
            request.setAttribute("endTime", endTimeOfCus);
            request.setAttribute("date", bookDate);
            request.setAttribute("courtList", freeCourt);

            request.getRequestDispatcher("view/customer/CusBookingCourt.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Please select date and time for booking!!!");
            request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
        }
    }

    private String getEmailFromCookies(HttpServletRequest request) {
        String email = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                }
            }
        }
        return email;
    }

    private List<Time> getSelectedTimes(String[] times, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Time> selectedTime = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

        for (String obj : times) {
            if (obj != null) {
                try {
                    LocalTime localTime = LocalTime.parse(obj, formatter);
                    Time time = Time.valueOf(localTime);
                    selectedTime.add(time);
                } catch (Exception e) {
                    request.setAttribute("error", "Invalid time format! Please enter time in HH format.");
                    request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
                }
            }
        }
        return selectedTime;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String stadium_ID = request.getParameter("stadium_ID");
        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");
        String dateStr = request.getParameter("date");
        String[] selectedCourtsId = request.getParameterValues("selectedCourt");

        // get stadium
        stadiumDAO stDAO = new stadiumDAO();
        Stadium st = stDAO.getStadiumByID(stadium_ID);
        request.setAttribute("st", st);

        // get list court of cus
        courtDAO courtDAO = new courtDAO();
        List<Court> courtList = new ArrayList<>();
        for (String id : selectedCourtsId) {
            Court court = courtDAO.getCourtByID(id);
            courtList.add(court);
        }
        request.setAttribute("courtList", courtList);

        // Get customer info by email
        String email = getEmailFromCookies(request);
        accountDAO accDAO = new accountDAO();
        Account ac = accDAO.getAccountByEmail(email);
        customerDAO cusDAO = new customerDAO();
        Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
        request.setAttribute("cus", cus);

        // Assuming a fixed price per hour per court
        int pricePerHourPerCourt = st.getPricePerHour(); // You can change this value as needed

        // Calculate the total price
        int total = calculateTotal(startTimeStr, endTimeStr, courtList.size(), pricePerHourPerCourt);
        request.setAttribute("total", total);

        request.setAttribute("startTime", startTimeStr);
        request.setAttribute("endTime", endTimeStr);
        request.setAttribute("date", dateStr);

        request.getRequestDispatcher("view/customer/CusBookingConfirm.jsp").forward(request, response);
    }

    private int calculateTotal(String startTimeStr, String endTimeStr, int numberOfCourts, int pricePerHourPerCourt) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalTime startTime = LocalTime.parse(startTimeStr, formatter);
        LocalTime endTime = LocalTime.parse(endTimeStr, formatter);

        // Calculate the duration in hours
        long duration = java.time.Duration.between(startTime, endTime).toHours();

        // Calculate the total price
        int total = (int) duration * numberOfCourts * pricePerHourPerCourt;
        return total;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
