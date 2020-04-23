
var idValueSexo = "";
var descripcionValueSexo = "";
var nombreDropDownSexo = "";
var valorComboSexo = "";

function LlamarDropDownSexo(uriLlamado, id, descripcion, dropDownNombre, comboValueDefault) {
    idValue = id;
    descripcionValueSexo = descripcion;
    nombreDropDownSexo = dropDownNombre;
    valorComboSexo = comboValueDefault;

    $.ajax({
        type: "POST",
        url: uriLlamado,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: llenarComboSexo,
        failure: function (response) {
            //alert(response);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus + ": " + XMLHttpRequest.responseText);
        }
    });

}


function llenarComboSexo(response) {
    try {

        $("[id*=" + nombreDropDownSexo + "]").empty();
        $("[id*=" + nombreDropDownSexo + "]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

        for (var i = 0; i < response.d.length; i++) {
            $("[id*=" + nombreDropDownSexo + "]").append($("<option></option>").val(response.d[i][idValue]).html(response.d[i][descripcionValueSexo]));
        }

        $("[id*=" + nombreDropDownSexo + "]").val(valorComboSexo);
    } catch (e) {

    }

}


var idValueTipoDoc = "";
var descripcionValueTipoDoc = "";
var nombreDropDownTipoDoc = "";
var valorComboTipoDoc = "";

function LlamarDropDownTipoDoc(uriLlamado, id, descripcion, dropDownNombre, comboValueDefault) {
    idValueTipoDoc = id;
    descripcionValueTipoDoc = descripcion;
    nombreDropDownTipoDoc = dropDownNombre;
    valorComboTipoDoc = comboValueDefault;

    $.ajax({
        type: "POST",
        url: uriLlamado,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: llenarComboTipoDoc,
        failure: function (response) {
            //alert(response);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus + ": " + XMLHttpRequest.responseText);
        }
    });

}


function llenarComboTipoDoc(response) {
    try {

        $("[id*=" + nombreDropDownTipoDoc + "]").empty();
        $("[id*=" + nombreDropDownTipoDoc + "]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

        for (var i = 0; i < response.d.length; i++) {
            $("[id*=" + nombreDropDownTipoDoc + "]").append($("<option></option>").val(response.d[i][idValueTipoDoc]).html(response.d[i][descripcionValueTipoDoc]));
        }

        $("[id*=" + nombreDropDownTipoDoc + "]").val(valorComboTipoDoc);
    } catch (e) {

    }

}



var idValuePais = "";
var descripcionValuePais = "";
var nombreDropDownPais = "";
var valorComboPais = "";

function LlamarDropDownPais(uriLlamado, id, descripcion, dropDownNombre, comboValueDefault) {
    idValuePais = id;
    descripcionValuePais = descripcion;
    nombreDropDownPais = dropDownNombre;
    valorComboPais = comboValueDefault;

    $.ajax({
        type: "POST",
        url: uriLlamado,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: llenarComboPais,
        failure: function (response) {
            //alert(response);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus + ": " + XMLHttpRequest.responseText);
        }
    });

}


function llenarComboPais(response) {
    try {

        $("[id*=" + nombreDropDownPais + "]").empty();
        $("[id*=" + nombreDropDownPais + "]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

        for (var i = 0; i < response.d.length; i++) {
            $("[id*=" + nombreDropDownPais + "]").append($("<option></option>").val(response.d[i][idValuePais]).html(response.d[i][descripcionValuePais]));
        }

        $("[id*=" + nombreDropDownPais + "]").val(valorComboPais);
    } catch (e) {

    }

}



var idValueRol = "";
var descripcionValueRol = "";
var nombreDropDownRol = "";
var valorComboRol = "";

function LlamarDropDownRol(uriLlamado, id, descripcion, dropDownNombre, comboValueDefault) {
    idValueRol = id;
    descripcionValueRol = descripcion;
    nombreDropDownRol = dropDownNombre;
    valorComboRol = comboValueDefault;

    $.ajax({
        type: "POST",
        url: uriLlamado,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: llenarComboRol,
        failure: function (response) {
            //alert(response);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus + ": " + XMLHttpRequest.responseText);
        }
    });

}


function llenarComboRol(response) {
    try {

        $("[id*=" + nombreDropDownRol + "]").empty();
        $("[id*=" + nombreDropDownRol + "]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

        for (var i = 0; i < response.d.length; i++) {
            $("[id*=" + nombreDropDownRol + "]").append($("<option></option>").val(response.d[i][idValueRol]).html(response.d[i][descripcionValueRol]));
        }

        $("[id*=" + nombreDropDownRol + "]").val(valorComboRol);
    } catch (e) {

    }

}


var idValueEstado = "";
var descripcionValueEstado = "";
var nombreDropDownRolEstado = "";
var valorComboRolEstado = "";

function LlamarDropDownEstado(uriLlamado, id, descripcion, dropDownNombre, comboValueDefault) {
    idValueEstado = id;
    descripcionValueEstado = descripcion;
    nombreDropDownRolEstado = dropDownNombre;
    valorComboRolEstado = comboValueDefault;

    $.ajax({
        type: "POST",
        url: uriLlamado,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: llenarComboEstado,
        failure: function (response) {
            //alert(response);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus + ": " + XMLHttpRequest.responseText);
        }
    });

}


function llenarComboEstado(response) {
    try {

        $("[id*=" + nombreDropDownRolEstado + "]").empty();
        $("[id*=" + nombreDropDownRolEstado + "]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

        for (var i = 0; i < response.d.length; i++) {
            $("[id*=" + nombreDropDownRolEstado + "]").append($("<option></option>").val(response.d[i][idValueEstado]).html(response.d[i][descripcionValueEstado]));
        }

        $("[id*=" + nombreDropDownRolEstado + "]").val(valorComboRolEstado);
    } catch (e) {

    }

}