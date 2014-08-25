<%@page import="beans.Projeto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="dataTables/jquery.dataTables.css">
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="dataTables/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function() {
            $('#projetos').dataTable({
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros por pagina",
                    "zeroRecords": "Nada encontrado",
                    "info": "Mostrando página _PAGE_ de _PAGES_",
                    "infoEmpty": "Sem registros disponíveis",
                    "infoFiltered": "(filtrado de _MAX_ total records)",
                    "search": "Pesquisar:"
                }

            });
        });

        jQuery(document).ready(function($) {
            $('#tabs').tab();
        });
    </script>
</head>


<%
    String mat = request.getParameter("mat");
    if (mat != null) {
        RiakPersistence riakPersistence = new RiakPersistence();
        List<Projeto> projetos = riakPersistence.getProjectsByPessoaId(mat);
        String nome = riakPersistence.findByKey(mat).getNome();
        pageContext.setAttribute("projetos", projetos);
        pageContext.setAttribute("mat", mat);
        pageContext.setAttribute("nome", nome);
    }
%>
    <div class="container">
        <h3>${nome}</h3>
        <div class="table-responsive">
            <table id="projetos" class="display table table-striped">
                <thead>
                    <tr>
                        <th>Disciplina</th>
                        <th>Descrição</th>
                        <th>Semestre</th>
                        <th>Nota</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${projetos}" var="projeto" varStatus="i"> 
                        <tr>
                            <td>${projeto.disciplina}</td>    
                            <td>${projeto.descricao}</td>
                            <td>${projeto.semestre}</td>
                            <td>${projeto.nota}</td>
                            <td>
                                <form id="excluir" method="POST" action="ExcluirProjeto">
                                    <input type="hidden" name="projeto" value="${i.getCount()}">
                                    <button type="submit" name="mat" value="${mat}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
