using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoTurno
    {
        public bool AgregarTurnoDao(Turno objTurno)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();
            objDatos.setearProcedimiento("SP_AgregarTurno");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_ESPECIALIDAD", System.Data.SqlDbType.Char);
            sqlParametros.Value = objTurno.IdEspecialidad;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objTurno.IdMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_MEDICO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objTurno.DniMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_PACIENTE", System.Data.SqlDbType.Char);
            sqlParametros.Value = objTurno.DniPaciente;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_PACIENTE", System.Data.SqlDbType.Int);
            sqlParametros.Value = objTurno.IdPaciente;

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_TURNO", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurno.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@HORA_TURNO", System.Data.SqlDbType.Time);
            sqlParametros.Value = objTurno.HoraTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@ASISTENCIA", System.Data.SqlDbType.Bit);
            sqlParametros.Value = objTurno.Asistencia;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }


        public DataTable TraerTurnosDao(Turno objturno)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();
            objDatos.setearProcedimiento("SP_ObtenerHoraTurno");

            sqlParametros = objDatos.Comando.Parameters.Add("@FechaTurno", System.Data.SqlDbType.Date);
            sqlParametros.Value = objturno.FechaTurno;

            DataTable tabla = new DataTable();
            objDatos.ejecutarLectura();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        //Muestra el historial de todos los turnos del medico actual filtrando mediante el
        //nombre de usuario del medico obtenido en la variable Session al momento de ingresar
        public DataTable cargarGrillaTurnosDao(Medico objMedico)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_CargarGrillaTurnos");
 
            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objMedico.IdMedico;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        //Muestra todos los turnos del dia actual
        public DataTable cargar_Turnos_Del_Dia_Dao(Medico objMedico)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_FiltrarTurnosDelDiaActual");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objMedico.IdMedico;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }


        public DataTable cargarTurnosPorFechaDao(Turno objTurno, Medico objMedico)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_CargarTurnosPorFecha");

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurno.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objMedico.IdMedico;

            DataTable tabla = new DataTable();
            objDatos.ejecutarLectura();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }


        public DataTable cargarHistorialTurnosPacienteDao(Turno objTurno, Medico objMedico)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_Obtener_Historiales_Por_Texto");

            sqlParametros = objDatos.Comando.Parameters.Add("@TEXTO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objTurno.BuscarTexto;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_MEDICO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objMedico.IdMedico;

            DataTable tabla = new DataTable();
            objDatos.ejecutarLectura();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public bool Agregar_Asistencia_Turno_Dao(Turno objTurno)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_Agregar_Asistencia_Observaciones");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_PACIENTE", System.Data.SqlDbType.Char);
            sqlParametros.Value = objTurno.DniPaciente;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_TURNO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objTurno.IdTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@ASISTENCIA", System.Data.SqlDbType.Bit);
            sqlParametros.Value = objTurno.Asistencia;

            sqlParametros = objDatos.Comando.Parameters.Add("@OBSERVACIONES", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objTurno.Observaciones;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }    
        

        public DataTable InformeTotalTurnosDao()
        {
            AccesoDatos objDatos = new AccesoDatos();

            objDatos.setearProcedimiento("SP_Informe_Total_Turnos");
            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }


        public DataTable InformePresentesDao(Turno objTurnoDesde, Turno objTurnoHasta, Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_Informe_Presentes");

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_DESDE", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurnoDesde.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_HASTA", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurnoHasta.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPaciente.DniPaciente;

            DataTable tabla = new DataTable();
            objDatos.ejecutarLectura();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;

        }

        public DataTable InformeAusentesDao(Turno objTurnoDesde, Turno objTurnoHasta, Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_Informe_Ausentes");

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_DESDE", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurnoDesde.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_HASTA", System.Data.SqlDbType.Date);
            sqlParametros.Value = objTurnoHasta.FechaTurno;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPaciente.DniPaciente;

            DataTable tabla = new DataTable();
            objDatos.ejecutarLectura();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;

        }

    }
}
