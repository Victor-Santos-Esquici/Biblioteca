package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.LivroDAO;
import br.com.model.Livro;

public class LivroController extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarLivro.jsp";
	private static String LIST_LIVRO = "/listarLivros.jsp";
    private LivroDAO dao;

    public LivroController() 
    {
        super();
        dao = new LivroDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String forward = "";
        String action = request.getParameter("action");
        
        String titulo = request.getParameter("title");
        String editora = request.getParameter("publisher");
        Double valor = null;
        Integer codCategoria = null;
        Integer codBib = null;
        
        try
        {
            valor = Double.parseDouble(request.getParameter("price"));
            codCategoria = Integer.parseInt(request.getParameter("category"));
            codBib = Integer.parseInt(request.getParameter("library"));
        }
        catch(Exception ex){}

        if (action.equalsIgnoreCase("delete"))
        {
            int codLivro = Integer.parseInt(request.getParameter("codLivro"));
            Livro livro = new Livro(codLivro, titulo, editora, valor, codCategoria, codBib, false);
            dao.update(livro);
            forward = LIST_LIVRO;
            request.setAttribute("livroList", dao.select(true));    
        } 
        else if (action.equalsIgnoreCase("edit"))
        {
            int codLivro = Integer.parseInt(request.getParameter("codLivro"));
            Livro livro = dao.selectID(codLivro);
            forward = INSERT_OR_EDIT;
            request.setAttribute("livro", livro);
        } 
        else if (action.equalsIgnoreCase("listarLivros"))
        {
            forward = LIST_LIVRO;
            request.setAttribute("livroList", dao.select(true));
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
        Livro livro = new Livro();
        livro.setTitulo(request.getParameter("title"));
        livro.setEditora(request.getParameter("publisher"));
        livro.setValor(Double.parseDouble(request.getParameter("price")));
        livro.setCodCategoria(Integer.parseInt(request.getParameter("category")));
        livro.setCodBib(Integer.parseInt(request.getParameter("library")));
        
        String livroID = request.getParameter("livroID");
        
        if (livroID == null || livroID.isEmpty())
        {
            dao.insert(livro);
        }
        else
        {
            livro.setCodLivro(Integer.parseInt(livroID));
            dao.update(livro);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_LIVRO);
        request.setAttribute("livroList", dao.select(true));
        view.forward(request, response);
    }
}