const express = require('express');
const app = express();
const axios = require('axios');
const { Suscripcion, Boleto, SuscripcionesRepositorio } = require('./models/models');

app.use(express.json());

app.post('/agregarSuscripcion', async (req, res) => {
    const suscripcionRecibida = req.body;
    const suscripcion = new Suscripcion(suscripcionRecibida);
    const result = await SuscripcionesRepositorio.agregarSuscripcion(suscripcion);
    res.send(result);
});

app.post('/enviarCorreo', async (req, res) =>{
    suscripcionRecibida = req.body;
    const suscripcion = new Suscripcion(suscripcionRecibida);
    const result = await SuscripcionesRepositorio.enviarCorreo(suscripcion);
    res.send(result);
});