package br.com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.dao.BibliotecaDAO;
import br.com.model.Biblioteca;

public class BibliotecaController extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/cadastrarBiblioteca.jsp";
    private static String LIST_BIBLIOTECA = "/listarBibliotecas.jsp";
    private BibliotecaDAO dao;

    public BibliotecaController() 
    {
        super();
        dao = new BibliotecaDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete"))
        {
            int codBib = Integer.parseInt(request.getParameter("codBib"));
            dao.delete(codBib);
            forward = LIST_BIBLIOTECA;
            request.setAttribute("bibliotecaList", dao.select());    
        } 
        else if (action.equalsIgnoreCase("edit"))
        {
            int codBib = Integer.parseInt(request.getParameter("codBib"));
            Biblioteca biblioteca = dao.selectID(codBib);
            forward = INSERT_OR_EDIT;
            request.setAttribute("biblioteca", biblioteca);
        } 
        else if (action.equalsIgnoreCase("listarBibliotecas"))
        {
            forward = LIST_BIBLIOTECA;
            request.setAttribute("bibliotecaList", dao.select());
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
        Biblioteca biblioteca = new Biblioteca();
        biblioteca.setNome(request.getParameter("name"));
        biblioteca.setEndereco(request.getParameter("address"));

        String bibliotecaID = request.getParameter("codBib");
        
        if (bibliotecaID == null || bibliotecaID.isEmpty())
        {
            dao.insert(biblioteca);
        }
        else
        {
            biblioteca.setCodBib(Integer.parseInt(bibliotecaID));
            dao.update(biblioteca);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(LIST_BIBLIOTECA);
        request.setAttribute("bibliotecaList", dao.select());
        view.forward(request, response);
    }
}