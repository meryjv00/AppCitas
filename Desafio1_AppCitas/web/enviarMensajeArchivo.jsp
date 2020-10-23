<%-- 
    Document   : enviarMensajeArchivo
    Created on : 23 oct. 2020, 10:44:56
    Author     : daw209
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Mensaje"%>
<%@page import="java.io.File"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String de = "";
            String para = "";
            String asunto = "";
            String cuerpo = "";
            String rutaFichero = "";
            boolean hayFichero = false;
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List items = upload.parseRequest(request);

            for (Object item : items) {
                FileItem uploaded = (FileItem) item;

                if (!uploaded.isFormField()) {
                    String email = "";
                    File fichero = new File(Constantes.rutaServidor, "ddfd.jpg"); //El archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
                    uploaded.write(fichero);
                    out.println("Archivo '" + uploaded.getName() + "' subido correctamente.");
                    rutaFichero = "ficheros/" + uploaded.getName();
                } else {
                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();
                    if (key.equals("de")) {
                        de = valor;
                    }
                    if (key.equals("para")) {
                        para = valor;
                    }
                    if (key.equals("asunto")) {
                        asunto = valor;
                    }
                    if (key.equals("cuerpo")) {
                        cuerpo = valor;
                    }
                }
            }

            Mensaje m = new Mensaje(asunto, cuerpo, de, para);
            ConexionEstatica.nueva();
            ConexionEstatica.enviarMensaje(m);
            if(hayFichero){
                ConexionEstatica.enviarFichero(m.getId(),rutaFichero);
            }
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/personasCompatibles.jsp");
        %>
    </body>
</html>
