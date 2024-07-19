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
@WebServlet(name = "editProfile", urlPatterns = {"/editProfile"})
public class editProfile extends HttpServlet {

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
            out.println("<title>Servlet editProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProfile at " + request.getContextPath() + "</h1>");
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

        String user_name = null;
        String user_phone = null;
        String user_ID = null;

        if (ac.getRole().equals("Admin")) {
            adminDAO adDAO = new adminDAO();
            Admin ad = adDAO.getAdminByAccID(ac.getAcc_ID());

            user_name = ad.getAdmin_name();
            user_phone = ad.getAdmin_phone();
            user_ID = ad.getAdmin_ID();

        } else if (ac.getRole().equals("Customer")) {
            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());

            user_name = cus.getCustomer_Name();
            user_phone = cus.getCustomer_Phone();
            user_ID = cus.getCustomer_ID();

        } else if (ac.getRole().equals("StadiumOwner")) {
            stadiumOwnerDAO owDAO = new stadiumOwnerDAO();
            StadiumOwner stdo = owDAO.getStadiumOwnerByAccID(ac.getAcc_ID());

            user_name = stdo.getOwner_name();
            user_phone = stdo.getOwner_phone();
            user_ID = stdo.getOwner_ID();

        }

        request.setAttribute("account", ac);
        request.setAttribute("name", user_name);
        request.setAttribute("phone", user_phone);
        request.setAttribute("ID", user_ID);

        request.getRequestDispatcher("view/common/EditProfile.jsp").forward(request, response);
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
         //----------Tien------------//
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String ID = request.getParameter("ID");
        String email = request.getParameter("email");
        String accID = request.getParameter("accID");
        String role = request.getParameter("role");

        accountDAO aDAO = new accountDAO();
        Account check = aDAO.getAccountByEmail(email);
        
        if (check!=null&&!check.getAcc_ID().equals(accID)) {
            request.setAttribute("error", "Email already existed!");
            doGet(request, response);
        } else {

            aDAO.updateEmail(email, accID);
            Cookie emailCookie = new Cookie("email", email);
            emailCookie.setMaxAge(60 * 60 * 72);
            response.addCookie(emailCookie);

            Account ac = aDAO.getAccountByEmail(email);
            request.setAttribute("account", ac);
            if (role.equals("Customer")) {
                customerDAO cDAO = new customerDAO();
                cDAO.updateProfile(ID, name, phone);

                Customer cus = cDAO.getCustomerByAcc_ID(ac.getAcc_ID());
                request.setAttribute("customer", cus);
                request.setAttribute("name", cus.getCustomer_Name());
                request.getRequestDispatcher("view/customer/CusProfile.jsp").forward(request, response);
            }
            if (role.equals("StadiumOwner")) {
                stadiumOwnerDAO stdDAO = new stadiumOwnerDAO();
                stdDAO.updateProfile(ID, name, phone);

                StadiumOwner stdo = stdDAO.getStadiumOwnerByAccID(ac.getAcc_ID());
                request.setAttribute("owner", stdo);
                request.setAttribute("name", stdo.getOwner_name());
                //response.getWriter().println("StadiumOwner");
                request.getRequestDispatcher("view/stadiumowner/ProfileOwner.jsp").forward(request, response);

            }
            if (role.equals("Admin")) {
                adminDAO adDAO = new adminDAO();
                adDAO.updateProfile(ID, name, phone);

                Admin ad = adDAO.getAdminByAccID(ac.getAcc_ID());
                request.setAttribute("admin", ad);
                request.setAttribute("name", ad.getAdmin_name());
                request.getRequestDispatcher("view/admin/AdPro.jsp").forward(request, response);
            }
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
