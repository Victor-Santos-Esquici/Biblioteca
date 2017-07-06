package br.com.model;

public class Funcionario 
{
	public Integer codFunc;
	public String nome;
	public String sobrenome;
	public String email;
	public String endereco;
	public String telefone;
	public String salario;
	public Integer codBib;
	public String biblioteca;
	
	public Funcionario(){}
	
	public Funcionario(Integer codFunc, String nome, String sobrenome, String email, String endereco, String telefone, String salario, Integer codBib, String biblioteca)
	{
		this.codFunc = codFunc;
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.email = email;
		this.endereco = endereco;
		this.telefone = telefone;
		this.salario = salario;
		this.codBib = codBib;
		this.biblioteca = biblioteca;
	}

	public Integer getCodFunc() 
	{
		return codFunc;
	}

	public void setCodFunc(Integer codFunc) 
	{
		this.codFunc = codFunc;
	}

	public String getNome() 
	{
		return nome;
	}

	public void setNome(String nome) 
	{
		this.nome = nome;
	}

	public String getSobrenome() 
	{
		return sobrenome;
	}

	public void setSobrenome(String sobrenome)
	{
		this.sobrenome = sobrenome;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getEndereco() 
	{
		return endereco;
	}

	public void setEndereco(String endereco)
	{
		this.endereco = endereco;
	}

	public String getTelefone() 
	{
		return telefone;
	}

	public void setTelefone(String telefone)
	{
		this.telefone = telefone;
	}

	public String getSalario() 
	{
		return salario;
	}

	public void setSalario(String salario) 
	{
		this.salario = salario;
	}

	public Integer getCodBib() 
	{
		return codBib;
	}

	public void setCodBib(Integer codBib) 
	{
		this.codBib = codBib;
	}
	
	public String getBiblioteca()
	{
		return biblioteca;
	}
	
	public void setBiblioteca(String biblioteca)
	{
		this.biblioteca = biblioteca;
	}
}