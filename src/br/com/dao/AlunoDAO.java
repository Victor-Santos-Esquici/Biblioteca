package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import br.com.model.Aluno;
import br.com.util.DbUtil;

public class AlunoDAO {
	
	private static Connection con = DbUtil.getConnection();
	
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
	
	public ArrayList<Aluno> select(){
		String sql = "select * from alunos";
		ArrayList<Aluno> alunoList = new ArrayList<Aluno>();
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			
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
