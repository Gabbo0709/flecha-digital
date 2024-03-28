using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    public class Boleto
    {
        public int no_boleto { get; set; }
        public int cve_tipo { get; set; }
        public int cve_asiento { get; set; }
        public string nombre_pas { get; set; }
        public string token_fac { get; set; }
        public int no_asiento_boleto { get; set; }
        //public string puerto {get; set;}
        //public int carril {get; set;}
        //public int anden {get; set;}
        public int tel_cliente { get; set; }
        public double costo_boletos { get; set; }
    }
}