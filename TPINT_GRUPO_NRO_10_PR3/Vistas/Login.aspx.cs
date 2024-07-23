using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            //Guarda el nombre de usuario y la contraseña
            Usuario objUsuario = new Usuario();
            objUsuario.NombreUsuario = txtUsuario.Text;
            objUsuario.Contrasenia = txtContrasenia.Text;

            //Conecta con la capa Negocio
            NegocioLogin objLogin = new NegocioLogin();

            //Devuelve el objeto usuario con todos los datos cargados de la base de datos
            Usuario auxUsuario = new Usuario();
            auxUsuario = objLogin.Ingresar(objUsuario);
            Session["Usuario"] = auxUsuario;

            //Filtra el tipo de usuario por el id de rol
            if (auxUsuario != null && Convert.ToInt32(auxUsuario.IdRol) == 1)
            {
                //redirecciona a la interface admin
                Response.Redirect("UsuarioAdministrador.aspx");
            }
            else if (auxUsuario != null && Convert.ToInt32(auxUsuario.IdRol) == 2)
            {
                //Redirecciona a interface usuario medico
                Response.Redirect("UsuarioMedico.aspx");
            }
            else
            {       
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Usuario o Contraseña incorrectos. Intente Nuevamente');", true);
            }
            
            
            
        }
    }
}