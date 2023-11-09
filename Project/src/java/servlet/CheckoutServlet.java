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
import java.sql.Date;
import java.time.LocalDate;
import models.Account;
import models.Cart;
import models.Order;
import models.OrderDetail;

/**
 *
 * @author BlackZ36
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/Checkout"})
public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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

        //lay ra tham so tu session
        Account account = (Account) session.getAttribute("ACCOUNT");

        //kiem tra trang thai tai khoan
        if (account != null) {
            if (account.getStatus() != 1) {
                content = "PLEASE VERIFY BEFORE CHECKOUT";
                response.sendRedirect("Account?NOTIBOX=true&NOTICONTENT=" + content);
                return;
            }
        }

        //lay danh sach nguoi ban hang
        ArrayList<Account> seller_list = dao.get_seller_list();

        //kiem tra account
        if (account == null) {
            content = "PLEASE LOGIN FIRST";
                response.sendRedirect("Login?NOTIBOX=true&NOTICONTENT=" + content);
                return;
        }

        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("CART_LIST");
        if (account != null) {

            //lay total tu trong session
            Float total = (Float) session.getAttribute("TOTAL");

            if (cart_list == null) {

                request.setAttribute("NOTIBOX", true);

                request.setAttribute("PRODUCT_LIST", dao.get_product_list());
                content = "CART EMPTY. PLEADE ADD AT LEAST 1 PRODUCT";
                request.setAttribute("NOTICONTENT", content);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);

                //response.sendRedirect("test.jsp");
            } else {

                request.setAttribute("TOTAL", total);
                request.setAttribute("cart_list", cart_list);
                request.setAttribute("ACCOUNT", account);
                request.setAttribute("SELLER_LIST", seller_list);

                RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
                rd.forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        //lay ra tham so tu session
        Account account = (Account) session.getAttribute("ACCOUNT");

        //kiem tra account
        if (account == null) {
            request.setAttribute("LOGIN_VALID", "Please login first.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        if (account != null) {

            //kiem tra trang thai tai khoan
            if (account.getStatus() != 1) {
                String content = "PLEASE VERIFY BEFORE CHECKOUT";
                response.sendRedirect("Account?NOTIBOX=true&NOTICONTENT=" + content);
                return;
            }

            //kiem tra action
            String action = request.getParameter("action");

            //to check out page
            if (action.equalsIgnoreCase("checkout")) {
                float total = Float.parseFloat(request.getParameter("txtTotal"));
                if (total != 0) {
                    session.setAttribute("TOTAL", total);
                    response.sendRedirect("Checkout");
                } else {

                    response.sendRedirect("Home");
                }
            }

            //proceed
            if (action.equalsIgnoreCase("proceed")) {

                //lay ra tham so can thiet
                float total = (float) session.getAttribute("TOTAL");
                ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("CART_LIST");
                int order_id = dao.get_order_list().size() + 1;
                int order_detail_id = dao.get_order_detail_list().size() + 1;
                int account_id = account.getAccountId();
                int status = 2;
                java.util.Date utilDate = new java.util.Date();
                java.sql.Date date = new java.sql.Date(utilDate.getTime());

                dao.add_order(order_id, account_id, total, status, date, date);
                dao.add_order_detail(order_detail_id, order_id, cart_list);
                dao.update_product_after_order(cart_list);
                session.removeAttribute("CART_LIST");

                response.sendRedirect("Order");
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
