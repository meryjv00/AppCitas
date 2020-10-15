<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 15:50:21
    Author     : Mery
--%>

<%@page import="Auxiliar.Bitacora"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //LOGIN BD
            if (request.getParameter("Aceptar") != null) {
                String email = request.getParameter("email");
                String contra = request.getParameter("psswd");

                ConexionEstatica.nueva();
                Usuario u = ConexionEstatica.existeUsuario(email, contra);
                if (u != null) {
                    session.setAttribute("usuario", u);

                    Bitacora.escribirBitacora("El usuario con correo " + u.getEmail() + " ha entrado en el sistema.");

                    //Si tiene más de 2 roles es admin
                    if (u.sizeRoles() == 2) {

                        LinkedList usuarios = ConexionEstatica.obtenerUsuarios();
                        for (int i = 0; i < usuarios.size(); i++) {
                            Usuario usu = (Usuario) usuarios.get(i);
                            LinkedList roles = ConexionEstatica.obtenerRolesUsuario(usu.getEmail());
                            for (int j = 0; j < roles.size(); j++) {
                                String rol = (String) roles.get(j);
                                usu.addRol(rol);
                            }
                        }
                        session.setAttribute("usuarios", usuarios);
                        ConexionEstatica.cerrarBD();

                        if (u.isHaIniciado()) {
                            response.sendRedirect("Vistas/elegirAdmin.jsp");
                        } else {
                            response.sendRedirect("Vistas/encuesta.jsp");
                        }

                        //Si no, es usuario normal 
                    } else {
                        //Si el usuario no está activado no puede logear
                        if (!u.isActivado()) {
                            session.setAttribute("mensaje", "¡Cuenta desactivada!");
                            response.sendRedirect("index.jsp");
                            //Usuario activado: comprobamos que ya ha iniciado o no para hacer la encuesta
                        } else {
                            if (u.isHaIniciado()) {
                                response.sendRedirect("Vistas/inicio.jsp");
                            } else {
                                response.sendRedirect("Vistas/encuesta.jsp");
                            }
                        }
                    }
                } else {
                    response.sendRedirect("Vistas/fracaso.jsp");
                }
            }

            //REGISTRO BD
            if (request.getParameter("Registrar") != null) {
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String apodo = request.getParameter("apodo");
                String pass1 = request.getParameter("psswd");
                //String pass2 = request.getParameter("psswd2");
                String tfno = request.getParameter("tfno");
                int edad = Integer.parseInt(request.getParameter("edad"));
                Usuario u = new Usuario(email, dni, apodo, pass1, tfno, edad, false, false);
                ConexionEstatica.nueva();
                if (ConexionEstatica.insertarUsuario(u)) {
                    response.sendRedirect("index.jsp");
                }
                ConexionEstatica.cerrarBD();
            }

            //CIERRA SESIÓN
            if (request.getParameter("CerrarSesion") != null) {
                session.invalidate();
                response.sendRedirect("index.jsp");
            }

            //ENTRAR COMO ADMINISTRADOR: CRUD
            if (request.getParameter("entrarAdmin") != null) {
                response.sendRedirect("Vistas/CRUDusuarios.jsp");
            }

            //ENTRAR COMO USUARIO: INICIO
            if (request.getParameter("entrarUsu") != null) {
                response.sendRedirect("Vistas/inicio.jsp");
            }

            //ENCUESTA PREFERENCIAS
            if (request.getParameter("Rellenar") != null) {
                Usuario u = (Usuario) session.getAttribute("usuario");
                String relacion = request.getParameter("relacion").toString();
                int deporte = Integer.parseInt(request.getParameter("deporte"));
                int arte = Integer.parseInt(request.getParameter("arte"));
                int politica = Integer.parseInt(request.getParameter("politica"));
                String tieneHijos = request.getParameter("tieneHijos");
                String quiereHijos = request.getParameter("quiereHijos");
                String interesMujeres = request.getParameter("interesMujeres");
                String interesHombres = request.getParameter("interesHombres");

                u.setRelacion(relacion);
                u.setDeporte(deporte);
                u.setArte(arte);
                u.setPolitica(politica);
                if (tieneHijos != null) {
                    u.setTieneHijos(true);
                }
                if (quiereHijos != null) {
                    u.setQuiereHijos(true);
                }
                if (interesMujeres != null) {
                    u.setInteresMujeres(true);
                }
                if (interesHombres != null) {
                    u.setInteresHombres(true);
                }
                ConexionEstatica.nueva();
                ConexionEstatica.rellenarPreferencias(u);
                ConexionEstatica.encuestaRealizada(u);
                ConexionEstatica.cerrarBD();
                
                response.sendRedirect("Vistas/inicio.jsp");

            }

        %>
    </body>
</html>
