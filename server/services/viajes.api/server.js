const express = require('express');
const env = require('./config/enviroment.js');
const models = require('./models/models.js');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("getViajes:origen_ruta:origen_viaje:destino_ruta:origen_ruta", async(  req, res ) => {
    let viaje = new models.viaje();
    viaje.origen_ruta = req.params.origen_ruta;
    viaje.origen_viaje = req.params.origen_viaje;
    viaje.destino_ruta = req.params.destino_ruta;
    viaje.destino_viaje = req.params.destino_viaje;
    let result = await models.viajesRepositorio.getViajes(viaje);
});

app.get("updateViaje:no_servicio:tiempo", async(  req, res ) => {
    let viaje = new models.viaje();
    viaje.no_servicio = req.params.no_servicio;
    let result = await models.viajesRepositorio.updateViaje(viaje, req.params.tiempo);
});

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});