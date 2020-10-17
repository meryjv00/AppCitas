<%-- 
    Document   : registro
    Created on : 14-oct-2020, 15:49:52
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
            <div class="col-m-4"></div>
            <form name="login" action="../controlador.jsp" class="col-m-4"> 
                <h1>Registrate</h1>
                <p>
                    <label for="email">
                        <span>Introduce tu email: </span>
                        <input type="email" name="email" id="email" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="dni">
                        <span>Introduce tu dni: </span>
                        <input type="text" name="dni" id="dni" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="apodo">
                        <span>Introduce tu nick: </span>
                        <input type="text" name="apodo" id="apodo" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="psswd">
                        <span>Introduce tu contraseña: </span>
                        <input type="password" name="psswd" id="psswd" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="psswd2">
                        <span>Repite tu contraseña: </span>
                        <input type="password" name="psswd2" id="psswd2" required/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="tfno">
                        <span>Introduce tu teléfono: </span>
                        <input type="text" name="tfno" id="tfno"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <p>
                    <label for="edad">
                        <span>Introduce tu edad: </span>
                        <input type="text" name="edad" id="edad"/>
                        <span class="error" aria-live="polite"></span>   
                    </label>
                </p>
                <input type="submit" name="Registrar" value="Confirmar" class="boton"/>
                <p><a href="../index.jsp"><input type="button" name="Volver" value="Volver" class="boton"/></a></p>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>
    </body>
</html>
