function llamarJson(valor) {
        //Reference the GridView Row.
    var row = valor.parentNode.parentNode;
 
        //Determine the Row Index.
        var message = "Row Index: " + (row.rowIndex - 1);
 
        //Read values from Cells.
        message += "\nCustomer Id: " + row.cells[0].innerHTML;
        message += "\nName: " + row.cells[1].innerHTML;
 
        //Reference the TextBox and read value.
    message += "\nCountry: " + row.cells[2].innerHTML;
 
        //Display the data using JavaScript Alert Message Box.
    //alert(message);


    $("input[ID$='txtNombre']").val(row.cells[1].innerHTML);
    $("input[ID$='txtApellido']").val(row.cells[2].innerHTML);
    $("input[ID$='txtSexo']").val(row.cells[5].innerHTML);

    $("input[ID$='txtTipoDocumento']").val(row.cells[3].innerHTML);
    $("input[ID$='txtNroDoc']").val(row.cells[4].innerHTML);
    $("input[ID$='txtPerfil']").val(row.cells[12].innerHTML);


    ListadoDetalle(row.cells[0].innerHTML);
    ListadoDetalleTelefono(row.cells[0].innerHTML);



    $("#modalAdvertencia").modal("show");

        return false;
}



function ListadoDetalle(values) {

    try {

        $.ajax({
            type: "POST",
            url: 'ListadoActivos.aspx/ListadoMail',
            data: JSON.stringify({ idEmpleado: values }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarMail,
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


function ListadoDetalleTelefono(values) {

    try {

        $.ajax({
            type: "POST",
            url: 'ListadoActivos.aspx/ListadoTelefono',
            data: JSON.stringify({ idEmpleado: values }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarTelefono,
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

function LlenarMail(response) {

    $("#tbodyCorreo tr").remove();

    for (var i = 0; i < response.d.length; i++) {

        var data = [{
            IdCodigo: response.d[i].IdMail,
            CorreoElectronico: response.d[i].CorreoElectronico
        }];

        $.each(data, function (index, value) {
            $("#tbodyCorreo")
                .append("<tr\>"
                + "<td  class=\hide\>" + value.IdCodigo + "</td>"
                + "<td>" + value.CorreoElectronico + "</td>"

                    + "</tr>");

        });

    }

}

function LlenarTelefono(response) {

    $("#tbodyTelefo tr").remove();

    for (var i = 0; i < response.d.length; i++) {

        var data = [{
            IdCodigo: response.d[i].IdTelefono,
            NroTelefono: response.d[i].NumeroTelefono,
            TipoTelefono: response.d[i].TipoTelefono.Descripcion
        }];

        $.each(data, function (index, value) {
            $("#tbodyTelefo")
                .append("<tr\>"
                + "<td  class=\hide\>" + value.IdCodigo + "</td>"
                + "<td>" + value.TipoTelefono + "</td>"
                + "<td>" + value.NroTelefono + "</td>"

                    + "</tr>");

        });

    }

}