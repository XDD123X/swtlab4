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
import java.net.URLEncoder;
import java.util.ArrayList;
import models.*;

/**
 *
 * @author duchi
 */
@WebServlet(name = "ProductUpdateServlet", urlPatterns = {"/Update-product"})
public class ProductUpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductUpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductUpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        //lay ra account tu session va kiem tra
        Account account = (Account) session.getAttribute("ACCOUNT");
        if (account == null) {
            String content = URLEncoder.encode("Vui Lòng Đăng Nhập Trước", "UTF-8");
            response.sendRedirect("Login?NOTIBOX=true&NOTICONTENT=" + content);
            return;
        } else {
            if (account.getRole() == 3 || account.getRole() == 5) {
                int product_id = Integer.parseInt(request.getParameter("ProductID"));
                Product product = dao.get_product_by_id(product_id);
                ArrayList<Category> category_list = dao.get_category_list();
                
                request.setAttribute("PRODUCT", product);
                request.setAttribute("CATEGORY_LIST", category_list);
                

                RequestDispatcher rd = request.getRequestDispatcher("product-update.jsp");
                rd.forward(request, response);
            } else {

                String content = URLEncoder.encode("YOU ARE NOT ALLOWED TO DO THIS.", "UTF-8");
                response.sendRedirect("Home?NOTIBOX=true&NOTICONTENT=" + content);
                return;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        
        //lay ra account tu session va kiem tra
        Account account = (Account) session.getAttribute("ACCOUNT");
        if (account == null) {
            String content = URLEncoder.encode("Vui Lòng Đăng Nhập Trước", "UTF-8");
            response.sendRedirect("Login?NOTIBOX=true&NOTICONTENT=" + content);
            return;
        } else {
            if (account.getRole() == 3 || account.getRole() == 5) {
                int product_id = Integer.parseInt(request.getParameter("txt_product_id"));
                String name = request.getParameter("txt_product_name");
                String detail = request.getParameter("txt_product_detail");
                int quantity = Integer.parseInt(request.getParameter("txt_product_quantity"));
                float price = Float.parseFloat(request.getParameter("txt_product_price"));
                
                boolean check = dao.update_product_by_id(product_id, name, detail, quantity, price);
                
                
                response.sendRedirect("ShopManager?NOTIBOX=true&NOTICONTENT=" + check);
                
            } else {

                String content = URLEncoder.encode("YOU ARE NOT ALLOWED TO DO THIS.", "UTF-8");
                response.sendRedirect("Home?NOTIBOX=true&NOTICONTENT=" + content);
                return;
            }
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
