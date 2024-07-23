using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private string _IdRol;
        private int _IdUsuario;
        private string _NombreUsuario;
        private string _Contrasenia;

        public string IdRol { get => _IdRol; set => _IdRol = value; }
        public int IdUsuario { get => _IdUsuario; set => _IdUsuario = value; }
        public string NombreUsuario { get => _NombreUsuario; set => _NombreUsuario = value; }
        public string Contrasenia { get => _Contrasenia; set => _Contrasenia = value; }
    }
}
