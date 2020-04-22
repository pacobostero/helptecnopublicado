function bootboxMostrarMensajePersonalizado(cadenaValor) {
    bootbox.alert(cadenaValor);

    return false;
}

function responseRedirectJs() {

    //if (valueInt==1)
    window.location.href = "Nuevo.aspx";
    //else if (valueInt == 2)
    //    window.location.href = "Listado.aspx";

    return false;
}
function AgregoCorrectamente() {
    
    $("#modaCorrecto").modal("show");
    
}
function limpiarControles(){
    
    $("input[ID$='txtNombre']").val("");
    $("input[ID$='txtApellido']").val("");
    $("input[ID$='txtFechaNacimiento']").val("");
    $("input[ID$='txtNroDocumento']").val("");
    $("input[ID$='txtDomicilio']").val("");
    $("input[ID$='txtNroDomicilio']").val("");
    $("input[ID$='txtCodigoPostal']").val("");
    $("input[ID$='txtCorreoELectronico']").val("");
    $("input[ID$='txtNroTelefono']").val("");
    $("input[ID$='txtLogin']").val("");
    $("input[ID$='txtClave']").val("");

    $("[id*=drpdSexo]").val("Seleccione...");
    $("[id*=drpdTipoDocumento]").val("Seleccione...");
    $("[id*=drpdTipoTelefono]").val("Seleccione...");
    $("[id*=drpdPerfil]").val("Seleccione...");
    $("[id*=drpdPais]").val("Seleccione...");
}

function funcionJS() {
    var msj = "Por favor complete los siguientes datos obligatorios <ul>"  ;
    if (($("[id*=drpdSexo]").val() != "Seleccione...") &&
        ($("[id*=drpdTipoDocumento]").val() != "Seleccione...") &&
        ($("[id*=drpdPerfil]").val() != "Seleccione...") &&
        ($("[id*=drpdPais]").val() != "Seleccione...")) {

        $("[id*=drpdSexo]").css("border-color", "#d2d6de");
        $("[id*=drpdTipoDocumento]").css("border-color", "#d2d6de");
        $("[id*=drpdPerfil]").css("border-color", "#d2d6de");
        $("[id*=drpdPais]").css("border-color", "#d2d6de");
        return false;

    }
    else {

        if ($("[id*=drpdSexo]").val() == "Seleccione...") {
            $("[id*=drpdSexo]").removeAttr("border-color");

            $("[id*=drpdSexo]").css("border-color", "red");
            msj += " <li>Sexo </li>";
        }
        else {
            $("[id*=drpdSexo]").css("border-color", "#d2d6de");
        }

        if ($("[id*=drpdTipoDocumento]").val() == "Seleccione...") {
            $("[id*=drpdTipoDocumento]").css("border-color", "red");
            msj += "  <li>Tipo Documento</li>";
        }
        else {
            $("[id*=drpdTipoDocumento]").css("border-color", "#d2d6de");
        }

        if ($("[id*=drpdPerfil]").val() == "Seleccione...") {
            $("[id*=drpdPerfil]").css("border-color", "red");
            msj += "<li>Perfil</li>";
        }
        else {
            $("[id*=drpdPerfil]").css("border-color", "#d2d6de");
        }

        if ($("[id*=drpdPais]").val() == "Seleccione...") {
            $("[id*=drpdPais]").css("border-color", "red");
            msj += "<li>País</li>";
        } else
        {
            $("[id*=drpdPais]").css("border-color", "#d2d6de");
        }

        msj += "</ul>";
        ErrorMensaje(msj);

        //return true;
    }
}



function CorrectoMensaje() {
    $('#h4TituloMensaje').text("Confirmacion");
    $('#lblMensajeUser').text("Se agregó correctamente el nuevo usuario");
    $("#imageID").attr('src', '../../dist/img/comprobar.png');

}

function ErrorMensaje(mensaje) {
    $('#h4TituloMensaje').text("Error");
    $('#lblMensajeUser').html(mensaje);
    $("#imageID").attr('src', '../../dist/img/advertencia.png');

    $("#myModal").modal("show");
}

