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
    public class NegocioTurno
    {
        public bool AgregarTurno(Turno objTurno)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            bool filasAfectadas = objDaoTurno.AgregarTurnoDao(objTurno);
            return filasAfectadas;
        }

        public DataTable TraerTurnos(Turno objTurno)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();
            tabla = objDaoTurno.TraerTurnosDao(objTurno);
            return tabla;
        }

        public DataTable cargarGrillaTurnosNegocio(Medico objMedico)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable(); 

            tabla = objDaoTurno.cargarGrillaTurnosDao(objMedico);
            return tabla;
        }

        public DataTable cargar_Turnos_Del_Dia_Negocio(Medico objMedico)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.cargar_Turnos_Del_Dia_Dao(objMedico);
            return tabla;
        }


        public DataTable cargarTurnosPorFechaNegocio(Turno objTurno, Medico objMedico)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.cargarTurnosPorFechaDao(objTurno, objMedico);
            return tabla;
        }

        public DataTable cargarHistorialTurnosPacienteNegocio(Turno objTurno, Medico objMedico)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.cargarHistorialTurnosPacienteDao(objTurno, objMedico);
            return tabla;
        }


        public bool Agregar_Asistencia_Turno_Negocio(Turno objTurno)
        {
            DaoTurno objDaoTurno = new DaoTurno();
            bool filasAfectadas = objDaoTurno.Agregar_Asistencia_Turno_Dao(objTurno);
            return filasAfectadas;
        }

        public DataTable InformeTotalTurnos()
        {
            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.InformeTotalTurnosDao();

            return tabla;
        }

        public DataTable InformePresentes(Turno objTurnoDesde,Turno objTurnoHasta, Paciente objPaciente)
        {

            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.InformePresentesDao(objTurnoDesde, objTurnoHasta, objPaciente);

            return tabla;
        }

        public DataTable InformeAusentes(Turno objTurnoDesde, Turno objTurnoHasta, Paciente objPaciente)
        {

            DaoTurno objDaoTurno = new DaoTurno();
            DataTable tabla = new DataTable();

            tabla = objDaoTurno.InformeAusentesDao(objTurnoDesde, objTurnoHasta, objPaciente);

            return tabla;
        }
    }
}
