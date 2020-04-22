<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ListadoPendiente.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.compra.ListadoPendiente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="well">Pendiente Autorizar</h1>
        <div class="well well-sm">
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 600px; overflow: scroll">
                    <div class="col-md-12">
                        <asp:GridView ID="grvListadoGeneral" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idOrdenCompra" HeaderText="Nro. Orden" />
                                <asp:BoundField DataField="idProveedor" HeaderText="Cod Proveedor">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" />
                                <asp:BoundField DataField="idDetalleCompra" HeaderText="Codigo Detalle">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="idProducto" HeaderText="idProducto">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Producto" HeaderText="Producto" />
                                <asp:BoundField DataField="idTipoProducto" HeaderText="idTipoProducto">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="idEmpleado" HeaderText="idEmpleado">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Generado" HeaderText="Generado" />
                                <asp:BoundField DataField="idUnidadMedida" HeaderText="idUnidadMedida">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Medida" HeaderText="Medida" />
                                <asp:BoundField DataField="idEstado" HeaderText="idEstado">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" />
                                <asp:BoundField DataField="fechaRecepcion" HeaderText="Fecha Recepcion" />
                                <%--                                <asp:ButtonField ButtonType="Button" DataTextField="idDetalleCompra" Text="Aprobar" HeaderText="Aprobar">
                                <ControlStyle CssClass="btn btn-success" />
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" Text="Rechazar" />
                                <asp:ButtonField ButtonType="Button" Text="Editar" />--%>
                            </Columns>
                        </asp:GridView>


                    </div>
                </div>


            </div>

        </div>

    </div>
</asp:Content>
