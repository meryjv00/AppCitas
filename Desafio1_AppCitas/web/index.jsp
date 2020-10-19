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
        <title>Login</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <link rel="icon" type="image/png" href="img/logo4.png">
        <script src="js/validacion.js"></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>

    </head>
    <body onload="validacionLogin()">
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="img/logo4.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row">
            <div class="col-m-3 col-l-4"></div>
            <form name="login" id="login" action="controlador.jsp" class="col-m-6 col-l-4" novalidate> 
                <h1>LOGIN</h1>
                <hr>
                <p>
                    <label for="email">
                        <input type="email" name="email" id="email" placeholder="Introduce tu email" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="psswd">
                        <input type="password" name="psswd" id="psswd" placeholder="Introduce tu contraseña"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p><input type="submit" name="Aceptar" value="Entrar" class="boton"></p>
                    <%
                        session.removeAttribute("captchaActivo");
                        int az = (int) (Math.random() * 3);
                        
                        if (az == 0) {
                            session.setAttribute("captchaActivo", "Si");
                    %>
                <div class="row">
                    <div class="col-m-3"></div>
                    <div class="col-m-6 g-recaptcha" data-sitekey="6LelKtkZAAAAABYQiYE7QtJFtdqwF0aRzurS7xba"></div>
                </div>
                <%
                    }
                    if (session.getAttribute("mensaje") != null) {
                        String mensaje = (String) session.getAttribute("mensaje");
                %>
                <span name="mensaje" id="mensaje"><%=mensaje%></span>
                <%
                    }
                %>

                <a href="Vistas/registro.jsp"><input type="button" name="Registrar" value="Registrate" class="boton"/></a>
                <hr>
                <a href="Vistas/olvidada.jsp">He olvidado la contraseña</a>
            </form>
            <div class="col-m-3 col-l-4"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
