<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="dao.RiakPersistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta charset="UTF-8">
        <link href= "../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href= "bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="css/global.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <a href="index.jsp" class="navbar-brand">Projetos IFPB-CZ</a>
                <button class="navbar-toggle" data-toggle = "collapse" data-target = ".custonNavHeaderCollapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse custonNavHeaderCollapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Alunos</a></li>
                        <li><a href="cadastro.jsp">Cadastro</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </body>
</html>
