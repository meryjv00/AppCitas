<%-- 
    Document   : personasCompatibles
    Created on : 17-oct-2020, 22:13:25
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios afines</title>
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
            <div class="col-m-2"></div>
            <div class="col-m-8">
                <div class="row" id="menu">
                    <div class="col-m-3">
                        <a href="">Ver amigos</a>
                    </div>
                    <div class="col-m-3">
                        <a href="">Ver mensajes</a>
                    </div>
                    <div class="col-m-3">
                        <a href="">Ver perfil</a>
                    </div>
                    <div class="col-m-3">
                        <a href="inicio.jsp">Página inicio</a>
                    </div>
                </div>
            </div>
            <div class="col-m-2"></div>
        </div>
        <main class="row">
            <div class="col-m-2"></div>
            <div class="col-m-8">
                <form name="login" id="personasAfines" action="../controlador.jsp">
                    <h1>Usuarios afines</h1>
                    <%
                        Usuario yo = (Usuario) session.getAttribute("usuario");
                        LinkedList usuariosAfines = (LinkedList) session.getAttribute("usuariosAfines");
                        if (usuariosAfines.size() >= 0) {
                            for (int i = 0; i < usuariosAfines.size(); i++) {
                                Usuario u = (Usuario) usuariosAfines.get(i);

                    %>
                    <div class="row">
                        <div class="col-m-2"></div>
                        <div class="col-m-8 persona">
                            <div class="row">
                                <h1><%=u.getApodo()%></h1>
                            </div>
                            <p class="subrayado">Gustos comunes:</p>
                            <%
                                if (u.getRelacion().equals(yo.getRelacion())) {
                            %>
                            <div class="row">
                                <div class="col-m-7">
                                    <span>Relación:</span>
                                </div>
                                <div class="col-m-4">
                                    <span><%=u.getRelacion()%></span>
                                </div>
                            </div>
                            <%
                                }
                                if (u.isTieneHijos() == yo.isTieneHijos()) {
                            %>
                            <div class="row">
                                <div class="col-m-7">
                                    <span>Tiene hijos:</span>
                                </div>
                                <div class="col-m-4">
                                    <%
                                        String tieneHijos = "";
                                        if (u.isTieneHijos() == false) {
                                            tieneHijos = "No";
                                        } else {
                                            tieneHijos = "Sí";
                                        }
                                    %>
                                    <span><%=tieneHijos%></span>
                                </div>
                            </div>
                            <%
                                }
                                if (u.isQuiereHijos() == yo.isQuiereHijos()) {
                            %>
                            <div class="row">
                                <div class="col-m-7">
                                    <span>Quiere hijos:</span>
                                </div>
                                <div class="col-m-4">
                                    <%
                                        String quiereHijos = "";
                                        if (u.isQuiereHijos() == false) {
                                            quiereHijos = "No";
                                        } else {
                                            quiereHijos = "Sí";
                                        }
                                    %>
                                    <span><%=quiereHijos%></span>
                                </div>
                            </div>
                            <%
                                }
                                if (u.isInteresMujeres() == yo.isInteresMujeres()) {
                            %>
                            <div class="row">
                                <div class="col-m-7">
                                    <span>Interés por mujeres:</span>
                                </div>
                                <div class="col-m-4">
                                    <%
                                        String interesMujeres = "";
                                        if (u.isInteresMujeres() == false) {
                                            interesMujeres = "No";
                                        } else {
                                            interesMujeres = "Sí";
                                        }
                                    %>
                                    <span><%=interesMujeres%></span>
                                </div>
                            </div>
                            <%
                                }
                                if (u.isInteresHombres()== yo.isInteresHombres()) {
                            %>
                            <div class="row">
                                <div class="col-m-7">
                                    <span>Interés por hombres:</span>
                                </div>
                                <div class="col-m-4">
                                    <%
                                        String interesHomres = "";
                                        if (u.isInteresHombres() == false) {
                                            interesHomres = "No";
                                        } else {
                                            interesHomres = "Sí";
                                        }
                                    %>
                                    <span><%=interesHomres%></span>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="col-m-6">
                                    <input type="submit" name="<%=i%>" value="Me gusta" class="boton"/>
                                </div>
                                <div class="col-m-6">
                                    <input type="submit" name="<%=i%>" value="Mandar mensaje" class="boton"/>
                                </div>

                            </div>
                        </div>
                        <div class="col-m-2"></div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <h1>Lo siento,no hemos encontrado personas afines a ti</h1>
                    <%
                        }
                    %>
                </form>
            </div>
            <div class="col-m-2"></div>
        </main>
        <footer class="index">
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
