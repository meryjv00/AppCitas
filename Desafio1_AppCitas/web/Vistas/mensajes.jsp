<%-- 
    Document   : mensajes
    Created on : 19-oct-2020, 17:12:25
    Author     : Mery
--%>

<%@page import="Modelo.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis mensajes</title>
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
                    <div class="col-m-3">
                        <input type="submit" name="cargarPersonasCompatibles" value="Ver personas afines" class="boton"/> 
                    </div>
                    <div class="col-m-3">
                        <input type="submit" name="verAmigos" value="Ver amigos" class="boton"/> 
                    </div>
                    <div class="col-m-3">
                        <input type="submit" name="verPerfil" value="Ver perfil" class="boton"/> 
                    </div>
                    <div class="col-m-3">
                        <input type="submit" name="cerrarSesion" value="Cerrar Sesión" class="boton"/>
                    </div>
                </form>
            </div>
            <div class="col-m-2 col-l-3"></div>
        </div>
        <!--MENU OPCIONES MENSAJE-->
        <main class="row">
            <div class="col-m-2 col-l-2"></div>
            <form name="login" action="../controlador.jsp" class="col-m-8 col-l-8"> 
                <h1>Mis mensajes</h1>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <div class="col-m-8 col-l-6 cuadro">
                        <div class="row">
                            <div class="col-m-4">
                                <a href="#mensajes_no_leidos"><input type="button" value="Mensajes no leídos" class="boton"></a>
                            </div>
                            <div class="col-m-4">
                                <a href="#todos_mensajes"><input type="button" value="Todos los mensajes" class="boton"></a>
                            </div>
                            <div class="col-m-4">
                                <a href="#mensajes_enviados"><input type="button" value="Mensajes enviados" class="boton"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-m-2 col-l-3"></div>
                </div>
                <br>
                <!--MENSAJES NO LEIDOS-->
                <a name="mensajes_no_leidos"></a>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para lista de mensajes-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <p class="subrayado">Mensajes no leídos</p>
                        <%
                            LinkedList mensajesParaMiNoLeidos = (LinkedList) session.getAttribute("mensajesParaMiNoLeidos");
                            if (mensajesParaMiNoLeidos.size() > 0) {
                                for (int i = 0; i < mensajesParaMiNoLeidos.size(); i++) {
                                    Mensaje m = (Mensaje) mensajesParaMiNoLeidos.get(i);
                        %>
                        <div class="row">
                            <div class="col-m-3 col-l-3">
                                <span>Asunto: <%=m.getAsunto()%></span>
                            </div>
                            <div class="col-m-5 col-l-6">
                                <span>De: <%=m.getEmisor()%></span>
                            </div>
                            <div class="col-m-4 col-l-3">
                                <input type="submit" name="<%=i%>" value="Leer mensaje" class="boton"/>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <p>Ya has leido todos los mensajes</p>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-m-2 col-l-3"></div>
                </div>
                <br>
                <!--TODOS LOS MENSAJES-->
                <a name="todos_mensajes"></a>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para lista de mensajes-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <p class="subrayado">Todos los mensajes</p>
                        <%
                            LinkedList mensajesParaMi = (LinkedList) session.getAttribute("mensajesParaMi");
                            if (mensajesParaMi.size() > 0) {
                                for (int i = 0; i < mensajesParaMi.size(); i++) {
                                    Mensaje m = (Mensaje) mensajesParaMi.get(i);
                        %>
                        <div class="row">
                            <div class="col-m-3 col-l-3">
                                <span>Asunto: <%=m.getAsunto()%></span>
                            </div>
                            <div class="col-m-5 col-l-6">
                                <span>De: <%=m.getEmisor()%></span>
                            </div>
                            <div class="col-m-4 col-l-3">
                                <input type="submit" name="<%=i%>" value="Ver en detalle" class="boton"/>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <p>No hay mensajes para ti :(</p>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-m-2 col-l-3"></div>
                </div>
                <br>
                <!--MENSAJES ENVIADOS-->
                <a name="mensajes_enviados"></a>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para lista de mensajes-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <p class="subrayado">Mensajes enviados</p>
                        <%
                            LinkedList mensajesEnviados = (LinkedList) session.getAttribute("mensajesEnviados");
                            if (mensajesEnviados.size() > 0) {
                                for (int i = 0; i < mensajesEnviados.size(); i++) {
                                    Mensaje m = (Mensaje) mensajesEnviados.get(i);
                        %>
                        <div class="row">
                            <div class="col-m-3 col-l-3">
                                <span>Asunto: <%=m.getAsunto()%></span>
                            </div>
                            <div class="col-m-5 col-l-6">
                                <span>Para: <%=m.getReceptor()%></span>
                            </div>
                            <div class="col-m-4 col-l-3">
                                <input type="submit" name="<%=i%>" value="Ver enviado" class="boton"/>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <p>No has enviado ningún mensaje</p>
                        <%
                            }
                        %>
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
