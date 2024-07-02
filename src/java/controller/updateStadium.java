/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.stadiumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.nio.file.Paths;
import model.Stadium;

/**
 *
 * @author NhanNQT
 */
@WebServlet(name = "updateStadium", urlPatterns = {"/updateStadium"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class updateStadium extends HttpServlet {

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
            out.println("<title>Servlet updateStadium</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStadium at " + request.getContextPath() + "</h1>");
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

        String stadiumID = request.getParameter("stadiumID");
        stadiumDAO staDAO = new stadiumDAO();
        Stadium stadium = staDAO.getStadiumByID(stadiumID);
        request.setAttribute("stadium", stadium);

        request.getRequestDispatcher("view/stadiumowner/UpdateStadium.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet responsea
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        stadiumDAO staDAO = new stadiumDAO();

        // Lấy dữ liệu 
        String stadiumID = request.getParameter("stadium_ID");

        // Lấy dữ liệu từ form
        String stadium_name = request.getParameter("stadium_name");
        String stadium_address = request.getParameter("stadium_address");
        String stadium_phone = request.getParameter("stadium_phone");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String opentime = startTime + '-' + endTime;
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

        // update stadium
        staDAO.updateStadium(stadium_name, stadium_address, stadium_phone, opentime, relativeStadiumPath, pricePerHour, relativeQRCodePath, stadiumID);

        request.getRequestDispatcher("stadiumDetail?stadiumID=" + stadiumID).forward(request, response);
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
