package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Aluno;
import br.com.model.Biblioteca;
import br.com.util.DbUtil;

public class BibliotecaDAO {

	private static Connection con = DbUtil.getConnection();
	
	public void insert(Biblioteca biblioteca) {
		
		String sql = "insert into bibliotecas (nome, endereco) values (?,?)";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, biblioteca.getNome());
			preparador.setString(2, biblioteca.getEndereco());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public void update(Biblioteca biblioteca) {
		
		String sql = "update bibliotecas set nome = ?, endereco= ? where codBib = ?";
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, biblioteca.getNome());
			preparador.setString(2, biblioteca.getEndereco());
			preparador.setInt(3, biblioteca.getCodBib());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Biblioteca> select() {
		
		String sql = "select * from bibliotecas";
		ArrayList<Biblioteca> bibliotecaList = new ArrayList<Biblioteca>();
		
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rst = preparador.executeQuery();
			
			while(rst.next()){
				Biblioteca biblioteca = new Biblioteca(rst.getInt("codBib"), rst.getString("nome"), rst.getString("endereco"));
				bibliotecaList.add(biblioteca);
			}
			
			rst.close();
			preparador.close();
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return bibliotecaList;
	}
	
    public Biblioteca selectID(int bibliotecaID) {
    	   
    	Biblioteca biblioteca = new Biblioteca();
    	
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from bibliotecas where codBib = ?");
            preparedStatement.setInt(1, bibliotecaID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                biblioteca.setCodBib(rs.getInt("codBib"));
                biblioteca.setNome(rs.getString("nome"));
                biblioteca.setEndereco(rs.getString("endereco"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return biblioteca;
    }
}
