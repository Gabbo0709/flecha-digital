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
        public int no_operacion { get; set; }
        public int cve_asiento { get; set; }
        public int cve_estado { get; set; }
        public string nombre_pas { get; set; }
        public string token_fac { get; set; }
        public int no_asiento_boleto { get; set; }
        public string puerta { get; set; }
        public int carril { get; set; }
        public int anden { get; set; }
        public string metodo_pago { get; set; }
        public string tel_cliente { get; set; }
        public decimal costo_boleto { get; set; }
        public string descripcion_tipo { get; set; }
        public string descripcion_estado { get; set; }
    }
}