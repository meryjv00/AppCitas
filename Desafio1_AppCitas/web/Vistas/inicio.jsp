<%-- 
    Document   : inicio
    Created on : 15-oct-2020, 15:40:11
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="icon" type="image/png" href="../img/logo4.png">
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
    </head>
    <body name="ajustar">
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
                <h1>¡Hola de nuevo <%=apodo%>!</h1>
                <div class="row">
                    <div class="col-m-6">
                        <input type="submit" name="verPersonasCompatibles" value="Ver personas afines" class="boton"/> 
                    </div>
                    <div class="col-m-6">
                        <input type="submit" name="verAmigos" value="Ver amigos" class="boton"/> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-m-6">
                        <input type="submit" name="verMensajes" value="Ver mensajes" class="boton"/> 
                    </div>
                    <div class="col-m-6">
                        <input type="submit" name="verPerfil" value="Ver perfil" class="boton"/> 
                    </div>
                </div>
                <hr>
                <%
                    if (u.sizeRoles() == 2) {
                %>
                <p><input type="submit" name="volverAdmin" value="Volver" class="boton"/></p>
                <%
                    }
                %>
                <input type="submit" name="cerrarSesion" value="Cerrar Sesión" class="boton"/>
            </form>
            <div class="col-m-3 col-l-4"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
