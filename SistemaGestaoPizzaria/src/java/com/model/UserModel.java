/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;

/**
 *
 * @author dumilde.matos
 */
public class UserModel  implements Serializable  {
 
    // private static final long serialVersionUID = 1 L;
    private String useremail;
    private String password;
    
    public String getEmail() {
        return useremail;
    }

    public void setEmail(String useremail) {
        this.useremail = useremail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
