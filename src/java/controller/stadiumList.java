/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.adminDAO;
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
import model.Admin;
import model.Customer;
import model.Stadium;
import model.StadiumOwner;

/**
 *
 * @author PC
 */
@WebServlet(name = "stadiumList", urlPatterns = {"/stadiumList"})
public class stadiumList extends HttpServlet {

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
            out.println("<title>Servlet stadiumList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet stadiumList at " + request.getContextPath() + "</h1>");
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
        accountDAO aDAO = new accountDAO();
        Account ac = aDAO.getAccountByEmail(email);

        String destinationJSP = "view/common/CommonStaList.jsp";
        List<Stadium> stList = new ArrayList<>();
        stList = new stadiumDAO().getAllStadium();
        

        if (role != null) {
            switch (role.toLowerCase()) {
                case "customer":
                    customerDAO cusDAO = new customerDAO();
                    Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
                    stList = new stadiumDAO().getAllStadium();                    
                    request.setAttribute("name", cus.getCustomer_Name());
                    destinationJSP = "view/customer/CusStaList.jsp";
                    break;
                case "admin":
                    adminDAO adDAO = new adminDAO();
                    Admin ad = adDAO.getAdminByAccID(ac.getAcc_ID());
                    stList = new stadiumDAO().getAllStadium();                   
                    request.setAttribute("name", ad.getAdmin_name());
                    destinationJSP = "view/admin/AdStaManage.jsp";
                    break;
                case "stadiumowner":
                    stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
                    StadiumOwner sto = stoDAO.getStadiumOwnerByAccID(ac.getAcc_ID());
                    stList = new stadiumDAO().getStadiumByStadiumOwnerID(sto.getOwner_ID());
                    request.setAttribute("name", sto.getOwner_name());
                    destinationJSP = "view/stadiumowner/StadiumManagement.jsp";
                    break;
                default:
                    break;
            }
        }
        
        request.setAttribute("stList", stList);
        request.getRequestDispatcher(destinationJSP).forward(request, response);
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
