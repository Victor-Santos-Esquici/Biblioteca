package com.br.entidade;

public class Livros {

	public Integer codLivro;
	public String titulo;
	public String editora;
	public Double valor;
	public Integer codCategoria;
	public Integer codBib;
	public Boolean situacao;
	
	public Livros(Integer codLivro, String titulo, String editora, Double valor, Integer codCategoria, Integer codBib, Boolean situacao){
		this.codLivro = codLivro;
		this.titulo = titulo;
		this.editora = editora;
		this.valor = valor;
		this.codCategoria = codCategoria;
		this.codBib = codBib;
		this.situacao = situacao;
	}

	private Integer getCodLivro() {
		return codLivro;
	}

	private void setCodLivro(Integer codLivro) {
		this.codLivro = codLivro;
	}

	private String getTitulo() {
		return titulo;
	}

	private void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	private String getEditora() {
		return editora;
	}

	private void setEditora(String editora) {
		this.editora = editora;
	}

	private Double getValor() {
		return valor;
	}

	private void setValor(Double valor) {
		this.valor = valor;
	}

	private Integer getCodCategoria() {
		return codCategoria;
	}

	private void setCodCategoria(Integer codCategoria) {
		this.codCategoria = codCategoria;
	}

	private Integer getCodBib() {
		return codBib;
	}

	private void setCodBib(Integer codBib) {
		this.codBib = codBib;
	}

	private Boolean getSituacao() {
		return situacao;
	}

	private void setSituacao(Boolean situacao) {
		this.situacao = situacao;
	}
}
