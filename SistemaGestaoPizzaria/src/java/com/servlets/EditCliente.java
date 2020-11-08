/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.ClienteController;
import com.model.ClienteModel;
import com.model.FuncionarioModel;
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

@WebServlet("/views/EditCliente")
public class EditCliente extends HttpServlet {

    private ClienteController clienteCtrl;
    
    public void init() {
        clienteCtrl = new ClienteController();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String idCliente = request.getParameter("idCliente");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        
        ClienteModel clienteModel = new ClienteModel();
        clienteModel.setIdCliente(Integer.parseInt(idCliente));
        clienteModel.setNome(nome);
        clienteModel.setTelefone(telefone);
        clienteModel.setEndereco(endereco);
        
            if(nome != "" || telefone != "" || telefone != "" || endereco != ""){
            try {
                clienteCtrl.Editar(clienteModel, Integer.parseInt(idCliente));
            } catch (SQLException ex) {
                Logger.getLogger(AddFuncionario.class.getName()).log(Level.SEVERE, null, ex);
            }
                // System.out.println("logado");
                HttpSession session = request.getSession();
                session.setAttribute("insertStatus","atualizado");
                response.sendRedirect("clientes.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("insertStatus","nAtualizado");
            response.sendRedirect("clientes.jsp");
        }
    }
    
}
