using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class UsuarioAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnGestionMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoMedicos.aspx");
        }

        protected void btnGestionPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoPacientes.aspx");
        }

        protected void btnGestionTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaTurno.aspx");
        }

        protected void btnInformes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informes.aspx");
        }
    }
}