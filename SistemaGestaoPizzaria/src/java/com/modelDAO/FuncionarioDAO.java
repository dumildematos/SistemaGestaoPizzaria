/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelDAO;

import com.controller.FuncionarioController;
import com.interfaces.FuncionarioInterface;
import com.model.FuncionarioModel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dumilde.matos
 */
public class FuncionarioDAO implements FuncionarioInterface{
   
       
    
    @Override
    public List getListaFuncionario() {
        ArrayList<FuncionarioModel> list = new ArrayList<>();
        FuncionarioController funcionarioCtrl = new FuncionarioController();
        list = (ArrayList<FuncionarioModel>) funcionarioCtrl.getFuncionarios();
        
        return list;
    }
    
    @Override
    public FuncionarioModel getFuncionario(int id) {
     
        FuncionarioModel funcionario = new FuncionarioModel();
        FuncionarioController funcionarioCtrl = new FuncionarioController();

        try {
            funcionario = funcionarioCtrl.getFunciomarioById(id);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return funcionario;
    }


    
}
