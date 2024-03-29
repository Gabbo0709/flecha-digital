const express = require('express');
const env = require('./config/enviroment');
const models = require('./models/models');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post("/crearOperacionYBoleto", async (req, res) => {
    const { no_operacion, id_usuario, cve_metodo, cant_boletos, costo_total} = req.body.operacion;
    const operacion_recibida = new models.reservasRepositorio.operacion(
        no_operacion,
        id_usuario,
        cve_metodo,
        cant_boletos,
        costo_total
    );
    const operacion = new models.operacion(operacion_recibida);
    const boleto_recibido = req.body.boleto;
    const boleto = new models.boleto(boleto_recibido);
    let result = await models.reservasRepositorio.crearOperacionYBoleto(operacion, boleto);
    res.send(result);
});

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});