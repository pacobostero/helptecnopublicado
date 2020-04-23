//function llamarJson(valor) {
//    //Reference the GridView Row.
//    var row = valor.parentNode.parentNode;

//    //Determine the Row Index.
//    var message = "Row Index: " + (row.rowIndex - 1);

//    //Read values from Cells.
//    message += "\nCustomer Id: " + row.cells[0].innerHTML;
//    message += "\nName: " + row.cells[1].innerHTML;

//    //Reference the TextBox and read value.
//    message += "\nCountry: " + row.cells[2].innerHTML;

//    //Display the data using JavaScript Alert Message Box.
//    //alert(message);


//    $("input[ID$='txtNombre']").val(row.cells[1].innerHTML);
//    $("input[ID$='txtApellido']").val(row.cells[2].innerHTML);
//    $("input[ID$='txtSexo']").val(row.cells[5].innerHTML);

//    $("input[ID$='txtTipoDocumento']").val(row.cells[3].innerHTML);
//    $("input[ID$='txtNroDoc']").val(row.cells[4].innerHTML);
//    $("input[ID$='txtPerfil']").val(row.cells[12].innerHTML);


//    ListadoDetalle(row.cells[0].innerHTML);
//    ListadoDetalleTelefono(row.cells[0].innerHTML);



//    $("#modalAdvertencia").modal("show");

//    return false;
//}

