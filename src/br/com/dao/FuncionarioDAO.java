package br.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.model.Funcionario;
import br.com.util.DbUtil;

public class FuncionarioDAO 
{
	private static Connection con = DbUtil.getConnection();
	
	public void insert(Funcionario funcionario) 
	{
		String sql = "insert into funcionarios (nome, sobrenome, email, endereco, telefone, salario, codBib) values (?, ?, ?, ?, ?, ?, ?)";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, funcionario.getNome());
			preparador.setString(2, funcionario.getSobrenome());
			preparador.setString(3, funcionario.getEmail());
			preparador.setString(4, funcionario.getEndereco());
			preparador.setString(5, funcionario.getTelefone());
			preparador.setString(6, funcionario.getSalario());
			preparador.setInt(7, funcionario.getCodBib());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void update(Funcionario funcionario) 
	{
		String sql = "update funcionarios set nome = ?, sobrenome = ?, email = ?, endereco = ?, telefone = ?, salario = ?, codBib = ? where codFunc = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, funcionario.getNome());
			preparador.setString(2, funcionario.getSobrenome());
			preparador.setString(3, funcionario.getEmail());
			preparador.setString(4, funcionario.getEndereco());
			preparador.setString(5, funcionario.getTelefone());
			preparador.setString(6, funcionario.getSalario());
			preparador.setInt(7, funcionario.getCodBib());
			preparador.setInt(8, funcionario.getCodFunc());
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public void delete(int codFunc) 
	{
		String sql = "delete from funcionarios where codFunc = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, codFunc);
			
			preparador.execute();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Funcionario> select()
	{	
		String sql = "select codFunc, funcionarios.nome, sobrenome, email, funcionarios.endereco, telefone, salario, funcionarios.codBib, bibliotecas.nome from funcionarios inner join bibliotecas on bibliotecas.codBib = funcionarios.codBib";
		ArrayList<Funcionario> funcionarioList = new ArrayList<Funcionario>();
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rs = preparador.executeQuery();
			
			while(rs.next())
			{
				Funcionario funcionario = new Funcionario();
                funcionario.setCodFunc(rs.getInt(1));
                funcionario.setNome(rs.getString(2));
                funcionario.setSobrenome(rs.getString(3));
                funcionario.setEmail(rs.getString(4));
                funcionario.setEndereco(rs.getString(5));
                funcionario.setTelefone(rs.getString(6));
                funcionario.setSalario(rs.getString(7));
                funcionario.setCodBib(rs.getInt(8));
                funcionario.setBiblioteca(rs.getString(9));
				funcionarioList.add(funcionario);
			}
			
			rs.close();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return funcionarioList;
	}
	
    public Funcionario selectID(int funcionarioID)
    {   
    	String sql = "select * from funcionarios where codFunc = ?";
    	Funcionario funcionario = new Funcionario();
    	
        try 
        {
            PreparedStatement preparador = con.prepareStatement(sql);
            preparador.setInt(1, funcionarioID);
            ResultSet rs = preparador.executeQuery();

            if (rs.next()) 
            {
                funcionario.setCodFunc(rs.getInt("codFunc"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setSobrenome(rs.getString("sobrenome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setSalario(rs.getString("salario"));
                funcionario.setCodBib(rs.getInt("codBib"));
            }
            
			rs.close();
			preparador.close();
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }

        return funcionario;
    }
}