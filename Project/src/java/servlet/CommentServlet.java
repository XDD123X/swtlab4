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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import models.Account;
import models.Order;
import models.OrderDetail;

/**
 *
 * @author duchi
 */
@WebServlet(name = "CommentServlet", urlPatterns = {"/Comment"})
public class CommentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        //lay va kiem tra account
        Account account = (Account) session.getAttribute("ACCOUNT");
        if (account == null) {
            request.setAttribute("LOGIN_VALID", "Please Login First");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
        }

        String comment = request.getParameter("txtComment");
        int product_id = Integer.parseInt(request.getParameter("txtProductID"));
        int rate = Integer.parseInt(request.getParameter("txtRate"));
        int account_id = account.getAccountId();

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date date = new java.sql.Date(utilDate.getTime());

        ArrayList<Order> order_list = dao.get_order_list();
        ArrayList<OrderDetail> order_detail_list = dao.get_order_detail_list();

        boolean check = false;
        for (Order order : order_list) {
            // Kiểm tra xem người dùng có `account_id` đã mua đơn hàng với `product_id` hay không
            if (order.getAccountId() == account_id && order.getStatus() == 3) {
                // Lặp qua danh sách Order_detail để kiểm tra sản phẩm
                for (OrderDetail orderDetail : order_detail_list) {
                    if (orderDetail.getOrderId() == order.getOrderId() && orderDetail.getProductId() == product_id) {
                        // Nếu tìm thấy đơn hàng với `account_id` và `product_id`, tức là người dùng đã mua sản phẩm
                        check = true;
                    }
                }
            }
        }

//        request.setAttribute("a", "product id: " + product_id);
//        request.setAttribute("b", "comment: " + comment);
//        request.setAttribute("c", "rate: " + rate);
//        request.setAttribute("d", "caccount id: " + account_id);
//        request.setAttribute("e", "comment check: " + check);
//        request.setAttribute("order_detail_list", order_detail_list);
        if (check) {
            //thuc thi DAO
            int comment_id = dao.get_comment_list().size() + 1;
            dao.add_comment(product_id, account_id, comment_id, comment, rate, check, date);
            dao.update_product_after_comment(product_id, rate);
            String content = "REVIEW ADDED SUCCESSFULLY";
            response.sendRedirect("Product-detail?productID=" + product_id + "&NOTIBOX=true&NOTICONTENT=" + content);
        }else{
            String content = "FAILED. PURCHASE REQUIRED";
            response.sendRedirect("Product-detail?productID=" + product_id + "&NOTIBOX=true&NOTICONTENT=" + content);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
