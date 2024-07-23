using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico
    {
        private string _IdEspecialidad;
        private int _IdMedico;
        private string _DniMedico;
        private string _IdRol;
        private int _IdUsuario;
        private string _Legajo;
        private bool _Activo;
        private string _BuscarTexto;

        public string IdEspecialidad { get => _IdEspecialidad; set => _IdEspecialidad = value; }
        public int IdMedico { get => _IdMedico; set => _IdMedico = value; }
        public string DniMedico { get => _DniMedico; set => _DniMedico = value; }
        public string IdRol { get => _IdRol; set => _IdRol = value; }
        public int IdUsuario { get => _IdUsuario; set => _IdUsuario = value; }
        public string Legajo { get => _Legajo; set => _Legajo = value; }
        public bool Activo { get => _Activo; set => _Activo = value; }
        public string BuscarTexto { get => _BuscarTexto; set => _BuscarTexto = value; }
    }
}
