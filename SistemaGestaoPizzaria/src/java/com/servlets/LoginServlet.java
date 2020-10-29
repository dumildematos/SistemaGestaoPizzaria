/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.LoginController;
import com.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dumilde.matos
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private LoginController loginController;

    public void init() {
        loginController = new LoginController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("senha");
        UserModel userModel = new UserModel();
        userModel.setEmail(email);
        userModel.setPassword(password);

        try {
            if(loginController.validate(userModel) > 0){
                System.out.println("logado");
                //HttpSession session = request.getSession();
                // session.setAttribute("username",username);
                response.sendRedirect("dashboard.html");
            }else{
                 HttpSession session = request.getSession();
                 session.setAttribute("user", "nLogado");
                 /*response.setContentType("text/html;charset=UTF-8");
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet teste</title>"); 
                        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Servlet teste at " + request.getContextPath() + "</h1>");
                        out.println("<script>"
                                + "Swal.fire({\n" +
"  icon: 'error',\n" +
"  title: 'Oops...',\n" +
"  text: 'Something went wrong!',\n" +
"  footer: '<a href>Why do I have this issue?</a>'\n" +
"})"
                                + ""
                                + "</script>");
                        out.println("</body>");
                        out.println("</html>");
                    }*/
                // session.setAttribute("user", username);
                response.sendRedirect("index.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
          
    }
}
