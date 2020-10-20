<%-- 
    Document   : detalleAmigo
    Created on : 19-oct-2020, 17:24:07
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle amigo</title>
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
            <div class="col-m-2 col-l-3"></div>
            <div class="col-m-8 col-l-6">
                <form name="login" class="row" id="menu" action="../controlador.jsp">
                    <div class="col-m-1"></div>
                    <div class="col-m-2">
                        <input type="submit" name="cargarPersonasCompatibles" value="Ver personas afines" class="boton"/> 
                    </div>
                    <div class="col-m-2">
                        <input type="submit" name="verAmigos" value="Ver amigos" class="boton"/> 
                    </div>
                    <div class="col-m-2">
                        <input type="submit" name="verMensajes" value="Ver mensajes" class="boton"/> 
                    </div>
                    <div class="col-m-2">
                        <input type="submit" name="verPerfil" value="Ver perfil" class="boton"/> 
                    </div>
                    <div class="col-m-2">
                        <input type="submit" name="cerrarSesion" value="Cerrar Sesión" class="boton"/>
                    </div>
                    <div class="col-m-1"></div>
                </form>
            </div>
            <div class="col-m-2 col-l-3"></div>
        </div>
        <main class="row">
            <div class="col-m-2 col-l-2"></div>
            <form name="login" action="../controlador.jsp" class="col-m-8 col-l-8"> 
            </form>
            <div class="col-m-2 col-l-2"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