function bajaEmpleado(valor) {
    try {
            var row = valor.parentNode.parentNode;

            //Determine the Row Index.
            //var message = "Row Index: " + (row.rowIndex - 1);

            ////Read values from Cells.
            var codEmpleado = row.cells[0].innerHTML;
            //    message += "\nName: " + row.cells[1].innerHTML;

            //    //Reference the TextBox and read value.
            //message += "\nCountry: " + row.cells[2].innerHTML;


            $.ajax({
                type: "POST",
                url: 'ModificarEmpleado.aspx/EmpleadosBaja',
                data: JSON.stringify({ idEmpleado:codEmpleado }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: LlenarTablaBaja,
                failure: function (response) {
                    alert(response);
                },
                error: function (response) {
                    alert(response);
                }
            });


    } catch (e) {

    }

}

function ListadoFiltroEmpleado() {
    try {

        if (($("[id*=drpdTipoDocumento]").val() != "Seleccione...") ||
            ($("input[ID$='txtNroDocFiltro']").val() != "") ||
            ($("input[ID$='txtNombreFiltro']").val() != "") ||
            ($("input[ID$='txtApellidoFiltro']").val() != "") ||
            ($("[id*=drpdSexo]").val() != "Seleccione...") ||
            ($("[id*=drpdPais]").val() != "Seleccione...") ||
            ($("[id*=drpdEstado]").val() != "Seleccione...") ||
            ($("[id*=drpdPerfil]").val() != "Seleccione...")) {



            var tipoDoc = "0";
            var tNroDoc = "0";

            var nombre = "0";
            var apellido = "0";

            var sexo = "0";
            var pais = "0";
            var perfil = "0";
            var estado = "0";

            if ($("[id*=drpdTipoDocumento]").val() != "Seleccione...") {
                tipoDoc = $("[id*=drpdTipoDocumento]").val();
            }
            if ($("input[ID$='txtNroDocFiltro']").val() != "") {

                tNroDoc = $("input[ID$='txtNroDocFiltro']").val();
            }

            if ($("input[ID$='txtNombreFiltro']").val() != "") {
                nombre = $("input[ID$='txtNombreFiltro']").val();
            }

            if ($("input[ID$='txtApellidoFiltro']").val() != "") {

                apellido = $("input[ID$='txtApellidoFiltro']").val();
            }

            if($("[id*=drpdSexo]").val() != "Seleccione...") {
                sexo = $("[id*=drpdSexo]").val();
            }

            if ($("[id*=drpdPais]").val() != "Seleccione...") {
                pais = $("[id*=drpdPais]").val();
            }

            if($("[id*=drpdPerfil]").val() != "Seleccione...") {
                perfil = $("[id*=drpdPerfil]").val();
            }

            if ($("[id*=drpdEstado]").val() != "Seleccione...") {
                estado = $("[id*=drpdEstado]").val();
            }

            $.ajax({
                type: "POST",
                url: 'ModificarEmpleado.aspx/empleadosFiltro',
                data: JSON.stringify({ nombre: nombre, apellido: apellido, idSexo: sexo, idEstado: estado, idPais: pais, idTipoRol: perfil, idTipoDocumento: tipoDoc, nroDocumento: tNroDoc}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: LlenarTablaFiltro,
                failure: function (response) {
                    alert(response);
                },
                error: function (response) {
                    alert(response);
                }
            });


        }

    } catch (e) {
        alert(e);
    }


    return false;
}

function LlenarTablaFiltro(response) {

    if (response.d.length > 0) {

        var row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
        $("[id*=grvListadoGeneral] tr").not($("[id*=grvListadoGeneral] tr:first-child")).remove();


        $("#grvListadoGeneral").append("<tr>"
            + "< th scope = /col/  class=\hide\ > IdEmpleado</th > "
                                                + "<th scope=/col /> Nombre</th >"
                                                + "<th scope=/col /> Apellido</th > "
            + "<th scope=/col class=\hide\ /> idTipoDocumento </th > "
                                                + "<th scope=/col />Tipo Doc</th >"
                                                + "<th scope=/col />Nro. Doc</th > "
            + "<th scope=/col class=\hide\ />idSexo</th > "
                                                + "<th scope=/col /> Sexo </th > "
                                                + "<th scope=/col /> Fecha Nacimiento</th >"
                                                + "<th scope=/col />Dirección</th >"
                                                + "<th scope=/col />Nro.  </th >"
                                                + "<th scope=/col />Cod. Postal  </th >"
            + "<th scope=/col class=\hide\ /> idPais </th >"
                                                + "<th scope=/col />Nacionalidad  </th >"
            + "<th scope=/col  class=\hide\ />idEstado  </th >"
                                                + "<th scope=/col />Estado  </th >"
            + "<th scope=/col class=\hide\ /> idTipoRol </th >"
                                                + "<th scope=/col /> Perfil </th >"
                                                + "<th scope=/col /> Fecha Alta </th >"
                                                + "<th scope=/col />  </th >"
                                                + "<th scope=/col />  </th >"
                                                + "<th scope=/col />  </th >"
                                    + "</tr > ");

        for (var i = 0; i < response.d.length; i++) {

            $("td", row).eq(0).html(response.d[i].IdEmpleado);
            $("td", row).eq(1).html(response.d[i].Nombre);
            $("td", row).eq(2).html(response.d[i].Apellido);

            $("td", row).eq(3).html(response.d[i].TipoDocumento.IdTipoDocumento);
            $("td", row).eq(4).html(response.d[i].TipoDocumento.Descripcion);
            $("td", row).eq(5).html(response.d[i].NroDocumento);


            $("td", row).eq(6).html(response.d[i].Sexo.IdSexo);
            $("td", row).eq(7).html(response.d[i].Sexo.Descripcion);

            var fechaNacimientoEmpleado = response.d[i].FechaNacimiento;

            var fechaNacimientoDate = new Date(parseInt(fechaNacimientoEmpleado.replace(/[^0-9 +]/g, '')));

            var datefechaNacimientoDate = new Date(fechaNacimientoDate).toDateString('yyyy-MM-dd');

            $("td", row).eq(8).html(formatDate(datefechaNacimientoDate));


            $("td", row).eq(9).html(response.d[i].Direccion);
            $("td", row).eq(10).html(response.d[i].NroDireccion);
            $("td", row).eq(11).html(response.d[i].CodigoPostal);


            $("td", row).eq(12).html(response.d[i].Pais.idPais);
            $("td", row).eq(13).html(response.d[i].Pais.Descripcion);

            console.log(response.d[i].Estado.IdEstado);
            $("td", row).eq(14).html(response.d[i].Estado.IdEstado);
            $("td", row).eq(15).html(response.d[i].Estado.Descripcion);


            $("td", row).eq(16).html(response.d[i].Rol.idTipoRol);
            $("td", row).eq(17).html(response.d[i].Rol.Descripcion);


            var fechaAltaEmpleado = response.d[i].FechaAlta;

            var fechaAltaDate = new Date(parseInt(fechaAltaEmpleado.replace(/[^0-9 +]/g, '')));
            //console.log(fechaAltaDate);

            var datefechaAltaDate = new Date(fechaAltaDate).toDateString('yyyy-MM-dd');


            //Fecha Alta
            $("td", row).eq(18).html(formatDate(datefechaAltaDate));


            $("td", row).eq(19).html("<button onclick=\'DetalleItems(this); return false;'\ class= \'btn btn-info'\> <span class=\'glyphicon glyphicon-list-alt'\></span></button> ");

            
            
            $("td", row).eq(20).html("<button onclick=\'EditItems(this); return false;'\ class= \'btn btn-warning'\> <span class=\'glyphicon glyphicon-pencil'\></span></button> ");

            if (response.d[i].Estado.IdEstado != 3) {
                $("td", row).eq(21).html("<button onclick=\'bajaEmpleado(this); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> ");
            }
            else {
                $("td", row).eq(21).html("");
            }
            
  

            $("[id*=grvListadoGeneral]").append(row);
            row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);

        }

    }

}



function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    //return [year, month, day].join('-');
    return [day, month, year].join('/');
}


