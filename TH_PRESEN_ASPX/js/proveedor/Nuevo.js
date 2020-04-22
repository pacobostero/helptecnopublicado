function limpiarControles() {

    $("input[ID$='txtRazonSocial']").val("");
    $("input[ID$='txtNroDocumento']").val("");
    $("input[ID$='txtDomicilio']").val("");
    $("input[ID$='txtNroDomicilio']").val("");
    $("input[ID$='txtCodigoPostal']").val("");
    $("input[ID$='txtCorreoELectronico']").val("");
    $("input[ID$='txtNroTelefono']").val("");



    $("[id*=drpdTipoDocumento]").val("Seleccione...");
    $("[id*=drpdTipoTelefono]").val("Seleccione...");

}

function AgregoCorrectamente() {

    $("#modaCorrecto").modal("show");

}

function funcionJS() {
    var msj = "Por favor complete los siguientes datos obligatorios <ul>";
    if (($("[id*=drpdTipoDocumento]").val() != "Seleccione...") &&
        ($("[id*=drpdTipoTelefono]").val() != "Seleccione...")) {

        $("[id*=drpdTipoDocumento]").css("border-color", "#d2d6de");
        $("[id*=drpdTipoTelefono]").css("border-color", "#d2d6de");

        return false;

    }
    else {

        if ($("[id*=drpdTipoTelefono]").val() == "Seleccione...") {
            $("[id*=drpdTipoTelefono]").removeAttr("border-color");

            $("[id*=drpdTipoTelefono]").css("border-color", "red");
            msj += " <li>Sexo </li>";
        }
        else {
            $("[id*=drpdTipoTelefono]").css("border-color", "#d2d6de");
        }

        if ($("[id*=drpdTipoDocumento]").val() == "Seleccione...") {
            $("[id*=drpdTipoDocumento]").css("border-color", "red");
            msj += "  <li>Tipo Documento</li>";
        }
        else {
            $("[id*=drpdTipoDocumento]").css("border-color", "#d2d6de");
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

function ejecutarmensaje() {
    $("#modaCorrecto").modal("show");
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

var iContadorGrillaBanco = 0;
function LlenarTablaBanco() {
    
    if (($("[id*=drpBancos]").val() != "Seleccione..." && $("input[ID$='txtCbu']").val() != "") ||
        ($("[id*=drpBancos]").val() != "Seleccione..." && $("input[ID$='txtAlias']").val() != ""))
    {
        var data = [{
            IdCodigo: iContadorGrillaBanco,
            Cbu: $("input[ID$='txtCbu']").val(),
            Alias: $("input[ID$='txtAlias']").val(),
            Banco: $("[id*='drpBancos'] :selected").text(),
            IdBanco: $("[id*=drpBancos]").val()
        }];

        iContadorGrillaBanco += 1;

        $.each(data, function (index, value) {
            $("#tbodyBanco")
                .append("<tr id=\'fila" + iContadorGrillaBanco + "'\ >"
                + "<th class=\hide\ scope=\row\>" + value.IdCodigo + "</th>"
                
                + "<td>" + value.Banco + "</td>"
                + "<td>" + value.Cbu + "</td>"
                + "<td>" + value.Alias + "</td>"
                + "<td class=\hide\>" + value.IdBanco + "</td>"
                + "<td> <button onclick=\'eliminarFilaTelefono(this); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> "
                    + " </td>"
                    + "</tr>");
        });


        $("[id*=drpBancos]").val("Seleccione...");
        $("input[ID$='txtCbu']").val("");
        $("input[ID$='txtAlias']").val("");

        leerTablaBanco();
    }
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

function leerTablaBanco() {
    var banco = "";

    try {
        $("input[ID$='hdBanco']").val("");

        $('#tableBanco tr').each(function () {
            banco += $(this).find("td").eq(0).html() + "|" + $(this).find("td").eq(1).html() + "|" + $(this).find("td").eq(2).html() + "|" + $(this).find("td").eq(3).html() + ";";
        });

        $("input[ID$='hdBanco']").val(banco);

    } catch (e) {

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

function eliminarFilaBanco(index) {


    var row = index.parentNode.parentNode;

    var indexs = row.rowIndex;

    $(row).remove();

}