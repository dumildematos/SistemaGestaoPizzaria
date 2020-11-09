/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.controller.FuncionarioController;
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
@WebServlet("/views/EditFuncionario")
public class EditFuncionario extends HttpServlet {

    private FuncionarioController funcionarioController;
    
    public void init() {
        funcionarioController = new FuncionarioController();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String idFornecedor = request.getParameter("idFornecedor");
        String nome = request.getParameter("nome");
        String funcao = request.getParameter("funcao");
        String telefone = request.getParameter("telefone");
        String nContrato = request.getParameter("nContrato");
        
        FuncionarioModel funcionarioModel = new FuncionarioModel();
        funcionarioModel.setIdFuncionario(Integer.parseInt(idFornecedor));
        funcionarioModel.setNome(nome);
        funcionarioModel.setFuncao(funcao);
        funcionarioModel.setTelefone(telefone);
        funcionarioModel.setN_contrato(nContrato);
        
            if(nome != "" && funcao != "" && telefone != "" && nContrato != ""){
            try {
                funcionarioController.Editar(funcionarioModel, Integer.parseInt(idFornecedor));
            } catch (SQLException ex) {
                Logger.getLogger(AddFuncionario.class.getName()).log(Level.SEVERE, null, ex);
            }
                // System.out.println("logado");
                HttpSession session = request.getSession();
                session.setAttribute("insertStatus","atualizado");
                response.sendRedirect("funcionarios.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("insertStatus","nAtualizado");
            response.sendRedirect("funcionarios.jsp");
        }
    }
    
}