function LlenarTablaBaja(response) {

    if (response.d.length > 0) {

        var row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);
        $("[id*=grvListadoGeneral] tr").not($("[id*=grvListadoGeneral] tr:first-child")).remove();


        $("#grvListadoGeneral").append("<tr>"
            + "< th scope = /col/  class=\hide\ > IdEmpleado</th > "
            + "<th scope=/col /> Nombre</th >"
            + "<th scope=/col /> Apellido</th > "
            + "<th scope=/col class=\hide\ /> idTipoDocumento </th > "
            + "<th scope=/col />Tipo Doc</th >"
            + "<th scope=/col />Nro. Doc</th > "
            + "<th scope=/col class=\hide\ />idSexo</th > "
            + "<th scope=/col /> Sexo </th > "
            + "<th scope=/col /> Fecha Nacimiento</th >"
            + "<th scope=/col />Dirección</th >"
            + "<th scope=/col />Nro.  </th >"
            + "<th scope=/col />Cod. Postal  </th >"
            + "<th scope=/col class=\hide\ /> idPais </th >"
            + "<th scope=/col />Nacionalidad  </th >"
            + "<th scope=/col  class=\hide\ />idEstado  </th >"
            + "<th scope=/col />Estado  </th >"
            + "<th scope=/col class=\hide\ /> idTipoRol </th >"
            + "<th scope=/col /> Perfil </th >"
            + "<th scope=/col /> Fecha Alta </th >"
            + "<th scope=/col />  </th >"
            + "<th scope=/col />  </th >"
            + "<th scope=/col />  </th >"
            + "</tr > ");

        for (var i = 0; i < response.d.length; i++) {

            $("td", row).eq(0).html(response.d[i].IdEmpleado);
            $("td", row).eq(1).html(response.d[i].Nombre);
            $("td", row).eq(2).html(response.d[i].Apellido);

            $("td", row).eq(3).html(response.d[i].TipoDocumento.IdTipoDocumento);
            $("td", row).eq(4).html(response.d[i].TipoDocumento.Descripcion);
            $("td", row).eq(5).html(response.d[i].NroDocumento);


            $("td", row).eq(6).html(response.d[i].Sexo.IdSexo);
            $("td", row).eq(7).html(response.d[i].Sexo.Descripcion);

            var fechaNacimientoEmpleado = response.d[i].FechaNacimiento;

            var fechaNacimientoDate = new Date(parseInt(fechaNacimientoEmpleado.replace(/[^0-9 +]/g, '')));

            var datefechaNacimientoDate = new Date(fechaNacimientoDate).toDateString('yyyy-MM-dd');

            $("td", row).eq(8).html(formatDate(datefechaNacimientoDate));


            $("td", row).eq(9).html(response.d[i].Direccion);
            $("td", row).eq(10).html(response.d[i].NroDireccion);
            $("td", row).eq(11).html(response.d[i].CodigoPostal);


            $("td", row).eq(12).html(response.d[i].Pais.idPais);
            $("td", row).eq(13).html(response.d[i].Pais.Descripcion);


            $("td", row).eq(14).html(response.d[i].Estado.idEstado);
            $("td", row).eq(15).html(response.d[i].Estado.Descripcion);


            $("td", row).eq(16).html(response.d[i].Rol.idTipoRol);
            $("td", row).eq(17).html(response.d[i].Rol.Descripcion);


            var fechaAltaEmpleado = response.d[i].FechaAlta;

            var fechaAltaDate = new Date(parseInt(fechaAltaEmpleado.replace(/[^0-9 +]/g, '')));
            console.log(fechaAltaDate);

            var datefechaAltaDate = new Date(fechaAltaDate).toDateString('yyyy-MM-dd');


            //Fecha Alta
            $("td", row).eq(18).html(formatDate(datefechaAltaDate));


            $("td", row).eq(19).html("<button onclick=\'DetalleItems(this); return false;'\ class= \'btn btn-info'\> <span class=\'glyphicon glyphicon-list-alt'\></span></button> ");
            $("td", row).eq(20).html("<button onclick=\'EditItems(this); return false;'\ class= \'btn btn-warning'\> <span class=\'glyphicon glyphicon-pencil'\></span></button> ");
            $("td", row).eq(21).html("<button onclick=\'bajaEmpleado(this); return false;'\ class= \'btn btn-danger'\> <span class=\'glyphicon glyphicon-trash'\></span></button> ");
            //$("td", row).eq(20).html("");


            $("[id*=grvListadoGeneral]").append(row);
            row = $("[id*=grvListadoGeneral] tr:last-child").clone(true);

        }

    }

}

