<%-- 
    Document   : CRUDusuarios
    Created on : 15-oct-2020, 17:27:09
    Author     : Mery
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../estilos.css">
        <script src="https://kit.fontawesome.com/f1c00fba54.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <header class="row">
            <div class="col-m-4">
                <a href="index.jsp">
                    <span>
                        <i class="fas fa-dove"></i>
                    </span>
                </a>
            </div>
            <div class="col-m-4">
                <h1>¡ENCUENTRA TU PAREJA IDEAL!</h1>
            </div>
            <div class="col-m-4">
                <p><a href="../index.jsp">Cerrar sesión</a></p>
            </div>
        </header>
        <main class="row">
            <div class="col-m-1"></div>
            <form name="form" action="../controladorAdmin.jsp" class="col-m-10 crud"> 
                <%
                    LinkedList usuarios = (LinkedList) session.getAttribute("usuarios");
                    for (int i = 0; i < usuarios.size(); i++) {
                        Usuario u = (Usuario) usuarios.get(i);
                        String email = u.getEmail();
                        String dni = u.getDni();
                        String apodo = u.getApodo();
                        String tfno = u.getTelefono();
                        int edad = u.getEdad();
                        boolean activado = u.isActivado();
                        boolean iniciado = u.isHaIniciado();
                %>
                <p>
                    <input type="text" name="email" value="<%=email%>" readonly>
                    <input type="text" name="dni" value="<%=dni%>" readonly>
                    <input type="text" name="apodo" value="<%=apodo%>" readonly>
                    <input type="text" name="tfno" value="<%=tfno%>" readonly>
                    <input type="text" name="edad" value="<%=edad%>" readonly>
                    <input type="text" name="iniciado" value="<%=iniciado%>" readonly>
                    <input type="text" name="activado" value="<%=activado%>" >
                    <input  type = "submit" name ="<%=i%>" value="Eliminar Usuario">
                    <input type="submit" name="<%=i%>" value="Editar Usuario">
                    <input type="submit" name="<%=i%>" value="Hacer administrador">
                    <br>
                </p>
                <%
                    }

                %>
                <input type="submit" name="RegistrarNuevo" value="Registrar">
            </form>
            <div class="col-m-1"></div>
        </main>

        <footer>
            <p>María Juan Viñas</p>
        </footer>
    </body>
</html>
