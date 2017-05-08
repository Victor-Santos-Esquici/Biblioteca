package com.br.entidade;

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

}
