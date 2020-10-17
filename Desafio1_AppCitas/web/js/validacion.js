/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
        if(!correcto){
            event.preventDefault();
        }
    });

//******************************************************************************
//---------------------------------DNI------------------------------------------
//******************************************************************************

    dni.addEventListener('input', function (event) {
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

    apodo.addEventListener('input', function (event) {
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

    edad.addEventListener('input', function (event) {
        if (edad.validity.valid) {
            edadError.innerHTML = '';
            edadError.className = 'error';
        } else {
            errorEdad();
        }
    });

    function errorEdad() {
        //No cumple con el pattern
        if (edad.validity.patternMismatch) {
            edadError.textContent = 'Debe introducir una edad válida';
        }
        // Establece el estilo apropiado
        edadError.className = 'error active';
    }

//******************************************************************************
//---------------------------------TELEFONO-------------------------------------
//******************************************************************************

    tfno.addEventListener('input', function (event) {
        if (tfno.validity.valid) {
            tfnoError.innerHTML = '';
            tfnoError.className = 'error';
        } else {
            errorTfno();
        }
    });

    function errorTfno() {
        //No cumple con el pattern
        if (tfno.validity.patternMismatch) {
            tfnoError.textContent = 'El valor introducido debe cumplir este patrón: 000-000-000';
        }
        // Establece el estilo apropiado
        tfnoError.className = 'error active';
    }

//******************************************************************************
//---------------------------------MAIL-----------------------------------------
//******************************************************************************
    mail.addEventListener('input', function (event) {
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
    contra.addEventListener('input', function (event) {
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
            contraError2.textContent = 'Las contraseñas no coinciden';
            contraError2.className = 'error active';
            correcto = false;
        } else {
            contraError2.innerHTML = '';
            contraError2.className = 'error';
            correcto = true;
        }
    }
}