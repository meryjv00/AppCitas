<%-- 
    Document   : registroAdmin
    Created on : 15-oct-2020, 22:46:34
    Author     : Mery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <link rel="icon" type="image/png" href="../img/logo4.png">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="../img/logo4.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row registro">
            <div class="col-m-3"></div>
            <form name="login" action="../controladorAdmin.jsp"class="col-m-6" > 
                <h1>Registra un usuario:</h1>
                <p>
                    <label for="email">
                        <span>Introduce el email: </span>
                        <input type="email" name="email" id="email" required/>
                    </label>
                </p>
                <p>
                    <label for="dni">
                        <span>Introduce el dni: </span>
                        <input type="text" name="dni" id="dni" required/>
                    </label>
                </p>
                <p>
                    <label for="apodo">
                        <span>Introduce el nick: </span>
                        <input type="text" name="apodo" id="apodo" required/>
                    </label>
                </p>
                <p>
                    <label for="psswd">
                        <span>Introduce la contraseña: </span>
                        <input type="password" name="psswd" id="psswd" required/>
                    </label>
                </p>
                <p>
                    <label for="psswd2">
                        <span>Repite la contraseña: </span>
                        <input type="password" name="psswd2" id="psswd2" required/>
                    </label>
                </p>
                <p>
                    <label for="tfno">
                        <span>Introduce el teléfono: </span>
                        <input type="text" name="tfno" id="tfno"/>
                    </label>
                </p>
                <p>
                    <label for="edad">
                        <span>Introduce la edad: </span>
                        <input type="text" name="edad" id="edad"/>
                    </label>
                </p>
                <p>
                    <label for="rolUsuario">
                        <span>Marcar como administrador: </span><br>
                        <input type="checkbox" name="rolAdmin"/>Administrador
                    </label>
                </p>
                <input type="submit" name="RegistrarComoAdmin" value="Confirmar" class="boton"/>
                <hr>
                <a href="CRUDusuarios.jsp"><input type="button" value="Volver" class="boton"></a>
            </form>

            <div class="col-m-3"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
