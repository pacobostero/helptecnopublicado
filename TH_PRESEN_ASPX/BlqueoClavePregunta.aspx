<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlqueoClavePregunta.aspx.cs" Inherits="TH_PRESEN_ASPX_GC.BlqueoClavePregunta" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Blqueo Clave Pregunta</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="dist/img/UserLogin.png" />
            <p id="profile-name" class="profile-name-card">
            </p>
            <form id="frmReset" class="form-signin">
            <span id="reauth-email" class="reauth-email"></span>
            <input type="text" runat="server" id="txtUser" class="form-control" placeholder="Usuario"
                required autofocus oncut="return false" oncopy="return false" autocomplete="off" />
            <br />
            <asp:DropDownList ID="dropPreguntaSecreta" runat="server" CssClass="form-control"
                required="required">
            </asp:DropDownList>
            <br />
            <input type="text" runat="server" id="txtRespuesta" class="form-control" placeholder="Respuesta"
                required oncut="return false" oncopy="return false" autocomplete="off" />
            <br />
            <%--<asp:Button ID="btnIniciar" runat="server" Text="Restablecer" CssClass="btn btn-lg btn-primary btn-block btn-signin" />--%>
            <input id="btnRestablecer" type="button" value="Restablecer" runat="server" class ="btn btn-lg btn-primary btn-block btn-signin" />
            </form>
        </div>
    </div>
    </form>
</body>
</html>