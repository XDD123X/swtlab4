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
import models.Account;

/**
 *
 * @author duchi
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //kiem tra NOTIBOX và content
        String content = request.getParameter("NOTICONTENT");
        boolean notibox = Boolean.parseBoolean(request.getParameter("NOTIBOX"));
        request.setAttribute("NOTIBOX", notibox);
        request.setAttribute("NOTICONTENT", content);
        
        //kiem tra account trong session
        Account account = (Account) session.getAttribute("ACCOUNT");
        if (account == null) {
            request.setAttribute("LOGIN_VALID", "Please Login");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("LOGIN_ACCOUNT", account);
            RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //goi ra thu vien
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        //lay ra cac tham so
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");

        //lay tra tai khoan voi parameter tu jsp
        Account login_account = dao.login(username, password);

        //kiem tra tai khoan lay ra
        if (login_account == null) {
            request.setAttribute("LOGIN_VALID", "Username/Password are invalid.");
            request.setAttribute("NOTIBOX", true);
            request.setAttribute("NOTICONTENT", "Username/Password are invalid.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);

        } else {
            session.setAttribute("ACCOUNT", login_account);
            response.sendRedirect("Home");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
