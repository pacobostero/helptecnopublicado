<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ListadoNoActivo.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.proveedor.ListadoNoActivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
        <h1 class="well">Proveedores InActivos</h1>
        <div class="well well-sm">
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 600px; overflow: scroll">
                    <div class="col-md-12">
                        <asp:GridView ID="grvListadoGeneral" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="idProveedor" HeaderText="idProveedor">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="razonSolcial" HeaderText="Razón Social" />
                                <asp:BoundField DataField="idTipoDocumento" HeaderText="idTipoDocumento">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="tipoDoc" HeaderText="Tipo Doc" />
                                <asp:BoundField DataField="nroDocumento" HeaderText="Nro. Doc" />
                                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="direccionNro" HeaderText="Nro." />
                                <asp:BoundField DataField="idEstado" HeaderText="idEstado">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="estado" HeaderText="Estado" />

                                <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" />

                                <asp:BoundField DataField="fechaModificacion" HeaderText="Fecha Modificación" />
                                <asp:BoundField DataField="fechaBaja" HeaderText="Fecha Baja">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <button runat="server" id="btnRun" class="btn btn-success" title="Search" onclick="llamarJson(this);return false">
                                            <span class="glyphicon glyphicon-search"></span>
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
        <div id="modalAdvertencia" class="modal fade" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="h4TituloMensaje">Búsqueda</h4>
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
                                            Sexo</label>
                                        <input type="text" id="txtSexo" class="form-control" required="required"
                                            placeholder="Apellido" readonly="true" style="background-color: #F3F2D7" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subject">
                                            Perfil</label>
                                        <input type="text" runat="server" id="txtPerfil" class="form-control" required="required"
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

    </div>
</asp:Content>
