<%-- 
    Document   : detalleMensaje
    Created on : 21-oct-2020, 18:49:38
    Author     : Mery
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para mensaje-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <fieldset>
                            <legend>Mensaje</legend>
                            <%
                                Mensaje m = (Mensaje) session.getAttribute("mensajeSeleccionado");
                            %>
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Emisor:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="emisor" value="<%=m.getEmisor()%>" readonly/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Fecha:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="fecha" value="<%=m.getFecha()%>" readonly/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Asunto:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="asunto" value="<%=m.getAsunto()%>" readonly/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Mensaje:</span>
                                </div>
                                <div class="col-m-7">
                                    <textarea name="cuerpo"><%=m.getCuerpo()%></textarea>
                                </div>
                            </div>
                            <%
                                //Comprobar que hay fichero
                                ConexionEstatica.nueva();
                                if (ConexionEstatica.hayFichero(m.getId())) {
                                    String ruta = ConexionEstatica.rutaFichero(m.getId());
                            %>
                            <div class="row">
                                <div class="col-m-4"></div>
                                <div class="col-m-4">
                                    <img src="ficheros/10_maria@gmail.com.jpg"/>
                                </div>
                                <div class="col-m-4"></div>
                            </div>
                            <%
                                }
                                ConexionEstatica.cerrarBD();
                            %>
                        </fieldset>
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
