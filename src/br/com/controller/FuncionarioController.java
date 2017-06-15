package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.FuncionarioDAO;
import br.com.model.Funcionario;

public class FuncionarioController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarFuncionario.jsp";
	private static String LIST_ALUNO = "/listarFuncionarios.jsp";
    private FuncionarioDAO dao;

    public FuncionarioController() {
        super();
        dao = new FuncionarioDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        
        String nome = request.getParameter("firstName");
        String sobrenome = request.getParameter("lastName");
        String email = request.getParameter("email");
        String endereco = request.getParameter("address");
        String telefone = request.getParameter("phone");
        Double salario = Double.parseDouble(request.getParameter("salary")); //parse tem que verificar nullo
        
        if (action.equalsIgnoreCase("delete")){
            int codFunc = Integer.parseInt(request.getParameter("codFunc"));
            int codBib = Integer.parseInt(request.getParameter("codBib"));
            Funcionario funcionario = new Funcionario(codFunc, nome, sobrenome, email, endereco, telefone, salario, codBib);
            dao.update(funcionario);
            forward = LIST_ALUNO;
            request.setAttribute("funcionarios", dao.select());    
        } 
        else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int codMatricula = Integer.parseInt(request.getParameter("codMatricula"));
            Funcionario funcionario = dao.selectID(codMatricula);
            request.setAttribute("funcionario", funcionario);
        } 
        else if (action.equalsIgnoreCase("listarFuncionarios")){
            forward = LIST_ALUNO;
            request.setAttribute("funcionarioList", dao.select());
        } 
        else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Funcionario funcionario = new Funcionario();
        funcionario.setNome(request.getParameter("firstName"));
        funcionario.setSobrenome(request.getParameter("lastName"));
        funcionario.setEmail(request.getParameter("email"));
        funcionario.setEndereco(request.getParameter("address"));

        String funcionarioID = request.getParameter("funcionarioID");
        
        if(funcionarioID == null || funcionarioID.isEmpty())
        {
            dao.insert(funcionario);
        }
        else
        {
            funcionario.setCodFunc(Integer.parseInt(funcionarioID));
            dao.update(funcionario);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_ALUNO);
        request.setAttribute("funcionarios", dao.select());
        view.forward(request, response);
    }
}