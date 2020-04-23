<%@ Page Title="Modificar Empleado" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ModificarEmpleado.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.empleado.ModificarEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/empleado/Modificar.js"></script>
    <script src="../js/FuncionesEspeciales/Telefono.js"></script>
    <script src="../js/FuncionesEspeciales/Mail.js"></script>
    <script src="../js/FuncionesEspeciales/DropDownCombo.js"></script>

    <script type="text/javascript">
        // Broad cast that your're opening a page.
        localStorage.openpages = Date.now();
        var onLocalStorageEvent = function (e) {
            if (e.key == "openpages") {
                // Listen if anybody else opening the same page!
                localStorage.page_available = Date.now();
            }
            if (e.key == "page_available") {
                alert("No puede tener mas de dos sesiones abiertas");
                window.location.href = "../Login.aspx";
            }
        };
        window.addEventListener('storage', onLocalStorageEvent, false);
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <%--<h1 class="well">Modificar</h1>--%>
        <div class="well well-sm">
            <div class="row">

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Tipo Doc</label>
                        <asp:DropDownList ID="drpdTipoDocumento" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Nro.</label>
                        <input type="text" runat="server" id="txtNroDocFiltro" class="form-control"
                            placeholder="Nro." oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" style="background-color: #F3F2D7" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Nombre</label>
                        <input type="text" runat="server" id="txtNombreFiltro" class="form-control"
                            placeholder="Nombre" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" style="background-color: #F3F2D7" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Apellido</label>
                        <input type="text" runat="server" id="txtApellidoFiltro" class="form-control"
                            placeholder="Apellido" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" style="background-color: #F3F2D7" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Sexo</label>
                        <asp:DropDownList ID="drpdSexo" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Estado</label>
                        <asp:DropDownList ID="drpdEstado" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Nacionalidad</label>
                        <asp:DropDownList ID="drpdPais" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Perfil</label>
                        <asp:DropDownList ID="drpdPerfil" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="ListadoFiltroEmpleado(); return false;"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 600px; overflow: scroll">
                    <div class="col-md-12">
                        <asp:GridView ID="grvListadoGeneral" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="IdEmpleado" HeaderText="#">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                                <asp:BoundField DataField="idTipoDocumento" HeaderText="idTipoDocumento">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="tipDocDescrip" HeaderText="Tipo Doc" />
                                <asp:BoundField DataField="nroDocumento" HeaderText="Nro. Doc" />
                                <asp:BoundField DataField="idSexo" HeaderText="idSexo">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="sexoDescrip" HeaderText="Sexo" />
                                <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha Nacimiento" />
                                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="direccionNro" HeaderText="Nro." />
                                <asp:BoundField DataField="codigoPostal" HeaderText="Cod. Postal" />
                                <asp:BoundField DataField="idPais" HeaderText="idPais">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="paisDescrip" HeaderText="Nacionalidad" />
                                <asp:BoundField DataField="idEstado" HeaderText="idEstado">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="estadoDescrip" HeaderText="Estado" />
                                <asp:BoundField DataField="idTipoRol" HeaderText="idTipoRol">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="rolDescrip" HeaderText="Perfil" />
                                <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" />

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <button runat="server" id="btnDetalle" class="btn btn-info" title="Detalle" onclick="DetalleItems(this);return false">
                                            <span class="glyphicon glyphicon-list-alt"></span>
                                        </button>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <button runat="server" id="btnWarning" class="btn btn-warning" title="Modificar" onclick="EditItems(this);return false">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                        </button>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <button runat="server" id="btnDanger" class="btn btn-danger" title="Baja" onclick="bajaEmpleado(this);return false">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Advertencia-->
        <div id="modalDetalle" class="modal fade" data-backdrop="static">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="h4TituloMensaje">Detalle</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nombre</label>
                                        <input type="text" id="txtNombre" class="form-control" required="required"
                                            placeholder="Nombre" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Apellido</label>
                                        <input type="text" id="txtApellido" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Fecha Nacimiento</label>
                                        <input type="text" id="txtFechaNacimiento" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Sexo</label>
                                        <input type="text" id="txtSexo" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Tipo Doc</label>
                                        <input type="text" runat="server" id="txtTipoDocumento" class="form-control" required="required"
                                            placeholder="Nombre" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nro</label>
                                        <input type="text" runat="server" id="txtNroDoc" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>

                            </div>


                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Direccion</label>
                                        <input type="text" runat="server" id="txtDireccion" class="form-control" required="required"
                                            placeholder="Direccion" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nro.</label>
                                        <input type="text" runat="server" id="txtDireccionNro" class="form-control" required="required"
                                            placeholder="Nro." readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Codigo Postal</label>
                                        <input type="text" runat="server" id="txtCodPostal" class="form-control" required="required"
                                            placeholder="Codigo Postal" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nacionalidad</label>
                                        <input type="text" runat="server" id="txtNacionalidad" class="form-control" required="required"
                                            placeholder="Nacionalidad" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Perfil</label>
                                        <input type="text" runat="server" id="txtPerfil" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Estado</label>
                                        <input type="text" runat="server" id="txtEstado" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>


                            </div>

                            <h5 class="modal-title" id="h5TituloTelefono">Teléfono</h5>
                            <div class="row">
                                <div class="col-md-12" style="width: 100%; height: 150px; overflow: scroll">
                                    <table id="tableTelefono" class="table table-dark">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="hide">#</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Nro.</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyTelefo"></tbody>
                                    </table>
                                </div>
                            </div>

                            <h5 class="modal-title" id="h5TituloMail">Correo Electrónico</h5>

                            <div class="row">
                                <div class="col-md-12" style="width: 100%; height: 150px; overflow: scroll">
                                    <table id="tableCorreo" class="table table-dark">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="hide">#</th>
                                                <th scope="col">Mail</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyCorreo"></tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-content">
                            <div class="row">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnAdvertencia" class="btn btn-primary" data-dismiss="modal">
                            Aceptar</button>
                    </div>
                </div>
            </div>
        </div>

        <%--ModalEditar--%>
        <div id="modalEdit" class="modal fade" data-backdrop="static">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="h4TituloMensajeEdit">Detalle</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nombre</label>
                                        <input type="text" id="txtNombreEdit" class="form-control"
                                            placeholder="Nombre" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Apellido</label>
                                        <input type="text" id="txtApellidoEdit" class="form-control"
                                            placeholder="Apellido" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Fecha Nacimiento</label>
                                        <input type="text" id="txtFechaNacimientoEdit" class="form-control"
                                            placeholder="Apellido" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Sexo</label>
                                        <asp:DropDownList ID="drpdSexoEdit" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <%--                                        <label for="subject">
                                            Tipo Doc</label>
                                        <input type="text" runat="server" id="txtTipoDocumentoEdit" class="form-control"
                                            placeholder="Nombre" style="background-color: #F3F2D7" />--%>
                                        <label for="subject">
                                            Tipo Doc</label>
                                        <asp:DropDownList ID="drpdTipoDocumentoEdit" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nro</label>
                                        <input type="text" runat="server" id="txtNroDocEdit" class="form-control"
                                            placeholder="Apellido" style="background-color: #F3F2D7" />
                                    </div>
                                </div>

                            </div>


                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Direccion</label>
                                        <input type="text" runat="server" id="txtDireccionEdit" class="form-control"
                                            placeholder="Direccion" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nro.</label>
                                        <input type="text" runat="server" id="txtDireccionNroEdit" class="form-control"
                                            placeholder="Nro." style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Codigo Postal</label>
                                        <input type="text" runat="server" id="txtCodPostalEdit" class="form-control"
                                            placeholder="Codigo Postal" style="background-color: #F3F2D7" />
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Nacionalidad</label>
                                        <asp:DropDownList ID="drpdNacionalidadEdit" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Perfil</label>
                                        <asp:DropDownList ID="drpdPerfilEdit" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Estado</label>
                                        <asp:DropDownList ID="drpdEstadoEdit" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" autofocus="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>


                            </div>

                            <h5 class="modal-title" id="h5TituloTelefonoEdit">Teléfono</h5>
                            <div class="row">
                                <div class="col-md-12" style="width: 100%; height: 150px; overflow: scroll">
                                    <table id="tableTelefonoEdit" class="table table-dark">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="hide">#</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Nro.</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyTelefoEdit"></tbody>
                                    </table>
                                </div>
                            </div>

                            <h5 class="modal-title" id="h5TituloMailEdit">Correo Electrónico</h5>

                            <div class="row">
                                <div class="col-md-12" style="width: 100%; height: 150px; overflow: scroll">
                                    <table id="tableCorreoEdit" class="table table-dark">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="hide">#</th>
                                                <th scope="col">Mail</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyCorreoEdit"></tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-content">
                            <div class="row">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnEdit" class="btn btn-primary" data-dismiss="modal">
                            Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%-- <div class="container"> 
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#dialogo1">Abrir ventana de diálogo</button>

    <div class="modal fade" id="dialogo1">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
    
          <!-- cabecera del diálogo -->
          <div class="modal-header">
            <h4 class="modal-title">Título del diálogo</h4>
            <button type="button" class="close" data-dismiss="modal">X</button>
          </div>
    
          <!-- cuerpo del diálogo -->
          <div class="modal-body">
            Contenido del diálogo.
          </div>
    
          <!-- pie del diálogo -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          </div>
    
        </div>
      </div>
    </div> 

  </div>--%>
</asp:Content>
