using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Services
{
    public class ServicioPagos
    {
        HttpClient httpClient;
        string baseUrl = "https://localhost:3001/server/services/pagos.api/server/";
        public ServicioPagos()
        {
            httpClient = new HttpClient();
        }
    }
}