<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pokemon", "root", "");
    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery("SELECT * FROM usuario");

    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasenna");

    boolean correcto = false;
    
    while (listado.next()) {
        if (request.getParameter("usuario").toString().equals(listado.getString("nombreUs")) ) {
            correcto = true;
        }
    }
    
    if (correcto){
        session.setAttribute("usuario", usuario);
        response.sendRedirect("pagPrincipal.jsp");
    } else  {
        session.setAttribute("error", "Usuario o contraseña incorrecto");
        response.sendRedirect("index.jsp");
    }
%>

