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
@WebServlet("/views/EditTipoPizza")
public class EditTipoPizza extends HttpServlet {

    private TipoPizzaController tipoPizzaController;

    public void init() {
        tipoPizzaController = new TipoPizzaController();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String idTipoPizza = request.getParameter("idTipoPizza");
        String nome = request.getParameter("tipo");
        String preco = request.getParameter("preco");
        
        TipoPizzaModel tipoPizzaModel = new TipoPizzaModel();
        tipoPizzaModel.setIdtipo_pizza(Integer.parseInt(idTipoPizza));
        tipoPizzaModel.setNome(nome);
        tipoPizzaModel.setPreco(preco);
        
            if(nome != "" && preco != ""){
            try {
                tipoPizzaController.Editar(tipoPizzaModel, Integer.parseInt(idTipoPizza));
            } catch (SQLException ex) {
                Logger.getLogger(AddFuncionario.class.getName()).log(Level.SEVERE, null, ex);
            }
                // System.out.println("logado");
                HttpSession session = request.getSession();
                session.setAttribute("insertStatus","atualizado");
                response.sendRedirect("pizzas.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("insertStatus","nAtualizado");
            response.sendRedirect("pizzas.jsp");
        }
    }
   
}
