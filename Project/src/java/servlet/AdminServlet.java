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
import models.*;
import java.util.*;

/**
 *
 * @author duchi
 */
@WebServlet(name="AdminServlet", urlPatterns={"/Admin"})
public class AdminServlet extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath () + "</h1>");
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
        if(account == null){
            String content = URLEncoder.encode("Vui Lòng Đăng Nhập Trước", "UTF-8");
            response.sendRedirect("Login?NOTIBOX=true&NOTICONTENT="+content);
            return;
        }else{
            
        }
        
        //lay ra account list
        ArrayList<Account> account_list = dao.get_account_list();
        request.setAttribute("ACCOUNT_LIST", account_list);
        
        //lay ra product list
        ArrayList<Product> product_list = dao.get_product_list_admin();
        request.setAttribute("PRODUCT_LIST", product_list);
        
        
        //lay ra order_list va order_detail_list
        ArrayList<Order> order_list = dao.get_order_list();
        ArrayList<OrderDetail> order_detail_list = dao.get_order_detail_list();
        request.setAttribute("ORDER_LIST", order_list);
        request.setAttribute("ORDER_DETAIL_LIST", order_detail_list);
        
        //lay ra category list
        ArrayList<Category> category_list = dao.get_category_list();
        request.setAttribute("CATEGORY_LIST", category_list);
        
        //lay ra comment_list
        ArrayList<Comment> comment_list = dao.get_comment_list();
        request.setAttribute("COMMENT_LIST", comment_list);
        
        //lay ra role list
        ArrayList<Role> role_list = dao.get_role_list();
        request.setAttribute("ROLE_LIST", role_list);
        
        //chuyen huong
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
        
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
