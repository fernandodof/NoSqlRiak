/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Pessoa;
import beans.Projeto;
import dao.RiakPersistence;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fernando
 */
@WebServlet(name = "ControlarPessoa", urlPatterns = {"/ControlarPessoa"})
public class ControlarPessoa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        RiakPersistence riakPersistence = new RiakPersistence();

        Pessoa pessoa = new Pessoa();
        pessoa.setMatricula(request.getParameter("matricula"));
        pessoa.setNome(request.getParameter("nome"));
        pessoa.setCurso(request.getParameter("curso"));

        List<String> disciplinas = new ArrayList<>();
        List<String> descricoes = new ArrayList<>();
        List<String> notas = new ArrayList<>();
        List<String> semestres = new ArrayList<>();

        int count = Integer.parseInt(request.getParameter("count"));
        for (int i = 1; i <= count; i++) {
            disciplinas.add(request.getParameter("disciplina" + i));
            descricoes.add((request.getParameter("descricao" + i)));
            notas.add(request.getParameter("nota" + i));
            semestres.add(request.getParameter("semestre" + i));
        }

        List<Projeto> projetos = new ArrayList<>();
        for (int i = 1; i <= count; i++) {
            Projeto projeto = new Projeto();
            projeto.setDisciplina(disciplinas.get(i - 1));
            projeto.setDescricao(descricoes.get(i - 1));
            projeto.setNota(notas.get(i - 1));
            projeto.setSemestre(semestres.get(i - 1));
            projetos.add(projeto);
        }
        
        pessoa.setProjetos(projetos);
        riakPersistence.save(pessoa);

        response.sendRedirect("index.jsp");
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
