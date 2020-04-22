<%@ Page Title="Nuevo Usuario" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.empleado.Nuevo"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="<%=ResolveUrl("~/js/empleado/Nuevo.js")%>"
        type="text/javascript"></script>
    <script src="../js/jquery/3.4.1/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>


    <script>
        function ejecutarmensaje() {
            $("#modaCorrecto").modal("show");
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 226px;
        }
    </style>

  

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="hdCorreo" type="hidden" runat="server" value="" />
    <input id="hdTelefono" type="hidden" runat="server" value="" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <div class="container">
        <h1 class="well">Nuevo Usuario</h1>
        <div class="well well-sm">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Nombre</label>
                        <input type="text" runat="server" id="txtNombre" class="form-control" required="required"
                            placeholder="Nombre" onkeypress="return PasarMayuscula(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Apellido</label>
                        <input type="text" runat="server" id="txtApellido" class="form-control" required="required"
                            placeholder="Apellido" onkeypress="return PasarMayuscula(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Fecha Nacimiento</label>
                        <input type="date" runat="server" id="txtFechaNacimiento" class="form-control" min="2018-02-18T24:00:00" max="2090-02-20T01:30:55"
                            placeholder="Fecha y hora salida" name="txtFechaHoraSalida" style="background-color: #F3F2D7" required="required" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Sexo</label>
                        <asp:DropDownList ID="drpdSexo" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Tipo Documento</label>
                        <asp:DropDownList ID="drpdTipoDocumento" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Nro Documento</label>
                        <input type="text" runat="server" id="txtNroDocumento" class="form-control" required="required"
                            placeholder=" Nro Documento" onkeypress="return soloNumeros(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="11" />

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Domicilio</label>
                        <input type="text" runat="server" id="txtDomicilio" class="form-control" required="required"
                            placeholder="Domicilio" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Numero</label>
                        <input type="text" runat="server" id="txtNroDomicilio" class="form-control" required="required"
                            placeholder="Numero" onkeypress="return soloNumeros(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="6" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Codigo Postal</label>
                        <input type="text" runat="server" id="txtCodigoPostal" class="form-control" required="required"
                            placeholder="Codigo Postal" oncut="return false" oncopy="return false" autocomplete="off" maxlength="15" />
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="input-group">
                        <label for="subject">
                            Correo Electronico</label>
                        <input type="email" runat="server" id="txtCorreoELectronico" class="form-control" style="background-color: #F3F2D7"
                            placeholder="Correo Electronico" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="LlenarTablaMail(); return false;"><span class="glyphicon glyphicon-plus"></span></button>
                        </span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Tipo de Telefono</label>
                        <asp:DropDownList ID="drpdTipoTelefono" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Numero Telefono</label>
                        <input type="text" runat="server" id="txtNroTelefono" class="form-control"
                            placeholder="Numero Telefono" onkeypress="return soloNumeros(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="20" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="LlenarTablaTelefono(); return false;"><span class="glyphicon glyphicon-plus"></span></button>
                        </span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Usuario Login</label>
                        <input type="text" runat="server" id="txtLogin" class="form-control"
                            placeholder="Usuario Login" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Clave</label>
                        <input type="password" runat="server" id="txtClave" class="form-control" style="background-color: #F3F2D7"
                            placeholder="Clave" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Perfil</label>
                        <asp:DropDownList ID="drpdPerfil" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Pais</label>
                        <asp:DropDownList ID="drpdPais" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-6" style="height: 200px; overflow: scroll">
                    <table id="tableCorreo" class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" class="hide">#</th>
                                <th scope="col">Mail</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody id="tbodyCorreo"></tbody>
                    </table>
                </div>
                <div class="col-md-6" style="height: 200px; overflow: scroll">
                    <table id="tableTelefono" class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" class="hide">#</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Nro.</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody id="tbodyTelefo"></tbody>
                    </table>
                </div>





            </div>
            <div class="row">
                <br />
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="BtnAceptar_Click" OnClientClick="funcionJS()" />
                    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="modaCorrecto" class="modal fade" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title" id="h4TituloMensajeModificar">Confirmación</h4>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <img src="../dist/img/comprobar.png" align="right" id="imageIDModificar" />

                        <label for="subject" id="lblMensajeModificar">
                            Se agregó correctamente el nuevo usuario
                        </label>
                    </div>
                    <div class="tab-content">
                        <div class="row">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        Aceptar</button>
                </div>
            </div>


        </div>
        <!-- Modal Advertencia-->
        <div id="modalAdvertencia" class="modal fade" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="h4TituloMensajeAdvertencia">Confirmación</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <img src="../dist/img/advertencia.png" align="right" id="imageIDAdvertencia" />

                            <label for="subject" id="lblMensajeAdvertencia">
                                Se agregó correctamente el nuevo usuario
                            </label>
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
    </div>

    <!-- Modal Generico-->
    <div id="myModal" class="modal fade" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    </button>
                    <h4 class="modal-title" id="h4TituloMensaje">Confirmación</h4>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <img id="imageID" align="right" src="../dist/img/signoInterrogacion.png" />
                        <%--                        <label for="subject" id="lblMensajeUser">
                        </label>--%>
                        <p id="lblMensajeUser">
                        </p>
                    </div>
                    <%--Alumno--%>
                    <div class="tab-content">
                        <div class="row">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <%--                   <button type="button" class="btn btn-primary" runat="server" id="btnAgregarAlumno" onclick="return Validar(); return false;">
                        Si</button>--%>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="return false;">
                        Aceptar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
