<%-- 
    Document   : enviarMensaje
    Created on : 19-oct-2020, 17:24:00
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enviar mensaje</title>
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
            <form name="login" action="../controlador.jsp" id="menu" class="col-m-8 col-l-6">
                <div class="row">
                    <div class="col-m-2"></div>
                    <div class="col-m-4">
                        <input type="submit" name="verAmigos" value="Ir amigos" class="boton"/>  
                    </div>
                    <div class="col-m-4">
                        <input type="submit" name="verMensajes" value="Ir a mensajes" class="boton"/> 
                    </div>
                    <div class="col-m-2"></div>
                </div>
            </form>
            <div class="col-m-2 col-l-3"></div>
        </div>
        <main class="row">
            <div class="col-m-2 col-l-2"></div>
            <form name="login" action="../controlador.jsp" class="col-m-8 col-l-8">
                <h1>Envía un mensaje </h1>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para enviar mensaje-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <%
                            Usuario yo = (Usuario) session.getAttribute("usuario");
                            String emailUsuario = "";
                            //Es amigo
                            if (session.getAttribute("amigoSeleccionado") != null) {
                                Usuario u = (Usuario) session.getAttribute("amigoSeleccionado");
                                emailUsuario = u.getEmail();
                                session.removeAttribute("amigoSeleccionado");
                            }
                            //Es usuario afin
                            if (session.getAttribute("afinSeleccionado") != null) {
                                Usuario u = (Usuario) session.getAttribute("afinSeleccionado");
                                emailUsuario = u.getEmail();
                                session.removeAttribute("afinSeleccionado");
                            }
                        %>
                        <div class="row">
                            <div class="col-m-3">De:</div>
                            <div class="col-m-8">
                                <input type="text" name="de" value="<%=yo.getEmail()%>" readonly/>
                            </div>
                            <div class="col-m-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-3">Para:</div>
                            <div class="col-m-8">
                                <input type="text" name="para" value="<%=emailUsuario%>" readonly/>
                            </div>
                            <div class="col-m-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-m-3">Asunto:</div>
                            <div class="col-m-8">
                                <input type="text" name="asunto" value="" required/>
                            </div>
                            <div class="col-m-1"></div>
                        </div>
                        <div class="row">
                            <fieldset class="col-m-11">
                                <legend>Mensaje</legend>
                                <textarea rows="4" name="cuerpo" required></textarea>
                            </fieldset>
                        </div>
                        
                        <div class="row">
                            <div class="col-m-11">
                                <hr>
                                <input type="submit" name="EnviarMsj" value="Enviar" class="boton"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-m-2 col-l-3"></div>
                </div>
            </form>
            <div class="col-m-2 col-l-2"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
