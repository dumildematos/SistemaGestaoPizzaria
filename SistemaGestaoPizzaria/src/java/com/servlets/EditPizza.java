/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.PizzaController;
import com.model.PizzaModel;
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
@WebServlet("/views/EditPizza")
public class EditPizza extends HttpServlet {

    private PizzaController pizzaController;
    
    public void init() {
        pizzaController = new PizzaController();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String idPizza = request.getParameter("idPizza");
        String nome = request.getParameter("nome");
        String ingredientes = request.getParameter("ingredientes");
        int idTipoPizza = Integer.parseInt(request.getParameter("tipoPizzaId"));
        
        PizzaModel pizzaModel = new PizzaModel();
        pizzaModel.setIdpizza(Integer.parseInt(idPizza));
        pizzaModel.setNome(nome);
        pizzaModel.setIngredientes(ingredientes);
        pizzaModel.setTipo_pizza_idtipo_pizza(idTipoPizza);
        
            if(nome != "" && ingredientes != "" ){
            try {
                pizzaController.Editar(pizzaModel, Integer.parseInt(idPizza));
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
