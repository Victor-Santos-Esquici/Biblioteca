package com.br.entidade;

public class Funcionario {

	public Integer codFunc;
	public String nome;
	public String endereco;
	public String telefone;
	public Double salario;
	public Integer codBib;
	
	public Funcionario(Integer codFunc, String nome, String endereco, String telefone, Double salario, Integer codBib){
		this.codFunc = codFunc;
		this.nome = nome;
		this.endereco = endereco;
		this.telefone = telefone;
		this.salario = salario;
		this.codBib = codBib;
	}

	private Integer getCodFunc() {
		return codFunc;
	}

	private void setCodFunc(Integer codFunc) {
		this.codFunc = codFunc;
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

	private String getTelefone() {
		return telefone;
	}

	private void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	private Double getSalario() {
		return salario;
	}

	private void setSalario(Double salario) {
		this.salario = salario;
	}

	private Integer getCodBib() {
		return codBib;
	}

	private void setCodBib(Integer codBib) {
		this.codBib = codBib;
	}
}
