using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class DaoLogin
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        public Usuario IngresarDao (Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_VerificarUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NombreUsuario", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@Contrasenia", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.Contrasenia;

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
