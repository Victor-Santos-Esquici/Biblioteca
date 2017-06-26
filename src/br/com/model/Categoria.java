package br.com.model;

public class Categoria 
{

	public Integer codCategoria;
	public String descricao;
	
	public Categoria(){}
	
	public Categoria(Integer codCategoria, String descricao)
	{
		this.codCategoria = codCategoria;
		this.descricao = descricao;
	}

	public Integer getCodCategoria() 
	{
		return codCategoria;
	}

	public void setCodCategoria(Integer codCategoria) 
	{
		this.codCategoria = codCategoria;
	}

	public String getDescricao() 
	{
		return descricao;
	}

	public void setDescricao(String descricao) 
	{
		this.descricao = descricao;
	}
}