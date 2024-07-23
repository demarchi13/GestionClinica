using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente
    {
        private string _DniPaciente;
        private int _IdPaciente;
        private string _BuscarTexto;
        public string DniPaciente { get => _DniPaciente; set => _DniPaciente = value; }
        public int IdPaciente { get => _IdPaciente; set => _IdPaciente = value; }
        public string BuscarTexto { get => _BuscarTexto; set => _BuscarTexto = value; }
    }
}
