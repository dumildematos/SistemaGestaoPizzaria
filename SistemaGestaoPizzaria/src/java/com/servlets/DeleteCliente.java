/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.ClienteController;
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

/**
 *
 * @author dumilde.matos
 */
@WebServlet("/views/DelCliente")
public class DeleteCliente extends HttpServlet {

    private ClienteController clienteCtrl;
    
    public void init() {
        clienteCtrl = new ClienteController();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
             throws ServletException, IOException {  
        String stringId = request.getParameter("idCliente");  
        int id = Integer.parseInt(stringId);
        
       
        try {
            clienteCtrl.Apagar(id);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
          
    } 

}
