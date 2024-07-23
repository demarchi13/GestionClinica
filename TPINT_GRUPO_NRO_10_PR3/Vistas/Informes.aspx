<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vistas.Informes2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/Informes.css" rel="stylesheet" type="text/css"/>
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
            <div class="divPadre">
                <div class="divSelecciones">
                     <asp:Button ID="btnTotalTurnos" runat="server" Text="Total Turnos" CssClass="boton" OnClick="btnTotalTurnos_Click" />
                </div>
                <div class="divMensaje">
                    <asp:Label ID="lblMensaje" runat="server" Text="Seleccione las fechas y el tipo de informe"></asp:Label>
                </div>
                
                <div class="divSelecciones">
                    <asp:Label ID="lblDesde" runat="server" Text="Desde: "></asp:Label>
                    <asp:TextBox ID="txtDesde" runat="server" Type="date" CssClass="txtMes"></asp:TextBox>

                    <asp:Label ID="lblHasta" runat="server" Text="Hasta: "></asp:Label>
                    <asp:TextBox ID="txtHasta" runat="server" Type="date" CssClass="txtMes"></asp:TextBox>

                   
                    <asp:Button ID="btnPresentes" runat="server" Text="Presentes" CssClass="boton" OnClick="btnPresentes_Click" ValidationGroup="Fechas"/>
                    <asp:Button ID="btnAusentes" runat="server" Text="Ausentes" CssClass="boton" ValidationGroup="Fechas" OnClick="btnAusentes_Click"/>             
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="rfv_Desde" runat="server" ErrorMessage="*Seleccione Fecha de Inicio" ControlToValidate="txtDesde" ValidationGroup="Fechas"></asp:RequiredFieldValidator>
                    <br /> 
                    <asp:RequiredFieldValidator ID="rfv_Hasta" runat="server" ErrorMessage="*Seleccione Fecha de Fin" ControlToValidate="txtHasta" ValidationGroup="Fechas"></asp:RequiredFieldValidator>
                </div>
                <div class="divSelecciones2">
                     <asp:Label ID="lblMensaje2" runat="server" Text="Filtrar informe por DNI: "></asp:Label>
                    <asp:TextBox ID="txtDniPaciente" runat="server"></asp:TextBox>
                </div>
                <div class="divGrilla">
                    <asp:GridView ID="grdInformes" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
                
            </div>
    </form>
</body>
</html>
