/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelDAO;

import com.controller.TipoPizzaController;
import com.interfaces.TipoPizzaInterface;
import com.model.TipoPizzaModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dumilde.matos
 */
public class TipoPizzaDAO implements TipoPizzaInterface{

    @Override
    public List getListaTipoPizza() {
       ArrayList<TipoPizzaModel> list = new ArrayList<>();
       TipoPizzaController tipoPizzaCtrl = new TipoPizzaController();
       list = (ArrayList<TipoPizzaModel>) tipoPizzaCtrl.getTiposPizza();
        
       return list;
    }

    @Override
    public TipoPizzaModel getTipoPizza(int id) {
        TipoPizzaModel tipoPizzaModel = new TipoPizzaModel();
        TipoPizzaController tipoPizzaCtrl = new TipoPizzaController();

        try {
            tipoPizzaModel = tipoPizzaCtrl.getTipoPizzaById(id);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return tipoPizzaModel;
    }
    
}
