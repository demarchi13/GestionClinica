<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoPacientes.aspx.cs" Inherits="Vistas.crudPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>
     <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/ListadoPacientes.css" rel="stylesheet" type="text/css"/>

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
            <div class="divMensaje">
                <asp:Label ID="lblMensaje" runat="server" Text="Listado de Pacientes"></asp:Label>
            </div>
            <div class="divBotonPaciente">
                <asp:Button ID="btnAgregarPaciente" runat="server" Text="Agregar Paciente" CssClass="boton" OnClick="btnAgregarPaciente_Click" />
            </div>
            <div class="divBotonPaciente">
                <asp:Label ID="lblFiltrarMedico" runat="server" Text="Buscar Paciente por palabra Clave:"></asp:Label>
                <asp:TextBox ID="txtTexto" runat="server" CssClass="txtDNI"></asp:TextBox>
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="boton" OnClick="btnFiltrar_Click" />
                <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar Todos" CssClass="boton" OnClick="btnMostrarTodos_Click" />
                <br />
                <asp:GridView ID="grdPacientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCancelingEdit="grdPacientes_RowCancelingEdit" OnRowDataBound="grdPacientes_RowDataBound" OnRowEditing="grdPacientes_RowEditing" OnRowUpdating="grdPacientes_RowUpdating" PageSize="4" OnPageIndexChanging="grdPacientes_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_nombre" runat="server" Text='<%# Bind("Nombre_pe") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_nombre" runat="server" Text='<%# Bind("Nombre_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_apellido" runat="server" Text='<%# Bind("Apellido_pe") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_apellido" runat="server" Text='<%# Bind("Apellido_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_dni" runat="server" Text='<%# Bind("DNI_PE") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_dni" runat="server" Text='<%# Bind("DNI_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sexo">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_eit_sexo" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_sexo" runat="server" Text='<%# Bind("IdSexo_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_provincia" runat="server" Text='<%# Bind("NombreProvincia_pro") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_provincia" runat="server" Text='<%# Bind("NombreProvincia_pro") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_localidad" runat="server" Text='<%# Bind("NombreLocalidad") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_localidad" runat="server" Text='<%# Bind("NombreLocalidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FechaNac">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_fechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento_pe") %>' Type="date"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_fechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento_pe","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Direccion">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_direccion" runat="server" Text='<%# Bind("Direccion_pe") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_direccion" runat="server" Text='<%# Bind("Direccion_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_email" runat="server" Text='<%# Bind("Email_pe") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_email" runat="server" Text='<%# Bind("Email_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_telefono" runat="server" Text='<%# Bind("Telefono_pe") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_telefono" runat="server" Text='<%# Bind("Telefono_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IdPaciente">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_IdPaciente" runat="server" Text='<%# Bind("IdPaciente_pa") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_IdPaciente" runat="server" Text='<%# Bind("IdPaciente_pa") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
