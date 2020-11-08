/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelDAO;

import com.controller.ClienteController;
import com.interfaces.ClienteInterface;
import com.model.ClienteModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dumilde.matos
 */
public class ClienteDAO implements ClienteInterface {

    @Override
    public List getListaCliente() {
        ArrayList<ClienteModel> list = new ArrayList<>();
        ClienteController clienteCtrl = new ClienteController();
        list = (ArrayList<ClienteModel>) clienteCtrl.getClientes();
        
        return list;
    }

    @Override
    public ClienteModel getCliente(int id) {
        
        ClienteModel clienteModel = new ClienteModel();
        ClienteController clienteCtrl = new ClienteController();

        try {
            clienteModel = clienteCtrl.getClienteById(id);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return clienteModel;
    }
    
    
}
