<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ListadoNoActivos.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.empleado.ListadoNoActivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="well">Empleados No Activos</h1>
        <div class="well well-sm">
            <div class="row">
                <div class="col-md-12" style="width: 100%; height: 600px; overflow: scroll">
                    <div class="col-md-12">
                        <asp:GridView ID="grvListadoGeneral" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="IdEmpleado" HeaderText="Código" Visible="False" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                                <asp:BoundField DataField="idTipoDocumento" HeaderText="idTipoDocumento" Visible="False" />
                                <asp:BoundField DataField="tipDocDescrip" HeaderText="Tipo Doc" />
                                <asp:BoundField DataField="nroDocumento" HeaderText="Nro. Doc" />
                                <asp:BoundField DataField="idSexo" HeaderText="idSexo" Visible="False" />
                                <asp:BoundField DataField="sexoDescrip" HeaderText="Sexo" />
                                <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha Nacimiento" />
                                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="direccionNro" HeaderText="Nro." />
                                <asp:BoundField DataField="codigoPostal" HeaderText="Cod. Postal" />
                                <asp:BoundField DataField="idPais" HeaderText="idPais" Visible="False" />
                                <asp:BoundField DataField="paisDescrip" HeaderText="Nacionalidad" />
                                <asp:BoundField DataField="idEstado" HeaderText="idEstado" Visible="False" />
                                <asp:BoundField DataField="estadoDescrip" HeaderText="Estado" />
                                <asp:BoundField DataField="idTipoRol" HeaderText="idTipoRol" Visible="False" />
                                <asp:BoundField DataField="rolDescrip" HeaderText="Perfil" />
                                <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
