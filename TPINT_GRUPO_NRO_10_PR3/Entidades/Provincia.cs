using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincia
    {
        private string _IdProvincia;
        private string _NombreProvincia;
        public string IdProvincia { get => _IdProvincia; set => _IdProvincia = value; }
        public string NombreProvincia { get => _NombreProvincia; set => _NombreProvincia = value; }
    }
}
