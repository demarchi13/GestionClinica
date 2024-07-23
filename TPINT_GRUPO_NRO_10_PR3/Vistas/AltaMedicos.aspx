<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaMedicos.aspx.cs" Inherits="Vistas.AltaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/AltaMedicos.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
       <header> 
            <div class="h1ClinicaSalud"> 
                <h2>CLINICA SALUD</h2>
                <h6><asp:HyperLink ID="lnkRegresar" runat="server" CssClass="lnkRegresar" NavigateUrl="~/ListadoMedicos.aspx">Regresar</asp:HyperLink></h6>
                <h4><asp:Label ID="lblNombreUsuario" runat="server" Text="Usuario:" CssClass="lblNombreUsuarioPosicion"></asp:Label></h4>
                <h4><asp:Button ID="btnSalir" runat="server" Text="Cerrar Sesion" CssClass="btnSalir" OnClick="btnSalir_Click" /></h4>
            </div>
        </header> 
        <div class="centrarDiv"> 
            <div class="contenedor-formulario">
                <asp:Label ID="lblUsuario" runat="server" Text="Ingrese Nombre Usuario "> </asp:Label><asp:TextBox ID="txtNombreUsuario" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblContrasenia1" runat="server" Text="Ingrese Contraseña "> </asp:Label><asp:TextBox ID="txtContrasenia1" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblContrasenia2" runat="server" Text="Confirmar Contraseña "> </asp:Label><asp:TextBox ID="txtContrasenia2" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblLegajo" runat="server" Text="Ingrese Legajo "> </asp:Label><asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblDNI" runat="server" Text="Ingrese DNI "> </asp:Label><asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblNombre" runat="server" Text="Ingrese Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblApellido" runat="server" Text="Ingrese Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblSexo" runat="server" Text="Seleccione Sexo"></asp:Label>
                <asp:DropDownList ID="ddlSexo" runat="server"></asp:DropDownList>
                <br />

                <asp:Label ID="lblNacionalidad" runat="server" Text="Ingrese Nacionalidad"></asp:Label>       
                <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblFecha" runat="server" Text="Seleccione Fecha de Nacimiento"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" Type="date"></asp:TextBox>
                <br />

                <asp:Label ID="lblDireccion" runat="server" Text="Ingrese Direccion"></asp:Label>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblProvincia" runat="server" Text="Seleccione Provincia"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"></asp:DropDownList>
                <br />

                <asp:Label ID="lblLocalidad" runat="server" Text="Seleccione Localidad"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
                 <br />

                <asp:Label ID="lblEmail" runat="server" Text="Ingrese Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                 <br />

                <asp:Label ID="lblTelefono" runat="server" Text="IngreseTelefono"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <br />

                <asp:Label ID="lblEspecialdiad" runat="server" Text="Seleccione Especialidad"></asp:Label>
                <asp:DropDownList ID="ddlEspecialidadMedico" runat="server"></asp:DropDownList>
                <br />

                <asp:Label ID="lblDiasAtencion" runat="server" Text="Seleccione dias de Atencion"></asp:Label>          
                <div class="checkbox-container">
                    <asp:CheckBoxList ID="chkDiasAtencion" runat="server" ValidationGroup="Medico"></asp:CheckBoxList>
                </div>
                <br />

                <asp:Label ID="lblInicioAtencion" runat="server" Text="Ingrese inicio de hora de atencion"></asp:Label>
                <asp:DropDownList ID="ddlHoraInicio" runat="server"></asp:DropDownList>
                <br />

                <asp:Label ID="lblFinAtencion" runat="server" Text="Ingrese fin de hora de atencion"></asp:Label>
                <asp:DropDownList ID="ddlHoraFin" runat="server"></asp:DropDownList>
                <br />          

                <asp:Button ID="btnAgregarMedico" runat="server" Text="Agregar Medico" CssClass="btnAgregarMedico" OnClick="btnAgregarMedico_Click" ValidationGroup="Medico" />
            </div>
        </div>
        <br />
        <asp:RequiredFieldValidator ID="rfvNombrUsuario" runat="server" ControlToValidate="txtNombreUsuario" ValidationGroup="Medico">*Ingrese Nombre Usuario</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvContrasenia1" runat="server" ControlToValidate="txtContrasenia1" ValidationGroup="Medico">*Ingrese contraseña</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvContrasenia2" runat="server" ControlToValidate="txtContrasenia2" ValidationGroup="Medico">*Confirme contraseña</asp:RequiredFieldValidator>
        <br />
        <asp:CompareValidator ID="cvContrasenia" runat="server" ControlToCompare="txtContrasenia1" ControlToValidate="txtContrasenia2" ValidationGroup="Medico">*Las contraseñas no coiciden</asp:CompareValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ValidationGroup="Medico">*Ingrese Legajo</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="regLegajo" runat="server" ControlToValidate="txtLegajo" ValidationExpression="^[a-zA-Z0-9]{4}$" ValidationGroup="Medico">*Ingrese Numeros o Letras hasta 4 caracteres</asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ValidationGroup="Medico">*Ingrese DNI</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="regDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$" ValidationGroup="Medico">*Ingrese solo Numeros</asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Medico">*Ingrese Nombre</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Medico">*Ingrese Apellido</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ValidationGroup="Medico">*Seleccione Sexo</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ValidationGroup="Medico">*Ingrese Nacionalidad</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ValidationGroup="Medico">*Ingrese Fecha Nacimiento</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cv_FechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*La fecha no puede ser mayor a la actual." Operator="LessThanEqual" Type="Date" ValidationGroup="Medico"></asp:CompareValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Medico">*Ingrese Direccion</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ValidationGroup="Medico">*Seleccione Provincia</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ValidationGroup="Medico">*Seleccione Localidad</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Medico">*Ingrese Email</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$" ValidationGroup="Medico">*Ingrese un Email valido</asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Medico">*Ingrese Telefono</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="regTelefono" runat="server" ControlToValidate="txtTelefono" ValidationExpression="^\d+$" ValidationGroup="Medico"></asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidadMedico" ValidationGroup="Medico">*Seleccione Especialidad</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvHorarioIni" runat="server" ControlToValidate="ddlHoraInicio" ValidationGroup="Medico">*Ingrese Horario  Inicio Atencion</asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="rfvHorarioFin" runat="server" ControlToValidate="ddlHoraFin" ValidationGroup="Medico">*Ingrese Horario Fin Atencion</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblMensaje2" runat="server" ViewStateMode="Enabled"></asp:Label>
        <br />
        <asp:Label ID="lblMensaje3" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblMensaje4" runat="server"></asp:Label>
    </form>
</body>
</html>
