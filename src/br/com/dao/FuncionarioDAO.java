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
		String sql = "insert into funcionarios (nome, endereco, telefone, salario, codBib) values (?, ?, ?, ?, ?)";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, funcionario.getNome());
			preparador.setString(2, funcionario.getEndereco());
			preparador.setString(3, funcionario.getTelefone());
			preparador.setDouble(4, funcionario.getSalario());
			preparador.setInt(5, funcionario.getCodBib());
			
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
		String sql = "update funcionarios set nome = ?, endereco = ?, telefone = ?, salario = ?, codBib = ? where codFunc = ?";
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, funcionario.getNome());
			preparador.setString(2, funcionario.getEndereco());
			preparador.setString(3, funcionario.getTelefone());
			preparador.setDouble(4, funcionario.getSalario());
			preparador.setInt(5, funcionario.getCodBib());
			
			preparador.executeQuery();
			preparador.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Funcionario> select()
	{	
		String sql = "select * from funcionarios";
		ArrayList<Funcionario> funcionarioList = new ArrayList<Funcionario>();
		
		try
		{
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet rs = preparador.executeQuery();
			
			while(rs.next())
			{
				Funcionario funcionario = new Funcionario();
                funcionario.setCodFunc(rs.getInt("codFunc"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setSobrenome(rs.getString("sobrenome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setSalario(rs.getDouble("salario"));
                funcionario.setCodBib(rs.getInt("codBib"));
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
                funcionario.setSalario(rs.getDouble("salario"));
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