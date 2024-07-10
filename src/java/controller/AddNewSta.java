/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.accountDAO;
import DAO.courtDAO;
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
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import model.Account;
import model.Stadium;
import model.StadiumOwner;

/**
 *
 * @author NhanNQT
 */
@WebServlet(name = "AddNewSta", urlPatterns = {"/AddNewSta"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddNewSta extends HttpServlet {

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
            out.println("<title>Servlet AddNewSta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewSta at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/stadiumowner/AddNewStadium.jsp").forward(request, response);
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
        // get role
        for (Cookie ck : cookies) {
            if (ck.getName().equalsIgnoreCase("email")) {
                email = ck.getValue();
            }
        }
        accountDAO aDAO = new accountDAO();
        Account ac = aDAO.getAccountByEmail(email);

        stadiumOwnerDAO ownerDAO = new stadiumOwnerDAO();
        StadiumOwner owner = ownerDAO.getStadiumOwnerByAccID(ac.getAcc_ID());

        // Auto create stadiumID
        stadiumDAO staDAO = new stadiumDAO();
        String stadium_ID = "";
        // get value from form       
        String stadium_name = request.getParameter("stadium_name");
        String stadium_address = request.getParameter("stadium_address");
        String stadium_phone = request.getParameter("stadium_phone");
        String opentime = request.getParameter("startTime") + "-" + request.getParameter("endTime");
        double avg_ratingScore = 0.0; // Khởi tạo giá trị trung bình đánh giá
        int pricePerHour = Integer.parseInt(request.getParameter("price_per_hour"));

        // Lấy hình ảnh từ request
        Part part = request.getPart("stadium_image");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        // Lấy đường dẫn thực tế của thư mục images trong project
        String realStadiumPath = getServletContext().getRealPath("/img/court/");

        // Tạo thư mục nếu nó không tồn tại
        File uploadDir = new File(realStadiumPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lưu file vào thư mục images trong project với tên file giữ nguyên
        String filePath = Paths.get(realStadiumPath, filename).toString();
        part.write(filePath);

        // Lấy đường dẫn tương đối của file đã lưu
        String relativeStadiumPath = "img/court/" + filename; // day la duong dan se luu trong DB

        // Lấy QR code từ request
        Part qrCodePart = request.getPart("QRCode");
        filename = Paths.get(qrCodePart.getSubmittedFileName()).getFileName().toString();

        // Lấy đường dẫn thực tế của thư mục images trong project
        String realQRCodePath = getServletContext().getRealPath("/img/QRCode/");

        // Tạo thư mục nếu nó không tồn tại
        uploadDir = new File(realQRCodePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lưu file vào thư mục images trong project với tên file giữ nguyên
        filePath = Paths.get(realQRCodePath, filename).toString();
        qrCodePart.write(filePath);

        // Lấy đường dẫn tương đối của file đã lưu
        String relativeQRCodePath = "img/QRCode/" + filename; // day la duong dan se luu trong DB

        // Tạo đối tượng Stadium
        Stadium stadium = new Stadium(stadium_ID, stadium_name, stadium_address, stadium_phone, opentime, relativeStadiumPath, avg_ratingScore, pricePerHour, relativeQRCodePath, owner);

        // Thêm sân vận động vào cơ sở dữ liệu
        int result = staDAO.addNewStadium(stadium);

        // Xử lý kết quả và redirect hoặc forward đến trang kết quả
        if (result == 1) {
            response.sendRedirect(request.getContextPath() + "/stadiumList");
        } else {
            // Thất bại
            request.getRequestDispatcher("view/stadiumowner/AddNewStadium.jsp").forward(request, response);
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
