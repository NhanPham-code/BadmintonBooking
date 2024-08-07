/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.bookingDAO;
import DAO.courtDAO;
import DAO.customerDAO;
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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Account;
import model.Booking;
import model.Court;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "bookingTime", urlPatterns = {"/bookingTime"})
public class bookingTime extends HttpServlet {

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
            out.println("<title>Servlet bookingTime</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingTime at " + request.getContextPath() + "</h1>");
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
        // check login
        Cookie[] cks = request.getCookies();
        boolean check = false;
        for(Cookie ck : cks) {
            if(ck.getName().equalsIgnoreCase("email")) {
                check = true;
            }
        }
        if(check == false) {
            response.sendRedirect("view/common/login.jsp");
            return;
        }
        // get stadiumID
        String stadium_ID = request.getParameter("stadium_ID");
        request.setAttribute("stadium_ID", stadium_ID);
        
        // get email
        String email = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                }
            }
        }

        accountDAO accDAO = new accountDAO();
        Account ac = accDAO.getAccountByEmail(email);

        // get customer name
        customerDAO cusDAO = new customerDAO();
        Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());

        request.setAttribute("name", cus.getCustomer_Name());
        request.getRequestDispatcher("view/customer/CusBookingTime.jsp").forward(request, response);
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
