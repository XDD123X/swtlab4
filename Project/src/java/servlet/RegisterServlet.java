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
import java.sql.Date;
import java.util.ArrayList;
import models.Account;

/**
 *
 * @author duchi
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        int id = dao.get_account_list().size() + 1;
        String username = request.getParameter("txtRegUsername");
        String password = request.getParameter("txtRegPassword");
        String name = request.getParameter("txtRegName");
        String address = "Updating...";
        String email = request.getParameter("txtRegEmail");
        String phone = request.getParameter("txtRegPhone");
        String confirm = request.getParameter("txtRegConfirm");

        String r = request.getParameter("txtType");
        int role = 0;
        if (r.equalsIgnoreCase("customer")) {
            role = 1;
        } else {
            role = 2;
        }

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date date = new java.sql.Date(utilDate.getTime());
        int status = 3;

        //kiem tra input
        boolean valid = true;
        if (username.length() < 6 || username.length() > 30) {
            request.setAttribute("REGISTER_VALID_MESS", "Username must be 6-30 characters.");
            valid = false;
        } else if (phone.length() != 10 && !phone.matches("^[0-9]+$")) {
            request.setAttribute("REGISTER_VALID_MESS", "Phone must be 10 numbers.");
            valid = false;
        } else if (password.length() < 6 || password.length() > 30) {
            request.setAttribute("REGISTER_VALID_MESS", "Password must be 6-30 characters.");
            valid = false;
        } else if (!password.equals(confirm)) {
            request.setAttribute("REGISTER_VALID_MESS", "Confirm password is not the same.");
            valid = false;
        } else if (!password.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).+$")) {
            request.setAttribute("REGISTER_VALID_MESS", "Password must be alphanumberics.");
            valid = false;
        }

        //kiem tra exist
        ArrayList<Account> account_list = dao.get_account_list();
        for (Account account : account_list) {
            if (account.getUsername().equalsIgnoreCase(username)) {
                request.setAttribute("REGISTER_VALID_MESS", "Username has been registered. Please login or choose another username.");
                valid = false;
            } else if (account.getEmail().equalsIgnoreCase(email)) {
                request.setAttribute("REGISTER_VALID_MESS", "Email has been registered. Please chooseanother email.");
                valid = false;
            } else if (account.getPhone().equalsIgnoreCase(phone)) {
                request.setAttribute("REGISTER_VALID_MESS", "Phone number has been registered. Please choose another number.");
                valid = false;
            }
        }

        //check valid va thuc hien
        if (valid) {
            boolean RegisterCheck = dao.register(id, username, password, name, address, email, phone, role, date, status);
            if (RegisterCheck) {
                request.setAttribute("REGISTER_VALID", "Register Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {

                request.setAttribute("a", id);
                request.setAttribute("b", username);
                request.setAttribute("c", password);
                request.setAttribute("d", name);
                request.setAttribute("a1", address);
                request.setAttribute("b1", email);
                request.setAttribute("c1", phone);
                request.setAttribute("d1", role);
                request.setAttribute("a2", date);
                request.setAttribute("b2", status);

                request.setAttribute("REGISTER_VALID", "Register Failed");
                RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
                rd.forward(request, response);
            }
        } else {

            request.setAttribute("REGISTER_VALID", "Register Failed");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
