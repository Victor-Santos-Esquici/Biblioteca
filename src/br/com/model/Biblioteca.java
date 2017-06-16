package br.com.model;

public class Biblioteca 
{
	public Integer codBib;
	public String nome;
	public String endereco;
	
	public Biblioteca(){}
	
	public Biblioteca(Integer codBib, String nome, String endereco)
	{
		this.codBib = codBib;
		this.nome = nome;
		this.endereco = endereco;
	}

	public Integer getCodBib() 
	{
		return codBib;
	}

	public void setCodBib(Integer codBib) 
	{
		this.codBib = codBib;
	}

	public String getNome() 
	{
		return nome;
	}

	public void setNome(String nome) 
	{
		this.nome = nome;
	}

	public String getEndereco() 
	{
		return endereco;
	}

	public void setEndereco(String endereco) 
	{
		this.endereco = endereco;
	}
}