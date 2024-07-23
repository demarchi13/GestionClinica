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
    public partial class AltaMedicos : System.Web.UI.Page
    {     
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                Usuario objLblUsuario = new Usuario();
                objLblUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objLblUsuario.NombreUsuario;

                cv_FechaNacimiento.ValueToCompare = DateTime.Now.ToString("yyyy-MM-dd");

                cargarDiasChk();
                cargarDdlSexo();
                cargarDdlProvincia();
                cargarDdlLocalidades();
                cargarDdlEspecialidades();
                cargar_DDL_HoraTurno();
            }
        }


        public void cargar_DDL_HoraTurno()
        {

            ddlHoraInicio.Items.Insert(0, new ListItem("Selecciona Hora", ""));
            ddlHoraInicio.Items.Add(new ListItem("08:00", "08:00"));
            ddlHoraInicio.Items.Add(new ListItem("09:00", "09:00"));
            ddlHoraInicio.Items.Add(new ListItem("10:00", "10:00"));
            ddlHoraInicio.Items.Add(new ListItem("11:00", "11:00"));
            ddlHoraInicio.Items.Add(new ListItem("12:00", "12:00"));
            ddlHoraInicio.Items.Add(new ListItem("13:00", "13:00"));
            ddlHoraInicio.Items.Add(new ListItem("14:00", "14:00"));
            ddlHoraInicio.Items.Add(new ListItem("15:00", "15:00"));
            ddlHoraInicio.Items.Add(new ListItem("16:00", "16:00"));
            ddlHoraInicio.Items.Add(new ListItem("17:00", "17:00"));
            ddlHoraInicio.Items.Add(new ListItem("18:00", "18:00"));
            ddlHoraInicio.Items.Add(new ListItem("19:00", "19:00"));
            ddlHoraInicio.Items.Add(new ListItem("20:00", "20:00"));
            ddlHoraInicio.Items.Add(new ListItem("21:00", "21:00"));
            ddlHoraInicio.Items.Add(new ListItem("22:00", "22:00"));

            ddlHoraFin.Items.Insert(0, new ListItem("Selecciona Hora", ""));
            ddlHoraFin.Items.Add(new ListItem("08:00", "08:00"));
            ddlHoraFin.Items.Add(new ListItem("09:00", "09:00"));
            ddlHoraFin.Items.Add(new ListItem("10:00", "10:00"));
            ddlHoraFin.Items.Add(new ListItem("11:00", "11:00"));
            ddlHoraFin.Items.Add(new ListItem("12:00", "12:00"));
            ddlHoraFin.Items.Add(new ListItem("13:00", "13:00"));
            ddlHoraFin.Items.Add(new ListItem("14:00", "14:00"));
            ddlHoraFin.Items.Add(new ListItem("15:00", "15:00"));
            ddlHoraFin.Items.Add(new ListItem("16:00", "16:00"));
            ddlHoraFin.Items.Add(new ListItem("17:00", "17:00"));
            ddlHoraFin.Items.Add(new ListItem("18:00", "18:00"));
            ddlHoraFin.Items.Add(new ListItem("19:00", "19:00"));
            ddlHoraFin.Items.Add(new ListItem("20:00", "20:00"));
            ddlHoraFin.Items.Add(new ListItem("21:00", "21:00"));
            ddlHoraFin.Items.Add(new ListItem("22:00", "22:00"));

        }
        public void cargarDiasChk()
        {
            chkDiasAtencion.Items.Add(new ListItem("Lunes", "1"));
            chkDiasAtencion.Items.Add(new ListItem("Martes", "2"));
            chkDiasAtencion.Items.Add(new ListItem("Miercoles", "3"));
            chkDiasAtencion.Items.Add(new ListItem("Jueves", "4"));
            chkDiasAtencion.Items.Add(new ListItem("Viernes", "5"));
            chkDiasAtencion.Items.Add(new ListItem("Sabado", "6"));
        }

        public void cargarDdlSexo()
        {
            ddlSexo.Items.Add(new ListItem("Masculino", "M"));
            ddlSexo.Items.Add(new ListItem("Femenino", "F"));
            ddlSexo.Items.Add(new ListItem("Otro", "O"));
        }

        public void cargarDdlProvincia()
        {
            NegocioProvincia objNegocioProvincia = new NegocioProvincia();
            DataTable tabla = new DataTable();
            tabla = objNegocioProvincia.CargarDdlProvincia();

            ddlProvincia.DataSource = tabla;
            ddlProvincia.DataTextField = "NombreProvincia_pro";
            ddlProvincia.DataValueField = "IdProvincia_pro";
            ddlProvincia.DataBind();
        }

        public void cargarDdlLocalidades()
        {
            string IdProvincia = ddlProvincia.SelectedValue; //Guarda id provincia  

            NegocioLocalidad objNegocioLocalidad = new NegocioLocalidad();
            DataTable tabla = new DataTable();
            tabla = objNegocioLocalidad.CargarDdlLocalidades(IdProvincia);

            ddlLocalidad.DataSource = tabla;
            ddlLocalidad.DataTextField = "NombreLocalidad";
            ddlLocalidad.DataValueField = "IdLocalidad_lo";
            ddlLocalidad.DataBind();
        }

        public void cargarDdlEspecialidades()
        {
            NegocioEspecialidad objNegocioEspecialidad = new NegocioEspecialidad();
            DataTable tabla = new DataTable();
            tabla = objNegocioEspecialidad.cargarDdlEspecialidades();

            ddlEspecialidadMedico.DataSource = tabla;
            ddlEspecialidadMedico.DataTextField = "NombreEspecialidad_esp";
            ddlEspecialidadMedico.DataValueField = "IdEspecialidad_esp";
            ddlEspecialidadMedico.DataBind();
        }


        //Una vez que selecciona una provincia se carga el ddlLocalidades con las localidades de la provincia seleccionada
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarDdlLocalidades();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        public void limpiarCampos()
        {
            txtNombreUsuario.Text = "";
            txtContrasenia1.Text = "";
            txtContrasenia2.Text = "";
            txtLegajo.Text = "";
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            ddlSexo.ClearSelection();
            txtNacionalidad.Text = "";
            txtFechaNacimiento.Text = "";
            txtDireccion.Text = "";
            ddlProvincia.ClearSelection();
            ddlLocalidad.ClearSelection();
            txtEmail.Text = "";
            txtTelefono.Text = "";
            ddlEspecialidadMedico.ClearSelection();
            chkDiasAtencion.ClearSelection();
            ddlHoraInicio.ClearSelection();
            ddlHoraFin.ClearSelection();
        }

        protected void btnAgregarMedico_Click(object sender, EventArgs e)
        {
            Usuario objUsuario = new Usuario();
            Persona objPersona = new Persona();
            Medico objMedico = new Medico();
            HorarioAtencion objHorario = new HorarioAtencion();

            lblMensaje.Text = "";
            lblMensaje2.Text = "";
            lblMensaje3.Text = "";
            lblMensaje4.Text = "";

            try
            {
                // Guarda datos para la tabla persona
                objPersona.Dni = txtDNI.Text;
                objPersona.Nombre = txtNombre.Text;
                objPersona.Apellido = txtApellido.Text;
                objPersona.IdSexo = ddlSexo.SelectedValue;
                objPersona.Nacionalidad = txtNacionalidad.Text;
                objPersona.FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
                objPersona.Direccion = txtDireccion.Text;
                objPersona.IdLocalidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
                objPersona.Email = txtEmail.Text;
                objPersona.Telefono = txtTelefono.Text;
            }
            catch (Exception)
            {
                lblMensaje.Text = "El DNI ya se encuentra registrado:";
                return;
            }

            try
            {
                // Guarda datos para la tabla usuario
                objUsuario.IdRol = "2"; // Tipo Usuario Medico
                objUsuario.NombreUsuario = txtNombreUsuario.Text;
                objUsuario.Contrasenia = txtContrasenia2.Text;
            }
            catch (Exception)
            {
                lblMensaje2.Text = "El Nombre de Usuario ya existe: ";
                return;
            }

            try
            {
                // Guarda datos para la tabla Medicos
                objMedico.IdEspecialidad = ddlEspecialidadMedico.SelectedValue;
                objMedico.DniMedico = txtDNI.Text;
                objMedico.IdRol = "2";
                objMedico.Legajo = txtLegajo.Text;
                objMedico.Activo = true;
            }
            catch (Exception)
            {
                lblMensaje3.Text = "El Código de Legajo ya existe: ";
                return;
            }

            //Verifica que el DNI, Nombre de usuario y Legajo no existan en la base de datos
            Persona auxPersona = new Persona();
            Usuario auxUsuario = new Usuario();
            Medico auxMedico = new Medico();
            auxPersona.Dni = txtDNI.Text;
            auxUsuario.NombreUsuario = txtNombreUsuario.Text;
            auxMedico.Legajo = txtLegajo.Text;

            NegocioPersona objNegocioPersona = new NegocioPersona();
            NegocioUsuario objNegocioUsuario = new NegocioUsuario();
            NegocioMedico objNegocioMedico = new NegocioMedico();
            
            if (!objNegocioPersona.verificarDNI(auxPersona))   
            {     
                if (!objNegocioUsuario.verificarNombreUsuario(auxUsuario))
                {   
                    if (!objNegocioMedico.verificarLegajoMedico(auxMedico))
                    {
                        objNegocioPersona.AgregarPersona(objPersona); // Agrega la persona a la tabla personas de la DB
                        objNegocioUsuario.AgregarUsuario(objUsuario); // Agrega el usuario a la tabla usuarios de la DB
                        Usuario obj_ObtenerUsuario = objNegocioUsuario.ObtenerIdUsuario(objUsuario); // Obtiene registro completo de la tabla usuario
                        objMedico.IdUsuario = obj_ObtenerUsuario.IdUsuario; // Extrae el id usuario del objeto ya cargado arriba
                        objNegocioMedico.AgregarMedico(objMedico); // Agrega el usuario a la tabla usuarios de la DB

                        try
                        {
                            // Procesar los días de atención seleccionados

                            // Obtiene registro completo del medico de la tabla medico pero solo nos interesa el idMedico
                            // que se creo en el metodo objAltaMedico.AgregarMedico(objMedico)

                            Medico obj_ObtenerMedico = objNegocioMedico.ObtenerMedico(objMedico); 
                            
                            NegocioHorarioAtencion objGestionHorario = new NegocioHorarioAtencion();

                            foreach (ListItem item in chkDiasAtencion.Items) //Recorre el checkbox list
                            {
                                string AuxIdDia = item.Value; // Guarda el id del dia

                                // Guarda los datos del dia y horario atencion      
                                objHorario.IdDia = AuxIdDia;
                                objHorario.IdMedico = obj_ObtenerMedico.IdMedico;
                                objHorario.IdEspecialidad = objMedico.IdEspecialidad;
                                objHorario.DniMedico = objMedico.DniMedico;
                                objHorario.HorarioInicio = TimeSpan.Parse(ddlHoraInicio.SelectedValue);
                                objHorario.HorarioFin = TimeSpan.Parse(ddlHoraFin.SelectedValue);
                                objHorario.Activo = item.Selected;

                                objGestionHorario.AgregarHorarioAtencion(objHorario); // Insertar en la tabla de HorariosAtencion
                            }

                            limpiarCampos();

                            /*txtNombreUsuario.Text = "";
                            txtContrasenia1.Text = "";
                            txtContrasenia2.Text = "";
                            txtLegajo.Text = "";
                            txtDNI.Text = "";
                            txtNombre.Text = "";
                            txtApellido.Text = "";
                            ddlSexo.ClearSelection();
                            txtNacionalidad.Text = "";
                            txtFechaNacimiento.Text = "";
                            txtDireccion.Text = "";
                            ddlProvincia.ClearSelection();
                            ddlLocalidad.ClearSelection();
                            txtEmail.Text = "";
                            txtTelefono.Text = "";
                            ddlEspecialidadMedico.ClearSelection();
                            chkDiasAtencion.ClearSelection();
                            ddlHoraInicio.ClearSelection();
                            ddlHoraFin.ClearSelection();*/

                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('MEDICO AGREGADO EXITOSAMENTE');", true);

                        }
                        catch (Exception ex)
                        {
                            lblMensaje4.Text = "Error al procesar los Horarios de Atención: " + ex.Message;
                        }     
                    }
                    else
                    {
                        
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('EL LEGAJO YA EXISTE');", true);
                    }
                }
                else
                {
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('EL USUARIO YA EXISTE');", true);
                }
            }
            else
            {
               
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('EL DNI YA EXISTE');", true);
            }
        }

        
    }
}