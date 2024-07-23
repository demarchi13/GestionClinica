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
    public class DaoPaciente
    {
        public bool AgregarPacienteDao(Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_AgregarPaciente");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPaciente.DniPaciente;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public DataTable CargarGrillaPacientesDao()
        {
            AccesoDatos objDatos = new AccesoDatos();

            objDatos.setearProcedimiento("SP_CargarGrillaPacientes");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }


        public DataTable Buscar_Paciente_Por_Texto_Dao(Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_Buscar_Paciente_por_texto");

            sqlParametros = objDatos.Comando.Parameters.Add("@TEXTO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPaciente.BuscarTexto;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        //EDITAR PACIENTES
        public DataTable cargarSexosDao()
        {
            AccesoDatos objDatos = new AccesoDatos();

            objDatos.setearProcedimiento("SP_CargarSexos");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public bool ActualizarPaciente_PersonasDao(Persona objPersona)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_ActualizarPaciente_Personas");

            /*sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objEditarMedico.Nombre;

            /sqlParametros = objDatos.Comando.Parameters.Add("@APELLIDO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objEditarMedico.Apellido;*/

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPersona.Dni;

            /*sqlParametros = objDatos.Comando.Parameters.Add("@PROVINCIA", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objEditarMedico.Provincia;

            sqlParametros = objDatos.Comando.Parameters.Add("@LOCALIDAD", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objEditarMedico.Localidad;*/

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_NACIMIENTO", System.Data.SqlDbType.Date);
            sqlParametros.Value = objPersona.FechaNacimiento;

            sqlParametros = objDatos.Comando.Parameters.Add("@DIRECCION", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Direccion;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_SEXO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPersona.IdSexo;

            sqlParametros = objDatos.Comando.Parameters.Add("@EMAIL", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Email;

            sqlParametros = objDatos.Comando.Parameters.Add("@TELEFONO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Telefono;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public Paciente ObtenerPacienteDao(Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_ObtenerPaciente");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_PACIENTE", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPaciente.DniPaciente;

            objDatos.ejecutarLectura();
           
            Paciente auxPaciente = new Paciente();
            if (objDatos.Lector.Read())
            {
                //auxPaciente.DniPaciente = objDatos.Lector.GetString(0);
                auxPaciente.IdPaciente = objDatos.Lector.GetInt32(0);
            }

            return auxPaciente;
        }

        public Paciente ObtenerIdPacientePorDniDao(Paciente objPaciente)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametrosEntrada = new SqlParameter();
            SqlParameter sqlParametrosSalida = new SqlParameter();

            objDatos.setearProcedimiento("SP_ObtenerIdPacientePorDNI");

            // Establecer parámetro de entrada para el DNI del paciente
            sqlParametrosEntrada = objDatos.Comando.Parameters.Add("@DNI_PACIENTE", System.Data.SqlDbType.Char);
            sqlParametrosEntrada.Value = objPaciente.DniPaciente;

            // Establecer parámetro de salida para el IdPaciente
            sqlParametrosSalida = objDatos.Comando.Parameters.Add("@ID_PACIENTE", System.Data.SqlDbType.Int);
            sqlParametrosSalida.Direction = System.Data.ParameterDirection.Output;

            try
            {
                // Ejecutar la lectura del procedimiento almacenado
                objDatos.ejecutarLectura();

                // Crear un objeto Paciente para almacenar el resultado
                Paciente auxPaciente = new Paciente();

                // Obtener el valor del parámetro de salida
                if (objDatos.Comando.Parameters["@ID_PACIENTE"].Value != DBNull.Value)
                {
                    auxPaciente.IdPaciente = Convert.ToInt32(objDatos.Comando.Parameters["@ID_PACIENTE"].Value);
                }

                return auxPaciente;
            }
            catch (Exception ex)
            {
                 throw ex; // Manejar o relanzar la excepción según sea necesario
            }
            finally
            {
                objDatos.cerrarConexion(); // Cerrar la conexión después de usarla
            }
        }


    }
}
