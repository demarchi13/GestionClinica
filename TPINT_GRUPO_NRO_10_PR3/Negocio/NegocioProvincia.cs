using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioProvincia
    {
        public DataTable CargarDdlProvincia()
        {
            DaoMedico objDaoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDaoMedico.getTablaProvincias();
            return tabla;
        }
    }
}
