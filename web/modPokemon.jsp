<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Modificar Pokemon</title>
    </head>

    <style>
        body {
            background-image: url("img/pokemonfondo.jpg");
            background-size: cover;
        }

        @font-face {
            font-family: texto;
            src: url("../fonts/Rubik-Regular.ttf");
        }
        
        .texto{font-family: texto;}

    </style>
    <body>
        <% request.setCharacterEncoding("UTF-8");%>
        <div class="container">
            <br><br>
            <div class="panel panel-color">
                <div class="panel-heading text-center " style="background-color: gold; "><h3 >Modificación de pokemon</h3></div>
                <form method="get" action="addPokemonMod.jsp">
                    <div class="form-group"> 
                        <label>&nbsp;&nbsp;Nº de la pokedex:&nbsp;</label><input type="text" size="11" name="IdPok" value="<%= request.getParameter("IdPok")%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nombre del pokemon:&nbsp;</label><input type="text" size="100" name="nombre" value="<%= request.getParameter("nomPok")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nº Generación:&nbsp;</label><input type="text" size="" name="generacion" value="<%= request.getParameter("GenPok")%>">
                        <label>&nbsp;&nbsp;Tipo:&nbsp;</label><input type="text" size="25" name="tipo" value="<%= request.getParameter("tipoPok")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Sexo:&nbsp;</label><input type="text" name="sexo" size="20" value="<%= request.getParameter("SePok")%>">
                    </div>
                    <hr>
                    &nbsp;&nbsp;<a href="pagPrincipal.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
