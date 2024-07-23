using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DiaAtencion
    {
        private string _IdDia;
        private string _NombreDia;

        public string IdDia { get => _IdDia; set => _IdDia = value; }
        public string NombreDia { get => _NombreDia; set => _NombreDia = value; }
    }
}
