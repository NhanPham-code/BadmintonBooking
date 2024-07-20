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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Booking;
import model.Court;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "bookingManage", urlPatterns = {"/bookingManage"})
public class bookingManage extends HttpServlet {

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
            out.println("<title>Servlet bookingManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingManage at " + request.getContextPath() + "</h1>");
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
        String stadiumID = request.getParameter("stadiumID");
        String stadiumName = request.getParameter("stadiumName");
        bookingDAO bookDAO = new bookingDAO();
        List<Booking> bookingList = bookDAO.getBookingByStadiumID(stadiumID);

        //seperate accepted and not accpeted
        List<Booking> acceptedBookings = new ArrayList<>();
        List<Booking> waitingBookings = new ArrayList<>();

        for (Booking booking : bookingList) {
            if (booking.getBookingAccepted().equalsIgnoreCase("accepted")) {/////////////////////////////////////////////////////////////////////////////////////
                acceptedBookings.add(booking);
            } else if (booking.getBookingAccepted().equalsIgnoreCase("waiting")) {///////////////////////////////////// waiting & reject 
                waitingBookings.add(booking);
            }
        }

        request.setAttribute("acceptedBookings", acceptedBookings);
        request.setAttribute("waitingBookings", waitingBookings);

        accountDAO accDAO = new accountDAO();
        stadiumOwnerDAO ownerDAO = new stadiumOwnerDAO();
        adminDAO adDAO = new adminDAO();

        Cookie[] cookies = request.getCookies();
        String role = "";
        String email = "";
        if (cookies != null && cookies.length > 1) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase("email")) {
                    email = cookie.getValue();
                }
                if (cookie.getName().equalsIgnoreCase("role")) {
                    role = cookie.getValue();
                }

            }
        }

        Account acc = accDAO.getAccountByEmail(email);
        String accID = acc.getAcc_ID();
        if (role.equalsIgnoreCase("StadiumOwner")) {
            request.setAttribute("name", ownerDAO.getStadiumOwnerByAccID(accID).getOwner_name());
            request.setAttribute("stadiumID", stadiumID);
            request.setAttribute("stadiumName", stadiumName);
            request.getRequestDispatcher("view/stadiumowner/BookingManagement.jsp").forward(request, response);

        } else if (role.equalsIgnoreCase("Admin")) {
            request.setAttribute("name", adDAO.getAdminByAccID(accID).getAdmin_name());
            request.setAttribute("stadiumID", stadiumID);
            request.setAttribute("stadiumName", stadiumName);
            request.getRequestDispatcher("view/admin/AdStaBookDetail.jsp").forward(request, response);
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
