/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.Account;
import models.Product;
import java.io.*;
import java.nio.*;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Date;

/**
 *
 * @author duchi
 */
@WebServlet(name = "UploadProductServlet", urlPatterns = {"/Upload-product"})
public class UploadProductServlet extends HttpServlet {

    // Path to store uploaded images
    private static final String UPLOAD_DIR = "/images/"; // Replace with the actual upload directory path

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        //kiem tra NOTIBOX và content
        String content = request.getParameter("NOTICONTENT");
        boolean notibox = Boolean.parseBoolean(request.getParameter("NOTIBOX"));
        request.setAttribute("NOTIBOX", notibox);
        request.setAttribute("NOTICONTENT", content);

        //kiem tra account trong session
        Account account = (Account) session.getAttribute("ACCOUNT");
        if (account == null) {
            request.setAttribute("LOGIN_VALID", "Please Login First");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {

            int role = account.getRole();
            int account_id = account.getAccountId();

            if (role < 3) {
                content = "YOU ARE NOT ALLOWED TO DO  THIS.";
                response.sendRedirect("Home&NOTIBOX=true&NOTICONTENT=" + content);
                return;
            }

            RequestDispatcher rd = request.getRequestDispatcher("product-upload.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("ACCOUNT");
        
        int product_id = dao.get_product_list_admin().size() + 1;
        String name = request.getParameter("txt_product_name");
        String detail = request.getParameter("txt_product_detail");
        float price = Float.parseFloat(request.getParameter("txt_product_price"));
        String imageBase64 = request.getParameter("image");
//        byte[] decodedBytes = Base64.getDecoder().decode(imageBase64.getBytes(StandardCharsets.UTF_8));
//        String fileName = "p" + product_id + ".png"; // You can use any suitable filename
//        File file = new File(UPLOAD_DIR + fileName);
//
//        try ( OutputStream stream = new FileOutputStream(file)) {
//            stream.write(decodedBytes);
//        }

        int category_id = 0;
        int account_id = account.getAccountId();
        
        String cate = request.getParameter("txt_product_category");
        if (cate.equalsIgnoreCase("Category 1")) {
            category_id = 1;
        } else if (cate.equalsIgnoreCase("Category 2")) {
            category_id = 2;
        } else if (cate.equalsIgnoreCase("Category 3")) {
            category_id = 3;
        }

        // Add the new product to the database
        boolean check = dao.upload_product(account_id, product_id, category_id, true, account_id, name, detail, price, imageBase64);

        if (check) {
            response.getWriter().write("Product added successfully.");
        } else {
            response.getWriter().write("Failed to add the product.");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
