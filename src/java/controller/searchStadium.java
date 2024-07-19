/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.accountDAO;
import DAO.customerDAO;
import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Customer;
import model.Stadium;

/**
 *
 * @author nhanPH
 */
@WebServlet(name="searchStadium", urlPatterns={"/searchStadium"})
public class searchStadium extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchStadium</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchStadium at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        String email = "";
        String role = "";
        for(Cookie ck : cks) {
            if(ck.getName().equalsIgnoreCase("email")) {
                check = true;
                email = ck.getValue();
            } else if(ck.getName().equalsIgnoreCase("role")) {
                role = ck.getValue();
            }
        }
        
        // get user
        if(role.equalsIgnoreCase("customer")) {
            accountDAO accDAO = new accountDAO();
            Account ac = accDAO.getAccountByEmail(email);
            
            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());
            
            request.setAttribute("name", cus.getCustomer_Name());
        }
        
        String searchKey = request.getParameter("searchKey");
        
        stadiumDAO stDAO = new stadiumDAO();
        List<Stadium> searchList = stDAO.searchStadiumByKey(searchKey);
        
        String err = "";
        if(searchList.isEmpty()) {
            err += "Can not find stadium !!!";
        }
        
        request.setAttribute("err", err);
        request.setAttribute("stList", searchList);
        
        if(check == false) {
            request.getRequestDispatcher("view/common/CommonStaList.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("view/customer/CusStaList.jsp").forward(request, response);
        }
              
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
