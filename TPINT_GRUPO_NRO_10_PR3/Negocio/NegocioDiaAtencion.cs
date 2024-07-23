using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioDiaAtencion
    {
        public DiaAtencion ObtenerDia(DiaAtencion objDiaAtencion)
        {
            DaoDiaAtencion objDaoDiaAtencion = new DaoDiaAtencion();
            DiaAtencion auxDiaAtencion = new DiaAtencion();

            auxDiaAtencion = objDaoDiaAtencion.ObtenerDiaDao(objDiaAtencion);

            return auxDiaAtencion;
        }
    }
}
