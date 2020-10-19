<%-- 
    Document   : cargandoPersonas
    Created on : 17-oct-2020, 21:25:39
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loading...</title>
        <link rel="icon" type="image/png" href="../img/logo4.png">
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <script src="../js/validacion.js"></script>
    </head>
    <body onload="avanzar()">
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <a href="inicio.jsp"><img src="../img/logo4.png" class="imagenLogo"/></a>
            </div>
        </header>
        <main class="row">
            <div class="col-m-3"></div>
            <form name="login" action="../controlador.jsp" class="col-m-6"> 
                <h1>Loading</h1>
                <div class="barraProgreso">
                    <div id="progreso"></div>
                </div>
                <p>Cargando personas compatibles...</p>
                <input type="submit" name="cargarPersonasCompatibles" id="ir" value="Ir" class="boton escondido"> 
            </form>
            <div class="col-m-3"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>


</html>
