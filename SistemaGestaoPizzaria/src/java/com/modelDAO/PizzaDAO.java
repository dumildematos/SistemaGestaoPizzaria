/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelDAO;

import com.controller.PizzaController;
import com.interfaces.PizzaInterface;
import com.model.PizzaModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dumilde.matos
 */
public class PizzaDAO implements PizzaInterface {

    @Override
    public List getListaPizza() {
       
       ArrayList<PizzaModel> list = new ArrayList<>();
       PizzaController pizzaCtrl = new PizzaController();
       list = (ArrayList<PizzaModel>) pizzaCtrl.getPizzas();
        
       return list;
    }

    @Override
    public PizzaModel getPizza(int id) {
       
        PizzaModel pizzaModel = new PizzaModel();
        PizzaController pizzaCtrl = new PizzaController();

        try {
            pizzaModel = pizzaCtrl.getPizzaById(id);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return pizzaModel;
    }
    
}
