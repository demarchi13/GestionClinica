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
    public class DaoProvincia
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        //Carga la tabla provincias que se muestra en el ddlProvincias del formulario AltaMedico
        public DataTable getTablaProvincias()
        {
            objDatos.setearProcedimiento("SP_CargarProvincias");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }
    }
}
