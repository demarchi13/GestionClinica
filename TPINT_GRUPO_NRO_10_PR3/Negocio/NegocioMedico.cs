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
    public class NegocioMedico
    {
        // VER MEDICOS
        public DataTable CargarGrillaMedicos()
        {
            DaoMedico objDatosListadoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDatosListadoMedico.getGrillaMedicos();
            return tabla;
        }

        public DataTable Buscar_Medico_por_texto_negocio(Medico objMedico)
        {
            DaoMedico objDatosListadoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDatosListadoMedico.Buscar_Medico_por_texto_dao(objMedico);
            return tabla;
        }

        public DataTable cargarHorariosAtencion(Medico objMedico)
        {
            DaoMedico objDatosListadoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDatosListadoMedico.cargarHorariosAtencionDao(objMedico);
            return tabla;
        }



        // EDITAR MEDICOS


        public bool BajaLogicaMedico(Medico objMedico)
        {
            DaoMedico objDatosListadoMedico = new DaoMedico();
            bool filasAfectadas = objDatosListadoMedico.BajaLogicaMedicoDao(objMedico);
            return filasAfectadas;
        }

        public bool ActualizarMedico_Personas(Persona objPersona)
        {
            DaoMedico objGestionDatosEditarMedico = new DaoMedico();
            bool filasAfectadas = objGestionDatosEditarMedico.ActualizarMedico_PersonasDao(objPersona);
            return filasAfectadas;
        }

        public bool ActualizarMedico_Usuarios(Usuario objUsuario)
        {
            DaoMedico objGestionDatosEditarMedico = new DaoMedico();
            bool filasAfectadas = objGestionDatosEditarMedico.ActualizarMedico_UsuariosDao(objUsuario);
            return filasAfectadas;
        }

        public DataTable cargarSexos()
        {
            DaoMedico objGestionDatosEditarMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objGestionDatosEditarMedico.cargarSexosDao();
            return tabla;
        }



        public Medico ObtenerMedico(Medico objMedico)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            Medico auxMedico = objDaoMedico.ObtenerMedicoDao(objMedico);
            return auxMedico;
        }

        public Medico Obtener_Medico_Por_Nombre_Usuario_Negocio(Usuario objUsuario)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            Medico auxMedico = objDaoMedico.Obtener_Medico_Por_Nombre_Usuario_Dao(objUsuario);
            return auxMedico;
        }

        public bool AgregarMedico(Medico objMedico)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            bool filasAfectadas = objDaoMedico.AgregarMedicoDao(objMedico);
            return filasAfectadas;
        }

        public bool verificarLegajoMedico(Medico auxMedico)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            bool encontrado = objDaoMedico.verificarLegajoMedicoDao(auxMedico);
            return encontrado;
        }



        //FORMULARIO ALTA TURNOS


        public DataTable cargarMedicosPorEspecialidad(Especialidad objEspecialidad)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDaoMedico.cargarMedicosPorEspecialidadDao(objEspecialidad);
            return tabla;
        }

        public DataTable cargarGrillaMedicoPorDni(Medico objMedico)
        {
            DaoMedico objDatosListadoMedico = new DaoMedico();
            DataTable tabla = new DataTable();
            tabla = objDatosListadoMedico.cargarGrillaMedicoPorDni(objMedico);
            return tabla;
        }
    }
}
