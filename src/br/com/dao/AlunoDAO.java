package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Aluno;
import br.com.util.Conexao;

public class AlunoDAO {
	
	private Connection con = Conexao.getConnection();
	
	public void insert(Aluno aluno){
		
		String sql = "insert into alunos values (?,?,?,?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, aluno.getCodMatricula().toString());
			preparador.setString(2, aluno.getNome());
			preparador.setString(3, aluno.getEndereco());
			preparador.setString(4, aluno.getSituacao().toString());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Aluno aluno){
		
		String sql = "update alunos set nome = ?, endereco = ?, situacao = ? where codMatricula = ?";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, aluno.getNome());
			preparador.setString(2, aluno.getEndereco());
			preparador.setString(3, aluno.getSituacao().toString());
			preparador.setInt(4, aluno.getCodMatricula());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Aluno> select(boolean situacao){
		
		String sql = "select * from alunos where situacao = ?";
		ArrayList<Aluno> alunoList = new ArrayList<Aluno>();
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setBoolean(1, situacao);
			
			ResultSet rst = preparador.executeQuery();
			
			while(rst.next()){
				Aluno aluno = new Aluno(rst.getInt("codMatricula"), rst.getString("nome"), rst.getString("sobrenome"), rst.getString("email"),rst.getString("endereco"), rst.getBoolean("situacao"));
				alunoList.add(aluno);
			}
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return alunoList;
	}
}
