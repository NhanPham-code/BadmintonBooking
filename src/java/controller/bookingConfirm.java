/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.bookingDAO;
import DAO.bookingDetailDAO;
import DAO.courtDAO;
import DAO.customerDAO;
import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.Court;
import model.Customer;
import model.Stadium;

/**
 *
 * @author nhanPH
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "bookingConfirm", urlPatterns = {"/bookingConfirm"})
public class bookingConfirm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookingConfirm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingConfirm at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Auto create bookingID
        bookingDAO bookDAO = new bookingDAO();
        List<Booking> bookList = bookDAO.getAllBooking();
        int index = bookList.size() + 1;
        String booking_ID = "BOOK" + index;

        // get value from bookingConfirm.jsp
        // Customer
        String customer_ID = request.getParameter("customerID");
        customerDAO cusDAO = new customerDAO();
        Customer cus = cusDAO.getCustomerByID(customer_ID);

        // stadium
        String stadium_ID = request.getParameter("stadiumID");
        stadiumDAO staDAO = new stadiumDAO();
        Stadium sta = staDAO.getStadiumByID(stadium_ID);

        // court list
        String[] courtIDArr = request.getParameterValues("court_ID");
        courtDAO courtDAO = new courtDAO();
        List<Court> courtList = new ArrayList<>();
        for (String courtID : courtIDArr) {
            Court court = courtDAO.getCourtByID(courtID);
            courtList.add(court);
        }

        // startTime and endTime
        String time = request.getParameter("bookingTime");
        String[] timeArr = time.split("-");
        String startTimeStr = timeArr[0];
        String endTimeStr = timeArr[1];
        Time startTime = Time.valueOf(startTimeStr);
        Time endTime = Time.valueOf(endTimeStr);

        // date
        String dateStr = request.getParameter("bookingDate");
        Date date = Date.valueOf(dateStr);

        // total
        String totalStr = request.getParameter("total");
        int total = Integer.parseInt(totalStr);

        // banking image
        Part part = request.getPart("bankingImage");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        // Lấy đường dẫn thực tế của thư mục images trong project
        String realPath = getServletContext().getRealPath("/img/banking/");

        // Tạo thư mục nếu nó không tồn tại
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lưu file vào thư mục images trong project với tên file giữ nguyên
        String filePath = Paths.get(realPath, filename).toString();
        part.write(filePath);

        // Lấy đường dẫn tương đối của file đã lưu
        String relativePath = "img/banking/" + filename; // day la duong dan se luu trong DB
        
        // add booking
        Booking book = new Booking(booking_ID, total, startTime, endTime, date, total, relativePath, "false", cus, sta, courtList);
        bookDAO.AddNewBooking(book);
        
        // add boking detail
        bookingDetailDAO bookDetDAO = new bookingDetailDAO();
        for(String courtID : courtIDArr) {
            int stt = bookDetDAO.getAllBookingDetailID().size() + 1;
            String bookingDetail_ID = "DET" + stt;
            bookDetDAO.AddNewBookingDetail(bookingDetail_ID, booking_ID, courtID);
        }
        
        response.sendRedirect("CustomerHistoryController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
