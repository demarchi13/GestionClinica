<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/EstiloLogin.css" rel="stylesheet" type="text/css"/>
   
</head>
<body>
    <form id="form1" runat="server">
        
        <header> 
            <div class="h1ClinicaSalud"> 
                <h1>CLINICA SALUD</h1>
                 <h3><asp:Label ID="lblNombreUsuario" runat="server" CssClass="lbllNombreUsuarioPosicion"></asp:Label> </h3>
             </div>
        </header>

        <div class="login-container">
                     <h2>Iniciar Sesión</h2>
                         <label for="nombreusuario">Usuario:</label>
                         <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                         <label for="contrasenia">Contraseña:</label>
                         <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:Button ID="btnIniciarSesion" runat="server" Text="INGRESAR" cssClass="botonInicio" OnClick="btnIniciarSesion_Click" ValidationGroup="GLogin"/>
        </div>
           
        <br />
        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ValidationGroup="GLogin" ForeColor="Red" >Ingrese Usuario</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" ValidationGroup="GLogin" ForeColor="Red">Ingrese Contraseña</asp:RequiredFieldValidator>
           
    </form>
</body>
</html>
