<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro</title>
    <script>

        $(document).ready(function() {
            var next = Number($("#count").val());
            $(".add-more").click(function(e) {
                e.preventDefault();
                var addto = "#semestre" + next;
                next = next + 1;

                var newIn = '<p>Projeto ' + next + '</p><input autocomplete="off" class="col-xs-12" id="disciplina ' + next + '" name="disciplina' + next + '" type="text" placeholder="Disciplina" data-items="8" required/>';
                var newInput = $(newIn);

                var newIn1 = '<input class="col-xs-12" id="descricao' + next + '" name="descricao' + next + '" type="text" placeholder="Descricao" data-items="8" required/>';
                var newInput1 = $(newIn1);

                var newIn2 = '<input class="col-xs-12"id="nota' + next + '" name="nota' + next + '" type="text" placeholder="Nota" data-items="8" required/>';
                var newInput2 = $(newIn2);

                var newIn3 = '<input class="col-xs-12" id="semestre' + next + '" name="semestre' + next + '" type="text" placeholder="Semestre" data-items="8" required/>';
                var newInput3 = $(newIn3);

                $(addto).after(newInput3);
                $(addto).after(newInput2);
                $(addto).after(newInput1);
                $(addto).after(newInput);
                $("#disciplina" + next).attr('data-source', $(addto).attr('data-source'));
                $("#descricao" + next).attr('data-source', $(addto).attr('data-source'));
                $("#nota" + next).attr('data-source', $(addto).attr('data-source'));
                $("#semestre" + next).attr('data-source', $(addto).attr('data-source'));
                $("#count").val(next);
            });
            document.getElementById('#count').innerHTML = next;
        });
    </script>
</head>

<%
    String mat = request.getParameter("mat");
    if (mat != null) {
        RiakPersistence riak = new RiakPersistence();
        Pessoa p = riak.findByKey(mat);
        pageContext.setAttribute("pessoa", p);
        pageContext.setAttribute("count", p.getProjetos().size());
        pageContext.setAttribute("projetos", p.getProjetos());
        pageContext.setAttribute("mat", request.getParameter("mat"));
    } else {
        pageContext.setAttribute("form", true);
        pageContext.setAttribute("count", 1);
    }
%>

<body>
    <div class="container">
        <h1>Aluno</h1>
        <div class="col-xs-12">
            <form class="col-md-4 col-md-offset-2" action="cadastro.jsp">
                <label for="cod">Informe a matricula do aluno:</label>
                <div class="form-group">
                    <input type="text" name="mat" id="mat" class="form-control" placeholder="Matricula do aluno" required value="${cod}">
                </div>
                <button type="submit" class="btn btn-success pull-right">Consultar</button>
            </form>
        </div>   

        <c:choose>
            <c:when test="${pessoa != null or form}">        
                <div class="col-xs-12">
                    <form class="col-md-4 col-md-offset-2" method="POST" action="ControlarPessoa">
                        <div class="form-group">
                            <input name="matricula" class="col-xs-12" placeholder="Matricula" value="${pessoa.matricula}">
                        </div>
                        <div class="form-group">
                            <input name="nome" class="col-xs-12" placeholder="Nome" value="${pessoa.nome}">
                        </div>
                        <div class="form-group">
                            <input name="curso" class="col-xs-12" placeholder="Curso" value="${pessoa.curso}">
                        </div>
                        <input type="hidden" name="count" value="${count}" id="count"/>
                        <c:choose>
                            <c:when test="${pessoa == null}">
                                <div id="div">
                                    <p>Projeto 1</p>
                                    <input autocomplete="off" class="col-xs-12" id="disciplina1" name="disciplina1" type="text" placeholder="Disciplina" data-items="8" required/>
                                    <input autocomplete="off" class="col-xs-12" id="descricao1" name="descricao1" type="text" placeholder="Descricao" data-items="8" required/>
                                    <input autocomplete="off" class="col-xs-12" id="nota1" name="nota1" type="text" placeholder="Nota" data-items="8" required/>
                                    <input autocomplete="off" class="col-xs-12" id="semestre1" name="semestre1" type="text" placeholder="Semestre" data-items="8" required/>
                                    <button id="b1" class="btn add-more btn-success pull-left" type="button">+</button>
                                </div>
                                <button type="submit" class="btn btn-info pull-right">Cadastrar</button>
                            </c:when>
                            <c:otherwise>
                                <div class="controls form-group">
                                    <div id="div">
                                        <c:forEach items="${projetos}" var="projeto" varStatus="i">
                                            <p>Projeto ${i.getCount()}</p>
                                            <input class="col-xs-12" id="disciplina${i.getCount()}" name="disciplina${i.getCount()}" type="text" placeholder="Disciplina" data-items="8" required value="${projeto.disciplina}">
                                            <input class="col-xs-12" id="descricao${i.getCount()}" name="descricao${i.getCount()}" type="text" placeholder="Descricao" data-items="8" required value="${projeto.descricao}">
                                            <input class="col-xs-12" id="nota${i.getCount()}" name="nota${i.getCount()}" type="text" placeholder="Nota" data-items="8" required value="${projeto.nota}">
                                            <input class="col-xs-12" id="semestre${i.getCount()}" name="semestre${i.getCount()}" type="text" placeholder="Semestre" data-items="8" required value="${projeto.semestre}">
                                        </c:forEach>
                                        <button id="b1" class="btn add-more btn-success pull-left" type="button">+ Projeto</button>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-warning pull-right">Editar</button>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </c:when>
                <c:otherwise><p>Nada encontrado</p></c:otherwise>                
            </c:choose>
        </div>    
    </div>
</body>
</html>
