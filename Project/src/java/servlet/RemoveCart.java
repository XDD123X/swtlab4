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
import java.util.Iterator;
import models.Cart;
import models.Product;

/**
 *
 * @author duchi
 */
@WebServlet(name = "RemoveCart", urlPatterns = {"/Remove-cart-item"})
public class RemoveCart extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RemoveCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveCart at " + request.getContextPath() + "</h1>");
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
        
        //lay cart tu session
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("CART_LIST");

        //lay product id can xoa
        int product_id = Integer.parseInt(request.getParameter("productId"));

        //xoa product trong cart_list va set lai session
        Iterator<Cart> iterator = cart_list.iterator();
        while (iterator.hasNext()) {
            Cart cart = iterator.next();
            if (cart.getProductId() == product_id) {
                iterator.remove();
            }
        }
        content = "REMOVED SUCCESSFULLY";
        response.sendRedirect("Cart?NOTIBOX=true&NOTICONTENT="+content);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
