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
    public class NegocioPaciente
    {
        public bool AgregarPaciente(Paciente objPaciente)
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            bool filasAfectadas = objDaoPaciente.AgregarPacienteDao(objPaciente);

            return filasAfectadas;
        }

        public DataTable CargarGrillaPacientes()
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            DataTable tabla = new DataTable();
            tabla = objDaoPaciente.CargarGrillaPacientesDao();
            return tabla;
        }


        public DataTable Buscar_Paciente_Por_Texto_Negocio(Paciente objPaciente)
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            DataTable tabla = new DataTable();
            tabla = objDaoPaciente.Buscar_Paciente_Por_Texto_Dao(objPaciente);
            return tabla;
        }

        // EDITAR PACIENTES

        public bool ActualizarPaciente_Personas(Persona objPersona)
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            bool filasAfectadas = objDaoPaciente.ActualizarPaciente_PersonasDao(objPersona);
            return filasAfectadas;
        }

        public DataTable cargarSexos()
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            DataTable tabla = new DataTable();
            tabla = objDaoPaciente.cargarSexosDao();
            return tabla;
        }


        // ALTA TURNO


        public Paciente ObtenerPaciente(Paciente objPaciente)
        {     
            DaoPaciente objDaoPaciente = new DaoPaciente();
            Paciente auxPaciente = objDaoPaciente.ObtenerPacienteDao(objPaciente);
            return auxPaciente;
        }

        public Paciente ObtenerIdPacientePorDni(Paciente objPaciente)
        {
            DaoPaciente objDaoPaciente = new DaoPaciente();
            Paciente auxPaciente = objDaoPaciente.ObtenerIdPacientePorDniDao(objPaciente);
            return auxPaciente;
        }
    }
}
