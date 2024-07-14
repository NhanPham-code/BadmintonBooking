/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.feedbackDAO;
import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import model.Stadium;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "feedback", urlPatterns = {"/feedback"})
public class feedback extends HttpServlet {

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
            out.println("<title>Servlet feedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet feedback at " + request.getContextPath() + "</h1>");
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
        String description = request.getParameter("description");
        int ratingScort = Integer.parseInt(request.getParameter("rating"));
        String customerID = request.getParameter("customerID");
        String stadiumID = request.getParameter("stadiumID");

        feedbackDAO fDAO = new feedbackDAO();

        Feedback currentFeedback = fDAO.getFeedback(stadiumID, customerID);
        if (currentFeedback.getDescription() != null) {
            fDAO.updateFeedback(description, ratingScort, customerID, stadiumID);
        } else {
            fDAO.addNewFeedback(description, ratingScort, customerID, stadiumID);
        }

        stadiumDAO sDAO = new stadiumDAO();
        Stadium satdium = sDAO.getStadiumByID(stadiumID);
        
        List<Feedback> feedbackList = new ArrayList<>();
        feedbackList=fDAO.getFeedbackList(stadiumID);
        float avg_ratingScore = 0;
        for(Feedback fb : feedbackList){
            avg_ratingScore += fb.getRatingScore();
        }
        avg_ratingScore = avg_ratingScore/feedbackList.size();
        
        sDAO.Feedback(avg_ratingScore, stadiumID);
        response.sendRedirect("stadiumDetail?stadiumID=" + stadiumID);

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
