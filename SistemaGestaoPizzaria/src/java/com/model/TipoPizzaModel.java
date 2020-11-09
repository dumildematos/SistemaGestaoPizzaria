/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author dumilde.matos
 */
public class TipoPizzaModel {
    private int idtipo_pizza;
    private String nome;
    private String preco;

    public TipoPizzaModel() {
    }

    public TipoPizzaModel(int idtipo_pizza, String nome, String preco) {
        this.idtipo_pizza = idtipo_pizza;
        this.nome = nome;
        this.preco = preco;
    }

    public int getIdtipo_pizza() {
        return idtipo_pizza;
    }

    public void setIdtipo_pizza(int idtipo_pizza) {
        this.idtipo_pizza = idtipo_pizza;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }
    
    
    
    
}
