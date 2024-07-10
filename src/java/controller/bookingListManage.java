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
import model.Court;
import model.Stadium;

/**
 *
 * @author NhanNQT
 */
@WebServlet(name = "BookingListManage", urlPatterns = {"/bookingListManage"})
public class bookingListManage extends HttpServlet {

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
            out.println("<title>Servlet BookingManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingManage at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        String role = null;
        String email = null;
        // get role
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("role")) {
                role = ck.getValue();
            }
            if (ck.getName().equalsIgnoreCase("email")) {
                email = ck.getValue();
            }
        }
        accountDAO accDAO = new accountDAO();
        stadiumOwnerDAO ownerDAO = new stadiumOwnerDAO();
        stadiumDAO stdDAO = new stadiumDAO();
        adminDAO adDAO = new adminDAO();
        String ownerID = null;

        Account ac = accDAO.getAccountByEmail(email);
        String accID = ac.getAcc_ID();
        
        if (role.equalsIgnoreCase("StadiumOwner")) {
            ownerID = ownerDAO.getStadiumOwnerByAccID(accID).getOwner_ID();

            List<Stadium> listStd = stdDAO.getStadiumByStadiumOwnerID(ownerID);

            request.setAttribute("name", ownerDAO.getStadiumOwnerByAccID(accID).getOwner_name());
            request.setAttribute("listStd", listStd);
            request.getRequestDispatcher("view/stadiumowner/BookingListManagement.jsp").forward(request, response);
        } else if (role.equalsIgnoreCase("Admin")) {
            ownerID = ownerDAO.getStadiumOwnerByAccID(request.getParameter("accID")).getOwner_ID();

            List<Stadium> listStd = stdDAO.getStadiumByStadiumOwnerID(ownerID);

            request.setAttribute("name", adDAO.getAdminByAccID(accID).getAdmin_name());
            request.setAttribute("listStd", listStd);
            request.getRequestDispatcher("view/admin/AdOwnerListSta.jsp").forward(request, response);
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
