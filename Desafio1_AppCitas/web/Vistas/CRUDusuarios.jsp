<%-- 
    Document   : CRUDusuarios
    Created on : 15-oct-2020, 17:27:09
    Author     : Mery
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <a name="arriba"></a>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="../img/logo4.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row">
            <div class="col-m-1"></div>
            <form name="crud" action="../controladorAdmin.jsp" class="col-m-10 crud"> 
                <h1>Gestión de usuarios</h1>
                <fieldset class="crud">
                    <legend>Opciones</legend>
                    <p><input type="submit" name="RegistrarNuevo" value="Registrar nuevo usuario" class="boton"></p>
                    <p><input type="submit" name="VolverElegir" value="Volver" class="boton"></p>
                    <p><input type="submit" name="CerrarSesion" value="Cerrar sesión" class="boton"></p>
                </fieldset>
                
                <br>
                <hr>
                <%
                    ConexionEstatica.nueva();
                    LinkedList usuarios = ConexionEstatica.obtenerUsuarios();
                    session.setAttribute("usuarios", usuarios);
                    ConexionEstatica.cerrarBD();
                    String texto = "";
                    String haIniciado = "";
                    String cuentaActivada = "";
                    String colorAdmin = "";
                    String colorInicio = "";
                    String colorActivado = "";

                    for (int i = 0; i < usuarios.size(); i++) {

                        Usuario u = (Usuario) usuarios.get(i);
                        String email = u.getEmail();
                        String dni = u.getDni();
                        String apodo = u.getApodo();
                        String tfno = u.getTelefono();
                        int edad = u.getEdad();
                        boolean activado = u.isActivado();
                        boolean iniciado = u.isHaIniciado();
                        if (iniciado == false) {
                            haIniciado = "No ha iniciado sesión";
                            colorInicio = "#ff6f69";
                        } else {
                            haIniciado = "Ha iniciado sesión";
                            colorInicio = "#96ceb4";
                        }
                        if (activado == false) {
                            cuentaActivada = "Cuenta desactivada";
                            colorActivado = "#ff6f69";
                        } else {
                            cuentaActivada = "Cuenta activada";
                            colorActivado = "#96ceb4";
                        }
                        ConexionEstatica.nueva();
                        if (ConexionEstatica.esAdmin(u)) {
                            colorAdmin = "#96ceb4";
                            texto = "Es administrador";
                        } else {
                            colorAdmin = "#ff6f69";
                            texto = "No es administrador";
                        }
                        ConexionEstatica.cerrarBD();
                %>
                <p>
                    <input type="text" style="background-color:<%=colorAdmin%>" name="admin" value="<%=texto%>">
                    <input type="text" name="email" value="<%=email%>" readonly>
                    <input type="text" name="dni" value="<%=dni%>" readonly>
                    <input type="text" name="apodo" value="<%=apodo%>" readonly>
                    <input type="text" name="tfno" value="<%=tfno%>" readonly>
                    <input type="text" name="edad" value="<%=edad%>" readonly>
                    <input type="text" style="background-color:<%=colorInicio%>" name="iniciado" value="<%=haIniciado%>" readonly>
                    <input type="text" style="background-color:<%=colorActivado%>" name="activado" value="<%=cuentaActivada%>" readonly >
                </p>
                <input type="submit" name ="<%=i%>" value="Eliminar Usuario" class="boton">
                <input type="submit" name="<%=i%>" value="Activar Cuenta" class="boton">
                <input type="submit" name="<%=i%>" value="Desactivar Cuenta" class="boton">
                <input type="submit" name="<%=i%>" value="Hacer administrador" class="boton">
                <input type="submit" name="<%=i%>" value="Quitar administrador" class=boton>
                <br>  
                <hr>
                <%
                    }

                %>
                <a href="#arriba" name="IrArriba"><input type="button" class="boton" value="Volver arriba"></a>
            </form>
            <div class="col-m-1"></div>
        </main>

        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
