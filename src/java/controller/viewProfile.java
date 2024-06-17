/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.adminDAO;
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

import model.Account;
import model.Admin;
import model.Customer;

import model.StadiumOwner;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "viewProfile", urlPatterns = {"/viewProfile"})
public class viewProfile extends HttpServlet {

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
            out.println("<title>Servlet viewProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewProfile at " + request.getContextPath() + "</h1>");
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
        String email = null;
        // get role
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("email")) {
                email = ck.getValue();
            }
        }
        accountDAO aDAO = new accountDAO();
        Account ac = aDAO.getAccountByEmail(email);

        if (ac.getRole().equals("Admin")) {
            adminDAO adDAO = new adminDAO();
            Admin ad = adDAO.getAdminByAccID(ac.getAcc_ID());

            request.setAttribute("account", ac);
            request.setAttribute("admin", ad);
            request.setAttribute("name", ad.getAdmin_name());

            request.getRequestDispatcher("view/admin/AdPro.jsp").forward(request, response);

        } else if (ac.getRole().equals("Customer")) {
            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());

            request.setAttribute("account", ac);
            request.setAttribute("customer", cus);
            request.setAttribute("name", cus.getCustomer_Name());

            request.getRequestDispatcher("view/customer/CusProfile.jsp").forward(request, response);

        } else if (ac.getRole().equals("StadiumOwner")) {
            stadiumOwnerDAO owDAO = new stadiumOwnerDAO();
            StadiumOwner stdo = owDAO.getStadimOwnerByAccID(ac.getAcc_ID());

            request.setAttribute("account", ac);
            request.setAttribute("owner", stdo);
            request.setAttribute("name", stdo.getOwner_name());
            //response.getWriter().println("StadiumOwner");
            request.getRequestDispatcher("view/stadiumowner/ProfileOwner.jsp").forward(request, response);
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
