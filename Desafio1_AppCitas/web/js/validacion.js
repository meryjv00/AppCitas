/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var captchaCorrecto = false;

function validacionRegistro() {
    //---------------------------VARIABLES
    const form = document.getElementById("registro");

    const mail = document.getElementById("email");
    const dni = document.getElementById("dni");
    const apodo = document.getElementById("apodo");
    const contra = document.getElementById("psswd");
    const contra2 = document.getElementById("psswd2");
    const tfno = document.getElementById("tfno");
    const edad = document.getElementById("edad");

    const mailError = document.querySelector('#email + span.error');
    const dniError = document.querySelector('#dni + span.error');
    const apodoError = document.querySelector('#apodo + span.error');
    const contraError = document.querySelector('#psswd + span.error');
    const contraError2 = document.querySelector('#psswd2 + span.error');
    const tfnoError = document.querySelector('#tfno + span.error');
    const edadError = document.querySelector('#edad + span.error');

    //-----------------------------DIBUJE CAPTCHA
    captcha();

    //-----------------------------FORMULARIO SUBMIT
    var correcto;

    form.addEventListener('submit', function (event) {
        if (!mail.validity.valid) {
            errorMail();
            event.preventDefault();
        }
        if (!dni.validity.valid) {
            errorDni();
            event.preventDefault();
        }
        if (!apodo.validity.valid) {
            errorApodo();
            event.preventDefault();
        }
        if (!contra.validity.valid) {
            errorContra();
            event.preventDefault();
        }
        if (!tfno.validity.valid) {
            errorTfno();
            event.preventDefault();
        }
        if (!edad.validity.valid) {
            errorEdad();
            event.preventDefault();
        }

        comprobarContras();
        if (!correcto) {
            event.preventDefault();
        }


        if (!captchaCorrecto) {
            event.preventDefault();
            captcha();
            var captchaMensaje = document.getElementById("mensajeCaptcha");
            captchaMensaje.innerHTML = "Captcha incorrecto.";
            captchaMensaje.className = 'error active';
            var txt = document.getElementById("txtInput");
            txt.value = '';
        }
    });

//******************************************************************************
//---------------------------------DNI------------------------------------------
//******************************************************************************
    //focus - blur
    dni.addEventListener('blur', function (event) {
        if (dni.validity.valid) {
            dniError.innerHTML = '';
            dniError.className = 'error';
        } else {
            errorDni();
        }
    });

    function errorDni() {
        //Campo vacío
        if (dni.validity.valueMissing) {
            dniError.textContent = 'Debe introducir un dni.';
            //No cumple con el pattern
        } else if (dni.validity.patternMismatch) {
            dniError.textContent = 'El valor introducido debe cumplir este patrón: 00.000.000-X';
        }
        // Establece el estilo apropiado
        dniError.className = 'error active';
    }

//******************************************************************************
//---------------------------------APODO----------------------------------------
//******************************************************************************

    apodo.addEventListener('blur', function (event) {
        if (apodo.validity.valid) {
            apodoError.innerHTML = '';
            apodoError.className = 'error';
        } else {
            errorApodo();
        }
    });

    function errorApodo() {
        //Campo vacío
        if (apodo.validity.valueMissing) {
            apodoError.textContent = 'Debe introducir un apodo.';
        } else if (apodo.validity.tooShort) {
            apodoError.textContent = 'El apodo debe tener al menos ' + apodo.minLength + ' caracteres; ha introducido ' + apodo.value.length;
        } else if (apodo.validity.tooLong) {
            apodoError.textContent = 'El apodo debe tener como máximo ' + apodo.maxLength + ' caracteres; ha introducido ' + apodo.value.length;
        }
        // Establece el estilo apropiado
        apodoError.className = 'error active';
    }


//******************************************************************************
//---------------------------------EDAD-----------------------------------------
//******************************************************************************

    edad.addEventListener('blur', function (event) {
        if (edad.validity.valid) {
            edadError.innerHTML = '';
            edadError.className = 'error';
        } else {
            errorEdad();
        }
    });

    function errorEdad() {
        if (edad.validity.valueMissing) {
            edadError.textContent = 'Debe introducir una edad.';
        }
        //No cumple con el pattern
        else if (edad.validity.patternMismatch) {
            edadError.textContent = 'Debe introducir una edad válida.';
        }
        // Establece el estilo apropiado
        edadError.className = 'error active';
    }

//******************************************************************************
//---------------------------------TELEFONO-------------------------------------
//******************************************************************************

    tfno.addEventListener('blur', function (event) {
        if (tfno.validity.valid) {
            tfnoError.innerHTML = '';
            tfnoError.className = 'error';
        } else {
            errorTfno();
        }
    });

    function errorTfno() {
        if (tfno.validity.valueMissing) {
            tfnoError.textContent = 'Debe introducir un teléfono.';
        }
        //No cumple con el pattern
        else if (tfno.validity.patternMismatch) {
            tfnoError.textContent = 'El valor introducido debe cumplir este patrón: 000-000-000';
        }
        // Establece el estilo apropiado
        tfnoError.className = 'error active';
    }

//******************************************************************************
//---------------------------------MAIL-----------------------------------------
//******************************************************************************
    mail.addEventListener('blur', function (event) {
        if (mail.validity.valid) {
            mailError.innerHTML = '';
            mailError.className = 'error';
        } else {
            errorMail();
        }
    });

    function errorMail() {
        //Campo vacío
        if (mail.validity.valueMissing) {
            mailError.textContent = 'Debe introducir una dirección de correo electrónico.';
            //No cumple los requisitos del campo email
        } else if (mail.validity.typeMismatch) {
            mailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico ';
            //Datos demasiado cortos
        } else if (mail.validity.tooShort) {
            mailError.textContent = 'El correo electrónico debe tener al menos ' + mail.minLength + ' caracteres; ha introducido ' + mail.value.length;
        }
        // Establece el estilo apropiado
        mailError.className = 'error active';
    }


//******************************************************************************
//---------------------------------CONTRA---------------------------------------
//******************************************************************************
    contra.addEventListener('blur', function (event) {
        if (contra.validity.valid) {
            contraError.innerHTML = '';
            contraError.className = 'error';
        } else {
            errorContra();
        }
    });

    function errorContra() {
        //Campo vacío
        if (contra.validity.valueMissing) {
            contraError.textContent = 'Debe introducir una contraseña.';
            //Dato demasiado cortos
        } else if (contra.validity.tooShort) {
            contraError.textContent = 'La contraseña debe tener al menos ' + contra.minLength + ' caracteres; ha introducido ' + contra.value.length;
            //Dato demasiado largo
        } else if (contra.validity.tooLong) {
            contraError.textContent = 'La contraseña debe tener como máximo ' + contra.maxLength + ' caracteres; ha introducido ' + contra.value.length;
        }
        // Establece el estilo apropiado
        contraError.className = 'error active';
    }


//******************************************************************************
//-----------------------------CONTRASEÑAS IGUALES------------------------------
//******************************************************************************
    contra2.addEventListener('input', function (event) {
        comprobarContras();
    });

    function comprobarContras() {
        var c1 = contra.value;
        var c2 = contra2.value;
        if (c1 != c2) {
            contraError2.textContent = 'Las contraseñas no coinciden.';
            contraError2.className = 'error active';
            correcto = false;
        } else {
            contraError2.innerHTML = '';
            contraError2.className = 'error';
            correcto = true;
        }
    }
}


