using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioHorarioAtencion
    {
        public bool AgregarHorarioAtencion(HorarioAtencion objHorario)
        {
            DaoHorarioAtencion objDatosHorario = new DaoHorarioAtencion();

            bool filasAfectadas = objDatosHorario.AgregarHorarioAtencionDao(objHorario);

            return filasAfectadas;
        }

        public bool EditarHorarioAtencion(HorarioAtencion objHorario)
        {
            DaoHorarioAtencion objDaoHorario = new DaoHorarioAtencion();
            bool filasAfectadas = objDaoHorario.EditarHorarioAtencionDao(objHorario);

            return filasAfectadas;
        }

    }
}
