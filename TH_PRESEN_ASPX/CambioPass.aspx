<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambioPass.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.CambioPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/Login.css" rel="stylesheet" />
    <title>Cambio de Clave</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="well">Cambio de Clave</h1>
            <div class="well well-sm">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Nick</label>
                            <input type="text" runat="server" id="txtUsuario" class="form-control" required="required"
                                placeholder="Usuario" readonly="true" oncut="return false" oncopy="return false"
                                autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Clave Anterior</label>
                            <input type="password" runat="server" id="txtClaveAnterior" class="form-control"
                                required="required" placeholder="Clave Anterior" oncut="return false" oncopy="return false"
                                autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Confirmar Nueva</label>
                            <input type="password" runat="server" id="txtNuevaClave" class="form-control" required="required"
                                placeholder="Confirmar Nueva" oncut="return false" oncopy="return false" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Confirmar Nueva Clave</label>
                            <input type="password" runat="server" id="txtConfirmarClave" class="form-control"
                                required="required" placeholder="Confirmar Nueva Clave" oncut="return false"
                                oncopy="return false" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Pregunta secreta</label>
                            <asp:DropDownList ID="dropPreguntaSecreta" runat="server" CssClass="form-control"
                                required="required">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject">
                                Respuesta</label>
                            <input type="password" runat="server" id="txtRespuesta" class="form-control" required="required"
                                placeholder="Respuesta" oncut="return false" oncopy="return false" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-12 text-right">
                        <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="BtnAceptar_Click" />
                        <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
