/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Stadium;

/**
 *
 * @author Admin
 */
@WebServlet(name = "deleteStadium", urlPatterns = {"/deleteStadium"})
public class deleteStadium extends HttpServlet {

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
            out.println("<title>Servlet deleteStadium</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteStadium at " + request.getContextPath() + "</h1>");
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
        // Get stadium ID from request parameter
        String stadiumID = request.getParameter("stadiumID");
        if (stadiumID != null) {
            // Retrieve stadium details by ID
            stadiumDAO sDAO = new stadiumDAO();
            Stadium stadium = sDAO.getStadiumByID(stadiumID);

            // Set stadium details in request scope
            request.setAttribute("stadium", stadium);
        } else {
            request.setAttribute("errorMessage", "Stadium ID is missing.");
        }
        // Forward to the JSP page
        request.getRequestDispatcher("view/admin/DeleteStadium.jsp").forward(request, response);
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
        // Retrieve the stadium ID from the request
        String stadiumID = request.getParameter("id");

        // Create an instance of the DAO and attempt to delete the stadium
        stadiumDAO sDAO = new stadiumDAO();
        boolean isDeleted = sDAO.deleteStadium(stadiumID);

        // Determine the response based on the success of the deletion
        if (isDeleted) {
            // If deletion was successful, redirect to the home page or a confirmation page
            response.sendRedirect("stadiumList");
        } else {
            // If deletion failed, set an error message and forward back to the JSP
            request.setAttribute("errorMessage", "Failed to delete the stadium. Please try again.");
            doGet(request, response); // This will reload the stadium details page with the error message
        }
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
