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
import models.Order;
import models.OrderDetail;

/**
 *
 * @author duchi
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/Order-detail"})
public class OrderDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath() + "</h1>");
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

        //lay ra tham so
        String action = request.getParameter("action");
        Account account = (Account) session.getAttribute("ACCOUNT");

        //xu ly tham so view
        if (action.equals("view")) {
            int orderID = Integer.parseInt(request.getParameter("txtOrderID"));
            ArrayList<OrderDetail> order_detail_list = dao.get_order_detail_list(orderID);
            Order order = dao.get_order_by_id(orderID);

            request.setAttribute("ACCOUNT", account);
            request.setAttribute("order", order);
            request.setAttribute("order_detail_list", order_detail_list);
            request.setAttribute("PRODUCT", dao.get_product_list());

            RequestDispatcher rd = request.getRequestDispatcher("order-detail.jsp");
            rd.forward(request, response);
        }

        //xu ly tham so remove
        if (action.equals("delete")) {
            int orderID = Integer.parseInt(request.getParameter("txtOrderID"));
            dao.remove_order_by_id(orderID);

            response.sendRedirect("Order");
        }

        //xu ly tham so cancel
        if (action.equals("cancel")) {
            int orderID = Integer.parseInt(request.getParameter("txtOrderID"));
            dao.cancel_order_by_id(orderID);

            response.sendRedirect("Order");
        }

        //xu ly tham so recieve
        if (action.equals("recieved")) {
            int orderID = Integer.parseInt(request.getParameter("txtOrderID"));
            dao.recieve_order_by_id(orderID);
            
            response.sendRedirect("Order");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
