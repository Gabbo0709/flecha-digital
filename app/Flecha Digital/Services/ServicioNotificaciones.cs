using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flecha_Digital.Services
{
    class ServicioNotificaciones
    {
        HttpClient httpClient;
        string baseUrl = "https://localhost:3004/server/services/notificaciones.api/server/";
        public ServicioNotificaciones()
        {
            httpClient = new HttpClient();
        }
    }
}