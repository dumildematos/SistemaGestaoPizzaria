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
public class FuncionarioModel {
    
    private int idFuncionario;
    private String nome;
    private String funcao;
    private String n_contrato;
    private String telefone;

    public FuncionarioModel() {
    }
    
    public FuncionarioModel(int idFuncionario, String nome, String funcao, String n_contrato) {
        this.idFuncionario = idFuncionario;
        this.nome = nome;
        this.funcao = funcao;
        this.n_contrato = n_contrato;
    }

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }

    public String getN_contrato() {
        return n_contrato;
    }

    public void setN_contrato(String n_contrato) {
        this.n_contrato = n_contrato;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    
    
}
