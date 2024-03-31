using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    public class TipoBoleto
    {
        public int cve_tipo { get; set; }
        public string descripcion { get; set; }
        public int disponibles { get; set; }
    }
}