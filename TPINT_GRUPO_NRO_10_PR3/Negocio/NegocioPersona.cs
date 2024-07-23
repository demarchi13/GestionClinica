using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{

    public class NegocioPersona
    {

        public bool verificarDNI(Persona auxPersona)
        {
            DaoMedico objDaoMedico = new DaoMedico();
            bool encontrado = objDaoMedico.verificarDniDao(auxPersona);
            return encontrado;
        }

        public bool AgregarPersona(Persona objPersona)
        {
            DaoPersona objDaoPersona = new DaoPersona();
            bool filasAfectadas = objDaoPersona.AgregarPersonaDao(objPersona);
            return filasAfectadas;
        }

        public Persona ObtenerFechaNacimiento(Persona objPersona)
        {
            DaoPersona objDaoPersona = new DaoPersona();
            //Declara un objeto auxiliar de la clase persona y guarda la fecha de nacimiento obtenida desde el dao
            Persona auxPersona = new Persona();
            auxPersona = objDaoPersona.ObtenerFechaNacimientoDao(objPersona);
            return auxPersona;
        }
    }
}
