<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.compra.Nuevo" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="<%=ResolveUrl("~/js/compra/Nuevo.js")%>"
        type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <div class="container">
        <h1 class="well">Generar Orden de Compra</h1>
        <div class="well well-sm">
            <div class="row">

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Proveedor</label>
                        <asp:DropDownList ID="drpdProveedor" runat="server" CssClass="form-control ComboDropdown" onchange="SeleccionComboProveedor();" Style="background-color: #F3F2D7" required="required" autofocus="true">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Producto</label>
                        <select name="drpProducto" id="drpProducto" class="form-control ComboDropdown" onchange="SeleccionComboTipoProducto();" style="background-color: #F3F2D7" required="required">
                            <option></option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Tipo</label>
                        <input type="text" runat="server" id="txtTipo" class="form-control" required="required"
                            placeholder="Tipo" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" readonly="true" style="background-color: #F3F2D7" />
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Unidad de Medida</label>
                        <asp:DropDownList ID="drpUnidadMedida" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required" onchange="onchangeUnidadMedida();">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Cantidad</label>
                        <input type="text" runat="server" id="txtCantidad" class="form-control" required="required"
                            placeholder="Cantidad" onkeypress="return soloNumeros(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />
                    </div>
                </div>
                <div class="col-md-3">
 
                    <div class="form-group">
                     <label for="subject">
                            Agregar</label>
                        <br />
                        <button name="" onclick="LlenarTablaHTML(); return false;" class="btn btn-success">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </div>
                </div>
            </div>
            <div>

                <br />
            </div>
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 400px; overflow: scroll">
                    <table id="tableIdProveedor" class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Cod Producto</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Cod Unidad Medida</th>
                                <th scope="col">Unidad Medida</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody id="data"></tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <input id="btnGenerarOrden" type="button" value="Generar" onclick="GenerarOrdenCompraProveedor(); return false;" class="btn btn-primary" />
                    <%--       <asp:Button <input id="Button1" type="button" value="button" />ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="BtnAceptar_Click" />--%>
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
                                Se generó correctamente la orden de compra Nro.
                                <p id="NroOrden"></p>
                                , por favor indicarle al administrador de autorizar la orden
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
        <div id="modalAdvertencia" class="modal fade"  data-backdrop="static">
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

        <!-- Modal Generico-->
        <div id="myModal" class="modal fade"  data-backdrop="static" >
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            </button>
                        <h4 class="modal-title" id="h4TituloMensaje"></h4>
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="responseRedirectJs(); return false;">
                            Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
