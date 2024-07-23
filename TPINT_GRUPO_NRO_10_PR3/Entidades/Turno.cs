using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        private string _IdEspecialidad;
        private int _IdMedico;
        private string _DniMedico;
        private int _IdTurno;
        private string _DniPaciente;
        private int _IdPaciente;
        private DateTime _FechaTurno;
        private TimeSpan _HoraTurno;
        private bool _Asistencia;
        private string _Observaciones;
        private string _BuscarTexto;

        public string IdEspecialidad { get => _IdEspecialidad; set => _IdEspecialidad = value; }
        public int IdMedico { get => _IdMedico; set => _IdMedico = value; }
        public string DniMedico { get => _DniMedico; set => _DniMedico = value; }
        public int IdTurno { get => _IdTurno; set => _IdTurno = value; }
        public string DniPaciente { get => _DniPaciente; set => _DniPaciente = value; }
        public DateTime FechaTurno { get => _FechaTurno; set => _FechaTurno = value; }
        public TimeSpan HoraTurno { get => _HoraTurno; set => _HoraTurno = value; }
        public bool Asistencia { get => _Asistencia; set => _Asistencia = value; }
        public string Observaciones { get => _Observaciones; set => _Observaciones = value; }
        public int IdPaciente { get => _IdPaciente; set => _IdPaciente = value; }
        public string BuscarTexto { get => _BuscarTexto; set => _BuscarTexto = value; }
    }
}
