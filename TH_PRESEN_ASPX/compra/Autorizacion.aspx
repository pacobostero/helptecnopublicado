<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Autorizacion.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.compra.Autorizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/compra/Autorizacion.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="well">Pendiente Autorizar</h1>
        <div class="well well-sm">
            <div class="row">

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Nro. Orden Compra</label>
                        <asp:DropDownList ID="drpdNroOrdenCompra" runat="server" CssClass="form-control ComboDropdown" onchange="SeleccionNroOrdenCompra();" Style="background-color: #F3F2D7" required="required" autofocus="true">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Proveedor</label>
                        <input type="text" runat="server" id="txtProveedor" class="form-control" required="required"
                            placeholder="Proveedor" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" readonly="true" style="background-color: #F3F2D7" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Generado</label>
                        <input type="text" runat="server" id="txtGeneradoUsuario" class="form-control" required="required"
                            placeholder="Generado" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" readonly="true" style="background-color: #F3F2D7" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Estado</label>
                        <input type="text" runat="server" id="txtEstado" class="form-control" required="required"
                            placeholder="Estado" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" readonly="true" style="background-color: #F3F2D7" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <%--<input id="btnGenerarOrden" type="button" value="Autorizar" onclick="GenerarOrdenCompraProveedor(); return false;" class="btn btn-success" />--%>
                    <asp:Button ID="btnGenerarOrden" runat="server" Text="Autorizar" CssClass="btn btn-success" OnClick="btnGenerarOrden_Click" />
                    <asp:Button ID="btnRechazar" runat="server" Text="Rechazar" CssClass="btn btn-danger" OnClick="btnRechazar_Click" />
                </div>
            </div>
            <div class="row">
                <br />
            </div>
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 600px; overflow: scroll">
                    <div class="col-md-12">
                        <asp:GridView ID="grvListadoGeneral" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idOrdenCompra" HeaderText="Nro. Orden" />
                                <asp:BoundField DataField="idProveedor" HeaderText="Cod Proveedor" Visible="False" />
                                <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" Visible="False" />
                                <asp:BoundField DataField="idDetalleCompra" HeaderText="Codigo Detalle" >                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="idProducto" HeaderText="idProducto" Visible="False" />
                                <asp:BoundField DataField="Producto" HeaderText="Producto" />
                                <asp:BoundField DataField="idTipoProducto" HeaderText="idTipoProducto" Visible="False" />
                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="idEmpleado" HeaderText="idEmpleado" Visible="False" />
                                <asp:BoundField DataField="Generado" HeaderText="Generado" InsertVisible="False" />
                                <asp:BoundField DataField="idUnidadMedida" HeaderText="idUnidadMedida" Visible="False" />
                                <asp:BoundField DataField="Medida" HeaderText="Medida" />
                                <asp:BoundField DataField="idEstado" HeaderText="idEstado" Visible="False" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" />
                                <asp:BoundField DataField="fechaRecepcion" HeaderText="Fecha Recepcion" />
                            </Columns>
                        </asp:GridView>


                    </div>
                </div>


            </div>

        </div>

    </div>
</asp:Content>
