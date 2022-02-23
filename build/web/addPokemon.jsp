<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>AddPokemon</title>
    </head>

    <style>
        body {
            background-image: url("img/pokemonfondo.jpg");
            color: white;
        }
    </style>

    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pokemon", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");

            // Comprueba la existencia del número de alumno introducido
            String consultaNumPokemon = "SELECT * FROM pokemon WHERE IdPok="
                    + Integer.valueOf(request.getParameter("IdPok"));

            ResultSet numeroDePokemon = s.executeQuery(consultaNumPokemon);
            numeroDePokemon.last();

            if (numeroDePokemon.getRow() != 0) {
                out.println("Lo siento, no se ha podido dar de alta, ya existe pokemon con este código:  "
                        + request.getParameter("IdPok") + ".");
            } else {
                String insercion = "INSERT INTO pokemon (IdPok, nomPok, GenPok, tipoPok, SexoPok ) VALUES ("
                        + Integer.parseInt(request.getParameter("IdPok"))
                        + ", '" + request.getParameter("nomPok")
                        + "', " + Integer.parseInt(request.getParameter("GenPok"))
                        + ", '" + request.getParameter("tipoPok")
                        + "', '" + request.getParameter("SexPok")
                        + "')";

                s.execute(insercion);
                out.println("Pokemon añadido correctamente.");
            }
            conexion.close();
        %>
        <br>
        <a href="pagPrincipal.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</a>

    </body>
</html>
