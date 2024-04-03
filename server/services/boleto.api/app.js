const express = require('express');
const app = express();
const axios = require('axios');
const { Boleto, BoletosRepositorio } = require('./models/models');

// Middleware
app.use(express.json());

// Rutas

// Ruta para crear un nuevo boleto
app.post('/crearBoleto', async (req, res) => {
    // Obtenemos los atributos del boleto del cuerpo de la petición
    const boletoRecibido = req.body;
    // Creamos un nuevo boleto y utilizamos el método agregarBoleto del repositorio para generar los
    const boleto = new Boleto(boletoRecibido);
    const enlaces = await BoletosRepositorio.guardarBoleto(boleto);
    // Hacer petición al microservicio de suscripción para enviar el correo de suscripción
    let result;
    axios.post('http://localhost:3001/suscripcion', {
        boleto: boleto,
        enlaceGoogleWallet: enlaces[0],
        enlaceAppleWallet: enlaces[1]
    }).then((response) => {
        result = response.data;
    }).catch((error) => {
        result = error;
    });
    res.send(result);
});

// Ruta para crear varios boletos
app.post('/crearBoletos', async (req, res) => {
    // Obtenemos los atributos de los boletos del cuerpo de la petición
    const boletosRecibidos = req.body;
    const boletos = boletosRecibidos.map(boleto => new Boleto(boleto));
    const enlaces = await Promise.all(boletos.map(boleto => BoletosRepositorio.guardarBoleto(boleto)));
    // Hacer petición al microservicio de suscripción para enviar el correo de suscripción
    let result;
    axios.post('http://localhost:3001/suscripcionVarios', {
        boletos: boletos,
        enlacesGoogleWallet: enlaces.map(enlace => enlace[0]),
        enlacesAppleWallet: enlaces.map(enlace => enlace[1])
    }).then((response) => {
        result = response.data;
    }).catch((error) => {
        result = error;
    });
    res.send(result);
});

// Ruta para actualizar el estado de un boleto
app.put('/actualizarBoleto', async (req, res) => {
    // Obtenemos los atributos del boleto del cuerpo de la petición
    const boletoRecibido = req.body;
    // Creamos un nuevo boleto y utilizamos el método actualizarBoleto del repositorio para actualizar el estado
    const boleto = new Boleto(boletoRecibido);
    const result = await BoletosRepositorio.actualizarBoleto(boleto);
    res.send(result);
});