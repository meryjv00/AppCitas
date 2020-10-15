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
        <title>JSP Page</title>
        <link rel="stylesheet" href="../estilos.css">
        <script src="https://kit.fontawesome.com/f1c00fba54.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <header class="row">
            <div class="col-m-4">
                <a href="../index.jsp">
                    <span>
                        <i class="fas fa-dove"></i>
                    </span>
                </a>
            </div>
            <div class="col-m-4">
                <h1>¡ENCUENTRA TU PAREJA IDEAL!</h1></a>
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
                <input type="submit" name="Registrar" value="Confirmar"/>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer>
            <p>María Juan Viñas</p>
        </footer>
    </body>
</html>
