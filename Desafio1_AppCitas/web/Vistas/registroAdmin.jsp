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
        <script src="../js/validacion.js"></script>
    </head>
    <body onload="validacionRegistroAdmin()">
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <img src="../img/logo4.png" class="imagenLogo"/>
            </div>
        </header>
        <main class="row registro">
            <div class="col-m-3 col-l-4"></div>
            <form name="login" action="../controladorAdmin.jsp" id="registroAdmin" class="col-m-6 col-l-4" novalidate> 
                <h1>Registra un usuario:</h1>
                <div class="m1">
                    <label for="email">
                        <span>Introduce el email: </span>
                        <input type="email" name="email" id="email" minlength="8" maxlength="20" required />
                        <span class="error" aria-live="polite"></span>
                    </label>
                </div>
                <div class="m1">
                    <label for="dni">
                        <span>Introduce el dni: </span>
                        <input type="text" name="dni" id="dni" required pattern="^[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[A-Z]$"/>
                        <span class="error" aria-live="polite"></span> 
                    </label>
                </div>
                <div class="m1">
                    <label for="apodo">
                        <span>Introduce el nick: </span>
                        <input type="text" name="apodo" id="apodo" required minlength="5" maxlength="15"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </div>
                <div class="m1">
                    <label for="psswd">
                        <span>Introduce la contraseña: </span>
                        <input type="password" name="psswd" id="psswd" required minlength="3" maxlength="15"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </div>
                <div class="m1">
                    <label for="psswd2">
                        <span>Repite la contraseña: </span>
                        <input type="password" name="psswd2" id="psswd2" required />
                        <span class="error" aria-live="polite"></span>
                    </label>
                </div>
                <div class="m1">
                    <label for="tfno">
                        <span>Introduce el teléfono: </span>
                        <input type="text" name="tfno" id="tfno" pattern="^[0-9]{3}-[0-9]{3}-[0-9]{3}$" required/>
                        <span class="error" aria-live="polite"></span> 
                    </label>
                </div>
                <div class="m1">
                    <label for="edad">
                        <span>Introduce la edad: </span>
                        <input type="text" name="edad" id="edad" pattern="^[0-9]{1,3}$" required/>
                        <span class="error" aria-live="polite"></span>  
                    </label>
                </div>
                <div class="m1">
                    <span>Marcar como administrador: </span>
                    <input class="izq" type="checkbox" name="rolAdmin"/>Administrador
                </div>
                <input type="submit" name="RegistrarComoAdmin" value="Confirmar" class="boton"/>
                <hr>
                <a href="CRUDusuarios.jsp"><input type="button" value="Volver" class="boton"></a>
            </form>

            <div class="col-m-3 col-l-4"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
