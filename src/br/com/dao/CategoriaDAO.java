package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Aluno;
import br.com.model.Categoria;
import br.com.util.DbUtil;

public class CategoriaDAO {

	private static Connection con = DbUtil.getConnection();
	
	public void insert(Categoria categoria) {
		
		String sql = "insert into categorias (descricao) values (?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, categoria.getDescricao());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Categoria categoria) {
		
		String sql = "update categorias set descricao = ? where codCategoria = ?";
		
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
		
		String sql = "select * from categorias";
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
	
    public Categoria selectID(int categoriaID) {
    	   
    	Categoria categoria = new Categoria();
    	
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from categorias where codCategoria = ?");
            preparedStatement.setInt(1, categoriaID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                categoria.setCodCategoria(rs.getInt("codCategoria"));
                categoria.setDescricao(rs.getString("descricao"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return categoria;
    }
}
