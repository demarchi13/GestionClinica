<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioMedico.aspx.cs" Inherits="Vistas.UsuarioMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> CLINICA SALUD</title>

    <!--BOOTSRAP-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    
    <!--HOJA DE ESTILOS-->
    <link href="CSS/Header.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/EstiloMedico.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        .auto-style1 {
            position: absolute; /* Permite el posicionamiento absoluto del elemento */
            left: 999px; /* Mueve el label 1000px hacia la derecha */
            top: 10px; /* Alinea el label con la parte superior del contenedor */
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

         <header> 
            <div class="h1ClinicaSalud"> 
                <h2>CLINICA SALUD</h2>
                <h6>&nbsp;</h6>
                <h4><asp:Label ID="lblNombreUsuario" runat="server" CssClass="auto-style1"></asp:Label></h4>
                <h4><asp:Button ID="btnSalir" runat="server" Text="Cerrar Sesion" CssClass="btnSalir" OnClick="btnSalir_Click" /></h4>
            </div>
        </header> 
        
        <div class="divPadre">
            <div class="divMensaje">
                <asp:Label ID="lblMensaje" runat="server" Text="Listado de Turnos"></asp:Label>
            </div>
            <div class="divEspaciador">
                <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar Todos" CssClass="boton" OnClick="btnMostrarTodos_Click" />
                <asp:Button ID="btnTurnosDia" runat="server" Text="Turnos del dia" CssClass="boton" OnClick="btnTurnosDia_Click" />
                <br />
            </div>
            <div class="divEspaciador">
                <asp:Label ID="lblMensaje2" runat="server" Text="Filtrar turnos por Fecha: "></asp:Label>
                <asp:TextBox ID="txtFecha" runat="server" Type ="date" CssClass="boton"></asp:TextBox>
                <asp:Button ID="btnFiltrarTurno" runat="server" Text="Filtrar" CssClass="boton" OnClick="btnFiltrarTurno_Click" />
            </div>          
            <div class="divGrilla">
                <asp:GridView ID="grdTurnos" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" OnPageIndexChanging="grdTurnos_PageIndexChanging" PageSize="4" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_nombre" runat="server" Text='<%# Bind("Nombre_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_apellido" runat="server" Text='<%# Bind("Apellido_pe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_dni" runat="server" Text='<%# Bind("DNI_Paciente_tu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_fechaTurno" runat="server" Text='<%# Bind("Fecha" , "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_horaTurno" runat="server" Text='<%# Bind("HoraTurno_tu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID Turno" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_IdTurno" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
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
                <asp:Label ID="lblMensaje1" runat="server"></asp:Label>
                
                <div class="divEspaciador2">
                    <asp:Label ID="lblIngreseAlgo" runat="server" Text="Buscar en Historiales por palabras clave"></asp:Label>
                    <asp:TextBox ID="txtTexto" runat="server" ValidationGroup="Paciente"></asp:TextBox>
                    <asp:Button ID="btnHistoriales" runat="server" Text="Mostrar Historiales" CssClass="boton" OnClick="btnHistoriales_Click" ValidationGroup="Paciente" />
                </div>
                <asp:GridView ID="grdPaciente" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="grdPaciente_RowCancelingEdit" OnRowEditing="grdPaciente_RowEditing" OnRowUpdating="grdPaciente_RowUpdating" OnPageIndexChanging="grdPaciente_PageIndexChanging">
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
                                <asp:Label ID="lbl_eit_dni" runat="server" Text='<%# Bind("DNI_Paciente_tu") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_dni" runat="server" Text='<%# Bind("DNI_Paciente_tu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_fechaTurno" runat="server" Text='<%# Bind("FechaTurno_tu") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_fechaTurno" runat="server" Text='<%# Bind("FechaTurno_tu", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_horaTurno" runat="server" Text='<%# Bind("HoraTurno_tu") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_horaTurno" runat="server" Text='<%# Bind("HoraTurno_tu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Asistencia">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chk_eit_asistencia" runat="server" Checked='<%# Bind("Asistencia_tu") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chk_it_asistencia" runat="server" Checked='<%# Bind("Asistencia_tu") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observaciones">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_observaciones" runat="server" TextMode="MultiLine" Text='<%# Bind("Observacion_tu") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_observaciones" runat="server" Text='<%# Bind("Observacion_tu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID Turno">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_eit_IdTurno" runat="server" Text='<%# Bind("IdTurno_tu") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_IdTurno" runat="server" Text='<%# Bind("IdTurno_tu") %>'></asp:Label>
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
                <br />
                <br />
            </div>
         </div>

    </form>
</body>
</html>
