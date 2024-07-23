using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class GestionMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrillaMedicos();

                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;
            }
        }

        public void cargarGrillaMedicos()
        {
            NegocioMedico objListadoMedico = new NegocioMedico();
            DataTable tabla = new DataTable();

            tabla = objListadoMedico.CargarGrillaMedicos();
            grdMedicos.DataSource = tabla;
            grdMedicos.DataBind();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaMedicos.aspx");
        }


        //BOTONES DE LA GRILLA GRILLA "grdMedicos"

        //BAJA LOGICA
        protected void grdMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblMensaje.Text = "";

            //Busca el dato del item template
            string DniMedico = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lblDNI")).Text;

            Medico objMedico = new Medico();
            objMedico.DniMedico = DniMedico;

            NegocioMedico objNegocioMedico = new NegocioMedico();
            if(objNegocioMedico.BajaLogicaMedico(objMedico))
            {
                lblMensaje.Text = "Medico Dado de Baja Exitosamente";
            }

            cargarGrillaMedicos();     
        }


        //BOTON EDITAR
        protected void grdMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdMedicos.EditIndex = e.NewEditIndex;
            cargarGrillaMedicos();
        }


        //BOTON CANCELAR EDICION 
        protected void grdMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdMedicos.EditIndex = -1;
            cargarGrillaMedicos();
        }


        //BOTON ACTUALIZAR
        protected void grdMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Busca datos del edit item template y los guarda

            //Personas
            string nombre = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_nombre")).Text;
            string apellido = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_apellido")).Text;
            string dni = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_dni")).Text; //Personas y Medicos
            string nombreProvincia = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_provincia")).Text;
            string nombreLocalidad = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_localidad")).Text;
            string direccion = ((TextBox)grdMedicos.Rows[e.RowIndex].FindControl("txt_eit_direccion")).Text;
            string Idsexo = ((DropDownList)grdMedicos.Rows[e.RowIndex].FindControl("ddl_eit_sexo")).Text;
            string email = ((TextBox)grdMedicos.Rows[e.RowIndex].FindControl("txt_eit_email")).Text;
            string telefono = ((TextBox)grdMedicos.Rows[e.RowIndex].FindControl("txt_eit_telefono")).Text;

            //Especialidades
            string nombreEspecialidad = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_especialidad")).Text;
            string idEspecialidad = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_id_especialidad")).Text;

            //Medicos
            string idMedico = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_id_medico")).Text;

            //Usuarios
            string usuario = ((TextBox)grdMedicos.Rows[e.RowIndex].FindControl("txt_eit_usuario")).Text;
            string contrasenia = ((TextBox)grdMedicos.Rows[e.RowIndex].FindControl("txt_eit_contrasenia")).Text;
            string idUsuario = ((Label)grdMedicos.Rows[e.RowIndex].FindControl("lbl_eit_idUsuario")).Text;

            //CARGAR LOS DATOS AL OBJETO
            Persona objPersona = new Persona();
            Provincia objProvincia = new Provincia();
            Localidad objLocalidad = new Localidad();
            Especialidad objEspecialidad = new Especialidad();
            Medico objMedico = new Medico();
            Usuario objUsuario = new Usuario();

            //PERSONAS
            objPersona.Nombre = nombre; //NO EDITABLE
            objPersona.Apellido = apellido; //NO EDITABLE
            objPersona.Dni = dni; //NO EDITABLE
            objPersona.Direccion = direccion; //EDITABLE
            objPersona.IdSexo = Idsexo; //EDITABLE
            objPersona.Email = email; //EDITABLE 
            objPersona.Telefono = telefono;//EDITABLE

            //PROVINCIAS
            objProvincia.NombreProvincia = nombreProvincia; //NO EDITABLE

            //LOCALIDADES
            objLocalidad.NombreLocalidad = nombreLocalidad; //NO EDITABLE

            //MEDICOS 
            objMedico.IdMedico = Convert.ToInt32(idMedico); //NO EDITABLE

            //ESPECIALIDADES
            objEspecialidad.NombreEspecialidad = nombreEspecialidad; //NO EDITABLE
            objEspecialidad.IdEspecialidad = idEspecialidad; //NO EDITABLE

            //USUARIOS
            objUsuario.NombreUsuario = usuario; //EDITABLE
            objUsuario.Contrasenia = contrasenia; //EDITABLE
            objUsuario.IdUsuario = Convert.ToInt32(idUsuario); //NO EDITABLE


            //Actualizar registro del medico
            NegocioUsuario objNegocioUsuario = new NegocioUsuario();
            NegocioMedico objNegocioMedico = new NegocioMedico();

            Usuario auxUsuario = new Usuario();
            auxUsuario = objNegocioUsuario.ObtenerIdUsuario(objUsuario); //Obtiene el registro completo, no solo el id

            //Verifica si el nuevo nombre de usuario ingresado es distinto del nombre de usuario actual
            if(auxUsuario.NombreUsuario != objUsuario.NombreUsuario)
            {   
                //Si es distinto verifica que no exista en la base de datos
                if (!objNegocioUsuario.verificarNombreUsuario(objUsuario))
                { 
                    objNegocioMedico.ActualizarMedico_Personas(objPersona); //Actualiza datos en la tabla persona relacionados al medico
                    objNegocioMedico.ActualizarMedico_Usuarios(objUsuario); //Actualiza datos en la tabla usuario relacionados al usuario del medico
                }
            }
            else
            {
                //Si el nombre de usuario es igual intenta actualizar los datos
                try
                {
                    // Si el nombre de usuario no ha sido modificado, procede con la actualización
                    objNegocioMedico.ActualizarMedico_Personas(objPersona); //Actualiza datos en la tabla persona relacionados al medico
                    objNegocioMedico.ActualizarMedico_Usuarios(objUsuario); //Actualiza datos en la tabla usuario relacionados al usuario del medico
                }
                //Si se intenta actualizar el nombre de usuario por un nombre de usuario que ya existe se activa la alerta
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El Nombre de Usuario ya se encuentra en uso! No se pudo actualizar.');", true);
                }
            }

            grdMedicos.EditIndex = -1; //Salir Modo Edicion

            cargarGrillaMedicos();
        }

        //PAGINACION EN LA GRILLA grdMedicos
        protected void grdMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMedicos.PageIndex = e.NewPageIndex;
            cargarGrillaMedicos();
        }


        protected void grdMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {          
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                // Carga el DropDownList (Sexos) dentro de la grilla medicos
                DropDownList ddlSexos = (DropDownList)e.Row.FindControl("ddl_eit_sexo");

                if (ddlSexos != null)
                {
                    //GestionEditarMedico objGestionEditarMedico = new GestionEditarMedico();

                    NegocioMedico objNegocioMedico = new NegocioMedico();
                    ddlSexos.DataSource = objNegocioMedico.cargarSexos();
                    ddlSexos.DataTextField = "IdSexo_se";
                    ddlSexos.DataValueField = "IdSexo_se";
                    ddlSexos.DataBind();
                }
                if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Obtener el valor actual del sexo del paciente
                    string sexoAnterior = DataBinder.Eval(e.Row.DataItem, "Sexo").ToString();

                    // Encontrar el DropDownList y establecer el valor seleccionado
                    DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddl_eit_sexo");
                    if (ddlSexo != null)
                    {
                        ddlSexo.SelectedValue = sexoAnterior;
                    }
                }
            }
        }


        //Muestra todos los medicos en la grilla grdMedicos
        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGrillaMedicos();

            //Oculta los datos de la grilla grdHorariosAtencion asignadole una tabla vacia
            DataTable tabla2 = new DataTable();  
            grdHorariosAtencion.DataSource = tabla2;
            grdHorariosAtencion.DataBind();

            txtTexto.Text = "";
            TxtDNI.Text = "";
        }

        //Filtra registro por DNI en la grilla GrdMedicos y carga la grilla grdHorariosAtencion con los
        //datos del medico filtrado (nombre, apellido, dni, id medico, dias atencion, horarios)
        //solo se podran editar los dias y los horarios de atencion
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (txtTexto.Text.Trim() != "")
            { 
                NegocioMedico objNegocioMedico = new NegocioMedico();
                DataTable tabla = new DataTable();

                //Obtiene el DNI y lo guarda en un objeto EditarMedico
                Medico objMedico = new Medico();
                objMedico.BuscarTexto = txtTexto.Text;
                
                tabla = objNegocioMedico.Buscar_Medico_por_texto_negocio(objMedico); //Recibe el obj con el dni cargado              
                grdMedicos.DataSource = tabla;
                grdMedicos.DataBind();

                // Cargar la grilla grdHorariosAtencion
                //cargarGrillaHorariosAtencion();
            }
            else
            {
                cargarGrillaMedicos();
                cargarGrillaHorariosAtencion();
            }
                    
        }

        //CARGAR GRILLA GrdHorariosAtencion
        public void cargarGrillaHorariosAtencion()
        {
            //Obtiene el DNI y lo guarda en el objeto de la clase Medico
            Medico objMedico = new Medico();
            objMedico.DniMedico = TxtDNI.Text;
 
            // Cargar la grilla grdHorariosAtencion
            NegocioMedico negocioMedico = new NegocioMedico();
            DataTable tabla = new DataTable();
            tabla = negocioMedico.cargarHorariosAtencion(objMedico); //Recibe el obj con el dni cargado
            grdHorariosAtencion.DataSource = tabla;
            grdHorariosAtencion.DataBind();
        }

        // BOTONES DE LA GRILLA GrdHorariosAtencion
        // EDITAR
        protected void grdHorariosAtencion_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdHorariosAtencion.EditIndex = e.NewEditIndex;
            cargarGrillaHorariosAtencion();  //Actualiza grilla    
        }

        // CANCELAR EDICION
        protected void grdHorariosAtencion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdHorariosAtencion.EditIndex = -1;
            cargarGrillaHorariosAtencion(); //Actualiza grilla
        }

        // ACTUALIZAR EDICION
        protected void grdHorariosAtencion_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DiaAtencion objDiaAtencion = new DiaAtencion();
            HorarioAtencion objHorario = new HorarioAtencion();

            string DNI = ((Label)grdHorariosAtencion.Rows[e.RowIndex].FindControl("lbl_eit_dni")).Text;
            string DiaAtencion = ((Label)grdHorariosAtencion.Rows[e.RowIndex].FindControl("lbl_eit_diaAtencion")).Text;
            string HorarioInicio = ((DropDownList)grdHorariosAtencion.Rows[e.RowIndex].FindControl("ddl_eit_horarioInicio")).Text;
            string Horariofin = ((DropDownList)grdHorariosAtencion.Rows[e.RowIndex].FindControl("ddl_eit_horarioFin")).Text;
            bool Activo = ((CheckBox)grdHorariosAtencion.Rows[e.RowIndex].FindControl("chk_eit_activo")).Checked;

            
            if (Activo) //Si el dia de atencion es true
            {
                try
                {
                    objDiaAtencion.NombreDia = DiaAtencion; //Asigna el nombre del dia

                    DiaAtencion auxDiaAtencion = new DiaAtencion();
                    NegocioDiaAtencion objNegocioDiaAtencion = new NegocioDiaAtencion();
                    auxDiaAtencion = objNegocioDiaAtencion.ObtenerDia(objDiaAtencion); //Obtiene el id del dia atencion

                    //Asigna los datos completos del objeto HorarioAtencion una vez obtenido el id del dia
                    objHorario.IdDia = auxDiaAtencion.IdDia;
                    objHorario.HorarioInicio = TimeSpan.Parse(HorarioInicio);
                    objHorario.HorarioFin = TimeSpan.Parse(Horariofin);
                    objHorario.DniMedico = DNI;
                    objHorario.Activo = Activo;

                    //Modifica los horarios de atencion
                    NegocioHorarioAtencion objNegocioHorarioAtencion = new NegocioHorarioAtencion();
                    objNegocioHorarioAtencion.EditarHorarioAtencion(objHorario);

                    grdHorariosAtencion.EditIndex = -1; //Salir del modo edicion
                    cargarGrillaHorariosAtencion(); //Recarga la grilla
                }
                //Si el check box activo se selecciona pero no se elige ningun horario salta el catch con el mensaje
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Por Favor, Seleccione un Horario de Inicio y Fin.');", true);
                    grdHorariosAtencion.EditIndex = -1;
                    cargarGrillaHorariosAtencion();
                }
            }  
            else //Si el dia no esta activo le asigna el hario 00:00 por defecto
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Marque la casilla -Activo- si desea modificar los Horarios de Atencion.');", true);
                try
                {                
                    objDiaAtencion.NombreDia = DiaAtencion;

                    DiaAtencion auxDiaAtencion = new DiaAtencion();
                    NegocioDiaAtencion objNegocioDiaAtencion = new NegocioDiaAtencion();
                    auxDiaAtencion = objNegocioDiaAtencion.ObtenerDia(objDiaAtencion);

                    objHorario.HorarioInicio = TimeSpan.Parse("00:00");
                    objHorario.HorarioFin = TimeSpan.Parse("00:00");
                    objHorario.DniMedico = DNI;
                    objHorario.Activo = Activo;
                    objHorario.IdDia = auxDiaAtencion.IdDia;
  
                    NegocioHorarioAtencion objNegocioHorarioAtencion = new NegocioHorarioAtencion();
                    objNegocioHorarioAtencion.EditarHorarioAtencion(objHorario);

                    grdHorariosAtencion.EditIndex = -1;
                    cargarGrillaHorariosAtencion();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Por Favor, Asegurese de que la casilla 'Activo' se encuentra marcada si " +
                        "desea agregar un nuevo dia de atencion y modificar los horarios.');", true);
                    grdHorariosAtencion.EditIndex = -1;
                    cargarGrillaHorariosAtencion();
                }
            }
        }

        protected void btnFiltrar_Dias_Horarios_Click(object sender, EventArgs e)
        {
            cargarGrillaHorariosAtencion();
        }

        protected void grdHorariosAtencion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Carga el DropDownList con el horario de inicio de atencion dentro de la grilla medicos
            DropDownList ddl_horario_inicio = (DropDownList)e.Row.FindControl("ddl_eit_horarioInicio");

            if (ddl_horario_inicio != null)
            {
                cargar_ddl_horarios_inicio(ddl_horario_inicio);
            }

            // Carga el DropDownList con el horario de inicio de atencion dentro de la grilla medicos
            DropDownList ddl_horario_fin = (DropDownList)e.Row.FindControl("ddl_eit_horarioFin");

            if (ddl_horario_fin != null)
            {
                cargar_ddl_horarios_fin(ddl_horario_fin);
            }
        }

        private void cargar_ddl_horarios_inicio(DropDownList ddl_horarios_inicio)
        {
            ddl_horarios_inicio.Items.Insert(0, new ListItem("Selecciona Hora", ""));
            ddl_horarios_inicio.Items.Add(new ListItem("08:00", "08:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("09:00", "09:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("10:00", "10:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("11:00", "11:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("12:00", "12:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("13:00", "13:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("14:00", "14:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("15:00", "15:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("16:00", "16:00"));
            ddl_horarios_inicio.Items.Add(new ListItem("17:00", "17:00"));
        }

        private void cargar_ddl_horarios_fin(DropDownList ddl_horarios_fin)
        {
            ddl_horarios_fin.Items.Insert(0, new ListItem("Selecciona Hora", ""));
            ddl_horarios_fin.Items.Add(new ListItem("09:00", "09:00"));
            ddl_horarios_fin.Items.Add(new ListItem("10:00", "10:00"));
            ddl_horarios_fin.Items.Add(new ListItem("11:00", "11:00"));
            ddl_horarios_fin.Items.Add(new ListItem("12:00", "12:00"));
            ddl_horarios_fin.Items.Add(new ListItem("13:00", "13:00"));
            ddl_horarios_fin.Items.Add(new ListItem("14:00", "14:00"));
            ddl_horarios_fin.Items.Add(new ListItem("15:00", "15:00"));
            ddl_horarios_fin.Items.Add(new ListItem("16:00", "16:00"));
            ddl_horarios_fin.Items.Add(new ListItem("17:00", "17:00"));
            ddl_horarios_fin.Items.Add(new ListItem("18:00", "18:00"));
        }
    }
}