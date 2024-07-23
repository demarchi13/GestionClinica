using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoHorarioAtencion
    {
        public bool AgregarHorarioAtencionDao(HorarioAtencion objHorario)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_AgregarHorariosAtencion");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_DIA", System.Data.SqlDbType.Char);
            sqlParametros.Value = objHorario.IdDia;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objHorario.IdMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_ESPECIALIDAD", System.Data.SqlDbType.Char);
            sqlParametros.Value = objHorario.IdEspecialidad;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objHorario.DniMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@HORARIO_INI", System.Data.SqlDbType.Time);
            sqlParametros.Value = objHorario.HorarioInicio;

            sqlParametros = objDatos.Comando.Parameters.Add("@HORARIO_FIN", System.Data.SqlDbType.Time);
            sqlParametros.Value = objHorario.HorarioFin;

            sqlParametros = objDatos.Comando.Parameters.Add("@ACTIVO", System.Data.SqlDbType.Bit);
            sqlParametros.Value = objHorario.Activo;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public bool EditarHorarioAtencionDao(HorarioAtencion objHorario)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_EditarHorarioAtencion");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_DIA", System.Data.SqlDbType.Char);
            sqlParametros.Value = objHorario.IdDia;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objHorario.DniMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@HORARIO_INI", System.Data.SqlDbType.Time);
            sqlParametros.Value = objHorario.HorarioInicio;

            sqlParametros = objDatos.Comando.Parameters.Add("@HORARIO_FIN", System.Data.SqlDbType.Time);
            sqlParametros.Value = objHorario.HorarioFin;

            sqlParametros = objDatos.Comando.Parameters.Add("@ACTIVO", System.Data.SqlDbType.Bit);
            sqlParametros.Value = objHorario.Activo;

            bool filasAfectadas = objDatos.ejecutarAccion();
            return filasAfectadas;
        }
    }
}
