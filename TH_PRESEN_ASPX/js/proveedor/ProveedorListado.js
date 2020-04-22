function llamarJson(valor) {
   


    try {
        ////Reference the GridView Row.
        //debugger;
        var row = valor.parentNode.parentNode;

        ////Determine the Row Index.
        //var message = "Row Index: " + (row.rowIndex - 1);

        ////Read values from Cells.
        //message += "\nCustomer Id: " + row.cells[0].innerHTML;
        //message += "\nName: " + row.cells[1].innerHTML;

        ////Reference the TextBox and read value.
        //message += "\nCountry: " + row.cells[2].innerHTML;

        ////Display the data using JavaScript Alert Message Box.
        ////alert(message);


        $("input[ID$='txtRazonSocial']").val(row.cells[1].innerHTML);
        $("input[ID$='txtTipoDoc']").val(row.cells[3].innerHTML);
        $("input[ID$='txtDocNro']").val(row.cells[4].innerHTML);

        $("input[ID$='txtDireccion']").val(row.cells[5].innerHTML);
        $("input[ID$='txtDireccionNro']").val(row.cells[6].innerHTML);
        $("input[ID$='txtFechaAlta']").val(row.cells[9].innerHTML);


        ListadoDetalle(row.cells[0].innerHTML);
        ListadoDetalleTelefono(row.cells[0].innerHTML);
        ListadoDetalleBanco(row.cells[0].innerHTML);



        $("#modalAdvertencia").modal("show");

        return false;
    } catch (e) {
        
    }
}



function ListadoDetalle(values) {

    try {

        $.ajax({
            type: "POST",
            url: 'ListadoActivo.aspx/ListadoMail',
            data: JSON.stringify({ idProveedor: values }),
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
        console.log(e);
        alert(e);
    }


    return false;
}


function ListadoDetalleTelefono(values) {

    try {

        $.ajax({
            type: "POST",
            url: 'ListadoActivo.aspx/ListadoTelefono',
            data: JSON.stringify({ idProveedor: values }),
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
        console.log(e);
        alert(e);
    }


    return false;
}


function ListadoDetalleBanco(values) {

    try {

        $.ajax({
            type: "POST",
            url: 'ListadoActivo.aspx/ListadoBanco',
            data: JSON.stringify({ idProveedor: values }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarBanco,
            failure: function (response) {
                alert(response);
            },
            error: function (response) {
                alert(response);
            }
        });

    } catch (e) {
        console.log(e);
        alert(e);
    }


    return false;
}

function LlenarMail(response) {

    $("#tbodyCorreo tr").remove();

    if (response.d != null) {
        if (response.d.length > 0) {
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

    }

}

function LlenarTelefono(response) {

    $("#tbodyTelefo tr").remove();

    if (response.d != null) {

        if (response.d.length > 0) {
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

    }




}

function LlenarBanco(response) {

    $("#tbodyBanco tr").remove();

    if (response.d != null) {
        if (response.d.length > 0) {
            for (var i = 0; i < response.d.length; i++) {
                console.log(response.d[0].IdBanco);
                console.log(response.d[0]);

                var data = [{
                    IdBanco: response.d[i].IdBanco,
                    RazonSocial: response.d[i].RazonSocial,
                    Cbu: response.d[i].Cbu,
                    Alias: response.d[i].Alias,
                    IdEstado: response.d[i].IdEstado
                }];

                $.each(data, function (index, value) {
                    $("#tbodyBanco")
                        .append("<tr\>"
                        + "<td  class=\hide\>" + value.IdBanco + "</td>"
                            + "<td>" + value.RazonSocial + "</td>"
                            + "<td>" + value.Cbu + "</td>"
                            + "<td>" + value.Alias + "</td>"
                            + "<td>" + value.IdEstado + "</td>"

                            + "</tr>");

                });

            }
        }

    }




}