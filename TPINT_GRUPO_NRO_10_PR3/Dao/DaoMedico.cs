using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoMedico
    {
        AccesoDatos objDatos = new AccesoDatos();
        SqlParameter sqlParametros = new SqlParameter();

        // FORMULARIO ALTA MEDICO
        public bool verificarLegajoMedicoDao(Medico auxMedico)
        {
            objDatos.setearProcedimiento("SP_VerificarLegajoMedico");

            sqlParametros = objDatos.Comando.Parameters.Add("@LEGAJO_MEDICO", System.Data.SqlDbType.Char);
            sqlParametros.Value = auxMedico.Legajo;

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

        public bool AgregarMedicoDao(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_AgregarMedico");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_ESPECIALIDAD", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.IdEspecialidad;

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.DniMedico;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_ROL", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.IdRol;

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_USUARIO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.IdUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@LEGAJO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.Legajo;

            sqlParametros = objDatos.Comando.Parameters.Add("@ACTIVO", System.Data.SqlDbType.Bit);
            sqlParametros.Value = objMedico.Activo;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public Medico ObtenerMedicoDao(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_ObtenerMedico");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.DniMedico;

            objDatos.ejecutarLectura();

            Medico auxMedico = new Medico();
            if (objDatos.Lector.Read())
            {
                auxMedico.IdEspecialidad = objDatos.Lector.GetString(0);
                auxMedico.IdMedico = objDatos.Lector.GetInt32(1);
                auxMedico.DniMedico = objDatos.Lector.GetString(2);
                auxMedico.IdRol = objDatos.Lector.GetString(3);
                auxMedico.IdUsuario = objDatos.Lector.GetInt32(4);
                auxMedico.Legajo = objDatos.Lector.GetString(5);
            }

            return auxMedico;
        }

        public Medico Obtener_Medico_Por_Nombre_Usuario_Dao(Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_Obtener_Medico_Por_Nombre_Usuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE_USUARIO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            objDatos.ejecutarLectura();

            //Declara el objeto Medico para guardar el registro completo del medico
            Medico objMedico = new Medico();
            if (objDatos.Lector.Read())
            {
                objMedico.IdEspecialidad = objDatos.Lector.GetString(0);
                objMedico.IdMedico = objDatos.Lector.GetInt32(1);
                objMedico.DniMedico = objDatos.Lector.GetString(2);
                objMedico.IdRol = objDatos.Lector.GetString(3);
                objMedico.IdUsuario = objDatos.Lector.GetInt32(4);
                objMedico.Legajo = objDatos.Lector.GetString(5);
            }

            return objMedico;
        }

 
        public DataTable getGrillaMedicos()
        {
            objDatos.setearProcedimiento("SP_CargarGrillaMedicos");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public DataTable Buscar_Medico_por_texto_dao(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_Buscar_Medico_por_texto");

            sqlParametros = objDatos.Comando.Parameters.Add("@TEXTO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objMedico.BuscarTexto;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public DataTable cargarHorariosAtencionDao(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_CargarHorariosAtencionMedico");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_MEDICO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.DniMedico;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }


        //EDITAR MEDICO

        public bool BajaLogicaMedicoDao(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_BajaLogicaMedico");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_MEDICO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.DniMedico;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public bool ActualizarMedico_PersonasDao(Persona objPersona)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_ActualizarMedico_Personas");

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

        public bool ActualizarMedico_UsuariosDao(Usuario objUsuario)
        {
            AccesoDatos objDatos = new AccesoDatos();
            SqlParameter sqlParametros = new SqlParameter();

            objDatos.setearProcedimiento("SP_ActualizarMedico_Usuarios");

            sqlParametros = objDatos.Comando.Parameters.Add("@ID_USUARIO", System.Data.SqlDbType.Int);
            sqlParametros.Value = objUsuario.IdUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@USUARIO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@CONTRASENIA", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.Contrasenia;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        //Carga el ddl de sexos en la grilla horarios atencion al momento de editar el sexo
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


        //


        public DataTable getTablaProvincias()
        {
            objDatos.setearProcedimiento("SP_CargarProvincias");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public DataTable getTablaLocalidades(string IdProvincia) 
        {
            objDatos.setearProcedimiento("SP_CargarLocalidades");

            sqlParametros = objDatos.Comando.Parameters.Add("@IdProvincia", System.Data.SqlDbType.Char);
            sqlParametros.Value = IdProvincia;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public DataTable getTablaEspecialidades()
        {
            objDatos.setearProcedimiento("SP_CargarEspecialidades");

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }
        

        public bool AgregarUsuarioDao(Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_AgregarUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@IdRol", System.Data.SqlDbType.Char);
            sqlParametros.Value = objUsuario.IdRol;

            sqlParametros = objDatos.Comando.Parameters.Add("@NombreUsuario", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            sqlParametros = objDatos.Comando.Parameters.Add("@Contrasenia", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.Contrasenia;

            bool filasAfectadas = objDatos.ejecutarAccion();

            return filasAfectadas;
        }

        public Usuario ObtenerIdUsuarioDao(Usuario objUsuario)
        {
            objDatos.setearProcedimiento("SP_ObtenerIdUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NombreUsuario", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = objUsuario.NombreUsuario;

            objDatos.ejecutarLectura();

            Usuario auxUsuario = new Usuario();
            if (objDatos.Lector.Read())
            {
                auxUsuario.IdRol = objDatos.Lector.GetString(0);
                auxUsuario.IdUsuario = objDatos.Lector.GetInt32(1);
                auxUsuario.NombreUsuario = objDatos.Lector.GetString(2);
                auxUsuario.Contrasenia = objDatos.Lector.GetString(3);
            }

            return auxUsuario;
        }
     

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

        /*public bool verificarNombreUsuarioDao(Usuario auxUsuario)
        {
            objDatos.setearProcedimiento("SP_VerificarNombreUsuario");

            sqlParametros = objDatos.Comando.Parameters.Add("@NOMBRE_USUARIO", System.Data.SqlDbType.VarChar);
            sqlParametros.Value = auxUsuario.NombreUsuario;

            objDatos.ejecutarLectura();

            if (objDatos.Lector.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }*/

        public DataTable cargarMedicosPorEspecialidadDao(Especialidad objEspecialidad)
        {
            objDatos.setearProcedimiento("SP_CargarMedicoPorEspecialidad");

            sqlParametros = objDatos.Comando.Parameters.Add("@IdEspecialidad", System.Data.SqlDbType.Char);
            sqlParametros.Value = objEspecialidad.IdEspecialidad;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

        public DataTable cargarGrillaMedicoPorDni(Medico objMedico)
        {
            objDatos.setearProcedimiento("SP_CargarGrillaMedicoPorDni");

            sqlParametros = objDatos.Comando.Parameters.Add("@DNI_MEDICO", System.Data.SqlDbType.Char);
            sqlParametros.Value = objMedico.DniMedico;

            objDatos.ejecutarLectura();

            DataTable tabla = new DataTable();
            tabla.Load(objDatos.Lector);

            objDatos.cerrarConexion();

            return tabla;
        }

    }
}
