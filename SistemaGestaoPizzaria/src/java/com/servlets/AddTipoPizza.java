/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.TipoPizzaController;
import com.model.TipoPizzaModel;
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
@WebServlet("/views/addTipoPizza")
public class AddTipoPizza extends HttpServlet {

    private TipoPizzaController tipoPizzaController;
    
    public void init() {
        tipoPizzaController = new TipoPizzaController();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String preco = request.getParameter("preco");
        
        TipoPizzaModel tipoPizzaModel = new TipoPizzaModel();
        tipoPizzaModel.setNome(nome);
        tipoPizzaModel.setPreco(preco);
             
            
        if(nome != "" && preco != ""){
            try {
                tipoPizzaController.Adicionar(tipoPizzaModel);
            } catch (SQLException ex) {
                Logger.getLogger(AddFuncionario.class.getName()).log(Level.SEVERE, null, ex);
            } 
                // System.out.println("logado");
                HttpSession session = request.getSession();
                session.setAttribute("insertStatus","inserido");
                response.sendRedirect("pizzas.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("insertStatus","nInserido");
            response.sendRedirect("pizzas.jsp");
        }

          
    }

    

}
