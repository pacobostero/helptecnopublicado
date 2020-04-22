<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.proveedor.producto.Nuevo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <div class="container">
        <h1 class="well">Nuevo Producto</h1>
        <div class="well well-sm">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Tipo</label>
                            <asp:DropDownList ID="drpTipoProducto" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="subject">
                            Producto</label>
                        <input type="text" runat="server" id="txtProducto" class="form-control" required="required"
                            placeholder="Producto" onkeypress="return PasarMayuscula(event,this)" oncut="return false" oncopy="return false" autocomplete="off" maxlength="100" />

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="subject">
                            Proveedor</label>
                        <asp:DropDownList ID="drpdProveedor" runat="server" CssClass="form-control ComboDropdown" Style="background-color: #F3F2D7" required="required">
                        </asp:DropDownList>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12 text-right">
                    <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="funcionJS()" OnClick="BtnAceptar_Click"/>
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
</asp:Content>
