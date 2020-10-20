<%-- 
    Document   : detalleAmigo
    Created on : 19-oct-2020, 17:24:07
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
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
                    <div class="col-m-3"></div>
                    <fieldset class="col-m-6">
                        <legend>Menu</legend>
                        <div class="row">
                            <div class="col-m-6">
                                <input type="submit" name="cargarPersonasCompatibles" value="Ver personas afines" class="boton"/>
                            </div>
                            <div class="col-m-6">
                                <input type="submit" name="verAmigos" value="Ver amigos" class="boton"/> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-m-6">
                                <input type="submit" name="verMensajes" value="Ver mensajes" class="boton"/> 
                            </div>
                            <div class="col-m-6">
                                <input type="submit" name="verPerfil" value="Ver perfil" class="boton"/> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-m-12">
                                <input type="submit" name="cerrarSesion" value="Cerrar Sesión" class="boton"/>
                            </div>
                        </div>
                    </fieldset>
                    <div class="col-m-3"></div>
                </form>
            </div>
            <div class="col-m-2 col-l-3"></div>
        </div>
        <main class="row">
            <div class="col-m-2 col-l-2"></div>
            <form name="login" action="../controlador.jsp" class="col-m-8 col-l-8">
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para amigo-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <%
                            Usuario amigoSeleccionado = (Usuario) session.getAttribute("amigoSeleccionado");

                        %>
                        <!--DATOS COMUNES-->
                        <h1>Perfil de <%=amigoSeleccionado.getApodo()%></h1>
                        <fieldset>
                            <legend>Datos personales</legend>
                            <!--Correo electrónico: no editable-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Correo electrónico:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="correo" value="<%=amigoSeleccionado.getEmail()%>" readonly/>
                                </div>
                            </div>
                            <!--Dni no editable-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Dni:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="dni" value="<%=amigoSeleccionado.getDni()%>" readonly/>
                                </div>
                            </div>
                            <!--Apodo-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Apodo:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="apodo" value="<%=amigoSeleccionado.getApodo()%>" readonly/>
                                </div>
                            </div>
                            <!--Telefono-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Telefono:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="tfno" value="<%=amigoSeleccionado.getTelefono()%>" readonly/>
                                </div> 
                            </div>
                            <!--Edad-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Edad:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="edad" value="<%=amigoSeleccionado.getEdad()%>" readonly/>
                                </div> 
                            </div>

                        </fieldset>
                        <!--PREFERENCIAS-->
                        <fieldset>
                            <legend>Preferencias</legend>
                            <!--Relacion-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Relación:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="relacion" value="<%=amigoSeleccionado.getRelacion()%>" readonly/>
                                </div> 
                            </div>
                            <!--Deporte-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Deporte:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="deporte" value="<%=amigoSeleccionado.getDeporte()%>" readonly/>
                                </div> 
                            </div>
                            <!--Arte-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Arte:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="arte" value="<%=amigoSeleccionado.getArte()%>" readonly/>
                                </div> 
                            </div>
                            <!--Politica-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Política:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="politica" value="<%=amigoSeleccionado.getPolitica()%>" readonly/>
                                </div> 
                            </div>
                            <!--Tiene hijos-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Tienes hijos:</span>
                                </div>
                                <div class="col-m-7">
                                    <%
                                        String tieneHijos = "";
                                        if (amigoSeleccionado.isTieneHijos() == false) {
                                            tieneHijos = "No";
                                        } else {
                                            tieneHijos = "Sí";
                                        }
                                    %>
                                    <input type="text" name="tieneHijos" value="<%=tieneHijos%>" readonly/>
                                </div> 
                            </div> 
                            <!--Quiere hijos-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Quieres hijos:</span>
                                </div>
                                <div class="col-m-7">
                                    <%
                                        String quiereHijos = "";
                                        if (amigoSeleccionado.isQuiereHijos() == false) {
                                            quiereHijos = "No";
                                        } else {
                                            quiereHijos = "Sí";
                                        }
                                    %>
                                    <input type="text" name="quiereHijos" value="<%=quiereHijos%>" readonly/>
                                </div> 
                            </div>  
                            <!--Interés mujeres-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Interés mujeres:</span>
                                </div>
                                <div class="col-m-7">
                                    <%
                                        String interesMujeres = "";
                                        if (amigoSeleccionado.isInteresMujeres() == false) {
                                            interesMujeres = "No";
                                        } else {
                                            interesMujeres = "Sí";
                                        }
                                    %>
                                    <input type="text" name="interesMujeres" value="<%=interesMujeres%>" readonly/>
                                </div> 
                            </div> 
                            <!--Interés hombres-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Interés hombres:</span>
                                </div>
                                <div class="col-m-7">
                                    <%
                                        String interesHombres = "";
                                        if (amigoSeleccionado.isInteresHombres() == false) {
                                            interesHombres = "No";
                                        } else {
                                            interesHombres = "Sí";
                                        }
                                    %>
                                    <input type="text" name="interesHombres" value="<%=interesHombres%>" readonly/>
                                </div> 
                            </div> 
                        </fieldset>
                        <p><input type="submit" name="dejarSerAmigo" value="Dejar de ser amigos" class="boton"/></p>
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
