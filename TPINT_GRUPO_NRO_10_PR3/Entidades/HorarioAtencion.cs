using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorarioAtencion
    {
        private string _IdDia;
        private int _IdMedico;
        private int _IdHorario;
        private string _IdEspecialidad;
        private string _DniMedico;
        private TimeSpan _HorarioInicio;
        private TimeSpan _HorarioFin;
        private bool _activo;

        public string IdDia { get => _IdDia; set => _IdDia = value; }
        public int IdMedico { get => _IdMedico; set => _IdMedico = value; }
        public int IdHorario { get => _IdHorario; set => _IdHorario = value; }
        public string IdEspecialidad { get => _IdEspecialidad; set => _IdEspecialidad = value; }
        public string DniMedico { get => _DniMedico; set => _DniMedico = value; }
        public TimeSpan HorarioInicio { get => _HorarioInicio; set => _HorarioInicio = value; }
        public TimeSpan HorarioFin { get => _HorarioFin; set => _HorarioFin = value; }
        public bool Activo { get => _activo; set => _activo = value; }
    }
}
