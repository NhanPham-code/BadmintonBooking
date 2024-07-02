/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.courtDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hong Dang
 */
@WebServlet(name = "DeleteCourtServlet", urlPatterns = {"/DeleteCourtServlet"})
public class DeleteCourtServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
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
            out.println("<title>Servlet DeleteCourtServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCourtServlet at " + request.getContextPath() + "</h1>");
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
        String courtID = request.getParameter("courtID");
        String stadiumID = request.getParameter("stadiumID"); // Lấy stadiumID từ request
        courtDAO cDAO = new courtDAO();
        boolean result = cDAO.deleteCourt(courtID);

        // Đặt thuộc tính deleteResult để truyền kết quả
        request.setAttribute("deleteResult", result ? "success" : "error");

        // Chuyển hướng đến servlet stadiumDetail với stadiumID
        request.getRequestDispatcher("stadiumDetail?stadiumID=" + stadiumID).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    // Nhận courtID từ request
    String courtID = request.getParameter("courtID");
    
    // Xóa Court từ database
    courtDAO cDAO = new courtDAO();
    boolean isDeleted = cDAO.deleteCourt(courtID);
    
    if (isDeleted) {
        // Chuyển hướng về trang StadiumDetail.jsp sau khi xử lý xong
        response.sendRedirect(request.getContextPath() + "/view/stadiumowner/StadiumDetail.jsp");
    } else {
        // Xử lý khi không xóa được (nếu cần)
        // Ví dụ: có thể hiển thị thông báo lỗi
        response.getWriter().println("Không thể xóa sân vận động.");
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
