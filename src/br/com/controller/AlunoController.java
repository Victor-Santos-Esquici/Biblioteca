package br.com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.AlunoDAO;
import br.com.model.Aluno;

public class AlunoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarAluno.jsp";
    private static String LIST_USER = "/listarAlunos.jsp";
    private AlunoDAO dao;

    public AlunoController() {
        super();
        dao = new AlunoDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        
        String nome = request.getParameter("firstName");
        String sobrenome = request.getParameter("lastName");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");

        if (action.equalsIgnoreCase("delete")){
            int codMatricula = Integer.parseInt(request.getParameter("codMatricula"));
            Aluno aluno = new Aluno(codMatricula, nome, sobrenome, email, endereco, false);
            dao.update(aluno);
            forward = LIST_USER;
            request.setAttribute("users", dao.select(true));    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int codMatricula = Integer.parseInt(request.getParameter("codMatricula"));
            Aluno aluno = dao.selectID(codMatricula);
            request.setAttribute("aluno", aluno);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            request.setAttribute("users", dao.select(true));
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Aluno aluno = new Aluno();
        aluno.setNome(request.getParameter("firstName"));
        aluno.setSobrenome(request.getParameter("lastName"));
        aluno.setEmail(request.getParameter("email"));
        aluno.setEndereco(request.getParameter("address"));

        String alunoID = request.getParameter("alunoID");
        
        if(alunoID == null || alunoID.isEmpty())
        {
            dao.insert(aluno);
        }
        else
        {
            aluno.setCodMatricula(Integer.parseInt(alunoID));
            dao.update(aluno);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.select(true));
        view.forward(request, response);
    }
}