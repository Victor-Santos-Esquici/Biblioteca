package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Biblioteca;
import br.com.util.DbUtil;

public class BibliotecaDAO 
{
	private static Connection con = DbUtil.getConnection();
	
	public void insert(Biblioteca biblioteca) 
	{
		String sql = "insert into bibliotecas (nome, endereco) values (?,?)";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, biblioteca.getNome());
			preparador.setString(2, biblioteca.getEndereco());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void update(Biblioteca biblioteca) 
	{
		String sql = "update bibliotecas set nome = ?, endereco= ? where codBib = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, biblioteca.getNome());
			preparador.setString(2, biblioteca.getEndereco());
			preparador.setInt(3, biblioteca.getCodBib());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Biblioteca> select()
	{
		String sql = "select * from bibliotecas";
		ArrayList<Biblioteca> bibliotecaList = new ArrayList<Biblioteca>();
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rs = preparador.executeQuery();
			
			while(rs.next())
			{
				Biblioteca biblioteca = new Biblioteca();
                biblioteca.setCodBib(rs.getInt("codBib"));
                biblioteca.setNome(rs.getString("nome"));
                biblioteca.setEndereco(rs.getString("endereco"));
				bibliotecaList.add(biblioteca);
			}
			
			rs.close();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return bibliotecaList;
	}
	
    public Biblioteca selectID(int bibliotecaID) 
    {   
    	String sql = "select * from bibliotecas where codBib = ?";
    	Biblioteca biblioteca = new Biblioteca();
    	
        try 
        {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setInt(1, bibliotecaID);
            ResultSet rs = preparador.executeQuery();

            if (rs.next()) 
            {
                biblioteca.setCodBib(rs.getInt("codBib"));
                biblioteca.setNome(rs.getString("nome"));
                biblioteca.setEndereco(rs.getString("endereco"));
            }
            
            rs.close();
            preparador.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return biblioteca;
    }
}