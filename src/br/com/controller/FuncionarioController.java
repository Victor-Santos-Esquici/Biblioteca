package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.FuncionarioDAO;
import br.com.model.Funcionario;

public class FuncionarioController extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarFuncionario.jsp";
	private static String LIST_FUNCIONARIO = "/listarFuncionarios.jsp";
    private FuncionarioDAO dao;

    public FuncionarioController() 
    {
        super();
        dao = new FuncionarioDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String forward = "";
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete"))
        {
            int codFunc = Integer.parseInt(request.getParameter("codFunc"));
            dao.delete(codFunc);
            forward = LIST_FUNCIONARIO;
            request.setAttribute("funcionarioList", dao.select());    
        } 
        else if (action.equalsIgnoreCase("edit"))
        {
        	int codFunc = Integer.parseInt(request.getParameter("codFunc"));
        	Funcionario funcionario = dao.selectID(codFunc);
        	forward = INSERT_OR_EDIT;
        	request.setAttribute("funcionario", funcionario);
        } 
        else if (action.equalsIgnoreCase("listarFuncionarios"))
        {
            forward = LIST_FUNCIONARIO;
            request.setAttribute("funcionarioList", dao.select());
        } 
        else 
        {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        Funcionario funcionario = new Funcionario();
        funcionario.setNome(request.getParameter("firstName"));
        funcionario.setSobrenome(request.getParameter("lastName"));
        funcionario.setEmail(request.getParameter("email"));
        funcionario.setEndereco(request.getParameter("address"));
        funcionario.setTelefone(request.getParameter("phone"));
        funcionario.setSalario(request.getParameter("salary"));
        funcionario.setCodBib(Integer.parseInt(request.getParameter("library")));
        
        String codFunc = request.getParameter("codFunc");
        
        if (codFunc == null || codFunc.isEmpty())
        {
            dao.insert(funcionario);
        }
        else
        {
            funcionario.setCodFunc(Integer.parseInt(codFunc));
            dao.update(funcionario);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_FUNCIONARIO);
        request.setAttribute("funcionarioList", dao.select());
        view.forward(request, response);
    }
}