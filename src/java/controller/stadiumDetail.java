/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.adminDAO;
import DAO.courtDAO;
import DAO.customerDAO;
import DAO.feedbackDAO;
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
import model.Admin;
import model.Court;
import model.Customer;
import model.Feedback;
import model.Stadium;
import model.StadiumOwner;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "G_stadiumDetail", urlPatterns = {"/stadiumDetail"})
public class stadiumDetail extends HttpServlet {

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
            out.println("<title>Servlet G_stadiumDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet G_stadiumDetail at " + request.getContextPath() + "</h1>");
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

        doPost(request, response);
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
        //----------Tien------------//
        Cookie[] cookies = request.getCookies();
        String email = null;
        // get role
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("email")) {
                email = ck.getValue();
            }
        }
        accountDAO aDAO = new accountDAO();
        Account ac = aDAO.getAccountByEmail(email);

        String stadiumID = request.getParameter("stadiumID");

        Stadium stadium = new Stadium();
        stadiumDAO sDAO = new stadiumDAO();
        stadium = sDAO.getStadiumByID(stadiumID);
        request.setAttribute("stadium", stadium);

        List<Court> courtList = new ArrayList<>();
        courtDAO cDAO = new courtDAO();
        courtList = cDAO.getCourtListByStadiumID(stadiumID);
        request.setAttribute("courtList", courtList);

        List<Feedback> feedbackList = new ArrayList<>();
        feedbackDAO fbDAO = new feedbackDAO();
        feedbackList = fbDAO.getFeedbackList(stadiumID);
        request.setAttribute("feedbackList", feedbackList);

        String role = null;
        // get role
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("role")) {
                role = ck.getValue();
            }
        }
        if (role != null) {
            if (role.equals("Customer")) {
                customerDAO cusDAO = new customerDAO();
                Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
                request.setAttribute("cusID", cus.getCustomer_ID());
                request.setAttribute("name", cus.getCustomer_Name());

                Feedback cusFeedback = new Feedback();
                cusFeedback = fbDAO.getFeedback(stadiumID, cus.getCustomer_ID());

                if (cusFeedback != null) {
                    request.setAttribute("feedback", cusFeedback);
                }

                request.getRequestDispatcher("view/customer/CusStaDetail.jsp").forward(request, response);
            } else if (role.equalsIgnoreCase("admin")) {
                adminDAO adDAO = new adminDAO();
                Admin ad = adDAO.getAdminByAccID(ac.getAcc_ID());

                request.setAttribute("name", ad.getAdmin_name());
                request.getRequestDispatcher("view/admin/AdStaDetail.jsp").forward(request, response);
            } else if (role.equalsIgnoreCase("stadiumowner")) {
                stadiumOwnerDAO owDAO = new stadiumOwnerDAO();
                StadiumOwner stdo = owDAO.getStadiumOwnerByAccID(ac.getAcc_ID());

                request.setAttribute("name", stdo.getOwner_name());
                request.getRequestDispatcher("view/stadiumowner/StadiumDetail.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("view/common/CommonStaDetail.jsp").forward(request, response);
        }
        //----------Tien------------//

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
