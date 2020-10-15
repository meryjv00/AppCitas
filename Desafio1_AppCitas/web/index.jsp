<%-- 
    Document   : index
    Created on : 14-oct-2020, 15:48:46
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilos.css">
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
                <p><a href="Vistas/registro.jsp">Registrate aquí</a></p>
            </div>
        </header>
        <main class="row">
            <div class="col-m-4"></div>
            <form name="login" action="controlador.jsp" class="col-m-4"> 
                <h1>Login</h1>
                <p>
                    <label for="email">
                        <span>Introduce tu email: </span>
                        <input type="email" name="email" id="email"/>
                    </label>
                </p>
                <p>
                    <label for="psswd">
                        <span>Introduce tu contraseña: </span>
                        <input type="password" name="psswd" id="psswd"/>
                    </label>
                </p>
                <input type="submit" name="Aceptar" value="Aceptar"/>
                <p><a href="Vistas/olvidada.jsp">He olvidado la contraseña</a></p>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer>
            <p>María Juan Viñas</p>
        </footer>
    </body>
</html>
