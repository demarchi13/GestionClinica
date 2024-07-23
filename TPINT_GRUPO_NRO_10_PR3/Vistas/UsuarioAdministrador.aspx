<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioAdministrador.aspx.cs" Inherits="Vistas.UsuarioAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/EstiloAdministrador.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header> 
            <div class="h1ClinicaSalud"> 
                <h2>CLINICA SALUD</h2>
                <h6>&nbsp;</h6>
                <h4><asp:Label ID="lblNombreUsuario" runat="server" Text="Usuario:" CssClass="lblNombreUsuarioPosicion"></asp:Label></h4>
                <h4><asp:Button ID="btnSalir" runat="server" Text="Cerrar Sesion" CssClass="btnSalir" OnClick="btnSalir_Click" /></h4>
             </div>
        </header>   

        <div class="container"> 

            <div class="mensaje">Seleccione a qué área del Sistema desea ingresar</div>
            
            <div class="box" style="background-color:peru">
                <asp:Button ID="btnGestionMedico" runat="server" Text="Gestion Medicos" CssClass="btnMedicos" OnClick="btnGestionMedico_Click" />
            </div>
            <div class="box" style="background-color:crimson">
                <asp:Button ID="btnGestionPaciente" runat="server" Text="Gestion Pacientes" CssClass="btnPacientes" OnClick="btnGestionPaciente_Click" />
            </div>
            <div class="box" style="background-color:lightseagreen">
                <asp:Button ID="btnGestionTurno" runat="server" Text="Gestion Turnos" CssClass="btnTurnos" OnClick="btnGestionTurno_Click"/>
            </div>
            <div class="box" style="background-color:lightskyblue">
                <asp:Button ID="btnInformes" runat="server" Text="Informes" CssClass="btnInformes" OnClick="btnInformes_Click" />
            </div>

        </div>
    </form>
</body>
</html>
