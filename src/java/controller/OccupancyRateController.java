/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.bookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author WINDOWS
 */
@WebServlet(name = "OccupancyRateController", urlPatterns = {"/OccupancyRateController"})
public class OccupancyRateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    bookingDAO bookDAO = new bookingDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OccupancyRateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OccupancyRateController at " + request.getContextPath() + "</h1>");
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
        bookingDAO bookDAO = new bookingDAO();

        // Xử lý năm
        String yearString = request.getParameter("year");
        int year;
        try {
            year = (yearString != null) ? Integer.parseInt(yearString) : java.time.Year.now().getValue();
        } catch (NumberFormatException e) {
            year = java.time.Year.now().getValue();
            // Log lỗi
        }

        // Xử lý StadiumID
        String stadiumID = request.getParameter("StadiumID");
        if (stadiumID == null || stadiumID.isEmpty()) {
            // Xử lý lỗi hoặc set giá trị mặc định
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "StadiumID is required");
            return;
        }

        List<Integer> freqList = bookDAO.getBookingTimeByStadiumIDandSelectedFactor(stadiumID, year);

        // Logging
        System.out.println("Year: " + year + ", StadiumID: " + stadiumID + ", FreqList size: " + freqList.size());

        request.setAttribute("freqList", freqList);
        request.setAttribute("selectedYear", year);
        request.getRequestDispatcher("view/stadiumowner/OccupancyRate.jsp").forward(request, response);
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
