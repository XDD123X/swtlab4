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
import models.Account;
import models.Cart;
import models.Comment;
import models.Product;

/**
 *
 * @author duchi
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add-to-cart"})
public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        ArrayList<Cart> list = new ArrayList<>();
        Cart cart = new Cart();

        //lay product id va quantity
        int id = Integer.parseInt(request.getParameter("product_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        //lay thong tin product theo id
        Product product = dao.get_product_by_id(id);
        String name = product.getName();
        int type = product.getCategoryId();
        double price = product.getPrice();
        String image = product.getImage();
        String category_name = product.getCategoryName();
        int upload_id = product.getUploadBy();

        //set thong tin cho cart entry
        cart.setProductId(id);
        cart.setName(name);
        cart.setCategoryId(type);
        cart.setPrice(price);
        cart.setUploadBy(upload_id);
        cart.setQuantity(quantity);
        cart.setImage(image);
        cart.setCategoryName(category_name);

        //set 
        request.setAttribute("PRODUCT_LIST", dao.get_product_list());

        //lay cart_list tu trong session
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("CART_LIST");
        Account account = (Account) session.getAttribute("ACCOUNT");

        if (cart_list == null) {
            list.add(cart);
            session.setAttribute("CART_LIST", list);
            String content = "ADDED TO CART SUCCESSFULLY";
            response.sendRedirect("Home?NOTIBOX=true&NOTICONTENT=" + content);
        } else {
            list = cart_list;

            boolean exist = false;
            for (Cart c : cart_list) {
                if (c.getProductId() == id) {
                    // Tăng số lượng sản phẩm
                    c.setQuantity(c.getQuantity() + 1);
                    exist = true;
                    break;
                }
            }

            if (!exist) {
                list.add(cart);
            }
            session.setAttribute("CART_LIST", list);

            // Chuyển hướng tới trang Home.jsp
            String content = "ADDED TO CART SUCCESSFULLY";
            response.sendRedirect("Home?NOTIBOX=true&NOTICONTENT=" + content);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        ArrayList<Cart> list = new ArrayList<>();
        Cart cart = new Cart();

        //lay ra product id cho DAO
        int id = Integer.parseInt(request.getParameter("product_id"));
        String quantityParam = request.getParameter("p_quantity");
        int quantity = 1;
        if (quantityParam != null && !quantityParam.isEmpty()) {
            try {
                quantity = Integer.parseInt(quantityParam);
            } catch (NumberFormatException e) {

            }
        }

        //lay thong tin product theo id
        Product product = dao.get_product_by_id(id);
        String name = product.getName();
        int type = product.getCategoryId();
        double price = product.getPrice();
        String image = product.getImage();
        String category_name = product.getCategoryName();
        int upload_id = product.getUploadBy();

        //set thong tin cho cart entry
        cart.setProductId(id);
        cart.setName(name);
        cart.setCategoryId(type);
        cart.setPrice(price);
        cart.setUploadBy(upload_id);
        cart.setQuantity(quantity);
        cart.setImage(image);
        cart.setCategoryName(category_name);

        //lay cart_list tu trong session
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("CART_LIST");
        Account account = (Account) session.getAttribute("ACCOUNT");

        if (cart_list == null) {
            list.add(cart);
            session.setAttribute("CART_LIST", list);
            String content = "ADDED TO CART SUCCESSFULLY";
            response.sendRedirect("Product-detail?productID=" + id + "&NOTIBOX=true&NOTICONTENT=" + content);

        } else {
            list = cart_list;

            boolean exist = false;
            for (Cart c : cart_list) {
                if (c.getProductId() == id && quantity == 1) {
                    // Tăng số lượng sản phẩm
                    int q = c.getQuantity() + 1;
                    c.setQuantity(q);
                    exist = true;
                    break;
                } else if (c.getProductId() == id && quantity > 1) {
                    // Tăng số lượng sản phẩm
                    int q = c.getQuantity() + quantity;
                    c.setQuantity(q);
                    exist = true;
                    break;
                }

            }

            if (!exist) {
                list.add(cart);
            }

            session.setAttribute("CART_LIST", list);

            String url = request.getParameter("currentURL");

            if (url.equals("product-detail")) {

                //lay danh sach seller
                ArrayList<Account> seller_list = dao.get_seller_list();

                //lay danh sach comment
                ArrayList<Comment> comment_list = dao.get_comment_list_by_product_id(id);

                //lay danh sach account
                ArrayList<Account> account_list = dao.get_account_list();

                //set attributee
                request.setAttribute("ACCOUNT_LIST", account_list);
                request.setAttribute("COMMENT_NUMBER", comment_list.size());
                request.setAttribute("COMMENT_LIST", comment_list);
                request.setAttribute("PRODUCT", product);
                request.setAttribute("SELLER_LIST", seller_list);

                // Chuyển hướng tới trang 
                String content = "ADDED TO CART SUCCESSFULLY";
                response.sendRedirect("Product-detail?productID=" + id + "&NOTIBOX=true&NOTICONTENT=" + content);

                return;
            }

            response.sendRedirect("Home");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
