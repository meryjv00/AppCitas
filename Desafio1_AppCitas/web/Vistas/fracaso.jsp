<%-- 
    Document   : fracaso
    Created on : 14-oct-2020, 15:49:42
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login incorrecto</title>
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
            <div class="col-m-3"></div>
            <form name="login" action="../controlador.jsp" class="col-m-6"> 
                <h1>Inicio de sesión incorrecto</h1>
                <input type="submit" name="Volver" value="Volver" class="boton"/>
            </form>
            <div class="col-m-3"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
