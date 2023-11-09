/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 *
 * @author duchi
 */
@WebServlet(name = "VerifyServlet", urlPatterns = {"/Verify"})
public class VerifyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();

        String encodedEmail = request.getParameter("encodedEmail");

        //kiem tra NOTIBOX và content
        String content = request.getParameter("NOTICONTENT");
        boolean notibox = Boolean.parseBoolean(request.getParameter("NOTIBOX"));
        request.setAttribute("NOTIBOX", notibox);
        request.setAttribute("NOTICONTENT", content);

        //check encodedEmail
        if (encodedEmail == null) {
            request.setAttribute("a", "null point exceptions");
            request.getRequestDispatcher("invalid.html").forward(request, response);
        }

        String email = new String(Base64.getUrlDecoder().decode(encodedEmail), StandardCharsets.UTF_8);

        boolean check = dao.verify(email);
        if (check) {
            session.removeAttribute("ACCOUNT");
            request.setAttribute("NOTIBOX", true);
            request.setAttribute("LOGIN_VALID", "ACTIVATED SUCCESSFULLY. Please re-login.");
            request.setAttribute("NOTICONTENT", "ACTIVATED SUCCESSFULLY. Please re-login.");

            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("a", "ACTIVATED FAILED");
            request.getRequestDispatcher("test.jsp").forward(request, response);
        }

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
