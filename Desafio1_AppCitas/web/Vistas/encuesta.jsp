<%-- 
    Document   : encuesta
    Created on : 15-oct-2020, 23:41:44
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
            <form name="encuesta" action="../controlador.jsp" class="col-m-4"> 
                <h1>Rellena la encuesta inicial</h1>
                <p>
                    <label for="relacion">
                        <span>Tipo de relacion:</span><br>
                        <input type="radio" name="relacion" value="Seria">Relación seria<br>
                        <input type="radio" name="relacion" value="Esporadica">Relación esporádica
                    </label>
                </p>
                <p>
                    <label for="deporte">
                        <span>Puntua tu afición por el deporte:</span>
                        <input type="range" max="100" min="0" value="0" name="deporte">
                    </label>
                </p>
                <p>
                    <label for="arte">
                        <span>Puntua tu gusto por el arte:</span>
                        <input type="range" max="100" min="0" value="0" name="arte">
                    </label>
                </p>
                <p>
                    <label for="politica">
                        <span>Puntua tu interés por la política:</span>
                        <input type="range" max="100" min="0" value="0" name="politica">
                    </label>
                </p>
                <p>                   
                    <label for="tieneHijos">
                        <span>Hijos:</span><br>
                        <input type="checkbox" name="tieneHijos" value="tieneHijos">Tiene hijos<br>
                        <input type="checkbox" name="quiereHijos" value="quiereHijos">Quiere hijos
                    </label>
                </p>
                <p>                   
                    <label for="interesMujeres">
                        <span>Atracción:</span><br>
                        <input type="checkbox" name="interesMujeres" value="interesMujeres">Interés en mujeres<br>
                        <input type="checkbox" name="interesHombres" value="interesHombres">Interés en hombres
                    </label>
                </p>
                <input type="submit" name="Rellenar" value="Confirmar"/>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer>
            <p>María Juan Viñas</p>
        </footer>

    </body>
</html>
