<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.proveedor.Nuevo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <script src="../js/proveedor/Nuevo.js"></script>--%>

    <script src="<%=ResolveUrl("~/js/proveedor/Nuevo.js")%>"
        type="text/javascript"></script>
    <script src="../js/jquery/3.4.1/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="hdCorreo" type="hidden" runat="server" value="" />
    <input id="hdTelefono" type="hidden" runat="server" value="" />
    <input id="hdBanco" type="hidden" runat="server" value="" />

    <meta http-equiv="Cache-Control" content="no-cache" />
    <div class="container">
        <h1 class="well">Nuevo Proveedor</h1>
        <div class="well well-sm">
            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="subject">
                            Razon Social</label>
                        <input type="text" runat="server" id="txtRazonSocial" class="form-control" required="required"
                            placeholder="Razon Social" onkeypress="return PasarMayuscula(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>

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

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Codigo Postal</label>
                        <input type="text" runat="server" id="txtCodigoPostal" class="form-control" required="required"
                            placeholder="Codigo Postal" oncut="return false" oncopy="return false" autocomplete="off" maxlength="15" />
                    </div>
                </div>

                <div class="col-md-3">
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
            </div>
            <div class="row">

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
                            Banco</label>
                        <asp:DropDownList ID="drpBancos" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            CBU</label>
                        <input type="text" runat="server" id="txtCbu" class="form-control"
                            placeholder="CBU" onkeypress="return soloNumeros(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="50" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="LlenarTablaBanco(); return false;"><span class="glyphicon glyphicon-plus"></span></button>
                        </span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <label for="subject">
                            Alias</label>
                        <input type="text" runat="server" id="txtAlias" class="form-control"
                            placeholder="Alias" oncut="return false" oncopy="return false" autocomplete="off" maxlength="50" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" onclick="LlenarTablaBanco(); return false;"><span class="glyphicon glyphicon-plus"></span></button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4" style="height: 200px; overflow: scroll">
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

                <div class="col-md-3" style="height: 200px; overflow: scroll">
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

                <div class="col-md-5" style="height: 200px; overflow: scroll">
                    <table id="tableBanco" class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col" class="hide">#</th>
                                
                                <th scope="col">Banco</th>
                                <th scope="col">CBU</th>
                                <th scope="col">Alias</th>
                                <th scope="col" class="hide">IdBanco</th>
                                <th scope="col"></th>
                                
                            </tr>
                        </thead>
                        <tbody id="tbodyBanco"></tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <br />
                <br />
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="funcionJS()" OnClick="BtnAceptar_Click" />
                    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="modaCorrecto" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
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

        </div>
        <!-- Modal Advertencia-->
        <div id="modalAdvertencia" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
                        <h4 class="modal-title" id="h4TituloMensajeAdvertencia">Confirmación</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <img src="../dist/img/advertencia.png" align="right" id="imageIDAdvertencia" />

                            <label for="subject" id="lblMensajeAdvertencia">
                                Se agregó correctamente el nuevo proveedor
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
    <%--</div>--%>
</asp:Content>