function DetalleItems(valor) {
    try {
            var row = valor.parentNode.parentNode;

            $("input[ID$='txtNombre']").val(row.cells[1].innerHTML);
            $("input[ID$='txtApellido']").val(row.cells[2].innerHTML); 
            $("input[ID$='txtTipoDocumento']").val(row.cells[4].innerHTML); 
            $("input[ID$='txtNroDoc']").val(row.cells[5].innerHTML); 
            $("input[ID$='txtSexo']").val(row.cells[7].innerHTML); 
            $("input[ID$='txtFechaNacimiento']").val(row.cells[8].innerHTML); 
            $("input[ID$='txtDireccion']").val(row.cells[9].innerHTML); 
            $("input[ID$='txtDireccionNro']").val(row.cells[10].innerHTML); 
            $("input[ID$='txtCodPostal']").val(row.cells[11].innerHTML); 
            $("input[ID$='txtNacionalidad']").val(row.cells[13].innerHTML); 
            $("input[ID$='txtEstado']").val(row.cells[15].innerHTML); 
            $("input[ID$='txtPerfil']").val(row.cells[17].innerHTML); 
            var uriTelefono = "ModificarEmpleado.aspx/ListadoTelefono";
            var uriMail = "ModificarEmpleado.aspx/ListadoMail";

            ListadoDetalleTelefono(row.cells[0].innerHTML, uriTelefono);
            ListadoDetalleMail(row.cells[0].innerHTML, uriMail);

            $("#modalDetalle").modal("show");

    } catch (e) {

    }
}