function ErrorMensajeInsert(mensaje) {
    $('#h4TituloMensaje').text("Error");
    $('#lblMensajeUser').html(mensaje);
    $("#imageID").attr('src', '../../dist/img/cancelar.png');

    $("#myModal").modal("show");
}

var iContadorGrillaMail = 0;

function LlenarTablaMail() {

    if ($("input[ID$='txtCorreoELectronico']").val() != "") {
        var data = [{
            IdCodigo: iContadorGrillaMail,
            Correo: $("input[ID$='txtCorreoELectronico']").val()
        }];

        iContadorGrillaMail += 1;

        //var iContadorGrillaAux = iContadorGrillaMail - 1;
        $.each(data, function (index, value) {
            $("#tbodyCorreo")
                .append("<tr id=\'fila" + iContadorGrillaMail + "'\>"
                + "<th class=\hide\ scope=\row\>" + value.IdCodigo + "</th>"
                    + "<td>" + value.Correo + "</td>"
                    + "<td> <button onclick=\'eliminarFilaMail(this); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> "
                    + " </td>"
                    + "</tr>");
        });

        $("input[ID$='txtCorreoELectronico']").val("");
        $("input[ID$='txtCorreoELectronico']").focus(); 

        leerTablaMail();

    } else {


    }

}

var iContadorGrillaAux = 0;
function LlenarTablaTelefono() {
    //var iContadorGrillaTelefono = 0;
    if (($("input[ID$='txtNroTelefono']").val() != "") && ($("[id*=drpdTipoTelefono]").val() != "Seleccione...")) {
        var data = [{
            IdCodigo: iContadorGrillaAux,
            NroTelefono: $("input[ID$='txtNroTelefono']").val(),
            TipoTelefono: $("[id*='drpdTipoTelefono'] :selected").text(),
            IdTipoTelefono: $("[id*=drpdTipoTelefono]").val()
        }];

        iContadorGrillaAux += 1;

        //var iContadorGrillaAux = iContadorGrillaAux - 1;
        $.each(data, function (index, value) {
            $("#tbodyTelefo")
                .append("<tr id=\'fila" + iContadorGrillaAux + "'\ >"
                + "<th class=\hide\ scope=\row\>" + value.IdCodigo + "</th>"
                + "<td>" + value.TipoTelefono + "</td>"
                + "<td>" + value.NroTelefono + "</td>"
                + "<td class=\hide\>" + value.IdTipoTelefono + "</td>"
                + "<td> <button onclick=\'eliminarFilaTelefono(this); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> "
                    + " </td>"
                    + "</tr>");
        });

        $("input[ID$='txtNroTelefono']").val("");
        $("input[ID$='txtNroTelefono']").focus(); 
        $("[id*=drpdTipoTelefono]").val("Seleccione...");

        leerTablaTelefono();

    } else {


    }


}


function eliminarFilaTelefono(index) {


    var row = index.parentNode.parentNode;

    var indexs = row.rowIndex;

    $(row).remove();

}


function eliminarFilaMail(index) {


    var row = index.parentNode.parentNode;

    var indexs = row.rowIndex;

    $(row).remove();

}

function leerTablaMail() {
    var correos = "";

    try {
            $("input[ID$='hdCorreo']").val("");

            $('#tableCorreo tr').each(function () {
                correos += $(this).find("td").eq(0).html() + ";";
                });

        $("input[ID$='hdCorreo']").val(correos);

    } catch (e) {

    }

}

function leerTablaTelefono() {
    var telefonos = "";

    try {
        $("input[ID$='hdTelefono']").val("");

        $('#tableTelefono tr').each(function () {
            telefonos += $(this).find("td").eq(1).html() + "|" + $(this).find("td").eq(2).html() + ";";
        });

        $("input[ID$='hdTelefono']").val(telefonos);

    } catch (e) {

    }

}