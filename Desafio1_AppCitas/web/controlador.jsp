<%-- 
    Document   : controlador
    Created on : 14-oct-2020, 15:50:21
    Author     : Mery
--%>

<%@page import="Auxiliar.VerificarRecaptcha"%>
<%@page import="Modelo.Email"%>
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
                boolean verificado = true;

                //CAPTCHA GOOGLE
                if (session.getAttribute("captchaActivo") != null) {
                    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                    verificado = VerificarRecaptcha.verificar(gRecaptchaResponse);
                }

                ConexionEstatica.nueva();
                Usuario u = ConexionEstatica.existeUsuario(email, contra);
                if (u != null && verificado) {
                    session.setAttribute("usuario", u);

                    Bitacora.escribirBitacora("El usuario con correo " + u.getEmail() + " ha entrado en el sistema.");
                    //Obtenemos todos los usuarios
                    LinkedList usuarios = ConexionEstatica.obtenerUsuarios();
                    for (int i = 0; i < usuarios.size(); i++) {
                        Usuario usu = (Usuario) usuarios.get(i);
                        LinkedList roles = ConexionEstatica.obtenerRolesUsuario(usu.getEmail());
                        for (int j = 0; j < roles.size(); j++) {
                            String rol = (String) roles.get(j);
                            usu.addRol(rol);
                        }
                        Object preferencias[] = (Object[]) ConexionEstatica.obtenerPreferenciasUsuario(usu);
                        if (preferencias[0] != null) {
                            usu.setRelacion((String) preferencias[0]);
                            usu.setDeporte((int) preferencias[1]);
                            usu.setArte((int) preferencias[2]);
                            usu.setPolitica((int) preferencias[3]);
                            usu.setTieneHijos((boolean) preferencias[4]);
                            usu.setQuiereHijos((boolean) preferencias[5]);
                            usu.setInteresMujeres((boolean) preferencias[6]);
                            usu.setInteresHombres((boolean) preferencias[7]);
                        }
                    }
                    session.setAttribute("usuarios", usuarios);

                    //Buscar usuarios afines, solo a aquellos usuarios que ya han rellenado la encuesta
                    if (u.isHaIniciado()) {
                        LinkedList usuariosPreferencias = new LinkedList();
                        LinkedList usuariosAfines = new LinkedList();
                        int cont = 0;

                        //Añadimos a la LK usuariosPreferencias aquellos que han rellenado la encuesta y quitando
                        // a el usuario que ha iniciado sesión
                        for (int i = 0; i < usuarios.size(); i++) {
                            Usuario usu = (Usuario) usuarios.get(i);
                            if (usu.getRelacion() != null) {
                                //Para quitar a el usuario que inicia sesión
                                if (!usu.getEmail().equals(u.getEmail())) {
                                    usuariosPreferencias.add(usu);
                                }
                            }
                        }
                        session.setAttribute("usuariosPreferencias", usuariosPreferencias);
                        //Buscar usuarios afines
                        for (int i = 0; i < usuariosPreferencias.size(); i++) {
                            cont = 0;
                            Usuario usuAfin = (Usuario) usuariosPreferencias.get(i);
                            if (u.getRelacion().equals(usuAfin.getRelacion())) {
                                cont++;
                            }
                            if (u.isQuiereHijos() == usuAfin.isQuiereHijos()) {
                                cont++;
                            }
                            if (u.isTieneHijos() == usuAfin.isTieneHijos()) {
                                cont++;
                            }
                            if (u.isInteresMujeres() == usuAfin.isInteresMujeres()) {
                                cont++;
                            }
                            if (u.isInteresHombres() == usuAfin.isInteresHombres()) {
                                cont++;
                            }
                            if (usuAfin.getDeporte() - 10 <= u.getDeporte() && u.getDeporte() <= usuAfin.getDeporte() + 10) {
                                cont++;
                            }
                            if (usuAfin.getArte() - 10 <= u.getArte() && u.getArte() <= usuAfin.getArte() + 10) {
                                cont++;
                            }
                            if (usuAfin.getPolitica() - 10 <= u.getPolitica() && u.getPolitica() <= usuAfin.getPolitica() + 10) {
                                cont++;
                            }

                            //Si tiene 5 cosas parecidas añadir a personas afines  5/8
                            if (cont >= 5) {
                                usuariosAfines.add(usuAfin);
                            }
                        }

                        session.setAttribute("usuariosAfines", usuariosAfines);
                    }

                    ConexionEstatica.cerrarBD();
                    //Si tiene más de 2 roles es admin
                    if (u.sizeRoles() == 2) {

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
                    if (session.getAttribute("captchaActivo") != null) {
                        session.setAttribute("mensaje", "Captcha no válido");
                    } else {
                        session.setAttribute("mensaje", "Usuario o contraseña incorrectos");
                    }
                    session.removeAttribute("captchaActivo");
                    response.sendRedirect("index.jsp");
                }
            }

            //REGISTRO BD
            if (request.getParameter("Registrar") != null) {
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String apodo = request.getParameter("apodo");
                String pass1 = request.getParameter("psswd");
                String tfno = request.getParameter("tfno");
                int edad = Integer.parseInt(request.getParameter("edad"));
                if (tfno == null) {
                    tfno = "";
                }

                Usuario u = new Usuario(email, dni, apodo, pass1, tfno, edad, false, false);
                ConexionEstatica.nueva();
                if (ConexionEstatica.insertarUsuario(u)) {
                    response.sendRedirect("index.jsp");
                }
                ConexionEstatica.cerrarBD();
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

                response.sendRedirect("Vistas/index.jsp");

            }

            //Enviar email
            if (request.getParameter("EnviarEmail") != null) {
                int az = (int) (Math.random() * 99999);

                //Envía email con la contraseña nueva
                Email email = new Email();
                String de = "auxiliardaw2@gmail.com";
                String clave = "Chubaca20";
                String para = request.getParameter("emailpsswd");
                String mensaje = "Nueva contraseña: " + az;
                String asunto = "Contraseña olvidada";
                email.enviarCorreo(de, clave, para, mensaje, asunto);

                //Asignar nueva contraseña al usuario
                ConexionEstatica.nueva();
                ConexionEstatica.modificarClave(para, az);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/mandado.jsp");

            }

            //Ir a la pagina cargar personas
            if (request.getParameter("verPersonasCompatibles") != null) {
                response.sendRedirect("Vistas/cargandoPersonas.jsp");
            }

            //Ir a la pagina de personas afines
            if (request.getParameter("cargarPersonasCompatibles") != null) {
                response.sendRedirect("Vistas/personasCompatibles.jsp");
            }

            //IR A VER AMIGOS
            if (request.getParameter("verAmigos") != null) {
                Usuario yo = (Usuario) session.getAttribute("usuario");
                LinkedList usuariosPreferencias = (LinkedList) session.getAttribute("usuariosPreferencias");
                LinkedList amigos = new LinkedList();
                ConexionEstatica.nueva();
                for (int i = 0; i < usuariosPreferencias.size(); i++) {
                    Usuario u = (Usuario) usuariosPreferencias.get(i);
                    if (ConexionEstatica.sonAmigos(yo.getEmail(), u.getEmail())) {
                        amigos.add(u);
                    }
                }
                ConexionEstatica.cerrarBD();
                session.setAttribute("amigos", amigos);
                response.sendRedirect("Vistas/amigos.jsp");
            }

            //IR A VER MENSAJES
            if (request.getParameter("verMensajes") != null) {
                //+++++
                response.sendRedirect("Vistas/mensajes.jsp");
            }
            //Ver en detalle + enviar mensaje a amigo
            if (session.getAttribute("amigos") != null) {
                LinkedList amigos = (LinkedList) session.getAttribute("amigos");
                if (amigos.size() > 0) {
                    String pos = "", accion = "";
                    int posElegida = 0;
                    for (int i = 0; i < amigos.size(); i++) {
                        pos = String.valueOf(i);
                        if (request.getParameter(pos) != null) {
                            accion = request.getParameter(pos).toString();
                            posElegida = i;
                        }
                    }
                    Usuario usu = (Usuario) amigos.get(posElegida);
                    
                    if (accion.equals("Ver en detalle")) {
                        session.setAttribute("amigoSeleccionado", usu);
                        response.sendRedirect("Vistas/detalleAmigo.jsp");
                    }
                    if (accion.equals("Enviar mensaje")) {
                        session.setAttribute("amigoSeleccionado", usu);
                        response.sendRedirect("Vistas/enviarMensaje.jsp");
                    }
                }

            }

            if (request.getParameter("dejarSerAmigo") != null) {
                Usuario amigo = (Usuario) session.getAttribute("amigoSeleccionado");
                Usuario yo = (Usuario) session.getAttribute("usuario");
                ConexionEstatica.nueva();
                ConexionEstatica.noMeGusta(yo.getEmail(), amigo.getEmail());

                //Actualiza los amigos 
                LinkedList usuariosPreferencias = (LinkedList) session.getAttribute("usuariosPreferencias");
                LinkedList amigos = new LinkedList();
                ConexionEstatica.nueva();
                for (int i = 0; i < usuariosPreferencias.size(); i++) {
                    Usuario u = (Usuario) usuariosPreferencias.get(i);
                    if (ConexionEstatica.sonAmigos(yo.getEmail(), u.getEmail())) {
                        amigos.add(u);
                    }
                }
                session.setAttribute("amigos", amigos);

                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/amigos.jsp");
            }

            //IR A VER PERFIL
            if (request.getParameter("verPerfil") != null) {
                response.sendRedirect("Vistas/perfil.jsp");
            }

            //EDITAR DATOS
            if (request.getParameter("EditarDatos") != null) {
                Usuario u = (Usuario) session.getAttribute("usuario");
                String apodo = request.getParameter("apodo");
                String tfno = request.getParameter("tfno");
                int edad = Integer.parseInt(request.getParameter("edad"));
                u.setApodo(apodo);
                u.setTelefono(tfno);
                u.setEdad(edad);
                session.setAttribute("usuario", u);
                ConexionEstatica.nueva();
                ConexionEstatica.editarDatosUsuario(u);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/perfil.jsp");
            }
            //EDITAR PREFERENCIAS
            if (request.getParameter("EditarPreferencias") != null) {
                Usuario u = (Usuario) session.getAttribute("usuario");
                String relacion = request.getParameter("relacion");
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
                if (tieneHijos.equals("No")) {
                    u.setTieneHijos(false);
                } else {
                    u.setTieneHijos(true);
                }
                if (quiereHijos.equals("No")) {
                    u.setQuiereHijos(false);
                } else {
                    u.setQuiereHijos(true);
                }
                if (interesMujeres.equals("Sí")) {
                    u.setInteresMujeres(false);
                } else {
                    u.setInteresMujeres(true);
                }
                if (interesHombres.equals("Sí")) {
                    u.setInteresHombres(false);
                } else {
                    u.setInteresHombres(true);
                }
                session.setAttribute("usuario", u);
                ConexionEstatica.nueva();
                ConexionEstatica.editarPreferenciasUsuario(u);
                ConexionEstatica.cerrarBD();

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
            //Cerrar sesion
            if (request.getParameter("cerrarSesion") != null) {
                session.invalidate();
                response.sendRedirect("index.jsp");
            }

            //LLeva a index
            if (request.getParameter("Volver") != null) {
                response.sendRedirect("index.jsp");
            }

            //Lleva a elegir admin
            if (request.getParameter("volverAdmin") != null) {
                response.sendRedirect("Vistas/elegirAdmin.jsp");
            }

            //Añadir como amigos - enviar mensaje a usuario afin
            if (session.getAttribute("usuariosAfines") != null) {
                Usuario u = (Usuario) session.getAttribute("usuario");
                LinkedList usuariosAfines = (LinkedList) session.getAttribute("usuariosAfines");
                String pos = "", accion = "";
                int posElegida = 0;
                if (usuariosAfines.size() > 0) {
                    for (int i = 0; i < usuariosAfines.size(); i++) {
                        pos = String.valueOf(i);
                        if (request.getParameter(pos) != null) {
                            accion = request.getParameter(pos).toString();
                            posElegida = i;
                        }
                    }

                    Usuario usu = (Usuario) usuariosAfines.get(posElegida);
                    ConexionEstatica.nueva();

                    //Añadir como q me gusta
                    if (accion.equals("Me gusta")) {
                        ConexionEstatica.meGusta(u.getEmail(), usu.getEmail());
                        response.sendRedirect("Vistas/personasCompatibles.jsp");
                    }
                    //Borrar como q me gusta
                    if (accion.equals("No me gusta")) {
                        ConexionEstatica.noMeGusta(u.getEmail(), usu.getEmail());
                        response.sendRedirect("Vistas/personasCompatibles.jsp");
                    }
                    //Mandar mensaje a persona afin
                    if (accion.equals("Mandar mensaje")) {
                        session.setAttribute("afinSeleccionado", usu);
                        response.sendRedirect("Vistas/enviarMensaje.jsp");
                    }

                    ConexionEstatica.cerrarBD();
                }

            }

            //Enviar mensaje
            if(request.getParameter("EnviarMsj")!= null){
                
            }

        %>
    </body>
</html>