function EditItems(valor) {
    try {
        var row = valor.parentNode.parentNode;

        $("input[ID$='txtNombreEdit']").val(row.cells[1].innerHTML);
        $("input[ID$='txtApellidoEdit']").val(row.cells[2].innerHTML);
        $("input[ID$='txtTipoDocumentoEdit']").val(row.cells[4].innerHTML);
        $("input[ID$='txtNroDocEdit']").val(row.cells[5].innerHTML);
        $("input[ID$='txtSexoEdit']").val(row.cells[7].innerHTML);
        $("input[ID$='txtFechaNacimientoEdit']").val(row.cells[8].innerHTML);
        $("input[ID$='txtDireccionEdit']").val(row.cells[9].innerHTML);
        $("input[ID$='txtDireccionNroEdit']").val(row.cells[10].innerHTML);
        $("input[ID$='txtCodPostalEdit']").val(row.cells[11].innerHTML);
        $("input[ID$='txtNacionalidadEdit']").val(row.cells[13].innerHTML);
        $("input[ID$='txtEstadoEdit']").val(row.cells[15].innerHTML);
        $("input[ID$='txtPerfilEdit']").val(row.cells[17].innerHTML);
        var uriTelefono = "ModificarEmpleado.aspx/ListadoTelefono";
        var uriMail = "ModificarEmpleado.aspx/ListadoMail";

        ListadoDetalleTelefono(row.cells[0].innerHTML, uriTelefono);
        ListadoDetalleMail(row.cells[0].innerHTML, uriMail);

        LlamarDropDownSexo("ModificarEmpleado.aspx/ComboSexo", "IdSexo", "Descripcion", "drpdSexoEdit", row.cells[6].innerHTML);

        LlamarDropDownTipoDoc("ModificarEmpleado.aspx/ComboTipoDocumento", "IdTipoDocumento", "Descripcion", "drpdTipoDocumentoEdit", row.cells[3].innerHTML);

        //Pais
        LlamarDropDownPais("ModificarEmpleado.aspx/ComboPais", "IdPais", "Descripcion", "drpdNacionalidadEdit", row.cells[12].innerHTML);

        //Rol
        LlamarDropDownRol("ModificarEmpleado.aspx/ComboRol", "IdTipoRol", "Descripcion", "drpdPerfilEdit", row.cells[16].innerHTML);

        //Estado
        LlamarDropDownEstado("ModificarEmpleado.aspx/ComboEstado", "IdEstado", "Descripcion", "drpdEstadoEdit", row.cells[14].innerHTML);

        
        //PoblarDropDown();

        $("#modalEdit").modal("show");

    } catch (e) {

    }
}

//var idValue = "";
//var descripcionValue = "";

//function PoblarDropDown() {
//    idValue = "IdSexo";
//    descripcionValue = "Descripcion";

//    $.ajax({
//        type: "POST",
//        url: "ModificarEmpleado.aspx/ComboSexo",
//        data: "",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: llenarCombo,
//        failure: function (response) {
//            //alert(response);
//        },
//        error: function (XMLHttpRequest, textStatus, errorThrown) {
//            console.log(textStatus + ": " + XMLHttpRequest.responseText);
//        }
//    });

//}


//function llenarCombo(response) {
//    try {

//        $("[id*=drpdTipoDocumentoEdit]").empty(); 
//        //$("[id*=drpdTipoDocumentoEdit]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))
//        $("[id*=drpdTipoDocumentoEdit]").append($("<option></option>").val("Seleccione...").html("Seleccione..."))

//        for (var i = 0; i < response.d.length; i++) {
//            //$("[id*=drpdTipoDocumentoEdit]").append($("<option></option>").val(response.d[i]['IdSexo']).html(response.d[i]['Descripcion']));
//            $("[id*=drpdTipoDocumentoEdit]").append($("<option></option>").val(response.d[i][idValue]).html(response.d[i][descripcionValue]));
//        }

//    } catch (e) {

//    }

//}