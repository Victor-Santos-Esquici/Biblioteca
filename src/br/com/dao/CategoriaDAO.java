package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Categoria;
import br.com.util.DbUtil;

public class CategoriaDAO 
{
	private static Connection con = DbUtil.getConnection();
	
	public void insert(Categoria categoria) 
	{
		String sql = "insert into categorias (descricao) values (?)";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, categoria.getDescricao());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void update(Categoria categoria) 
	{
		String sql = "update categorias set descricao = ? where codCategoria = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, categoria.getDescricao());
			preparador.setInt(2, categoria.getCodCategoria());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void delete(int codCategoria) 
	{
		String sql = "delete from categorias where codCategoria = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, codCategoria);
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Categoria> select() 
	{
		String sql = "select * from categorias";
		ArrayList<Categoria> categoriaList = new ArrayList<Categoria>();
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rs = preparador.executeQuery();
			
			while(rs.next())
			{
				Categoria categoria = new Categoria();
                categoria.setCodCategoria(rs.getInt("codCategoria"));
                categoria.setDescricao(rs.getString("descricao"));
				categoriaList.add(categoria);
			}
			
			rs.close();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return categoriaList;
	}
	
    public Categoria selectID(int categoriaID) 
    {   
    	String sql = "select * from categorias where codCategoria = ?";
    	Categoria categoria = new Categoria();
    	
        try 
        {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setInt(1, categoriaID);
            ResultSet rs = preparador.executeQuery();

            if (rs.next()) 
            {
                categoria.setCodCategoria(rs.getInt("codCategoria"));
                categoria.setDescricao(rs.getString("descricao"));
            }
            
			rs.close();
			preparador.close(); 
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }

        return categoria;
    }
}