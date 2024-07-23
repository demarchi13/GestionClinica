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
    public class DaoEspecialidad
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        //Carga la tabla especialidades que se muestra en el ddlEspecialidades del formulario AltaMedico
        public DataTable getTablaEspecialidades()
        {
            objDatos.setearProcedimiento("SP_CargarEspecialidades");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }
    }
}
