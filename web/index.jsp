<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Pokemon</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
    </head>

    <style>
        
        html,
        body{
            height: 100%;
            background-image: url(img/pokemonfondo.jpg);
            background-size: cover;
            font-family: "Roboto", sans-serif;

        }
        
        
        .global-container{
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: gold;
        }

        form{
            padding-top: 10px;
            font-size: 14px;
            margin-top: 3px;
        }

        .login-form{
            width: 380px;
            height: 450px;
            margin: 20px;
            background: #1a2226bb !important;
            border-radius: 10px !important;
        }

        input[type="text"],
        input[type="password"]{
            background: #1a2226;
            border: 2px solid gold;
            border-radius: 10px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus{
            outline: none;
            border: none;
            background: #1a2226;
            margin: 0;
        }

        .card-title{
            font-weight: 900;
            padding-top: 20px;
        }

        .btn {
            background: gold !important;
            font-size: 14px;
            transform: translateY(10px);
            border-radius: 10px !important;
        }

        .singup{
            text-align: center;
            padding-top: 25px;
        }
        </style>

        <body class="bg-secondary">
            <%
                if (session.getAttribute("usuario") != null) {
                    response.sendRedirect("pagPrincipal.jsp");
                }
            %>
            <div class="global-container">
                <div class="card login-form">
                    <div class="card-body">
                        <h1 class="card-title text-center">LOGIN</h1>
                        <div class="card-text">
                            <form method="get"  action="login.jsp">
                                <div class="form-group">
                                    <label for="ejemploNombre1">Nombre</label>
                                    <input type="text" class="form-control form-control-sm" name="usuario" id="ejemploNombre1">
                                </div>

                                <div class="form-group">
                                    <label for="ejemploEmailContraseña">Contraseña</label>
                                    <input type="password" class="form-control form-control-sm" name="contrasenna" id="ejemploEmailContraseña" >
                                </div>
                                <button type="submit" class="btn btn-primary btn-info btn-block">Sign in</button>
                            </form>
                            <p class="p-5 text-danger">
                                <%=session.getAttribute("error") == null
                                        ? "" : session.getAttribute("error")%>
                                <% session.removeAttribute("error");%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
    </body>  
</html>