package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.LivroDAO;
import br.com.model.Livro;

public class LivroController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarLivro.jsp";
	private static String LIST_LIVRO = "/listarLivros.jsp";
    private LivroDAO dao;

    public LivroController() {
        super();
        dao = new LivroDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        String titulo = request.getParameter("title");
        String editora = request.getParameter("publisher");
        Double valor = Double.parseDouble(request.getParameter("price"));
        Integer codCategoria = Integer.parseInt(request.getParameter("category"));
        Integer codBib = Integer.parseInt(request.getParameter("library"));

        if (action.equalsIgnoreCase("delete")){
            int codLivro = Integer.parseInt(request.getParameter("codLivro"));
            Livro livro = new Livro(codLivro, titulo, editora, valor, codCategoria, codBib, false);
            dao.update(livro);
            forward = LIST_LIVRO;
            request.setAttribute("alunos", dao.select());    
        } 
        else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int codLivro = Integer.parseInt(request.getParameter("codLivro"));
            Livro livro = dao.selectID(codLivro);
            request.setAttribute("livro", livro);
        } 
        else if (action.equalsIgnoreCase("listarAlunos")){
            forward = LIST_LIVRO;
            request.setAttribute("alunoList", dao.select());
        } 
        else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Livro livro = new Livro();
        livro.setTitulo(request.getParameter("titulo"));
        livro.setEditora(request.getParameter("editora"));
        livro.setValor(Double.parseDouble(request.getParameter("valor")));
        livro.setCodCategoria(Integer.parseInt(request.getParameter("codCategoria")));

        String livroID = request.getParameter("alunoID");
        
        if(livroID == null || livroID.isEmpty())
        {
            dao.insert(livro);
        }
        else
        {
            livro.setCodLivro(Integer.parseInt(livroID));
            dao.update(livro);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_LIVRO);
        request.setAttribute("livros", dao.select());
        view.forward(request, response);
    }
}