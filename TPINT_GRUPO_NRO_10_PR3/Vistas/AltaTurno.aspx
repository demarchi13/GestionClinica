<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaTurno.aspx.cs" Inherits="Vistas.AltaTurno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/AltaTurno.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <form id="form1" runat="server">
        <header> 
            <div class="h1ClinicaSalud"> 
                <h2>CLINICA SALUD</h2>
                <h6><asp:HyperLink ID="lnkRegresar" runat="server" CssClass="lnkRegresar" NavigateUrl="~/UsuarioAdministrador.aspx">Regresar</asp:HyperLink></h6>
                <h4><asp:Label ID="lblNombreUsuario" runat="server" Text="Usuario:" CssClass="lblNombreUsuarioPosicion"></asp:Label></h4>
                <h4><asp:Button ID="btnSalir" runat="server" Text="Cerrar Sesion" CssClass="btnSalir" OnClick="btnSalir_Click" /></h4>
            </div>
        </header> 
        <div class="centrarDiv"> 
            <div class="contenedor-formulario">
                <asp:Label ID="lblEspecialidad" runat="server" Text="Seleccione Especialidad: "></asp:Label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>
                <br />    

                <asp:Label ID="lblMedico" runat="server" Text="Seleccione un Medico: "></asp:Label>
                <asp:DropDownList ID="ddlMedicos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMedicos_SelectedIndexChanged"></asp:DropDownList>
                <br />
                
                <asp:Label ID="lblPaciente" runat="server" Text="Ingrese DNI Paciente: "></asp:Label>
                <asp:TextBox ID="txtDniPaciente" runat="server"></asp:TextBox>
                <br />

                 <asp:Label ID="lblFechaTurno" runat="server" Text="Seleccione la Fecha del turno: "></asp:Label>          
                <asp:TextBox ID="txtFechaTurno" runat="server" Type="date" AutoPostBack="True" OnTextChanged="txtFechaTurno_TextChanged"></asp:TextBox>
                <br />

                <asp:Label ID="lblInicioAtencion" runat="server" Text="Seleccione horario del turno:  "></asp:Label>
                <asp:DropDownList ID="ddlHoraTurno" runat="server"></asp:DropDownList>
                <br />

                <asp:Button ID="btnCargarTurno" runat="server" Text="Cargar Turno" CssClass="btnCargarTurno" OnClick="btnCargarTurno_Click" />
            </div>
        </div>
        <asp:Label ID="lblMensaje1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblMensaje2" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblMensaje3" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblMensaje4" runat="server" Text=""></asp:Label>
        <br />

        <div class="centrar">
            <asp:Label ID="lbl_infoMedico" runat="server" Text=""></asp:Label>
        </div>

        <div class="centrar">
            <asp:GridView ID="grdMedico" runat="server"></asp:GridView>
        </div>
         <br />
        <div class="centrar">
             <asp:Label ID="lblTurnos" runat="server"></asp:Label>
        </div>
       
        <div class="centrar">
            <asp:GridView ID="grdTurnos" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
