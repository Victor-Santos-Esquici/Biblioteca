package br.com.model;

import java.sql.Date;

public class Empresta {
	
	Integer id;
	Integer codMatricula;
	Integer codLivro;
	Date dataRetirada;
	Date dataPrevisao;
	Date dataEntrega;
	
	public Empresta(Integer id, Integer codMatricula, Integer codLivro, Date dataRetirada, Date dataPrevisao, Date dataEntrega){
		this.id = id;
		this.codMatricula = codMatricula;
		this.codLivro = codLivro;
		this.dataRetirada = dataRetirada;
		this.dataPrevisao = dataPrevisao;
		this.dataEntrega = dataEntrega;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCodMatricula() {
		return codMatricula;
	}

	public void setCodMatricula(Integer codMatricula) {
		this.codMatricula = codMatricula;
	}

	public Integer getCodLivro() {
		return codLivro;
	}

	public void setCodLivro(Integer codLivro) {
		this.codLivro = codLivro;
	}

	public Date getDataRetirada() {
		return dataRetirada;
	}

	public void setDataRetirada(Date dataRetirada) {
		this.dataRetirada = dataRetirada;
	}

	public Date getDataPrevisao() {
		return dataPrevisao;
	}

	public void setDataPrevisao(Date dataPrevisao) {
		this.dataPrevisao = dataPrevisao;
	}

	public Date getDataEntrega() {
		return dataEntrega;
	}

	public void setDataEntrega(Date dataEntrega) {
		this.dataEntrega = dataEntrega;
	}
}
