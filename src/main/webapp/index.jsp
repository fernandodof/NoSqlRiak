<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alunos</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="dataTables/jquery.dataTables.css">
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="dataTables/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function() {
            $('#pessoas').dataTable({
                "order": [[1, "asc"]],
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

<%
    RiakPersistence riak = new RiakPersistence();
    List<Pessoa> pessoas = riak.getAllPeople();
    pageContext.setAttribute("pessoas", pessoas);
%>
    <div class="container">
        <div class="table-responsive">
            <table id="pessoas" class="display table">
                <thead>
                    <tr>
                        <th>Matricula</th>
                        <th>Nome</th>
                        <th>Quantidade de Projetos</th>
                        <th>Editar/Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pessoas}" var="pessoa" > 
                        <tr>
                            <td>${pessoa.matricula}</td>    
                            <td><a href="projetos.jsp?mat=${pessoa.matricula}">${pessoa.nome}</a></td>
                            <td>${pessoa.getProjetos().size()}</td>
                            <td>
                                <a href="cadastro.jsp?mat=${pessoa.matricula}" class="btn pull-left"><span class="glyphicon glyphicon-edit"></span></a>
                                <form id="excluir" method="POST" action="ExcluirPessoa">
                                    <button type="submit" name="mat" value="${pessoa.matricula}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:set var="pessoas" scope="page" value="null"></c:set>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
