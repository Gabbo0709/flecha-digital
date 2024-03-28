const express = require('express');
const env = require('./config/environment');
const models = require('./models/models');

const app = express();

// Set up middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Set up routes

// Rutas de usuarios

app.post('/iniciar', async (req, res) => {
    const { email, pass } = req.body;
    const usuario_recibido = { email: email, pass: pass };
    const usuario = new models.usuario(usuario_recibido);
    const result = await models.usuariosRepositorio.autenticarUsuario(usuario);
    res.send(result);
});

app.post('/registrar', async (req, res) => {
    const { nombre_user, apellido, pass, email, tel_user } = req.body;
    const usuario_recibido = {
        nombre_user: nombre_user,
        apellido: apellido,
        pass: pass,
        email: email,
        tel_user: tel_user,
        cve_estado: 2
    };
    const usuario = new models.usuario(usuario_recibido);
    const result = await models.usuariosRepositorio.registrarUsuario(usuario);
    res.send(result);
});

app.post('/actualizar', async (req, res) => {
    const { nombre_user, apellido, email, tel_user } = req.body;
    const usuario_recibido = {
        nombre_user: nombre_user,
        apellido: apellido,
        email: email,
        tel_user: tel_user
    };
    const usuario = new models.usuario(usuario_recibido);
    const result = await models.usuariosRepositorio.actualizarUsuario(usuario);
    res.send(result);
});

app.post('/actualizarPass', async (req, res) => {
    const { email, pass } = req.body;
    const usuario_recibido = { email: email, pass: pass };
    const usuario = new models.usuario(usuario_recibido);
    const result = await models.usuariosRepositorio.actualizarPass(usuario);
    res.send(result);
});

app.post('/activar', async (req, res) => {
    const { email } = req.body;
    const usuario_recibido = { email: email, cve_estado: 1 }; // Activo
    const usuario = new models.usuario(usuario_recibido);
    const result = await models.usuariosRepositorio.actualizarEstado(usuario);
    res.send(result);
});

app.post('/desactivar', async (req, res) => {
    const { email } = req.body;
    const usuario_recibido = { email: email, cve_estado: 4 }; // Desactivado
    const result = await models.usuariosRepositorio.actualizarEstado(usuario_recibido);
    res.send(result);
});

app.post('/suspender', async (req, res) => {
    let usuario = new models.usuario(null, null, null, req.body.email, null);
    usuario.cve_estado = 3; // Suspendido
    const result = await models.usuariosRepositorio.actualizarEstado(usuario);
    res.send(result);
});

app.post('/actualizarPass', async (req, res) => {
    const { email, pass } = req.body;
    const usuario = new models.usuario(null, null, pass, email, null);
    const result = await models.usuariosRepositorio.actualizarPass(usuario);
    res.send(result);
});

// Rutas de actividades relacionadas con el usuario
// Formato de peticion GET url/obtenerActividades?email=correo
app.get('/obtenerActividades', async (req, res) => {
    const { email } = req.query; // Obtener el correo del usuario del query de la URL
    const usuario_recibido = { email: email }; // Crear un objeto con el correo del usuario
    const usuario = new models.usuario(usuario_recibido); // Crear un objeto de la clase usuario con el correo del usuario
    const result = await models.actividadesRepositorio.obtenerActividadesUsuario(usuario); 
    res.send(JSON.stringify(result));
});

app.get('/obtenerBoletosActividad', async (req, res) => {
    const { no_operacion } = req.query;
    const actividad = { no_operacion: no_operacion };
    const result = await models.boletosRepositorio.obtenerBoletosActividad(actividad);
    res.send(JSON.stringify(result)); // Convertir arreglo de boletos a JSON
});

// Start the server
app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});