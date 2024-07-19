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
@WebServlet(name = "accountDetail", urlPatterns = {"/accountDetail"})
public class accountDetail extends HttpServlet {

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
            out.println("<title>Servlet accountDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet accountDetail at " + request.getContextPath() + "</h1>");
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
         //----------Tien------------//
        String accID = request.getParameter("accID");
        String accName = "";
        String roleID="";
        String phone="";
        String email="";
        String role="";
        
        accountDAO aDAO = new accountDAO();
        Account acc = aDAO.getAccountById(accID);
        email=acc.getEmail();
        role=acc.getRole();
        
        if(acc.getRole().equalsIgnoreCase("customer")){
            customerDAO cDAO = new customerDAO();
            Customer c = cDAO.getCustomerByAcc_ID(accID);
            accName=c.getCustomer_Name();
            roleID="Customer: " + c.getCustomer_ID();
            phone=c.getCustomer_Phone();
        } else if (acc.getRole().equalsIgnoreCase("stadiumowner")){
            stadiumOwnerDAO oDAO = new stadiumOwnerDAO();
            StadiumOwner o = oDAO.getStadiumOwnerByAccID(accID);
            accName=o.getOwner_name();
            roleID="Stadium Owner: " + o.getOwner_ID();
            phone=o.getOwner_phone();
        } else if (acc.getRole().equalsIgnoreCase("admin")){
            adminDAO adDAO = new adminDAO();
            Admin ad = adDAO.getAdminByAccID(accID);
            accName = ad.getAdmin_name();
            roleID = "Admin: " + ad.getAdmin_ID();
            phone = ad.getAdmin_phone();
        }
        
        String name = request.getParameter("name");
        request.setAttribute("name", name);
        request.setAttribute("accID", accID);
        request.setAttribute("accName", accName );
        request.setAttribute("roleID", roleID);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("role", role);
        
        request.getRequestDispatcher("view/admin/AdAccDetail.jsp").forward(request, response);
         //----------Tien------------//
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
