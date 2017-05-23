package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Aluno;
import br.com.util.DbUtil;

public class AlunoDAO {
	
	private static Connection con = DbUtil.getConnection();
	
	public void insert(Aluno aluno) {
		
		String sql = "insert into alunos values (?,?,?,?,?,?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, aluno.getCodMatricula());
			preparador.setString(2, aluno.getNome());
			preparador.setString(3, aluno.getSobrenome());
			preparador.setString(4, aluno.getEmail());
			preparador.setString(5, aluno.getEndereco());
			preparador.setBoolean(6, aluno.getSituacao());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Aluno aluno) {
		
		String sql = "update alunos set nome = ?, sobrenome = ?, email = ?, endereco = ?, situacao = ? where codMatricula = ?";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, aluno.getNome());
			preparador.setString(2, aluno.getSobrenome());
			preparador.setString(3, aluno.getEmail());
			preparador.setString(4, aluno.getEndereco());
			preparador.setString(5, aluno.getSituacao().toString());
			preparador.setInt(6, aluno.getCodMatricula());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Aluno> select(boolean situacao) {
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
			
			rst.close();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return alunoList;
	}
	
	/*public static void main(String[] args) {
		ArrayList<Aluno> listaTeste = new ArrayList<>();
		listaTeste = selectTest();
		
		listaTeste.forEach(aluno -> 
							System.out.println("\nNome: " + aluno.getNome() + 
							"\nSobrenome: " + aluno.getSobrenome()+
							"\nEmail: " + aluno.getEmail()+
							"\nEndereço: " + aluno.getEndereco()+
							"\nCodMatricula: " + aluno.getCodMatricula()+
							"\nSituacao: "+aluno.getSituacao()));
	}*/
}
