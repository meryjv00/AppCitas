<%-- 
    Document   : elegirAdmin
    Created on : 15-oct-2020, 15:39:18
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elegir admin</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <link rel="icon" type="image/png" href="../img/logo4.png">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="../img/logo4.png" class="imagenLogo"/>
            </div>
        </header>

        <main class="row">
            <div class="col-m-3 col-l-4"></div>
            <form name="login" action="../controlador.jsp" class="col-m-6 col-l-4">
                <%
                    Usuario u = (Usuario) session.getAttribute("usuario");
                    String apodo = u.getApodo();
                %>
                <h1>Bienvenido/a <%=apodo%></h1>
                <p>¿Cómo quieres entrar?</p>
                <p><input type="submit" name="entrarAdmin" value="Entrar como administrador" class="boton"></p>
                <p><input type="submit" name="entrarUsu" value="Entrar como usuario" class="boton"></p>
                <hr>
                <p><input type="submit" name="cerrarSesion" value="Cerrar sesión" class="boton"></p>
            </form>
            <div class="col-m-3 col-l-4"></div>
        </main>

        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>

    </body>
</html>
