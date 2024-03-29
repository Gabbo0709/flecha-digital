using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    public class Operacion
    {
        public int no_operacion { get; set; }
        public int id_usuario {get; set;}
        public Boleto[] boleto { get; set;}
        public double costo_total { get; set; }
        public int cve_metodo { get; set; }
    }
}