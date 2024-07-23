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
    public class NegocioUsuario
    {
        public bool verificarNombreUsuario(Usuario auxUsuario)
        {
            /*DaoMedico objDaoMedico = new DaoMedico();
            bool encontrado = objDaoMedico.verificarNombreUsuarioDao(auxUsuario);*/

            DaoUsuario objDaoUsuario = new DaoUsuario();
            bool encontrado = objDaoUsuario.verificarNombreUsuarioDao(auxUsuario);

            return encontrado;
        }

        public bool AgregarUsuario(Usuario objUsuario)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            bool filasAfectadas = objDaoMedico.AgregarUsuarioDao(objUsuario);

            return filasAfectadas;
        }

        public Usuario ObtenerIdUsuario(Usuario objUsuario)
        {
            DaoMedico objDaoMedico = new DaoMedico();

            Usuario auxUsuario = objDaoMedico.ObtenerIdUsuarioDao(objUsuario);

            return auxUsuario;
        }
    }
}
