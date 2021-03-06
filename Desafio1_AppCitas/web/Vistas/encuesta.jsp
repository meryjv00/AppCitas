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
        <title>Encuesta inicial</title>
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
            <div class="col-m-3 col-l-4"></div>
            <form name="encuesta" action="../controlador.jsp" class="col-m-6 col-l-4"> 
                <h1>Rellena la encuesta inicial</h1>

                <fieldset>
                    <legend>Tipo de relacion:</legend>
                    <input type="radio" name="relacion" value="Seria"/>Relación seria<br>
                    <input type="radio" name="relacion" value="Esporadica"/>Relación esporádica
                </fieldset>

                <div class="m1">
                    <label for="deporte">
                        <span>Puntua tu afición por el deporte:</span>
                        <input type="range" max="100" min="0" value="0" name="deporte"/>
                    </label>
                </div>
                <div class="m1">
                    <label for="arte">
                        <span>Puntua tu gusto por el arte:</span>
                        <input type="range" max="100" min="0" value="0" name="arte"/>
                    </label>
                </div>
                <div class="m1">
                    <label for="politica">
                        <span>Puntua tu interés por la política:</span>
                        <input type="range" max="100" min="0" value="0" name="politica"/>
                    </label>
                </div>
                <fieldset>
                    <legend>Interés en hijos:</legend>
                    <input type="checkbox" name="tieneHijos" value="tieneHijos">Tiene hijos<br>
                    <input type="checkbox" name="quiereHijos" value="quiereHijos">Quiere hijos
                </fieldset><br>

                <fieldset>
                    <legend>Atracción hacia:</legend>
                    <input type="checkbox" name="interesMujeres" value="interesMujeres">Interés en mujeres<br>
                    <input type="checkbox" name="interesHombres" value="interesHombres">Interés en hombres
                </fieldset>

                <div class="m1"><input type="submit" name="Rellenar" value="Confirmar" class="boton ancho100"/></div>
                <hr>
                <div class="m1"><input type="submit" name="cerrarSesion" value="Cerrar sesión" class="boton ancho100"></div>

            </form>
            <div class="col-m-3 col-l-4"></div>
        </main>
        <footer>
            <p>© María Juan Viñas, 2020</p>
        </footer>

    </body>
</html>
