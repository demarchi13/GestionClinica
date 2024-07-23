using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoDiaAtencion
    {
        public DiaAtencion ObtenerDiaDao(DiaAtencion objDiaAtencion)
        {
            SqlParameter sqlParametros = new SqlParameter();
            AccesoDatos objDatos = new AccesoDatos();

            objDatos.setearProcedimiento("SP_TraeridDia");

            /*Obtiene el id del dia para realizar la busqueda*/
            sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE_DIA", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objDiaAtencion.NombreDia;

            objDatos.ejecutarLectura();

            if (objDatos.Lector.Read())
            {
                objDiaAtencion.IdDia = objDatos.Lector.GetString(0);
            }

            return objDiaAtencion;
        }
    }
}
