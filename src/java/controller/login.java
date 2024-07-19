/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.GoogleLoginDAO;
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
import model.Iconstant;
import model.StadiumOwner;
import model.UserGoogle;
import model.hashPasswordMD5;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import java.io.IOException;
import model.Iconstant;
import model.UserGoogle;

/**
 *
 * @author NhanNQT
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
        String code = request.getParameter("code"); // lấy code từ gg trả về

        GoogleLoginDAO gg = new GoogleLoginDAO();
        String accessToken = gg.getToken(code); // lấy accessToken bằng CODE
        UserGoogle acc = gg.getUserInfo(accessToken); // trả về thông tin của tài khoản bằng accessToken: email, name...
        String email = acc.getEmail(); // lấy email để login
        accountDAO accDAO = new accountDAO();
        //get accout by email
        Account ac = accDAO.getAccountByEmail(email);
        if (ac != null) {
            // add email by cookie
            Cookie emailCookie = new Cookie("email", email);
            Cookie roleCookie = new Cookie("role", ac.getRole());

            emailCookie.setMaxAge(60 * 60 * 72);
            roleCookie.setMaxAge(60 * 60 * 72);

            response.addCookie(emailCookie);
            response.addCookie(roleCookie);

            // check role and move to correct page of role
            if (ac.getRole().equalsIgnoreCase("Customer")) {
                // create customerDao
                customerDAO cusDAO = new customerDAO();
                Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());

                request.setAttribute("name", cus.getCustomer_Name());
                request.getRequestDispatcher("view/customer/cusDashBoard.jsp").forward(request, response);
            } else if (ac.getRole().equalsIgnoreCase("StadiumOwner")) {
                // create stadiumOwnerDAO
                stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
                StadiumOwner sto = stoDAO.getStadiumOwnerByAccID(ac.getAcc_ID());
                request.setAttribute("name", sto.getOwner_name());
                request.getRequestDispatcher("view/stadiumowner/HomeStadiumOwner.jsp").forward(request, response);
            } else {
                adminDAO aDAO = new adminDAO();
                Admin ad = aDAO.getAdminByAccID(ac.getAcc_ID());

                request.setAttribute("name", ad.getAdmin_name());
                request.getRequestDispatcher("view/admin/AdDashBoard.jsp").forward(request, response);
            }
        } else { // chinh cho nay
            request.setAttribute("error", "Email was not registed!!!");
            request.getRequestDispatcher("view/common/login.jsp").forward(request, response);
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
        // delete all cookie before login
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Thiết lập thời gian sống của cookie là 0 để xóa nó
                cookie.setMaxAge(0);
                // Đặt lại đường dẫn để đảm bảo đúng cookie được xóa
                cookie.setPath("/");
                // Thêm cookie vào response để xóa nó
                response.addCookie(cookie);
            }
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember_me");
        System.out.print(rememberMe);
        // hash password
        hashPasswordMD5 md5 = new hashPasswordMD5();
        String hashPass = md5.hashPasswordMD5(password);

        // check login
        accountDAO accDAO = new accountDAO();
        boolean checker = accDAO.checkLogin(email, hashPass);

        if (checker) {

            //get accout by email
            Account ac = accDAO.getAccountByEmail(email);

            if (rememberMe != null && rememberMe.equals("true")) {
                // Sử dụng Cookie để ghi nhớ thông tin đăng nhập

                Cookie emailCookie = new Cookie("email", email);
                Cookie roleCookie = new Cookie("role", ac.getRole());

                emailCookie.setMaxAge(60 * 60 * 72);
                roleCookie.setMaxAge(60 * 60 * 72);

                response.addCookie(emailCookie);
                response.addCookie(roleCookie);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("role", ac.getRole());
            }

            // check role and move to correct page of role
            if (ac.getRole().equalsIgnoreCase("Customer")) {
                // create customerDao
                customerDAO cusDAO = new customerDAO();
                Customer cus = cusDAO.getCustomerByAcc_ID(ac.getAcc_ID());

                request.setAttribute("name", cus.getCustomer_Name());
                request.getRequestDispatcher("view/customer/cusDashBoard.jsp").forward(request, response);
            } else if (ac.getRole().equalsIgnoreCase("StadiumOwner")) {
                // create stadiumOwnerDAO
                stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
                StadiumOwner sto = stoDAO.getStadiumOwnerByAccID(ac.getAcc_ID());
                request.setAttribute("name", sto.getOwner_name());
                request.getRequestDispatcher("view/stadiumowner/HomeStadiumOwner.jsp").forward(request, response);
            } else {
                adminDAO aDAO = new adminDAO();
                Admin ad = aDAO.getAdminByAccID(ac.getAcc_ID());

                request.setAttribute("name", ad.getAdmin_name());
                request.getRequestDispatcher("view/admin/AdDashBoard.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid email or password!!!");
            request.getRequestDispatcher("view/common/login.jsp").forward(request, response);
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
