<%-- 
    Document   : perfil
    Created on : 19-oct-2020, 17:13:03
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi perfil</title>
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
                        <input type="submit" name="verMensajes" value="Ver mensajes" class="boton"/> 
                    </div>
                    <div class="col-m-3">
                        <input type="submit" name="verAmigos" value="Ver amigos" class="boton"/> 
                    </div>
                    <div class="col-m-3">
                        <input type="submit" name="cerrarSesion" value="Cerrar Sesión" class="boton"/>
                    </div>
                </form>
            </div>
            <div class="col-m-2 col-l-3"></div>
        </div>
        <main class="row">
            <div class="col-m-2 col-l-2"></div>
            <form name="login" action="../controlador.jsp" class="col-m-8 col-l-8"> 
                <h1>Mi perfil</h1>
                <div class="row">
                    <div class="col-m-2 col-l-3"></div>
                    <!--Cuadro para el perfil-->
                    <div class="col-m-8 col-l-6 cuadro">
                        <%
                            Usuario u = (Usuario) session.getAttribute("usuario");
                        %>
                        <!--DATOS COMUNES-->
                        <fieldset>
                            <legend>Mis datos personales</legend>
                            <!--Correo electrónico: no editable-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Correo electrónico:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="correo" value="<%=u.getEmail()%>" readonly/>
                                </div>
                            </div>
                            <!--Dni no editable-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Dni:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="dni" value="<%=u.getDni()%>" readonly/>
                                </div>
                            </div>
                            <!--Apodo-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Apodo:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="apodo" value="<%=u.getApodo()%>"/>
                                </div>
                            </div>
                            <!--Telefono-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Telefono:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="tfno" value="<%=u.getTelefono()%>"/>
                                </div> 
                            </div>
                            <!--Edad-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Edad:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="edad" value="<%=u.getEdad()%>"/>
                                </div> 
                            </div>

                        </fieldset>
                        <p><input type="submit" name="EditarDatos" value="Editar datos personales" class="boton"/></p>

                        <!--PREFERENCIAS-->
                        <fieldset>
                            <legend>Mis preferencias</legend>
                            <!--Relacion-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Relación:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="text" name="relacion" value="<%=u.getRelacion()%>"/>
                                </div> 
                            </div>
                            <!--Deporte-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Deporte:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="deporte" value="<%=u.getDeporte()%>"/>
                                </div> 
                            </div>
                            <!--Arte-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Arte:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="arte" value="<%=u.getArte()%>"/>
                                </div> 
                            </div>
                            <!--Politica-->
                            <div class="row">
                                <div class="col-m-5">
                                    <span>Política:</span>
                                </div>
                                <div class="col-m-7">
                                    <input type="number" name="politica" value="<%=u.getPolitica()%>"/>
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
                                        if (u.isTieneHijos() == false) {
                                            tieneHijos = "No";
                                        } else {
                                            tieneHijos = "Sí";
                                        }
                                    %>
                                    <input type="text" name="tieneHijos" value="<%=tieneHijos%>"/>
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
                                        if (u.isQuiereHijos() == false) {
                                            quiereHijos = "No";
                                        } else {
                                            quiereHijos = "Sí";
                                        }
                                    %>
                                    <input type="text" name="quiereHijos" value="<%=quiereHijos%>"/>
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
                                        if (u.isInteresMujeres() == false) {
                                            interesMujeres = "No";
                                        } else {
                                            interesMujeres = "Sí";
                                        }
                                    %>
                                    <input type="text" name="interesMujeres" value="<%=interesMujeres%>"/>
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
                                        if (u.isInteresHombres() == false) {
                                            interesHombres = "No";
                                        } else {
                                            interesHombres = "Sí";
                                        }
                                    %>
                                    <input type="text" name="interesHombres" value="<%=interesHombres%>"/>
                                </div> 
                            </div> 
                        </fieldset>
                        <p><input type="submit" name="EditarPreferencias" value="Editar preferencias" class="boton"/></p>
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
