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
    // Guardamos el boleto en el repositorio y obtenemos enlaces para Google y Apple Wallet
    const enlaces = await BoletosRepositorio.guardarBoleto(boleto);
    // Hacer petición al microservicio de suscripción para enviar el correo de suscripción
    let result;
    // Realizamos una petición POST al servicio de suscripción
    axios.post('http://localhost:3001/suscripcion', {
        boleto: boleto,                 // Pasamos el boleto como parte del cuerpo de la petición
        enlaceGoogleWallet: enlaces[0], // Enlace para agregar el boleto a Google Wallet
        enlaceAppleWallet: enlaces[1]   // Enlace para agregar el boleto a Apple Wallet
    }).then((response) => {             // Si la petición es exitosa, almacenamos la respuesta en la variable result
        result = response.data;
    }).catch((error) => {               // Si ocurre un error en la petición, almacenamos el error en la variable resul
        result = error;
    });
    res.send(result);                   // Enviamos el resultado de la petición al cliente que hizo la solicitud HTTP
});

// Ruta para crear varios boletos
app.post('/crearBoletos', async (req, res) => {
    // Obtenemos los atributos de los boletos del cuerpo de la petición
    const boletosRecibidos = req.body;
    // Convertimos cada boleto recibido en una instancia de la clase Boleto
    const boletos = boletosRecibidos.map(boleto => new Boleto(boleto));
    // Guardamos todos los boletos en el repositorio y esperamos que todos se resuelvan
    const enlaces = await Promise.all(boletos.map(boleto => BoletosRepositorio.guardarBoleto(boleto)));
    // Hacer petición al microservicio de suscripción pa/ Variable para almacenar el resultado de la petición al microservicio de suscripciónra enviar el correo de suscripción
    let result;
    axios.post('http://localhost:3001/suscripcionVarios', {
        boletos: boletos,                                        // Pasamos la lista de boletos
        enlacesGoogleWallet: enlaces.map(enlace => enlace[0]),   // Pasamos los enlaces de Google Wallet
        enlacesAppleWallet: enlaces.map(enlace => enlace[1])     // Pasamos los enlaces de Apple Wallet
    }).then((response) => {         // Si la petición es exitosa, almacenamos la respuesta en result
        result = response.data;
    }).catch((error) => {            // Si ocurre un error, almacenamos el error en result
        result = error;     
    });
    res.send(result);                // Enviamos el resultado al cliente que hizo la solicitud HTTP
});

// Ruta para actualizar el estado de un boleto
app.post('/actualizarBoleto', async (req, res) => {
    // Obtenemos los atributos del boleto del cuerpo de la petición
    const boletoRecibido = req.body;
    // Creamos un nuevo boleto y utilizamos el método actualizarBoleto del repositorio para actualizar el estado
    const boleto = new Boleto(boletoRecibido);
    // Utilizamos el método actualizarBoleto del repositorio para cambiar el estado del boleto
    const result = await BoletosRepositorio.actualizarBoleto(boleto);
    // Enviamos el resultado de la operación al cliente
    res.send(result);
});