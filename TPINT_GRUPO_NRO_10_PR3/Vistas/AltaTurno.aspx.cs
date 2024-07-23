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
    public partial class AltaTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

                cargar_DDL_Especialidades();
                cargar_DDL_Medicos();
                cargar_DDL_HoraTurno();
                lbl_infoMedico.Text = "No hay ningun Medico seleccionado";
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        public void cargar_DDL_Especialidades()
        {
            NegocioEspecialidad objNegocioEspecialidad = new NegocioEspecialidad();
            DataTable tabla = new DataTable();
            tabla = objNegocioEspecialidad.cargarDdlEspecialidades();

            ddlEspecialidad.DataSource = tabla;
            ddlEspecialidad.DataTextField = "NombreEspecialidad_esp";
            ddlEspecialidad.DataValueField = "IdEspecialidad_esp";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Selecciona Especialidad", "Selecciona Especialidad"));
        }

        public void cargar_DDL_Medicos()
        {
            //Obtiene el nombre de la especialdiad y el id seleccionado del ddlEspecialidades
            Especialidad objEspecialidad = new Especialidad();
            objEspecialidad.IdEspecialidad = ddlEspecialidad.SelectedValue;

            //Cargar el ddl de medicos segun la especialidad seleccionada
            NegocioMedico ObjNegocioMedico = new NegocioMedico();
            DataTable tabla = new DataTable();
            tabla = ObjNegocioMedico.cargarMedicosPorEspecialidad(objEspecialidad);

            ddlMedicos.DataSource = tabla;
            ddlMedicos.DataTextField = "NombreCompleto"; //Va a mostrar el nombre completo
            ddlMedicos.DataValueField = "DNI_me"; //Guarda el dni del medico como valor para usarlo posteriormente
            ddlMedicos.DataBind();
            ddlMedicos.Items.Insert(0, new ListItem("Selecciona Medico", "0"));
        }

        public void cargar_DDL_HoraTurno()
        {
            ddlHoraTurno.Items.Insert(0, new ListItem("Selecciona Hora", "0"));
            ddlHoraTurno.Items.Add(new ListItem("08:00", "08:00"));
            ddlHoraTurno.Items.Add(new ListItem("09:00", "09:00"));
            ddlHoraTurno.Items.Add(new ListItem("10:00", "10:00"));
            ddlHoraTurno.Items.Add(new ListItem("11:00", "11:00"));
            ddlHoraTurno.Items.Add(new ListItem("12:00", "12:00"));
            ddlHoraTurno.Items.Add(new ListItem("13:00", "13:00"));
            ddlHoraTurno.Items.Add(new ListItem("14:00", "14:00"));
            ddlHoraTurno.Items.Add(new ListItem("15:00", "15:00"));
            ddlHoraTurno.Items.Add(new ListItem("16:00", "16:00"));
            ddlHoraTurno.Items.Add(new ListItem("17:00", "17:00"));
            ddlHoraTurno.Items.Add(new ListItem("18:00", "18:00"));
            ddlHoraTurno.Items.Add(new ListItem("19:00", "19:00"));
            ddlHoraTurno.Items.Add(new ListItem("20:00", "20:00"));
            ddlHoraTurno.Items.Add(new ListItem("21:00", "21:00"));
            ddlHoraTurno.Items.Add(new ListItem("22:00", "22:00"));
        }

        //Muestra los medicos disponibles de la especialidad seleccionada
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargar_DDL_Medicos();
        }

        protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Si se selecciono un medico procede a cargar la grilla con la informacion
            //del medico elegido (nombre, apellido, especialidad, dias de atencion y horarios)
            if(ddlMedicos.SelectedValue != "0")
            {
                NegocioMedico objNegocioMedico = new NegocioMedico();
                Medico objMedico = new Medico();
                objMedico.DniMedico = ddlMedicos.SelectedValue; //Guarda Dni Medico

                DataTable tabla = new DataTable();
                tabla = objNegocioMedico.cargarGrillaMedicoPorDni(objMedico);

                grdMedico.DataSource = tabla;
                grdMedico.DataBind();

                lbl_infoMedico.Text = "Dias y Horarios de Atencion del Medico";
            }
            //Si no se eligio ningun medico todavia informa por pantalla el mensaje
            //y carga una tabla vacia para que no se muestre nada
            else
            {
                DataTable tabla = new DataTable();
                tabla = null;
                grdMedico.DataSource = tabla;
                grdMedico.DataBind();
                lbl_infoMedico.Text = "No hay ningun Medico seleccionado";
            }
        }

        protected void btnCargarTurno_Click(object sender, EventArgs e)
        {
            Turno objTurno = new Turno();  
            Medico objMedico = new Medico();
            Paciente objPaciente = new Paciente();
             
            //Obtiene el dni del medico para realizar la busqueda
            Medico auxMedico = new Medico();
            auxMedico.DniMedico = ddlMedicos.SelectedValue;

            //Obtiene el registro completo del medico
            NegocioMedico objNegocioMedico = new NegocioMedico();
            objMedico = objNegocioMedico.ObtenerMedico(auxMedico);


            //Obtiene el dni del paciente para realizar la busqueda
            Paciente auxPaciente = new Paciente();
            auxPaciente.DniPaciente = txtDniPaciente.Text.Trim();

            //Obtener el registro completo del paciente
            NegocioPaciente objNegocioPaciente = new NegocioPaciente();
            objPaciente = objNegocioPaciente.ObtenerPaciente(auxPaciente);
            objPaciente = objNegocioPaciente.ObtenerIdPacientePorDni(auxPaciente);
                
            //Cargar datos al objeto Turno
            objTurno.IdEspecialidad = ddlEspecialidad.SelectedValue;
            objTurno.IdMedico = objMedico.IdMedico;
            objTurno.DniMedico = ddlMedicos.SelectedValue;
            objTurno.DniPaciente = txtDniPaciente.Text.Trim();
            objTurno.IdPaciente = objPaciente.IdPaciente;
            objTurno.FechaTurno = Convert.ToDateTime(txtFechaTurno.Text);
            objTurno.HoraTurno = TimeSpan.Parse(ddlHoraTurno.SelectedValue);
            objTurno.Asistencia = false;

            //Verificar que el dni del paciente exista
            //Para que el dni exista en la tabla pacientes primero tiene que existir en la
            //tabla personas. Para eso reutilizamos el metodo verificarDNI
            NegocioPersona objNegocioPersona = new NegocioPersona();
            Persona objPersona = new Persona();
            objPersona.Dni = txtDniPaciente.Text;

            NegocioTurno objNegocioTurno = new NegocioTurno();
            try
            {
                //Verifica que el dni exista
                if (objNegocioPersona.verificarDNI(objPersona))
                {
                    objNegocioTurno.AgregarTurno(objTurno);
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Turno cargado exitosamente!');", true);   
                }
            }
            catch (Exception ex)
            {      
                string mensaje = ex.Message.Replace("'", "\\'");
                string alerta = "alert('" + mensaje + "');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", alerta, true);
            }

        }

        protected void txtFechaTurno_TextChanged(object sender, EventArgs e)
        {
            lblTurnos.Text = "Turnos ocupados para la fecha seleccionada";
            Turno objTurno = new Turno();
            NegocioTurno objNegocioTurno = new NegocioTurno();

            objTurno.FechaTurno = Convert.ToDateTime(txtFechaTurno.Text);
            DataTable tabla = new DataTable();

            tabla = objNegocioTurno.TraerTurnos(objTurno);
            grdTurnos.DataSource = tabla;
            grdTurnos.DataBind();
        }
    }
}