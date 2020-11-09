/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.TipoPizzaController;
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
@WebServlet("/views/GetTipoPizza")
public class GetTipoPizza extends HttpServlet {

    private TipoPizzaController tipoPizzaController;
    
    public void init() {
        tipoPizzaController = new TipoPizzaController();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
             throws ServletException, IOException { 
        String stringId = request.getParameter("idTipoPizza");  

        int id = Integer.parseInt(stringId);
        try {
           
            tipoPizzaController.getTipoPizzaById(id);
            
            HttpSession session = request.getSession();
            session.setAttribute("eidtarUserId",id);
            response.sendRedirect("pizzas.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(GetFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
