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
    public partial class AltaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

                cargarDdlSexo();
                cargarDdlProvincia();
                cargarDdlLocalidades();
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
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

        //Una vez que selecciona una provincia se carga el ddlLocalidades con las localidades de la provincia seleccionada
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarDdlLocalidades();
        }

        public void limpiarCampos()
        {
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
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Persona objPersona = new Persona();
            Paciente objPaciente = new Paciente();

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
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El DNI ya se encuentra registrado!');", true);
            }

            NegocioPersona objNegocioPersona = new NegocioPersona();
            NegocioPaciente objNegocioPaciente = new NegocioPaciente();
            if (!objNegocioPersona.verificarDNI(objPersona)) //Si no encuentra la persona la agrega
            {
                objNegocioPersona.AgregarPersona(objPersona); //Agrega la persona a la tabla personas de la DB

                objPaciente.DniPaciente = objPersona.Dni; //Luego asigna el dni del objpersona al objpaciente
                objNegocioPaciente.AgregarPaciente(objPaciente); //Agrega el paciente a la tabla pacientes de la DB

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Paciente agregado exitosamente');", true);
                limpiarCampos();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('El DNI ya se encuentra registrado!');", true);
            }

        }

    }
}