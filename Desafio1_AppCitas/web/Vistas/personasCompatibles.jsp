<%-- 
    Document   : personasCompatibles
    Created on : 17-oct-2020, 22:13:25
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios afines</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <link rel="icon" type="image/png" href="../img/logo4.png">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <a href="inicio.jsp"><img src="../img/logo4.png" class="imagenLogo"/></a>
            </div>
        </header>
        <div class="row">
            <div class="col-m-3"></div>
            <div class="col-m-6">
                <div class="row" id="menu">
                    <div class="col-m-3">
                        <a href="">Ver amigos</a>
                    </div>
                    <div class="col-m-3">
                        <a href="">Ver mensajes</a>
                    </div>
                    <div class="col-m-3">
                        <a href="">Ver perfil</a>
                    </div>
                    <div class="col-m-3">
                        <a href="inicio.jsp">Página inicio</a>
                    </div>
                </div>
            </div>
            <div class="col-m-3"></div>
        </div>
        <main class="row">
            <div class="col-m-2"></div>
            <div class="col-m-8">
                <form class="" action="../controlador.jsp">
                    <%
                        LinkedList usuariosAfines = (LinkedList) session.getAttribute("usuariosAfines");
                        if (usuariosAfines.size() >= 0) {
                            for (int i = 0; i < usuariosAfines.size(); i++) {
                                Usuario u = (Usuario) usuariosAfines.get(i);
                                
                            }
                        } else {
                            %>
                            <h1>Lo siento,no hemos encontrado personas afines a ti</h1>
                            <%
                        }
                    %>
                </form>
            </div>
            <div class="col-m-2"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
