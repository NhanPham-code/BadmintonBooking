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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;
import model.StadiumOwner;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckVerifyCode", urlPatterns = {"/CheckVerifyCode"})
public class CheckVerifyCode extends HttpServlet {

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
            out.println("<title>Servlet CheckVerifyCode</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckVerifyCode at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        String email = null;
        // get email
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("email")) {
                email = ck.getValue();
            }
        }
        // code user input
        String verifyCode = request.getParameter("verifyCode");

        // code check
        String verifyCheckCode = request.getParameter("verifyCheckCode");

        if (email != null) {

            // email
            email = request.getParameter("email");

            if (verifyCode.equals(verifyCheckCode)) {
                request.setAttribute("emailFix", email);
                request.getRequestDispatcher("/view/common/FillNewPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Your verify code is incorrect. Please try again!!!");
                request.getRequestDispatcher("/view/common/FillEmailVerify.jsp").forward(request, response);
            }
        } else {
            if (verifyCode.equals(verifyCheckCode)) {
                email = request.getParameter("email");
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                accountDAO aDAO = new accountDAO();

                //add to account table
                Account accNew = new Account();
                // set value for new account
                accNew.setEmail(email);
                accNew.setPassword(password);
                accNew.setRole(role);
                // add to DB
                aDAO.addNewAcc(accNew);
                String acc_ID = aDAO.getAccountByEmail(email).getAcc_ID();
                if (role.equalsIgnoreCase("StadiumOwner")) {

                    // add to stadium owner table
                    stadiumOwnerDAO oDAO = new stadiumOwnerDAO();
                    StadiumOwner ownerNew = new StadiumOwner();
                    // auto create owner_ID
                    String owner_ID = "";
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

                    String customer_ID = "";
                    //set value for customer
                    cusNew.setCustomer_ID(customer_ID);
                    cusNew.setCustomer_Name(name);
                    cusNew.setCustomer_Phone(phone);
                    cusNew.setAcc_ID(acc_ID);
                    cusDAO.addNewCus(cusNew);
                    request.setAttribute("email", email);
                    request.getRequestDispatcher("/view/common/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Your verify code is incorrect. Please try again!!!");
                request.getRequestDispatcher("/view/common/register.jsp").forward(request, response);

            }
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
