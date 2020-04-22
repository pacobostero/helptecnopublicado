var iContadorGrilla = 0 ;
var ordenCompraMin = { IdProveedor: 0, IdEmpleado: 0 };
var ordenCompraDetalleMin = [];





function SeleccionComboProveedor()
{
    var values = $("[id*=drpdProveedor]").val();

    try {

        $.ajax({
            type: "POST",
            url: 'Nuevo.aspx/ListProveedorProducto',
            data: JSON.stringify({ idProveedor: values}),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarComboProveedor,
            failure: function (response) {
                alert(response);
            },
            error: function (response) {
                alert(response);
            }
        });

    } catch (e) {
        alert(e);
    }


    return false;
}

function LlenarComboProveedor(response) {

    var ddlCustomers = $("[id*=drpProducto]");

    if (response.d.length > 0) {

        ddlCustomers.empty().append('<option selected="selected" value="0">Seleccione...</option>');
        for (var i = 0; i < response.d.length; i++) {
            ddlCustomers.append($("<option></option>").val(response.d[i]['IdProducto']).html(response.d[i]['Descripcion']));
        }

        $("[id*=drpProducto]").focus();

    }
    else {
        ddlCustomers.empty().append('<option selected="selected" value="0">Sin registros</option>');
    }

}

function AlumnosExiste(response)
{
    alert(response);
}
function CargarDatosAlumno() {

    $.ajax({
        type: "POST",
        url: 'Nuevo.aspx/AlumnoExisteDato',
        data: JSON.stringify({ Legajo: JSON.stringify(23), CodDoc: JSON.stringify(23), NroDoc: JSON.stringify(23) }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: AlumnosExiste,
        failure: function (response) {
            alert(response.d);
        },
        error: function (response) {
            alert(response.d);
        }
    });

}


function SeleccionComboTipoProducto() {
    var values = $("[id*=drpProducto]").val();

    try {

        $.ajax({
            type: "POST",
            url: 'Nuevo.aspx/ProductoTipoProducto',
            data: JSON.stringify({ idTipoProducto: values }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarTipoProductotxt,
            failure: function (response) {
                alert(response);
            },
            error: function (response) {
                alert(response);
            }
        });

    } catch (e) {
        alert(e);
    }


    return false;
}
function LlenarTipoProductotxt(response){

    try {

            $("input[ID$='txtTipo']").val("");

            if (response.d.Descripcion != null) {
                if (response.d.Descripcion != '') {
                    $("input[ID$='txtTipo']").val(response.d.Descripcion);
                    $("[id*=drpUnidadMedida]").focus();
                }
                else {
                    $("input[ID$='txtTipo']").val("Sin registros");
                }

            } else {
                $("input[ID$='txtTipo']").val("Sin registros");
            }



    } catch (e) {

    }
}

function LlenarTablaHTML() {

    $("[id*=drpdProveedor]").prop("disabled", true);
    $("[id*=drpdProveedor]").css({ "background-color": "#F3F2D7" });

    if (($("[id*=drpProducto]").val() != "Seleccione...") &&
        ($("input[ID$='txtTipo']").val() != "") &&
        ($("[id*='drpUnidadMedida'] :selected").text() != "Seleccione...") &&
        ($("input[ID$='txtCantidad']").val() > 0)) {

        iContadorGrilla += 1;

        if (iContadorGrilla == 1) {
            ordenCompraMin.IdEmpleado = parseInt(1);
            ordenCompraMin.IdProveedor = parseInt($("[id*=drpdProveedor]").val());
        }

        var data = [{
            IdCodigo: iContadorGrilla,
            CodProducto: $("[id*=drpProducto]").val(),
            Producto: $("#drpProducto option:selected").text(),
            Tipo: $("input[ID$='txtTipo']").val(),
            CogidoUnidadMedida: $("[id*=drpUnidadMedida]").val(),
            UnidadMedida: $("[id*='drpUnidadMedida'] :selected").text(),
            Cantidad: $("input[ID$='txtCantidad']").val()
        }];
        //$("[id*='drpUnidadMedida'] :selected").text()

        var iContadorGrillaAux = iContadorGrilla - 1;
        $.each(data, function (index, value) {
            $("#data")
                .append("<tr id=\'fila" + iContadorGrillaAux + "'\>"
                    + "<th  scope=\row\>" + value.IdCodigo + "</th>"
                    + "<td>" + value.CodProducto + "</td>"
                    + "<td>" + value.Producto + "</td>"
                    + "<td>" + value.Tipo + "</td>"
                    + "<td>" + value.CogidoUnidadMedida + "</td>"
                    + "<td>" + value.UnidadMedida + "</td>"
                    + "<td>" + value.Cantidad + "</td>" 
                + "<td> <button onclick=\'eliminarFila(" + iContadorGrillaAux + "); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> " 
                + " <button onclick=\'eliminarFila(" + iContadorGrillaAux + "); return false;'\ class= \'btn btn-warning'\> <span class=\'glyphicon glyphicon-pencil'\></span></button></td>"
                + "</tr>");
        });

        ordenCompraDetalleMin.push({
            IdProducto: parseInt($("[id*=drpProducto]").val()),
            IdUnidadMedida: parseInt($("[id*=drpUnidadMedida]").val()),
            Cantidad: parseInt($("input[ID$='txtCantidad']").val())
        });

        $("input[ID$='txtTipo']").val("");
        $("input[ID$='txtCantidad']").val("");
        $("[id*=drpUnidadMedida]").val("Seleccione...");
        $("[id*=drpProducto]").val("0");

    }
    else {
        ErrorMensajeInsert("Por favor antes de agregar, verifique los campos estén completos");
    }



    return false;
}

function onchangeUnidadMedida() {

    try {

        $("input[ID$='txtCantidad']").focus();
        return false;

    } catch (e) {

    }

}

function myfunction() {
    $('#tableIdProveedor tr').each(function () {

        var pk = $(this).find("td").eq(0).html();
        var nombre = $(this).find("td").eq(1).html();
        var apellidos = $(this).find("td").eq(3).html();

        console.log(apellidos);

    });
}



function GenerarOrdenCompraProveedor() {
    
    try {

        if ((ordenCompraMin.IdEmpleado > 0) &&
            (ordenCompraMin.IdProveedor > 0) &&
            (ordenCompraDetalleMin.length > 0)) {

            $.ajax({
                type: "POST",
                url: 'Nuevo.aspx/GuardarProveedorOrdenCompra',
                data: JSON.stringify({ ordenCompraMin: ordenCompraMin, ordenCompraDetalleMin: JSON.stringify(ordenCompraDetalleMin) }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: ObtenerNroOrdenCompra,
                failure: function (response) {
                    alert(response);
                },
                error: function (response) {
                    alert(response);
                }
            });

        }
        else {
            ErrorMensajeInsert("No se encontró ningún registro en la grilla");
        }

    } catch (e) {
        alert(e);
    }


    return false;
}

function ObtenerNroOrdenCompra(response) {

    CorrectoMensaje(response.d)
    //window.location.href = "Nuevo.aspx";

}

function CorrectoMensaje(valor) {
    $('#h4TituloMensaje').text("Operación exitosa");
    $('#lblMensajeUser').text("Se generó correctamente la orden de compra Nro. " + valor +", por favor indicarle al administrador de autorizar la orden");
    $("#imageID").attr('src', '../../dist/img/comprobar.png');

    $("#myModal").modal("show");
}


function ErrorMensajeInsert(mensaje) {
    $('#h4TituloMensaje').text("Error");
    $('#lblMensajeUser').html(mensaje);
    $("#imageID").attr('src', '../../dist/img/cancelar.png');

    $("#myModal").modal("show");
}

function eliminarFila(index) {
    var arrayNuevoDato = [];
    var eliminarIndice = false;
    var indeceArrayEliminar;

    //Valido para antes de eliminar
    if ($("#fila" + index).length > 0) {

        var arrayDelete = [];
        

        arrayDelete.push({
            IdProducto: parseInt($("#fila" + index)[0].childNodes[1].innerText),
            IdUnidadMedida: parseInt($("#fila" + index)[0].childNodes[4].innerText),
            Cantidad: parseInt($("#fila" + index)[0].childNodes[6].innerText)
        });


        for (var i = 0; i < ordenCompraDetalleMin.length; i++) {

            if ((ordenCompraDetalleMin[i].IdProducto == $("#fila" + index)[0].childNodes[1].innerText) &&
                (ordenCompraDetalleMin[i].IdUnidadMedida == $("#fila" + index)[0].childNodes[4].innerText) &&
                (ordenCompraDetalleMin[i].Cantidad == $("#fila" + index)[0].childNodes[6].innerText)) {

                eliminarIndice = true;

                indeceArrayEliminar = i;

            }
            else {
                arrayNuevoDato.push({
                    IdProducto: ordenCompraDetalleMin[i].IdProducto,
                    IdUnidadMedida: ordenCompraDetalleMin[i].IdUnidadMedida,
                    Cantidad: ordenCompraDetalleMin[i].Cantidad
                });
            }

        }

        if (eliminarIndice) {
            delete (ordenCompraDetalleMin[indeceArrayEliminar]);
            $("#fila" + index).remove();

            if (ordenCompraDetalleMin.length == 1) {

                iContadorGrilla = 0;
                habilitarComboProveedor();
            }
        }

        ordenCompraDetalleMin = null;
        ordenCompraDetalleMin = arrayNuevoDato;

    }



}

function responseRedirectJs() {

    window.location.href = "Nuevo.aspx";
    return false;
}

function habilitarComboProveedor() {
    $("[id*=drpdProveedor]").prop("disabled", false);
    $("[id*=drpdProveedor]").css({ "background-color": "#F3F2D7" });
    $("[id*=drpdProveedor]").val("Seleccione...");
}