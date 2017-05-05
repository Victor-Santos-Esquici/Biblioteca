package com.br.entidade;

public class Biblioteca {
	
	public Integer codBib;
	public String nome;
	public String endereco;
	
	public Biblioteca(Integer codBib, String nome, String endereco){
		this.codBib = codBib;
		this.nome = nome;
		this.endereco = endereco;
	}

	private Integer getCodBib() {
		return codBib;
	}

	private void setCodBib(Integer codBib) {
		this.codBib = codBib;
	}

	private String getNome() {
		return nome;
	}

	private void setNome(String nome) {
		this.nome = nome;
	}

	private String getEndereco() {
		return endereco;
	}

	private void setEndereco(String endereco) {
		this.endereco = endereco;
	}
}
