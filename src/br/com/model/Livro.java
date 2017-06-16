package br.com.model;

public class Livro 
{
	public Integer codLivro;
	public String titulo;
	public String editora;
	public Double valor;
	public Integer codCategoria;
	public Integer codBib;
	public Boolean situacao;
	
	public Livro(){}
	
	public Livro(Integer codLivro, String titulo, String editora, Double valor, Integer codCategoria, Integer codBib, Boolean situacao)
	{
		this.codLivro = codLivro;
		this.titulo = titulo;
		this.editora = editora;
		this.valor = valor;
		this.codCategoria = codCategoria;
		this.codBib = codBib;
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

	public Double getValor()
	{
		return valor;
	}

	public void setValor(Double valor)
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

	public Integer getCodBib()
	{
		return codBib;
	}

	public void setCodBib(Integer codBib)
	{
		this.codBib = codBib;
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