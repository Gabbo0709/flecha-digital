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
    const { boletos_recibidos } = req.body.boletos; //req.body.boletos debe ser un arreglo de objetos en formato JSON
    const boletos = boletos_recibidos.map(boleto => new models.boleto(boleto));
    const { actividad_recibida } = req.body.actividad;
    const actividad = new models.actividad(actividad_recibida);
    let result = await models.reservasRepositorio.crearOperacionYBoleto(operacion, boletos, actividad);
    res.send(result);
});

app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});