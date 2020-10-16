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
        <link rel="stylesheet" href="css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="img/logo.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row">
            <div class="col-m-4"></div>
            <form name="login" action="controlador.jsp" class="col-m-4"> 
                <h1>LOGIN</h1>
                <hr>
                <p>
                    <label for="email">
                        <input type="email" name="email" id="email" placeholder="Introduce tu email"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="psswd">
                        <input type="password" name="psswd" id="psswd" placeholder="Introduce tu contraseña"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p><input type="submit" name="Aceptar" value="Aceptar" class="boton"></p>

                <%
                    if (session.getAttribute("mensaje") != null) {
                        String mensaje = (String) session.getAttribute("mensaje");
                %>
                <span name="mensaje"><%=mensaje%></span>
                <%
                    }
                %>

                <a href="Vistas/registro.jsp"><input type="button" name="Registrar" value="Registrate" class="boton"/></a>
                <hr>
                <a href="Vistas/olvidada.jsp">He olvidado la contraseña</a>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
