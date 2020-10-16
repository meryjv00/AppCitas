<%-- 
    Document   : olvidada
    Created on : 14-oct-2020, 15:49:47
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="../img/logo4.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row">
            <div class="col-m-4"></div>
            <form name="login" action="../controlador.jsp" class="col-m-4"> 
                <p>
                    <label for="email">
                        <span>Introduce tu email: </span>
                        <input type="email" name="emailpsswd" id="emailpsswd" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <input type="submit" name="EnviarEmail" value="Confirmar" class="boton"/> 
                <hr>
                <a href="../index.jsp"><input type="button" name="Volver" value="Volver" class="boton"/></a>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
