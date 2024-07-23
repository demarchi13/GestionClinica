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
    public partial class UsuarioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario objUsuario = new Usuario();
                objUsuario = (Usuario)Session["Usuario"];
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

                cargarGrillaTurnos();
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        public void cargarGrillaTurnos()
        {
            //Obtiene el nombre de usuario del medico para filtrar los turnos de ese medico
            Usuario objUsuario = new Usuario();
            objUsuario = (Usuario)Session["Usuario"];

            //Obtiene el registro completo del medico a partir del nombre de usuario
            Medico objMedico = new Medico();
            NegocioMedico negocioMedico = new NegocioMedico();
            objMedico = negocioMedico.Obtener_Medico_Por_Nombre_Usuario_Negocio(objUsuario);

            //Ya con todo el registro cargado del medico se lo mandamos como argumento al metodo CargarGrillaTurnosNegocio
            //para cargar la grilla de los turnos que coincidan con ese medico mediante los campos IdMedico_tu y IdMedico_me
            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();
            tabla = objNegocioTurno.cargarGrillaTurnosNegocio(objMedico);
            grdTurnos.DataSource = tabla;
            grdTurnos.DataBind();
        }

        protected void grdTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //Si el text para filtrar turnos por fecha esta vacio activa la paginacion para ver todos los turnos
            if(txtFecha.Text == "")
            {
                grdTurnos.PageIndex = e.NewPageIndex;
                cargarGrillaTurnos();
            }
            //Si el text box tiene una fecha cargarda activa la paginacion para ver los turnos en esa fecha especifica
            else
            {
                grdTurnos.PageIndex = e.NewPageIndex;

                Cargar_Turnos_Por_Fecha();
            }
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGrillaTurnos();
            LimpiarGrillaHistorialPaciente(); //Limpia la grilla
            txtFecha.Text = "";
            txtTexto.Text = ""; //Limpia el textbox para buscar el historial
        }

        protected void btnTurnosDia_Click(object sender, EventArgs e)
        {
            txtFecha.Text = ""; //Limpiar el textbox Fecha

            //Obtiene el nombre de usuario del medico para filtrar los turnos de ese medico
            Usuario objUsuario = new Usuario();
            objUsuario = (Usuario)Session["Usuario"];

            //Obtiene el registro completo del medico a partir del nombre de usuario
            Medico objMedico = new Medico();
            NegocioMedico negocioMedico = new NegocioMedico();
            objMedico = negocioMedico.Obtener_Medico_Por_Nombre_Usuario_Negocio(objUsuario);

            //Manda como argumento el objMedico al metodo cargar_Turnos_Del_Dia_Negocio de la capa Negocio con todos los datos de ese medico
            //para filtrar los turnos de ese dia por medio del ID del Medico, luego se lo guarda en una tabla
            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();
            tabla = objNegocioTurno.cargar_Turnos_Del_Dia_Negocio(objMedico);
            grdTurnos.DataSource = tabla;
            grdTurnos.DataBind();

            LimpiarGrillaHistorialPaciente(); //Limpia la grilla
        }

        protected void btnFiltrarTurno_Click(object sender, EventArgs e)
        {
            LimpiarGrillaHistorialPaciente(); //Limpia la grilla
            txtTexto.Text = ""; //Limpia el textbox para buscar el historial

            try
            {
                //Si el textbox de tipo fecha es null o vacio muestra todos los turnos
                //porque quiere decir que no se utilizo el boton filtrar turnos por fecha
                if (txtFecha.Text == "" || txtFecha == null)
                {
                    cargarGrillaTurnos();
                }
                //Muestra todos los turnos de la fecha seleccionada
                else
                {
                    Cargar_Turnos_Por_Fecha();
                }
            }
            catch (Exception ex)
            {
                lblMensaje1.Text = " Error: " + ex.Message;
            }
        }

        public void cargarGrillaHistorialPaciente()
        {
            //Obtiene el nombre de usuario del medico para filtrar los turnos de ese medico
            Usuario objUsuario = new Usuario();
            objUsuario = (Usuario)Session["Usuario"];

            //Obtiene el registro completo del medico a partir del nombre de usuario
            Medico objMedico = new Medico();
            NegocioMedico negocioMedico = new NegocioMedico();
            objMedico = negocioMedico.Obtener_Medico_Por_Nombre_Usuario_Negocio(objUsuario);

            //Guarda el texto que se utilizara como palabra clave y registrar la busqueda en los Historiales
            Turno objTurno = new Turno();
            objTurno.BuscarTexto = txtTexto.Text;

            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = objNegocioTurno.cargarHistorialTurnosPacienteNegocio(objTurno, objMedico);

            grdPaciente.DataSource = tabla;
            grdPaciente.DataBind();
        }

        public void LimpiarGrillaHistorialPaciente()
        {
            //Limpia la grilla de turnos para ocultarla
            DataTable tablaVacia = new DataTable();
            grdPaciente.DataSource = tablaVacia;
            grdPaciente.DataBind();
          
        }

        //Boton Editar grilla paciente
        protected void grdPaciente_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Establece la fila en modo de edición
            grdPaciente.EditIndex = e.NewEditIndex;
            cargarGrillaHistorialPaciente();          
        }

        //Boton cancelar
        protected void grdPaciente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdPaciente.EditIndex = -1;
            cargarGrillaHistorialPaciente();
            txtTexto.Text = ""; //Limpia el textbox para buscar el historial
        }
        
        //Muestra todos los historiales que tengan algun texto coicidente en cualquiera de los
        //campos del registro
        protected void btnHistoriales_Click(object sender, EventArgs e)
        {
            //Si el text box contiene texto realiza la busqueda del registro
            if (txtTexto.Text != "")
            {
                cargarGrillaHistorialPaciente();
            }
            //Si esta vacio limpia la grilla del historial y sale del modo edicion
            else
            {
                grdPaciente.EditIndex = -1;
                LimpiarGrillaHistorialPaciente();   
            }
        }

        protected void grdPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            txtTexto.Text = ""; //Limpia el textbox para buscar el historial

            //Busca datos del edit item template y los guarda

            //Turnos  
            string s_dni = ((Label)grdPaciente.Rows[e.RowIndex].FindControl("lbl_eit_dni")).Text; //Personas/Pacientes
            bool s_asistencia = ((CheckBox)grdPaciente.Rows[e.RowIndex].FindControl("chk_eit_asistencia")).Checked;
            string s_observaciones = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_observaciones")).Text;
            string s_idTurno = ((Label)grdPaciente.Rows[e.RowIndex].FindControl("lbl_eit_IdTurno")).Text;

            //CARGAR LOS DATOS AL OBJETO;
            Turno objTurno = new Turno();
            objTurno.DniPaciente = s_dni;
            objTurno.IdTurno = int.Parse(s_idTurno);
            objTurno.Asistencia = s_asistencia;
            objTurno.Observaciones = s_observaciones;

            NegocioTurno objNegocioTurno = new NegocioTurno();
            try
            {
                //Actualiza la asistencia del turno y la observacion del paciente
                if (objNegocioTurno.Agregar_Asistencia_Turno_Negocio(objTurno))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Asistencia y Observaciones actualizados exitosamente!');", true);
                }                
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No se pudo actualizar el registro!');", true);
            }

            grdPaciente.EditIndex = -1; //Salir Modo Edicion

            cargarGrillaHistorialPaciente();
        }

        protected void grdPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPaciente.PageIndex = e.NewPageIndex;
            cargarGrillaHistorialPaciente();
        }

        private void Cargar_Turnos_Por_Fecha()
        {
            //Guarda la fecha del turno en el objeto para luego realizar la busqueda
            Turno objTurno = new Turno();
            objTurno.FechaTurno = DateTime.Parse(txtFecha.Text);

            //Obtiene el nombre de usuario del medico para filtrar los turnos de ese medico
            Usuario objUsuario = new Usuario();
            objUsuario = (Usuario)Session["Usuario"];

            //Obtiene el registro completo del medico a partir del nombre de usuario
            Medico objMedico = new Medico();
            NegocioMedico negocioMedico = new NegocioMedico();
            objMedico = negocioMedico.Obtener_Medico_Por_Nombre_Usuario_Negocio(objUsuario);

            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();
            tabla = objNegocioTurno.cargarTurnosPorFechaNegocio(objTurno, objMedico);

            grdTurnos.DataSource = tabla;
            grdTurnos.DataBind();
        }
    }
}