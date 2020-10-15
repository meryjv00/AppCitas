<%-- 
    Document   : controladorAdmin
    Created on : 15-oct-2020, 18:30:27
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
    </head>
    <body>
        <%
            //ELIMINAR Y EDITAR USUARIO: ACTIVARLOS
            if (session.getAttribute("usuarios") != null) {
                LinkedList usuarios = (LinkedList) session.getAttribute("usuarios");
                String pos = "", accion = "";
                int posElegida = 0;
                for (int i = 0; i < usuarios.size(); i++) {
                    pos = String.valueOf(i);
                    if (request.getParameter(pos) != null) {
                        accion = request.getParameter(pos).toString();
                        posElegida = i;
                    }
                }

                Usuario u = (Usuario) usuarios.get(posElegida);
                ConexionEstatica.nueva();

                if (accion.equals("Eliminar Usuario")) {
                    //Eliminar BDD
                    if (ConexionEstatica.eliminarUsuario(u)) {
                        usuarios.remove(posElegida);
                    }

                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Editar Usuario")) {
                    String activado[] = request.getParameterValues("activado");
                    u.setActivado(Boolean.parseBoolean(activado[posElegida]));

                    //Editar BDD
                    ConexionEstatica.editarUsuario(u);

                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Hacer administrador")) {
                    //Añadir rol de administrador
                    if (!ConexionEstatica.esAdmin(u)) {
                        ConexionEstatica.hacerAdmin(u);
                    }

                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                ConexionEstatica.cerrarBD();
            }

            //REGISTRAR NUEVO USUARIO: OPCIÓN DE ADMINISTRADOR
            if (request.getParameter("RegistrarNuevo") != null) {
                response.sendRedirect("Vistas/registroAdmin.jsp");
            }

        %>

    </body>
</html>
