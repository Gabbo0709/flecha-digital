using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Model
{
    public class Camion
    {
        public int id_camion { get; set; }
        public IEnumerable asientos { get; set; }
    }
}