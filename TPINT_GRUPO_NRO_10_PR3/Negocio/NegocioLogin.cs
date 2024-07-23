using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioLogin
    {
        DaoLogin objDatos = new DaoLogin();

        public Usuario Ingresar(Usuario objUsuario)
        {
            //Guada el usuario con todos los datos cargados desde el Dao
            Usuario auxUsuario = new Usuario();

            //Devuelve el usuario cargado a vistas
            return auxUsuario = objDatos.IngresarDao(objUsuario); 
        }
    }
}
