<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro</title>
    <script>

        $(document).ready(function() {
            var next = 1;
            $(".add-more").click(function(e) {
                e.preventDefault();
                var addto = "#curso" + next;
                next = next + 1;

                var newIn = '<p>Projeto '+next+'</p><input autocomplete="off" class="col-xs-12" id="disciplina ' + next + '" name="disciplina' + next + '" type="text" placeholder="Disciplina" data-items="8" required/>';
                var newInput = $(newIn);

                var newIn1 = '<input autocomplete="off" class="col-xs-12" id="descricao' + next + '" name="descricao' + next + '" type="text" placeholder="Descricao" data-items="8" required/>';
                var newInput1 = $(newIn1);

                var newIn2 = '<input autocomplete="off" class="col-xs-12"id="nota' + next + '" name="nota1' + next + '" type="text" placeholder="Nota" data-items="8" required/>';
                var newInput2 = $(newIn2);

                var newIn3 = '<input autocomplete="off" class="col-xs-12" id="semestre' + next + '" name="semestre' + next + '" type="text" placeholder="Semestre" data-items="8" required/>';
                var newInput3 = $(newIn3);

                var newIn4 = '<input autocomplete = "off" class="col-xs-12" id = "curso' + next + '" name = "curso' + next + '" type = "text" placeholder = "Curso" data - items = "8" required/>';
                var newInput4 = $(newIn4);

                $(addto).after(newInput4);
                $(addto).after(newInput3);
                $(addto).after(newInput2);
                $(addto).after(newInput1);
                $(addto).after(newInput);
                $("#disciplina" + next).attr('data-source', $(addto).attr('data-source'));
                $("#descricao" + next).attr('data-source', $(addto).attr('data-source'));
                $("#nota" + next).attr('data-source', $(addto).attr('data-source'));
                $("#semestre" + next).attr('data-source', $(addto).attr('data-source'));
                $("#curso" + next).attr('data-source', $(addto).attr('data-source'));
                $("#count").val(next);
            });
            document.getElementById('#count').innerHTML = next;
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Cadastrar Aluno</h1>
        <form class="col-md-4 col-md-offset-2" method="POST" action="ControlarPessoa">
            <div class="form-group">
                <input name="matricula" class="col-xs-12" placeholder="Matricula">
            </div>
            <div class="form-group">
                <input name="nome" class="col-xs-12" placeholder="Nome">
            </div>

            <div class="controls form-group">
                <input type="hidden" name="count" value="1" id="count"/>
                <div id="div">
                    <p>Projeto 1</p>
                    <input autocomplete="off" class="col-xs-12" id="disciplina1" name="disciplina1" type="text" placeholder="Disciplina" data-items="8" required/>
                    <input autocomplete="off" class="col-xs-12" id="descricao1" name="descricao1" type="text" placeholder="Descricao" data-items="8" required/>
                    <input autocomplete="off" class="col-xs-12" id="nota1" name="nota1" type="text" placeholder="Nota" data-items="8" required/>
                    <input autocomplete="off" class="col-xs-12" id="semestre1" name="semestre1" type="text" placeholder="Semestre" data-items="8" required/>
                    <input autocomplete="off" class="col-xs-12" id="curso1" name="curso1" type="text" placeholder="Curso" data-items="8" required/>
                    <button id="b1" class="btn add-more btn-success" type="button">+</button>
                </div>
            </div>

            <button type="submit" class="btn btn-info pull-right">Cadastro</button>
        </form>
    </div>
</body>
</html>