function validacionLogin() {
    const form = document.getElementById("login");
    const mail = document.getElementById("email");
    const mailError = document.querySelector('#email + span.error');

    form.addEventListener('submit', function (event) {
        if (!mail.validity.valid) {
            errorMail();
            event.preventDefault();
        }
    });

    mail.addEventListener('blur', function (event) {
        if (mail.validity.valid) {
            mailError.innerHTML = '';
            mailError.className = 'error';
        } else {
            errorMail();
        }
    });

    function errorMail() {
        //Campo vacío
        if (mail.validity.valueMissing) {
            mailError.textContent = 'Debe introducir una dirección de correo electrónico.';
            //No cumple los requisitos del campo email
        } else if (mail.validity.typeMismatch) {
            mailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
            //Datos demasiado cortos
        }
        // Establece el estilo apropiado
        mailError.className = 'error active';
    }


}

//-----------------------------CAPTCHA
function captcha() {
    var n = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    var op = new Array('+', '-', '*');
    var i;
    for (i = 0; i < 6; i++) {
        var a = n[Math.floor(Math.random() * n.length)];
        var b = n[Math.floor(Math.random() * n.length)];
        var op = op[Math.floor(Math.random() * op.length)]
    }
    var code = '';
    code = a + op + b;
    creaIMG(code);
    document.cookie = 'code=' + code + ';max-age=120';
}

function validCaptcha(txtInput) {
    var captchaMensaje = document.getElementById("mensajeCaptcha");
    var botonRefrescar = document.getElementById("refresh");
    var txt = document.getElementById("txtInput");
    var code = cargarCookie();
    var string1 = removeSpaces(code);
    var n1 = parseInt(string1.substr(0, 1));
    var op = string1.substr(1, 1);
    var n2 = parseInt(string1.substr(2, 1));
    var rdo;
    var string2 = removeSpaces(document.getElementById(txtInput).value);
    if (op == '+') {
        rdo = n1 + n2;
    }
    if (op == '*') {
        rdo = n1 * n2;
    }
    if (op == '-') {
        rdo = n1 - n2;
    }

    if (rdo == string2) {
        captchaMensaje.innerHTML = "Captcha correcto.";
        captchaMensaje.className = 'error';
        captchaCorrecto = true;
        botonRefrescar.style.visibility = 'hidden';
    } else {
        captchaMensaje.innerHTML = "Captcha incorrecto.";
        captchaMensaje.className = 'error active';
        txt.value = '';
        captcha();
    }
}

function cargarCookie() {
    var nom_cookie, valor_cookie, temp;
    var array_cookies = document.cookie.split('; ');
    for (var i = 0; i < array_cookies.length; i++) {
        temp = array_cookies[i].split('=');
        nom_cookie = temp[0];
        valor_cookie = temp[1];
        return valor_cookie;
    }
}
function removeSpaces(string) {
    return string.split(' ').join('');
}

function creaIMG(texto) {
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 250;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "black";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "black";
    ctxCanvas.fillText(texto, x, y);
}




//-----------------------------BARRA PROGRESO
function avanzar() {
    var elem = document.getElementById("progreso");
    var width = 1;
    var id = setInterval(frame, 100);
    var boton = document.getElementById("ir");

    function frame() {
        if (width >= 100) {
            clearInterval(id);
            boton.style.visibility = 'visible';
        } else {
            width++;
            elem.style.width = width + '%';
            elem.innerHTML = width * 1 + '%';
        }
    }
}