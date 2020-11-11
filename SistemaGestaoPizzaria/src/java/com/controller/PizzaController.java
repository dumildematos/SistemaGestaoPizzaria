/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.connection.ConnectionEntity;
import com.model.PizzaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author dumilde.matos
 */
public class PizzaController {
    
    public void Adicionar(PizzaModel pizzaModel) throws SQLException{
    
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int pizzaId = 0;
        
         try{
            String insertInPizza = "insert into pizza (nome,ingredientes) values(?,?)";
            stmt = con.prepareStatement(insertInPizza,Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, pizzaModel.getNome());
            stmt.setString(2, pizzaModel.getIngredientes());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                pizzaId = rs.getInt(1);
                if(pizzaId > 0){
                    String insertInTipo_pizza_has_pizza = "insert into tipo_pizza_has_pizza (pizza_idpizza,tipo_pizza_idtipo_pizza) values (?,?);";
                    stmt = con.prepareStatement(insertInTipo_pizza_has_pizza);
                    stmt.setInt(1, pizzaId);
                    stmt.setInt(2, pizzaModel.getTipo_pizza_idtipo_pizza());
                    stmt.executeUpdate();
                }
            }
            
            // System.out.println("id retornado "+pizzaId);

        }catch(SQLException ex){
            System.out.println(ex);            
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
    }
    
    public void Editar(PizzaModel pizzaModel, int id) throws SQLException{
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
       
        
         try {
            
            String updatePizza = "update pizza set nome=?, ingredientes=? where idpizza =?";
            stmt = con.prepareStatement(updatePizza);
            stmt.setString(1, pizzaModel.getNome());
            stmt.setString(2, pizzaModel.getIngredientes());
            stmt.setInt(3, id);
            stmt.executeUpdate();
            
            String updateHasTipo ="update tipo_pizza_has_pizza set tipo_pizza_idtipo_pizza=? where pizza_idpizza=?";
            stmt = con.prepareStatement(updateHasTipo);
            stmt.setInt(1, pizzaModel.getTipo_pizza_idtipo_pizza());
            stmt.setInt(2, id);
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
            
            String deleteFromHasTabele = " delete from tipo_pizza_has_pizza where pizza_idpizza = ?";
            stmt = con.prepareStatement(deleteFromHasTabele);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            
            String deletePizza = "delete  from pizza where idpizza=?";
            stmt = con.prepareStatement(deletePizza);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            
            
            // JOptionPane.showMessageDialog(null, "Funcionário Eliminado com sucesso");
         }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao editar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
     
     }
    
    public List getPizzas() {
         
       
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<PizzaModel> list = new ArrayList<>();
        String sql = "select distinct p.idpizza, p.nome, p.ingredientes, tPizza.tipo ,tPizza.preco from pizza as p join tipo_pizza_has_pizza as tHasp join tipo_pizza as tPizza on tHasp.pizza_idpizza = p.idpizza and tHasp.tipo_pizza_idtipo_pizza = tPizza.idtipo_pizza";
        try {
            Connection con = ConnectionEntity.openConection();
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PizzaModel pizza = new PizzaModel();
                pizza.setIdpizza(rs.getInt("idpizza"));
                pizza.setNome(rs.getString("nome"));
                pizza.setIngredientes(rs.getString("ingredientes"));
                pizza.setTipoPizza(rs.getString("tipo"));
                pizza.setPreco(rs.getString("preco"));
                list.add(pizza);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public PizzaModel getPizzaById(int id) throws SQLException {
        
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PizzaModel pizza = new PizzaModel();
        try{
            
            stmt = con.prepareStatement("select * from pizza where idpizza = ? ");    
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                pizza.setIdpizza(rs.getInt("idpizza"));
                pizza.setNome(rs.getString("nome"));
                pizza.setIngredientes(rs.getString("ingredientes"));
                pizza.setTipoPizza(rs.getString("nome"));
                pizza.setPreco(rs.getString("preco"));
        
                return pizza;
            }
            
        }catch(SQLException ex){
            // JOptionPane.showMessageDialog(null, "Erro ao pesquisar "+ex); 
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
        return pizza;
         
     }
    
}
