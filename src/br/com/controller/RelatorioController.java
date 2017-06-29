package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.AlunoDAO;

public class RelatorioController extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	private static String LIST_ALUNO = "/admin.jsp";
    private AlunoDAO dao;

    public RelatorioController() 
    {
        super();
        dao = new AlunoDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("alunosInativos"))
        {
            forward = LIST_ALUNO;
            request.setAttribute("alunoList", dao.select(true));    
        } 
        else if (action.equalsIgnoreCase("alunosAtivos"))
        {
            forward = LIST_ALUNO;
            request.setAttribute("alunoList", dao.select(false));
        }
        else 
        {
            forward = LIST_ALUNO;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    }
}