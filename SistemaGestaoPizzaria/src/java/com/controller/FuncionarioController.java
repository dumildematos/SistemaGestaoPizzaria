/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.connection.ConnectionEntity;
import com.model.FuncionarioModel;
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
public class FuncionarioController {
    
    public void Adicionar(FuncionarioModel funcionario) throws SQLException{
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        
         try{
            stmt = con.prepareStatement("insert into funcionario (nome,funcao,telefone,n_contrato) values(?,?,?,?)");
                        
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getFuncao());
            stmt.setString(3, funcionario.getTelefone());
            stmt.setString(4, funcionario.getN_contrato());

            
            stmt.executeUpdate();
            System.out.println("Funcionario inserido");
            // JOptionPane.showMessageDialog(null, "Funcionario adicionado com sucesso");
        }catch(SQLException ex){
            System.out.println(ex);
            // JOptionPane.showMessageDialog(null, "Erro ao cadastrar "+ex); 
            
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
    }
    
    public void Editar(FuncionarioModel funcionario, int id) throws SQLException{
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
       
        
         try {
            
            stmt = con.prepareStatement("update funcionario set nome=?, funcao=?, telefone=?, n_contrato=? where idfuncionario=?");
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getFuncao());
            stmt.setString(3, funcionario.getTelefone());
            stmt.setString(4, funcionario.getN_contrato());
            stmt.setInt(5, id);

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
            
            stmt = con.prepareStatement("delete from funcionario where idfuncionario=?");
            stmt.setInt(1, id);

            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionário Eliminado com sucesso");
         }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao editar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
     
     }
    
    public List getFuncionarios() {
         
       
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<FuncionarioModel> list = new ArrayList<>();
        String sql = "select * from funcionario";
        try {
            Connection con = ConnectionEntity.openConection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                FuncionarioModel funcionario = new FuncionarioModel();
                funcionario.setIdFuncionario(rs.getInt("idfuncionario"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setFuncao(rs.getString("funcao"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setN_contrato(rs.getString("n_contrato"));
                list.add(funcionario);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public FuncionarioModel getFunciomarioById(int id) throws SQLException {
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        FuncionarioModel funcionario = new FuncionarioModel();
        try{
            
            stmt = con.prepareStatement("select * from funcionario where idfuncionario = ? ");    
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                funcionario.setIdFuncionario(rs.getInt("idfuncionario"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setFuncao(rs.getString("funcao"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setN_contrato(rs.getString("n_contrato"));
                System.out.println(funcionario.getNome() + "tssss");
                return funcionario;
            }
            
        }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao pesquisar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
        return funcionario;
         
     }
}
