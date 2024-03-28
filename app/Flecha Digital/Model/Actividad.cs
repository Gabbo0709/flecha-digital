using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    public class Actividad
    {
        public int no_operacion { get; set; }
        public int origen_viaje { get; set; }
        public int destino_viaje { get; set; }
        public DateTime fecha_salida { get; set; }
        public IEnumerable Boleto { get; set;}
    }
}