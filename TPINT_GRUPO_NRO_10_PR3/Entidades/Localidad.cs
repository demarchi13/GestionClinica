using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Localidad
    {
        private int _IdLocalidad;
        private string _IdProvincia;
        private string _NombreLocalidad;

        public int IdLocalidad { get => _IdLocalidad; set => _IdLocalidad = value; }
        public string IdProvincia { get => _IdProvincia; set => _IdProvincia = value; }
        public string NombreLocalidad { get => _NombreLocalidad; set => _NombreLocalidad = value; }
    }
}
