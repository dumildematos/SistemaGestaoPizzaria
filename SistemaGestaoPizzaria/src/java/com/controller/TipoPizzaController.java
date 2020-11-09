/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.connection.ConnectionEntity;
import com.model.TipoPizzaModel;
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
public class TipoPizzaController {
    public void Adicionar(TipoPizzaModel tipoPizzaModel) throws SQLException{
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        
         try{
            stmt = con.prepareStatement("insert into tipo_pizza (tipo,preco) values(?,?)");
                        
            stmt.setString(1, tipoPizzaModel.getNome());
            stmt.setString(2, tipoPizzaModel.getPreco());

            
            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionario adicionado com sucesso");
        }catch(SQLException ex){
            System.out.println(ex);
            // JOptionPane.showMessageDialog(null, "Erro ao cadastrar "+ex); 
            
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
    }
    
    public void Editar(TipoPizzaModel tipoPizzaModel, int id) throws SQLException{
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
       
        
         try {
            
            stmt = con.prepareStatement("update tipo_pizza set tipo=?, preco=? where idtipo_pizza =?");
            stmt.setString(1, tipoPizzaModel.getNome());
            stmt.setString(2, tipoPizzaModel.getPreco());
            stmt.setInt(3, id);

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
            
            stmt = con.prepareStatement("delete from tipo_pizza where idtipo_pizza=?");
            stmt.setInt(1, id);

            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionário Eliminado com sucesso");
         }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao editar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
     
     }
    
    public List getTiposPizza() {
         
       
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<TipoPizzaModel> list = new ArrayList<>();
        String sql = "select * from tipo_pizza";
        try {
            Connection con = ConnectionEntity.openConection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                TipoPizzaModel tipoPizzaModel = new TipoPizzaModel();
                tipoPizzaModel.setIdtipo_pizza(rs.getInt("idtipo_pizza"));
                tipoPizzaModel.setNome(rs.getString("tipo"));
                tipoPizzaModel.setPreco(rs.getString("preco"));
                list.add(tipoPizzaModel);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public TipoPizzaModel getTipoPizzaById(int id) throws SQLException {
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        TipoPizzaModel tipoPizzaModel = new TipoPizzaModel();
        try{
            
            stmt = con.prepareStatement("select * from tipo_pizza where idtipo_pizza = ? ");    
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                tipoPizzaModel.setIdtipo_pizza(rs.getInt("idtipo_pizza"));
                tipoPizzaModel.setNome(rs.getString("tipo"));
                tipoPizzaModel.setPreco(rs.getString("preco"));
        
                return tipoPizzaModel;
            }
            
        }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao pesquisar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
        return tipoPizzaModel;
         
     }
}
