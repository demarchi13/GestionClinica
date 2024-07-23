using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoPersona
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        public bool verificarDniDao(Persona auxPersona)
        {
            objDatos.setearProcedimiento("SP_VerificarDniPersona");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_PERSONA", System.Data.SqlDbType.Char);
            sqlParametros.Value = auxPersona.Dni;

            objDatos.ejecutarLectura();

            if (objDatos.Lector.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool AgregarPersonaDao(Persona objPersona)
        {
            objDatos.setearProcedimiento("SP_AgregarPersona");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPersona.Dni;

            sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Nombre;

            sqlParametros = objDatos.Comando.Parameters.Add("@APELLIDO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Apellido;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_SEXO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPersona.IdSexo;

            sqlParametros = objDatos.Comando.Parameters.Add("@NACIONALIDAD", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Nacionalidad;

            sqlParametros = objDatos.Comando.Parameters.Add("@FECHA_NACIMIENTO", System.Data.SqlDbType.Date);
            sqlParametros.Value = objPersona.FechaNacimiento;

            sqlParametros = objDatos.Comando.Parameters.Add("@DIRECCION", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Direccion;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_LOCALIDAD", System.Data.SqlDbType.Int);
            sqlParametros.Value = objPersona.IdLocalidad;

            sqlParametros = objDatos.Comando.Parameters.Add("@EMAIL", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Email;

            sqlParametros = objDatos.Comando.Parameters.Add("@TELEFONO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objPersona.Telefono;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public Persona ObtenerFechaNacimientoDao(Persona objPersona)
        {
            SqlParameter sqlParametros = new SqlParameter();
            AccesoDatos objDatos = new AccesoDatos();

            objDatos.setearProcedimiento("SP_ObtenerFechaNacimiento");

            /*Obtiene el dni del paciente para realizar la busqueda*/
            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objPersona.Dni;

            objDatos.ejecutarLectura();

            if (objDatos.Lector.Read())
            {
                DateTime fecha = objDatos.Lector.GetDateTime(0);
                objPersona.FechaNacimiento = Convert.ToDateTime(fecha);
            }

            return objPersona;
        }
    }


}
