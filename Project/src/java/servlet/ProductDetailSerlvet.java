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
import models.Comment;
import models.Product;

/**
 *
 * @author duchi
 */
@WebServlet(name = "ProductDetailSerlvet", urlPatterns = {"/Product-detail"})
public class ProductDetailSerlvet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailSerlvet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailSerlvet at " + request.getContextPath() + "</h1>");
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

        //lay ra product id tu url
        int product_id = Integer.parseInt(request.getParameter("productID"));

        //lay account tu trong session
        Account account = (Account) session.getAttribute("ACCOUNT");

        //lay product information tu id
        Product product = dao.get_product_by_id(product_id);

        //lay danh sach seller
        ArrayList<Account> seller_list = dao.get_seller_list();

        //lay danh sach comment
        ArrayList<Comment> comment_list = dao.get_comment_list_by_product_id(product_id);

        //lay danh sach account
        ArrayList<Account> account_list = dao.get_account_list();

        //set attributee
        request.setAttribute("ACCOUNT", account);
        request.setAttribute("ACCOUNT_LIST", account_list);
        request.setAttribute("COMMENT_NUMBER", comment_list.size());
        request.setAttribute("COMMENT_LIST", comment_list);
        request.setAttribute("PRODUCT", product);
        request.setAttribute("SELLER_LIST", seller_list);

        //chuyen url
        RequestDispatcher rd = request.getRequestDispatcher("product-detail.jsp");
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
