/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
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
import model.Customer;
import model.StadiumOwner;
import model.hashPasswordMD5;

/**
 *
 * @author PC
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

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
            out.println("<title>Servlet register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
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
        hashPasswordMD5 md = new hashPasswordMD5();

        // get value from jsp
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //hash password
        String hashPass = md.hashPasswordMD5(password);

        String role = request.getParameter("role");

        accountDAO aDAO = new accountDAO();
        // check account exits or not
        Account check = aDAO.getAccountByEmail(email);

        if (check == null) {
            //add to account table
            Account accNew = new Account();
            // auto create acc_ID
            accountDAO accDAO = new accountDAO();
            int number = accDAO.getAllAccount().size() + 1;
            String acc_ID = "ACC" + number;
            // set value for new account
            accNew.setAcc_ID(acc_ID);
            accNew.setEmail(email);
            accNew.setPassword(hashPass);
            accNew.setRole(role);
            // add to DB
            aDAO.addNewAcc(accNew);
            
            if (role.equalsIgnoreCase("Stadium Owner")) {

                // add to stadium owner table
                stadiumOwnerDAO oDAO = new stadiumOwnerDAO();
                StadiumOwner ownerNew = new StadiumOwner();
                // auto create owner_ID
                int ownerNumber = oDAO.getAllStadiumOwner().size() + 1;
                String owner_ID = "OWNER" + ownerNumber;
                //set value for owner
                ownerNew.setOwner_ID(owner_ID);
                ownerNew.setOwner_name(name);
                ownerNew.setOwner_phone(phone);
                ownerNew.setAcc_ID(acc_ID);
                //add to DB
                oDAO.addNewOwner(ownerNew);

                request.setAttribute("email", email);
                //request.setAttribute("password", password);
                //move to login.jsp
                request.getRequestDispatcher("view/common/login.jsp").forward(request, response);
                
            } else {

                // add to customer table
                customerDAO cusDAO = new customerDAO();
                Customer cusNew = new Customer();
                //auto create customer_ID
                int cusNumber = cusDAO.getAllCustomer().size() + 1;
                String customer_ID = "CUST" + cusNumber;
                //set value for customer
                cusNew.setCustomer_ID(customer_ID);
                cusNew.setCustomer_Name(name);
                cusNew.setCustomer_Phone(phone);
                cusNew.setAcc_ID(acc_ID);
                cusDAO.addNewCus(cusNew);

                request.setAttribute("email", email);
                //request.setAttribute("password", password);
                //move to login.jsp
                request.getRequestDispatcher("view/common/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "this email is exists!!!");
            request.getRequestDispatcher("view/common/register.jsp").forward(request, response);
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
