<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPacientes.aspx.cs" Inherits="Vistas.AltaMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/AltaPacientes.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
       <header> 
            <div class="h1ClinicaSalud"> 
                <h2>CLINICA SALUD</h2>
                <h6><asp:HyperLink ID="lnkRegresar" runat="server" CssClass="lnkRegresar" NavigateUrl="~/ListadoPacientes.aspx">Regresar</asp:HyperLink></h6>
                <h4><asp:Label ID="lblNombreUsuario" runat="server" Text="Usuario:" CssClass="lblNombreUsuarioPosicion"></asp:Label></h4>
                <h4><asp:Button ID="btnSalir" runat="server" Text="Cerrar Sesion" CssClass="btnSalir" OnClick="btnSalir_Click" /></h4>
            </div>
        </header> 

        <div class="centrarDiv"> 
            <div class="contenedor-formulario">
                <asp:Label ID="lblDNI" runat="server" Text="Ingrese DNI ">
                </asp:Label><asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblNombre" runat="server" Text="Ingrese Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblApellido" runat="server" Text="Ingrese Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblSexo" runat="server" Text="Ingrese Sexo"></asp:Label>
                <asp:DropDownList ID="ddlSexo" runat="server"></asp:DropDownList>
                <br />

                <asp:Label ID="lblNacionalidad" runat="server" Text="Ingrese Nacionalidad"></asp:Label>
                <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblFecha" runat="server" Text="Ingrese Fecha de Nacimiento"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" Type="date"></asp:TextBox>
                <br />

                <asp:Label ID="lblDireccion" runat="server" Text="Ingrese Direccion"></asp:Label>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblProvincia" runat="server" Text="Ingrese Provincia"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                <br />

                <asp:Label ID="lblLocalidad" runat="server" Text="Ingrese Localidad"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
                 <br />

                <asp:Label ID="lblEmail" runat="server" Text="Ingrese Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                 <br />

                <asp:Label ID="lblTelefono" runat="server" Text="IngreseTelefono"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <br />

                <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" CssClass="btnAgregarPaciente" OnClick="btnAgregarPaciente_Click" ValidationGroup="Paciente" />
            </div>
        </div>

        <div>               
            <br />
            <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ValidationGroup="Paciente">*Ingrese DNI</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="regDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$" ValidationGroup="Paciente">*Ingrese solo Numeros</asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Paciente">*Ingrese Nombre</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Paciente">*Ingrese Apellido</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ValidationGroup="Paciente">*Seleccione Sexo</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ValidationGroup="Paciente">*Ingrese Nacionalidad</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ValidationGroup="Paciente">*Ingrese Fecha Nacimiento</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Paciente">*Ingrese Direccion</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ValidationGroup="Paciente">*Seleccione Provincia</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ValidationGroup="Paciente">*Seleccione Localidad</asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Paciente">*Ingrese Email</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$" ValidationGroup="Paciente">*Ingrese un Email valido</asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Paciente">*Ingrese Telefono</asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="regTelefono" runat="server" ControlToValidate="txtTelefono" ValidationExpression="^\d+$" ValidationGroup="Paciente"></asp:RegularExpressionValidator>
        </div>   
            
    </form>
</body>
</html>
