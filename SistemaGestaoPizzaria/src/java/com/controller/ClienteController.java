/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.connection.ConnectionEntity;
import com.model.ClienteModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dumilde.matos
 */
public class ClienteController {
    public void Adicionar(ClienteModel clienteModel) throws SQLException{
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        
         try{
            stmt = con.prepareStatement("insert into cliente (nome,telefone,endereco) values(?,?,?)");
                        
            stmt.setString(1, clienteModel.getNome());
            stmt.setString(2, clienteModel.getTelefone());
            stmt.setString(3, clienteModel.getEndereco());

            
            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionario adicionado com sucesso");
        }catch(SQLException ex){
            System.out.println(ex);
            // JOptionPane.showMessageDialog(null, "Erro ao cadastrar "+ex); 
            
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
    }
    
    public void Editar(ClienteModel cliente, int id) throws SQLException{
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
       
        
         try {
            
            stmt = con.prepareStatement("update cliente set nome=?, telefone=?, endereco=? where idcliente=?");
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getTelefone());
            stmt.setString(3, cliente.getEndereco());
            stmt.setInt(4, id);

            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionário Editado com sucesso");
         }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao editar "+ex); 
        }finally{
           ConnectionEntity.closeConnection(con, stmt);
        }
     }
    
    public void Apagar(int id) throws SQLException{
         
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        
         try {
            
            stmt = con.prepareStatement("delete from cliente where idcliente=?");
            stmt.setInt(1, id);

            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionário Eliminado com sucesso");
         }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao editar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
     
     }
    
    public List getClientes() {
         
       
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<ClienteModel> list = new ArrayList<>();
        String sql = "select * from cliente";
        try {
            Connection con = ConnectionEntity.openConection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ClienteModel cliente = new ClienteModel();
                cliente.setIdCliente(rs.getInt("idcliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEndereco(rs.getString("endereco"));
                list.add(cliente);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public ClienteModel getClienteById(int id) throws SQLException {
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ClienteModel cliente = new ClienteModel();
        try{
            
            stmt = con.prepareStatement("select * from cliente where idcliente = ? ");    
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                cliente.setIdCliente(rs.getInt("idcliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEndereco(rs.getString("endereco"));
        
                return cliente;
            }
            
        }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao pesquisar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
        return cliente;
         
     }
}
