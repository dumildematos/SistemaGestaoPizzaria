/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.connection.ConnectionEntity;
import com.model.UserModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dumilde.matos
 */
public class LoginController {
    
    public int validate(UserModel userModel) throws ClassNotFoundException, SQLException {
                
        Connection con = ConnectionEntity.openConection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = con.prepareStatement("select * from utilizador where email=? and senha=?");
                        
            stmt.setString(1, userModel.getEmail());
            stmt.setString(2, userModel.getPassword());
            rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getInt("idutilizador");
            }
        } catch(SQLException e){
            printSQLException(e); 
        }finally{
            ConnectionEntity.closeConnection(con,stmt);
        }
        
        return 0;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    
}
