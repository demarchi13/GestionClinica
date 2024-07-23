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
    public partial class Informes2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

                TotalTurnos();
            }
        }

        private void TotalTurnos()
        {
            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();
            tabla = objNegocioTurno.InformeTotalTurnos();
            grdInformes.DataSource = tabla;
            grdInformes.DataBind();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnTotalTurnos_Click(object sender, EventArgs e)
        {
            TotalTurnos();
            txtDniPaciente.Text = "";
        }

        protected void btnPresentes_Click(object sender, EventArgs e)
        {    
            Turno objTurnoDesde = new Turno();
            Turno objTurnoHasta = new Turno();
            Paciente objPaciente = new Paciente();

            objTurnoDesde.FechaTurno = Convert.ToDateTime(txtDesde.Text);
            objPaciente.DniPaciente = txtDniPaciente.Text;
            objTurnoHasta.FechaTurno = Convert.ToDateTime(txtHasta.Text);

            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();

            tabla = objNegocioTurno.InformePresentes(objTurnoDesde, objTurnoHasta, objPaciente);
            grdInformes.DataSource = tabla;
            grdInformes.DataBind();
        }

        protected void btnAusentes_Click(object sender, EventArgs e)
        {
            Turno objTurnoDesde = new Turno();
            Turno objTurnoHasta = new Turno();
            Paciente objPaciente = new Paciente();

            objTurnoDesde.FechaTurno = Convert.ToDateTime(txtDesde.Text);
            objPaciente.DniPaciente = txtDniPaciente.Text;
            objTurnoHasta.FechaTurno = Convert.ToDateTime(txtHasta.Text);

            NegocioTurno objNegocioTurno = new NegocioTurno();
            DataTable tabla = new DataTable();

            tabla = objNegocioTurno.InformeAusentes(objTurnoDesde, objTurnoHasta, objPaciente);
            grdInformes.DataSource = tabla;
            grdInformes.DataBind();
        }
    }
}