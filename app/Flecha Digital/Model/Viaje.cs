using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    internal class Viaje
    {
        public int cve_viaje { get; set; }
        public int no_servicio { get; set; }
        public int origen_viaje { get; set; }
        public int destino_viaje { get; set; }
        public string descripcion_clase   { get; set; }
        public DateTime fecha_salida { get; set; }
        public DateTime fecha_llegada { get; set; }
        public string descripcion_servicios { get; set; }
        public string descrpcion_viaje { get; set; }
        public double costo_total { get; set; }
        public int cve_linea { get; set; }
        public string nombre_linea { get; set; }
    }
}