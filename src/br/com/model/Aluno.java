package br.com.model;

public class Aluno 
{
	Integer codMatricula;
	String nome;
	String sobrenome;
	String email;
	String endereco;
	Boolean situacao;
	
	public Aluno(){}
	
	public Aluno(Integer codMatricula, String nome, String sobrenome, String email, String endereco, Boolean situacao)
	{
		this.codMatricula = codMatricula;
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.email = email;
		this.endereco = endereco;
		this.situacao = situacao;
	}

	public Integer getCodMatricula() 
	{
		return codMatricula;
	}

	public void setCodMatricula(Integer codMatricula) 
	{
		this.codMatricula = codMatricula;
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

	public Boolean getSituacao() 
	{
		return situacao;
	}

	public void setSituacao(Boolean situacao)
	{
		this.situacao = situacao;
	}
}
