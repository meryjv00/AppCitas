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
                    if (ConexionEstatica.eliminarUsuario(u)) {
                        usuarios.remove(posElegida);
                    }
                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Activar Cuenta")) {
                    u.setActivado(true);
                    ConexionEstatica.editarUsuario(u);

                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Desactivar Cuenta")) {
                    u.setActivado(false);
                    ConexionEstatica.editarUsuario(u);
                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Hacer administrador")) {
                    if (!ConexionEstatica.esAdmin(u)) {
                        ConexionEstatica.hacerAdmin(u);
                    }
                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                if (accion.equals("Quitar administrador")) {
                    ConexionEstatica.quitarAdmin(u);

                    response.sendRedirect("Vistas/CRUDusuarios.jsp");
                }

                ConexionEstatica.cerrarBD();
            }

            if (request.getParameter("RegistrarNuevo") != null) {
                response.sendRedirect("Vistas/registroAdmin.jsp");
            }

            //REGISTRAR NUEVO USUARIO: OPCIÓN DE ADMINISTRADOR
            if (request.getParameter("RegistrarComoAdmin") != null) {
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String apodo = request.getParameter("apodo");
                String pass1 = request.getParameter("psswd");
                String tfno = request.getParameter("tfno");
                int edad = Integer.parseInt(request.getParameter("edad"));
                String rolAdmin = request.getParameter("rolAdmin");

                Usuario u = new Usuario(email, dni, apodo, pass1, tfno, edad, false, false);

                ConexionEstatica.nueva();
                if (rolAdmin != null) {
                    if (ConexionEstatica.insertarAdmin(u)) {
                        response.sendRedirect("Vistas/CRUDusuarios.jsp");
                    }
                } else {
                    if (ConexionEstatica.insertarUsuario(u)) {
                        response.sendRedirect("Vistas/CRUDusuarios.jsp");
                    }
                }

                ConexionEstatica.cerrarBD();
            }

            if (request.getParameter("VolverElegir") != null) {
                response.sendRedirect("Vistas/elegirAdmin.jsp");
            }
            if (request.getParameter("VolverCRUD") != null) {
                response.sendRedirect("Vistas/CRUDusuarios.jsp");
            }
            if (request.getParameter("CerrarSesion") != null) {
                int usuariosConectados = (int) application.getAttribute("usuariosConectados");
                usuariosConectados--;
                application.setAttribute("usuariosConectados", usuariosConectados);
                while (session.getAttributeNames().hasMoreElements()) {
                    session.removeAttribute(session.getAttributeNames().nextElement());
                }
                response.sendRedirect("index.jsp");
            }
        %>

    </body>
</html>
