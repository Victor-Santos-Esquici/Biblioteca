package br.com.model;

public class Livro 
{
	public Integer codLivro;
	public String titulo;
	public String editora;
	public String valor;
	public Integer codCategoria;
	public String categoria;
	public Integer codBib;
	public String biblioteca;
	public Boolean situacao;
	
	public Livro(){}

	public Livro(Integer codLivro, String titulo, String editora, String valor, Integer codCategoria, String categoria,
				 Integer codBib, String biblioteca, Boolean situacao) 
	{
		this.codLivro = codLivro;
		this.titulo = titulo;
		this.editora = editora;
		this.valor = valor;
		this.codCategoria = codCategoria;
		this.categoria = categoria;
		this.codBib = codBib;
		this.biblioteca = biblioteca;
		this.situacao = situacao;
	}

	public Integer getCodLivro() 
	{
		return codLivro;
	}

	public void setCodLivro(Integer codLivro) 
	{
		this.codLivro = codLivro;
	}

	public String getTitulo() 
	{
		return titulo;
	}

	public void setTitulo(String titulo) 
	{
		this.titulo = titulo;
	}

	public String getEditora() 
	{
		return editora;
	}

	public void setEditora(String editora) 
	{
		this.editora = editora;
	}

	public String getValor() 
	{
		return valor;
	}

	public void setValor(String valor) 
	{
		this.valor = valor;
	}

	public Integer getCodCategoria() 
	{
		return codCategoria;
	}

	public void setCodCategoria(Integer codCategoria) 
	{
		this.codCategoria = codCategoria;
	}

	public String getCategoria() 
	{
		return categoria;
	}

	public void setCategoria(String categoria) 
	{
		this.categoria = categoria;
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

	public Boolean getSituacao() 
	{
		return situacao;
	}

	public void setSituacao(Boolean situacao) 
	{
		this.situacao = situacao;
	}
}