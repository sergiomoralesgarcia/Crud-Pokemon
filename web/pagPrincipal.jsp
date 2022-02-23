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

        <title>Lista Pokemon</title>
        <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
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

        .texto{
            font-family: texto;
        }

    </style>


    <body>
        <div class="container">
            <br><br>			
            <div class="panel panel-color">
                <div class="panel-heading text-center" style="font-family: 'CenturyGothic'; background-color: gold; color: black "><h2 class="texto">Datos Pokedex</h2></div>

                <%
                    if (session.getAttribute("usuario") == null) {
                %>
                <a href="index.jsp">Entrar</a>
                <%
                } else {
                %>
                <div style="background-color: #0c0e0f; color: white; padding-left: 5px ">
                    Cerrar sesión como <%= session.getAttribute("usuario")%>
                    (<a style="text-decoration: none;" href="logout.jsp">logout</a>)
                </div>
                <%
                    }
                %>


                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pokemon", "root", "");
                    Statement s = conexion.createStatement();

                    ResultSet listado = s.executeQuery("SELECT * FROM pokemon");
                %>
                <div class="table-responsive">
                    <table class="table table-striped table-dark align-middle border border-radius" style="font-family: 'CenturyGothic'; background-color: dimgray ; ">
                        <tr><th>Nº Pokedex</th><th>Nombre</th><th>Generación</th><th>Tipo</th><th>Sexo</th><th></th><th></th></tr>
                        <form method="get" action="addPokemon.jsp">
                            <td><input type="text" name="IdPok" size="11"></td>
                            <td><input type="text" name="nomPok" size="25"></td>
                            <td><input type="text" name="GenPok" size="5"></td>
                            <td><input type="text" name="tipoPok" size="20"></td>
                            <td><input type="text" name="SexoPok" size="20"></td>
                            
                            <td><button type="submit" value="Añadir" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td>          
                        </form>
                        
                        <%
                            while (listado.next()) {
                                out.println("<tr><td>");
                                out.println(listado.getString("IdPok") + "</td>");
                                out.println("<td>" + listado.getString("nomPok") + "</td>");
                                out.println("<td>" + listado.getString("GenPok") + "</td>");
                                out.println("<td>" + listado.getString("tipoPok") + "</td>");
                                out.println("<td>" + listado.getString("SexoPok") + "</td>");

                        %>
                        <td>
                            <form method="get" action="modPokemon.jsp">
                                <input type="hidden" name="IdPok" value="<%=listado.getString("IdPok")%>">
                                <input type="hidden" name="nomPok" value="<%=listado.getString("nomPok")%>">
                                <input type="hidden" name="GenPok" value="<%=listado.getString("GenPok")%>">
                                <input type="hidden" name="tipoPok" value="<%=listado.getString("tipoPok")%>">
                                <input type="hidden" name="SexoPok" value="<%=listado.getString("SexoPok")%>">
                                <button type="submit"  class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                            </form>
                        </td>

                        <td>
                            <form method="get" action="deletePokemon.jsp">
                                <input type="hidden" name="IdPok" value="<%=listado.getString("IdPok")%>"/>
                                <button type="submit"  class="btn btn-danger"><span class="glyphicon glyphicon-remove "></span></button>

                            </form>
                        </td>

                        <%
                            } // while   

                            conexion.close();
                        %>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
