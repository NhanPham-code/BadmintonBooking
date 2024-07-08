/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.bookingDAO;
import DAO.stadiumDAO;
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

/**
 *
 * @author WINDOWS
 */
@WebServlet(name = "ChartDrawController", urlPatterns = {"/ChartDrawController"})
public class ChartDrawController extends HttpServlet {

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
            out.println("<title>Servlet ChartDrawController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartDrawController at " + request.getContextPath() + "</h1>");
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
        accountDAO accDAO = new accountDAO();
        stadiumOwnerDAO ownerDAO = new stadiumOwnerDAO();
        stadiumDAO staDAO = new stadiumDAO();
        bookingDAO bookDAO = new bookingDAO();

        Cookie[] cookies = request.getCookies();
        String email = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase("email")) {
                    email = cookie.getValue();
                }
            }
        }

        Account acc = accDAO.getAccountByEmail(email);
        String accID = acc.getAcc_ID();
        String stadiumID = request.getParameter("StadiumID");

        List<Booking> bookingList = new ArrayList<>();
        List<Booking> acceptedBookings = new ArrayList<>();

        bookingList.addAll(bookDAO.getBookingByStadiumID(stadiumID));
        
        for (Booking booking : bookingList) {
            if (booking.getBookingAccepted().equalsIgnoreCase("accepted")) {
                acceptedBookings.add(booking);
            }
        }

        request.setAttribute("stadiumID", stadiumID);
        request.setAttribute("name", ownerDAO.getStadimOwnerByAccID(accID).getOwner_name());
        request.setAttribute("acceptedBookings", acceptedBookings);
        request.getRequestDispatcher("view/stadiumowner/StadiumChartStatistic.jsp").forward(request, response);
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
