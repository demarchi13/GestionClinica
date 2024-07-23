using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class crudPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario objUsuario = new Usuario();
                objUsuario = Session["Usuario"] as Usuario;
                lblNombreUsuario.Text = objUsuario.NombreUsuario;

                cargarGrillaPacientes();
            }
        }

        public void cargarGrillaPacientes()
        {
            NegocioPaciente objNegocioPaciente = new NegocioPaciente();
          
            DataTable tabla = new DataTable();

            tabla = objNegocioPaciente.CargarGrillaPacientes();
            grdPacientes.DataSource = tabla;
            grdPacientes.DataBind();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaPacientes.aspx");
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGrillaPacientes();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (txtTexto.Text.Trim() != "")
            {
                NegocioPaciente objNegocioPaciente = new NegocioPaciente();
                DataTable tabla = new DataTable();

                //Obtiene el DNI y lo guarda en un objeto
                Paciente objPaciente = new Paciente();
                objPaciente.BuscarTexto = txtTexto.Text;

                tabla = objNegocioPaciente.Buscar_Paciente_Por_Texto_Negocio(objPaciente); //Recibe el obj con el dni cargado
                grdPacientes.DataSource = tabla;
                grdPacientes.DataBind();

                txtTexto.Text = "";
            }
            else
            {
                cargarGrillaPacientes();
            }
        }

        //BOTON EDITAR
        protected void grdPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdPacientes.EditIndex = e.NewEditIndex;
            cargarGrillaPacientes();
        }

        //BOTON CANCELAR EDICION
        protected void grdPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdPacientes.EditIndex = -1;
            cargarGrillaPacientes();
        }

        //CARGA EL ddlSexo DENTRO DE LA GRILLA PACIENTES
        protected void grdPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlSexos = (DropDownList)e.Row.FindControl("ddl_eit_sexo");

                if (ddlSexos != null)
                {
                    NegocioPaciente objNegocioPaciente = new NegocioPaciente();
                    ddlSexos.DataSource = objNegocioPaciente.cargarSexos();
                    ddlSexos.DataTextField = "IdSexo_se";
                    ddlSexos.DataValueField = "IdSexo_se";
                    ddlSexos.DataBind();
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                // Obtener el valor actual del sexo del paciente
                string sexoAnterior = DataBinder.Eval(e.Row.DataItem, "IdSexo_pe").ToString();

                // Encontrar el DropDownList y establecer el valor seleccionado
                DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddl_eit_sexo");
                if (ddlSexo != null)
                {
                    ddlSexo.SelectedValue = sexoAnterior;
                }
            }
        }

        protected void grdPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Personas
            string nombre = ((Label)grdPacientes.Rows[e.RowIndex].FindControl("lbl_eit_nombre")).Text;
            string apellido = ((Label)grdPacientes.Rows[e.RowIndex].FindControl("lbl_eit_apellido")).Text;
            string dni = ((Label)grdPacientes.Rows[e.RowIndex].FindControl("lbl_eit_dni")).Text; 
            string Idsexo = ((DropDownList)grdPacientes.Rows[e.RowIndex].FindControl("ddl_eit_sexo")).Text;
            string fechaNacimiento = ((TextBox)grdPacientes.Rows[e.RowIndex].FindControl("txt_eit_fechaNacimiento")).Text;
            string direccion = ((TextBox)grdPacientes.Rows[e.RowIndex].FindControl("txt_eit_direccion")).Text;
            string email = ((TextBox)grdPacientes.Rows[e.RowIndex].FindControl("txt_eit_email")).Text;
            string telefono = ((TextBox)grdPacientes.Rows[e.RowIndex].FindControl("txt_eit_telefono")).Text;

            //CARGAR LOS DATOS AL OBJETO PERSONA
            Persona objPersona = new Persona();
            objPersona.Nombre = nombre; //NO EDITABLE
            objPersona.Apellido = apellido; //NO EDITABLE
            objPersona.Dni = dni; //NO EDITABLE
            objPersona.Direccion = direccion; //EDITABLE
            objPersona.IdSexo = Idsexo; //EDITABLE 
            objPersona.Email = email; //EDITABLE 
            objPersona.Telefono = telefono;//EDITABLE

            if(fechaNacimiento == "") //Verifica si no se cargo ninguna fecha de nacimiento
            {
                //Obtiene la fecha de nacimiento vinculada al dni del objeto "objPersona" cargado previamente y
                //lo asigna al objeto objPersona.FechaNacimiento para evitar el salto de la excepcion al
                //actualizar los datos del registro del paciente sin haber cargado una fecha de nacimiento
                //Basicamente le asigna por defecto la fecha de nacimiento anterior si no se cargo una nueva.
                NegocioPersona objNegocioPersona = new NegocioPersona();
                Persona auxPersona = objNegocioPersona.ObtenerFechaNacimiento(objPersona);
                objPersona.FechaNacimiento = auxPersona.FechaNacimiento;
            }
            else //Si se cargo una fecha de nacimiento diferente se la asigna al objeto
            {
                objPersona.FechaNacimiento = Convert.ToDateTime(fechaNacimiento); //EDITABLE
            }
 
            //Actualiza datos en la tabla persona relacionados al paciente
            NegocioPaciente objNegocioPaciente = new NegocioPaciente();
            objNegocioPaciente.ActualizarPaciente_Personas(objPersona);

            grdPacientes.EditIndex = -1; //Salir Modo Edicion
            cargarGrillaPacientes();
        }

        protected void grdPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPacientes.PageIndex = e.NewPageIndex;
            cargarGrillaPacientes();
        }
    }
}