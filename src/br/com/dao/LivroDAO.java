package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Livro;
import br.com.util.DbUtil;

public class LivroDAO {

	private static Connection con = DbUtil.getConnection();
	
	public void insert(Livro livro) {
		
		String sql = "insert into livros (titulo, editora, valor, codCategoria, codBib, situacao) values (?, ?, ?, ?, ?, ?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, livro.getTitulo());
			preparador.setString(2, livro.getEditora());
			preparador.setDouble(3, livro.getValor());
			preparador.setInt(4, livro.getCodLivro());
			preparador.setBoolean(5, livro.getSituacao());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Livro livro) {
		
		String sql = "update livros set titulo = ?, editora = ?, valor = ?, codCategoria = ?, codLib = ?, situacao = ? where codLivro = ?";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, livro.getTitulo());
			preparador.setString(2, livro.getEditora());
			preparador.setDouble(3, livro.getValor());
			preparador.setInt(4, livro.getCodCategoria());
			preparador.setInt(5, livro.getCodBib());
			preparador.setBoolean(6, livro.getSituacao());
			preparador.setInt(7, livro.getCodLivro());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Livro> select() {
		
		String sql = "select * from livros";
		ArrayList<Livro> livrosList = new ArrayList<Livro>();
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rst = preparador.executeQuery();
			
			while(rst.next()){
				Livro livro = new Livro(rst.getInt("codLivro"), rst.getString("titulo"), rst.getString("editora"), rst.getDouble("valor"), rst.getInt("codCategoria"), rst.getInt("codBib"), rst.getBoolean("situacao"));
				livrosList.add(livro);
			}
			
			rst.close();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return livrosList;
	}
}
