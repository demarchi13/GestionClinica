using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoUsuario
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        public bool verificarNombreUsuarioDao(Usuario auxUsuario)
        {
            objDatos.setearProcedimiento("SP_VerificarNombreUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE_USUARIO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = auxUsuario.NombreUsuario;

            objDatos.ejecutarLectura();

            if (objDatos.Lector.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool AgregarUsuarioDao(Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_AgregarUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@IdRol", System.Data.SqlDbType.Char);
            sqlParametros.Value = objUsuario.IdRol;

            sqlParametros = objDatos.Comando.Parameters.Add("@NombreUsuario", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@Contrasenia", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.Contrasenia;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public Usuario ObtenerIdUsuarioDao(Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_ObtenerIdUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NombreUsuario", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            objDatos.ejecutarLectura();

            Usuario auxUsuario = new Usuario();
            if (objDatos.Lector.Read())
            {
                auxUsuario.IdRol = objDatos.Lector.GetString(0);
                auxUsuario.IdUsuario = objDatos.Lector.GetInt32(1);
                auxUsuario.NombreUsuario = objDatos.Lector.GetString(2);
                auxUsuario.Contrasenia = objDatos.Lector.GetString(3);
            }

            return auxUsuario;
        }
    }
}
