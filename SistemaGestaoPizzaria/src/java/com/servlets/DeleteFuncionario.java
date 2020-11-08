/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.FuncionarioController;
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
@WebServlet("/views/DelFuncionario")
public class DeleteFuncionario extends HttpServlet {
        
    private FuncionarioController funcionarioController;
    
    public void init() {
        funcionarioController = new FuncionarioController();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
             throws ServletException, IOException {  
        String stringId = request.getParameter("idFuncionario");  
        int id = Integer.parseInt(stringId);
        
        try {
            funcionarioController.Apagar(id);
           
        } catch (SQLException ex) {
            Logger.getLogger(DeleteFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
         
          
    } 
}
