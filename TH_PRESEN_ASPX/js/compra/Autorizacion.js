function SeleccionNroOrdenCompra() {
    var values = $("[id*=drpdNroOrdenCompra]").val();

    try {

        if (values != 'Seleccione...') {

            $.ajax({
                type: "POST",
                url: 'Autorizacion.aspx/ListDetalleCompraXNroOrdenCompra',
                data: JSON.stringify({ idNroOrdenCompra: values }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: LlenarGrilla,
                failure: function (response) {
                    alert(response);
                },
                error: function (response) {
                    alert(response);
                }
            });
        }
        else {
            responseRedirectJs();
            //__doPostBack('Button2', 'My Argument');    
            //$.ajax({
            //    type: "POST",
            //    url: 'Autorizacion.aspx/ListadoTodo',
            //    data: JSON.stringify({ idNroOrdenCompra: values }),
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: LlenarGrillaTodo,
            //    failure: function (response) {
            //        alert(response);
            //    },
            //    error: function (response) {
            //        alert(response);
            //    }
            //});
        }



    } catch (e) {
        alert(e);
    }


    return false;
}

function LlenarGrilla(response) {

    if (response.d.length > 0) {

        var row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
        $("[id*=grvListadoGeneral] tr").not($("[id*=grvListadoGeneral] tr:first-child")).remove();
        

        $("#grvListadoGeneral").append("<tr><th scope=/col/>Nro. Orden</th><th scope=/col/>Codigo Detalle</th><th scope=/col/>Producto</th><th scope=/col/>Tipo</th><th scope=/col/>Cantidad</th><th scope=/col/>Generado</th><th scope=/col/>Medida</th><th scope=/col/>Estado</th><th scope=/col/>Fecha Alta</th><th scope=/col/>Fecha Recepcion</th></tr>");

        for (var i = 0; i < response.d.length; i++) {

            if (i == 0) {
                $("input[ID$='txtProveedor']").val(response.d[i].Proveedor.RazonSocial);
                $("input[ID$='txtGeneradoUsuario']").val(response.d[i].Empleado.Nombre);
                $("input[ID$='txtEstado']").val(response.d[i].Estado.Descripcion);
            }

            $("td", row).eq(0).html(response.d[i].IdOrdenCompra );
            $("td", row).eq(1).html(response.d[i].IdDetalleCompra);
            $("td", row).eq(2).html(response.d[i].Producto.Descripcion);
            $("td", row).eq(3).html(response.d[i].TipoProducto.Descripcion);
            $("td", row).eq(4).html(response.d[i].Cantidad);
            $("td", row).eq(5).html(response.d[i].Empleado.Nombre);
            $("td", row).eq(6).html(response.d[i].UnidadMedida.Descripcion);
            $("td", row).eq(7).html(response.d[i].Estado.Descripcion);
            $("td", row).eq(8).html(response.d[i].FechaAlta.slice(0, 10).split('-').reverse().join('/'));


            if (response.d[i].fechaRecepcion.slice(0, 10).split('-').reverse().join('/') != "01/01/0001") {
                $("td", row).eq(9).html(response.d[i].fechaRecepcion.slice(0, 10).split('-').reverse().join('/'));
            }
            else {
                $("td", row).eq(9).html("");
            }
            $("[id*=grvListadoGeneral]").append(row);
            row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
        }

    }

}

function responseRedirectJs() {

    window.location.href = "Autorizacion.aspx";
    return false;
}

//function LlenarGrillaTodo(response) {

//    if (response.d.length > 0) {

//        var row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
//        $("[id*=grvListadoGeneral] tr").not($("[id*=grvListadoGeneral] tr:first-child")).remove();


//        $("#grvListadoGeneral").append("<tr><th scope=/col/>Nro. Orden</th><th scope=/col/>Codigo Detalle</th><th scope=/col/>Producto</th><th scope=/col/>Tipo</th><th scope=/col/>Cantidad</th><th scope=/col/>Generado</th><th scope=/col/>Medida</th><th scope=/col/>Estado</th><th scope=/col/>Fecha Alta</th><th scope=/col/>Fecha Recepcion</th></tr>");

//        for (var i = 0; i < response.d.length; i++) {

//            if (i == 0) {
//                $("input[ID$='txtProveedor']").val(response.d[i].Proveedor.RazonSocial);
//                $("input[ID$='txtGeneradoUsuario']").val(response.d[i].Empleado.Nombre);
//                $("input[ID$='txtEstado']").val(response.d[i].Estado.Descripcion);
//            }

//            $("td", row).eq(0).html(response.d[i].IdOrdenCompra);
//            $("td", row).eq(1).html(response.d[i].IdDetalleCompra);
//            $("td", row).eq(2).html(response.d[i].Producto.Descripcion);
//            $("td", row).eq(3).html(response.d[i].TipoProducto.Descripcion);
//            $("td", row).eq(4).html(response.d[i].Cantidad);
//            $("td", row).eq(5).html(response.d[i].Empleado.Nombre);
//            $("td", row).eq(6).html(response.d[i].UnidadMedida.Descripcion);
//            $("td", row).eq(7).html(response.d[i].Estado.Descripcion);
//            $("td", row).eq(8).html(response.d[i].FechaAlta.slice(0, 10).split('-').reverse().join('/'));


//            if (response.d[i].fechaRecepcion.slice(0, 10).split('-').reverse().join('/') != "01/01/0001") {
//                $("td", row).eq(9).html(response.d[i].fechaRecepcion.slice(0, 10).split('-').reverse().join('/'));
//            }
//            else {
//                $("td", row).eq(9).html("");
//            }
//            $("[id*=grvListadoGeneral]").append(row);
//            row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
//        }

//    }

//}