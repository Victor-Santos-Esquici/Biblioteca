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

	public Integer getCodMatricula() {
		return codMatricula;
	}

	public void setCodMatricula(Integer codMatricula) {
		this.codMatricula = codMatricula;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Boolean getSituacao() {
		return situacao;
	}

	public void setSituacao(Boolean situacao) {
		this.situacao = situacao;
	}
}
