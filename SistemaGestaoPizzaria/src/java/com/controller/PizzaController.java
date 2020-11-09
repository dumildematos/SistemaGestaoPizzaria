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

/**
 *
 * @author dumilde.matos
 */
public class PizzaController {
    
    public void Adicionar(PizzaModel pizzaModel) throws SQLException{
    
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        
         try{
            stmt = con.prepareStatement("insert into pizza (nome,ingredientes, tipo_pizza_idtipo_pizza) values(?,?,?)");
                        
            stmt.setString(1, pizzaModel.getNome());
            stmt.setString(2, pizzaModel.getIngredientes());
            stmt.setInt(3, pizzaModel.getTipo_pizza_idtipo_pizza());

            
            stmt.executeUpdate();
            // JOptionPane.showMessageDialog(null, "Funcionario adicionado com sucesso");
        }catch(SQLException ex){
            System.out.println(ex);
            // JOptionPane.showMessageDialog(null, "Erro ao cadastrar "+ex); 
            
        }finally{
            ConnectionEntity.closeConnection(con, stmt);
        }
    }
    
    public void Editar(PizzaModel pizzaModel, int id) throws SQLException{
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
       
        
         try {
            
            stmt = con.prepareStatement("update pizza set nome=?, ingredientes=? , tipo_pizza_idtipo_pizza = ? where idpizza =?");
            stmt.setString(1, pizzaModel.getNome());
            stmt.setString(2, pizzaModel.getIngredientes());
            stmt.setInt(3, pizzaModel.getTipo_pizza_idtipo_pizza());
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
            
            stmt = con.prepareStatement("delete from pizza where idpizza=?");
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
        String sql = "select pizza.idpizza, pizza.nome, pizza.ingredientes, tipo_pizza.tipo, tipo_pizza.preco from pizza inner join tipo_pizza where pizza.tipo_pizza_idtipo_pizza = tipo_pizza.idtipo_pizza";
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
    
    public PizzaModel getTipoPizzaById(int id) throws SQLException {
        
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
