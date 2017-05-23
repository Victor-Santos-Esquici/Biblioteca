package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Categoria;
import br.com.util.DbUtil;

public class CategoriaDAO {

	private static Connection con = DbUtil.getConnection();
	
	public void insert(Categoria categoria) {
		
		String sql = "insert into categoria (descricao) values (?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, categoria.getDescricao());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Categoria categoria) {
		
		String sql = "update categoria set descricao = ? where codCategoria = ?";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, categoria.getDescricao());
			preparador.setInt(2, categoria.getCodCategoria());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Categoria> select() {
		
		String sql = "select * from categoria";
		ArrayList<Categoria> categoriaList = new ArrayList<Categoria>();
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rst = preparador.executeQuery();
			
			while(rst.next()){
				Categoria categoria = new Categoria(rst.getInt("codCategoria"), rst.getString("descricao"));
				categoriaList.add(categoria);
			}
			
			rst.close();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return categoriaList;
	}
}
