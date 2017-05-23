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

        /*if (action.equalsIgnoreCase("delete")){
            int alunoID = Integer.parseInt(request.getParameter("alunoID"));
            dao.deleteUser(alunoID);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
        }*/
        
        if(action.equalsIgnoreCase("select")){
        	forward = LIST_USER;
        	request.setAttribute("alunos", dao.select(
        			));
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Aluno aluno = new Aluno(null, null, null, null, null, null);
        aluno.setNome(request.getParameter("firstName"));
        aluno.setSobrenome(request.getParameter("lastName"));
        aluno.setEmail(request.getParameter("email"));
        aluno.setEndereco(request.getParameter("address"));
        dao.insert(aluno);
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("alunos", dao.select());
        view.forward(request, response);
    }
}