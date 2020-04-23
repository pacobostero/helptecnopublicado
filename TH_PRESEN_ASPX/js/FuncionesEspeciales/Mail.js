function ListadoDetalleMail(values, uri) {

    try {

        $.ajax({
            type: "POST",
            url: uri,
            data: JSON.stringify({ idEmpleado: values }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: LlenarDetalleMail,
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


function LlenarDetalleMail(response) {

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