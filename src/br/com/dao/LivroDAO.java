package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Livro;
import br.com.util.DbUtil;

public class LivroDAO 
{

	private static Connection con = DbUtil.getConnection();
	
	public void insert(Livro livro) 
	{
		String sql = "insert into livros (titulo, editora, valor, codCategoria, codBib, situacao) values (?, ?, ?, ?, ?, ?)";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, livro.getTitulo());
			preparador.setString(2, livro.getEditora());
			preparador.setDouble(3, livro.getValor());
			preparador.setInt(4, livro.getCodCategoria());
			preparador.setInt(5, livro.getCodBib());
			preparador.setBoolean(6, true);
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void update(Livro livro) 
	{
		String sql = "update livros set titulo = ?, editora = ?, valor = ?, codCategoria = ?, codLib = ?, situacao = ? where codLivro = ?";
		
		try
		{
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
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Livro> select(boolean situacao)
	{
		String sql = "select * from livros where situacao = ?";
		ArrayList<Livro> livroList = new ArrayList<Livro>();
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rs = preparador.executeQuery();
			
			while(rs.next())
			{
				Livro livro = new Livro();
            	livro.setCodLivro(rs.getInt("codLivro"));
            	livro.setTitulo(rs.getString("titulo"));
            	livro.setEditora(rs.getString("editora"));
            	livro.setValor(Double.parseDouble(rs.getString("valor")));
            	livro.setCodCategoria(Integer.parseInt(rs.getString("codCategoria")));
            	livro.setCodBib(Integer.parseInt(rs.getString("codBib")));
            	livro.setSituacao(rs.getBoolean("situacao"));
				livroList.add(livro);
			}
			
			rs.close();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return livroList;
	}
	
    public Livro selectID(int livroID) 
    {
    	String sql = "select * from livros where codLivro = ?";   
    	Livro livro = new Livro();
    	
        try 
        {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setInt(1, livroID);
            ResultSet rs = preparador.executeQuery();

            if (rs.next())
            {
            	livro.setCodLivro(rs.getInt("codLivro"));
            	livro.setTitulo(rs.getString("titulo"));
            	livro.setEditora(rs.getString("editora"));
            	livro.setValor(Double.parseDouble(rs.getString("valor")));
            	livro.setCodCategoria(Integer.parseInt(rs.getString("codCategoria")));
            	livro.setCodBib(Integer.parseInt(rs.getString("codBib")));
            	livro.setSituacao(rs.getBoolean("situacao"));
            }
            
			rs.close();
			preparador.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return livro;
    }
}