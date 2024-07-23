using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Especialidad
    {
        private string _IdEspecialidad;
        private string _NombreEspecialidad;

        public string IdEspecialidad { get => _IdEspecialidad; set => _IdEspecialidad = value; }
        public string NombreEspecialidad { get => _NombreEspecialidad; set => _NombreEspecialidad = value; }
    }
}
