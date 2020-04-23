function ListadoDetalleTelefono(values, uri) {

    try {

        $.ajax({
            type: "POST",
            url: uri,
            //url: 'ListadoActivos.aspx/ListadoTelefono',
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