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
    public class DaoLocalidad
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        //Carga la tabla localidades que se muestra en el ddlLocalidad del formulario AltaMedico
        public DataTable getTablaLocalidades(string IdProvincia)
        {
            objDatos.setearProcedimiento("SP_CargarLocalidades");

            sqlParametros = objDatos.Comando.Parameters.Add("@IdProvincia", System.Data.SqlDbType.Char);
            sqlParametros.Value = IdProvincia;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }
    }
}
