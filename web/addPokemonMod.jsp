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

        <title>Modificar Pokemon</title>
    </head>

    <style>
        body {background-image: url("img/pokemonfondo.jpg");
              background-size: cover;}
        
    </style>

    <body style="font-family: 'CenturyGothic'; color: white;">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pokemon", "root", "");
            Statement s = conexion.createStatement();

            request.setCharacterEncoding("UTF-8");

            String actualizacion = "UPDATE pokemon SET "
                    + "nomPok=' " + request.getParameter("nombre")
                    + " ', tipoPok='" + request.getParameter("tipo")
                    + " ', SexoPok='" + request.getParameter("sexo")
                    + " ', GenPok=" + Integer.valueOf(request.getParameter("generacion"))
                    + " WHERE IdPok=" + Integer.valueOf(request.getParameter("IdPok"));
            s.execute(actualizacion);
            out.println("Información actualizada correctamente.");

            conexion.close();
        %>
        <br>
        <a href="pagPrincipal.jsp" class="btn btn-primary" style="font-family: 'CenturyGothic';"><span class="glyphicon glyphicon-home"></span> Página principal</a>
</body>
</html>