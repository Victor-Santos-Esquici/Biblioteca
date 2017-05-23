package br.com.model;

public class Biblioteca {
	
	public Integer codLib;
	public String nome;
	public String endereco;
	
	public Biblioteca(Integer codLib, String nome, String endereco){
		this.codLib = codLib;
		this.nome = nome;
		this.endereco = endereco;
	}

	public Integer getCodBib() {
		return codLib;
	}

	public void setCodBib(Integer codLib) {
		this.codLib = codLib;
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
}
