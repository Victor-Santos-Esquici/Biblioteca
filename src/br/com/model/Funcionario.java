package br.com.model;

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

	public Integer getCodFunc() {
		return codFunc;
	}

	public void setCodFunc(Integer codFunc) {
		this.codFunc = codFunc;
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

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Double getSalario() {
		return salario;
	}

	public void setSalario(Double salario) {
		this.salario = salario;
	}

	public Integer getCodBib() {
		return codBib;
	}

	public void setCodBib(Integer codBib) {
		this.codBib = codBib;
	}
}
