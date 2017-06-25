package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.AlunoDAO;
import br.com.model.Aluno;

public class AlunoController extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarAluno.jsp";
	private static String LIST_ALUNO = "/listarAlunos.jsp";
    private AlunoDAO dao;

    public AlunoController() 
    {
        super();
        dao = new AlunoDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete"))
        {
            int codMatricula = Integer.parseInt(request.getParameter("codMatricula"));
            dao.delete(codMatricula);
            forward = LIST_ALUNO;
            request.setAttribute("alunoList", dao.select(true));    
        } 
        else if (action.equalsIgnoreCase("edit"))
        {
            int codMatricula = Integer.parseInt(request.getParameter("codMatricula"));
            Aluno aluno = dao.selectID(codMatricula);
            forward = INSERT_OR_EDIT;
            request.setAttribute("aluno", aluno);
        }
        else if (action.equalsIgnoreCase("listarAlunos"))
        {
            forward = LIST_ALUNO;
            request.setAttribute("alunoList", dao.select(true));
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
        Aluno aluno = new Aluno();
        aluno.setNome(request.getParameter("firstName"));
        aluno.setSobrenome(request.getParameter("lastName"));
        aluno.setEmail(request.getParameter("email"));
        aluno.setEndereco(request.getParameter("address"));
        aluno.setSituacao(true);

        String alunoID = request.getParameter("codMatricula");
        
        if (alunoID == null || alunoID.isEmpty())
        {
            dao.insert(aluno);
        }
        else
        {
            aluno.setCodMatricula(Integer.parseInt(alunoID));
            dao.update(aluno);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_ALUNO);
        request.setAttribute("alunoList", dao.select(true));
        view.forward(request, response);
    }
}