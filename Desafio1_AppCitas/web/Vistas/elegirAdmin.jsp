<%-- 
    Document   : elegirAdmin
    Created on : 15-oct-2020, 15:39:18
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../estilos.css">
        <script src="https://kit.fontawesome.com/f1c00fba54.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="row">
            <div class="col-m-4">
                <a href="index.jsp">
                    <span>
                        <i class="fas fa-dove"></i>
                    </span>
                </a>
            </div>
            <div class="col-m-4">
                <h1>¡ENCUENTRA TU PAREJA IDEAL!</h1>
            </div>
            <div class="col-m-4">
                <p><a href="../index.jsp">Cerrar sesión</a></p>
            </div>
        </header>

        <main class="row">
            <div class="col-m-4"></div>
            <form name="login" action="../controlador.jsp" class="col-m-4"> 
                <p><input type="submit" name="entrarAdmin" value="Entrar como administrador"></p>
                <p><input type="submit" name="entrarUsu" value="Entrar como usuario"></p>
            </form>
            <div class="col-m-4"></div>
        </main>

        <footer>
            <p>María Juan Viñas</p>
        </footer>

    </body>
</html>
