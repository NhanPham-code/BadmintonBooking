/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.adminDAO;
import DAO.bookingDetailDAO;
import DAO.bookingDAO;
import DAO.customerDAO;
import DAO.stadiumOwnerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.Court;
import java.sql.Time;
import java.util.List;
import java.util.Date;
import model.Account;
import model.Admin;
import model.Customer;
import model.StadiumOwner;

/**
 *
 * @author NhiTCU
 */
@WebServlet(name = "bookingDetail", urlPatterns = {"/bookingDetail"})
public class bookingDetail extends HttpServlet {

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
            out.println("<title>Servlet bookingDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingDetail at " + request.getContextPath() + "</h1>");
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
        // Lấy bookingID từ request parameter
        String bookingID = request.getParameter("bookingID");

        if (bookingID == null || bookingID.isEmpty()) {
            // Xử lý khi không có bookingID hợp lệ, ví dụ:
            response.getWriter().println("Booking ID is missing or invalid.");
            return;
        }

        // Gọi phương thức để lấy Booking object dựa trên bookingID
        bookingDAO bookDAO = new bookingDAO(); // Assume you have a DAO class for Booking
        Booking booking = bookDAO.getBookingByBookingID(bookingID);
        request.setAttribute("booking", booking);

        List<Court> chooseCourt = booking.getCourtList();
        request.setAttribute("chooseCourt", chooseCourt);

        // Check cookie de lay role chuyen trang
        Cookie[] cookies = request.getCookies();
        String token = "";
        String email = "";
        if (cookies != null && cookies.length > 1) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase("email")) {
                    email = cookie.getValue();
                }
                if (cookie.getName().equalsIgnoreCase("role")) {
                    token = cookie.getValue();
                }

            }
        }
        accountDAO accDAO = new accountDAO();
        Account ac = accDAO.getAccountByEmail(email);
        // Chuyen trang jsp        
        if (token.equalsIgnoreCase("Customer")) {
            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
            request.setAttribute("name", cus.getCustomer_Name());
            request.getRequestDispatcher("view/customer/CusBookingDetail.jsp").forward(request, response);

        } else if (token.equalsIgnoreCase("StadiumOwner")) {
            stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
            StadiumOwner sto = stoDAO.getStadimOwnerByAccID(ac.getAcc_ID());
            request.setAttribute("name", sto.getOwner_name());
            request.getRequestDispatcher("view/stadiumowner/BookingDetail.jsp").forward(request, response);
        } else {

            adminDAO aDAO = new adminDAO();
            Admin ad = aDAO.getAdminByAccID(ac.getAcc_ID());
            request.setAttribute("name", ad.getAdmin_name());
            request.getRequestDispatcher("view/admin/AdBookingDetail.jsp").forward(request, response);
        }

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
        processRequest(request, response);
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
