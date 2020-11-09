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
public class PizzaModel {
    
   private int idpizza ;
   private String nome;
   private String ingredientes;
   private int tipo_pizza_idtipo_pizza;
   private String tipoPizza;
   private String preco;

    public PizzaModel() {
    }

    public PizzaModel(int idpizza, String nome, String ingredientes, int tipo_pizza_idtipo_pizza, String tipoPizza, String preco) {
        this.idpizza = idpizza;
        this.nome = nome;
        this.ingredientes = ingredientes;
        this.tipo_pizza_idtipo_pizza = tipo_pizza_idtipo_pizza;
        this.tipoPizza = tipoPizza;
        this.preco = preco;
    }

    public int getIdpizza() {
        return idpizza;
    }

    public void setIdpizza(int idpizza) {
        this.idpizza = idpizza;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public int getTipo_pizza_idtipo_pizza() {
        return tipo_pizza_idtipo_pizza;
    }

    public void setTipo_pizza_idtipo_pizza(int tipo_pizza_idtipo_pizza) {
        this.tipo_pizza_idtipo_pizza = tipo_pizza_idtipo_pizza;
    }

    public String getTipoPizza() {
        return tipoPizza;
    }

    public void setTipoPizza(String tipoPizza) {
        this.tipoPizza = tipoPizza;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }
   
   
   
}
