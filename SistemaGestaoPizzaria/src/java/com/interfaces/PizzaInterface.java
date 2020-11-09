/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interfaces;

import com.model.PizzaModel;
import java.util.List;

/**
 *
 * @author dumilde.matos
 */
public interface PizzaInterface {
    public List getListaPizza();
    public PizzaModel getPizza(int id);
}
