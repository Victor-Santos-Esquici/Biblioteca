package com.br.entidade;

public class Aluno {
	
	Integer codMatricula;
	String nome;
	String endereco;
	Boolean situacao;
	
	public Aluno(Integer codMatricula, String nome, String endereco, Boolean situacao){
		this.codMatricula = codMatricula;
		this.nome = nome;
		this.endereco = endereco;
		this.situacao = situacao;
	}

}
