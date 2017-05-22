package br.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao 
{
	public static Connection getConnection()
	{
		Connection con = null;
		
		try	
		{
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bibliotecaDB", "postgres", "admin");
			System.out.println("Conectado com sucesso");
		} 
		catch(SQLException e) 
		{
			e.printStackTrace();
			System.out.println("Falha na conexão");
		}
		
		return con;
	}
}