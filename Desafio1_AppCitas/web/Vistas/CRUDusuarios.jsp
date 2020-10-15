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
    </head>
    <body>
        <%
            LinkedList usuarios = (LinkedList) session.getAttribute("usuarios");
            for (int i = 0; i < usuarios.size(); i++) {
                Usuario u = (Usuario) usuarios.get(i);
                out.print(u.getEmail() +"<br>");
            }
        %>

    </body>
</html>
