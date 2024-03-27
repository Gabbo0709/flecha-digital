const express = require('express');
const env = require('./config/environment.js');
const models = require('./models/models.js');

const app = express();

// Set up middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Set up routes

app.post('/iniciar', async (req, res) => {
    const usuario = new models.usuario(req.body.email, req.body.pass);
    const result = await models.usuariosRepositorio.autenticar(usuario);
    res.send(result);
});

app.post('/registrar', async (req, res) => {
    const { nombre_user, apellido, pass, email, tel_user } = req.body;
    const usuario = new models.usuario(
        nombre_user,
        apellido,
        pass,
        email,
        tel_user,
        2 // Sin confirmar
    );
    const result = await models.usuariosRepositorio.registrarUsuario(usuario);
    res.send(result);
});

app.post('/actualizar', async (req, res) => {
    const { nombre_user, apellido, email, tel_user } = req.body;
    const usuario = new models.usuario(
        nombre_user,
        apellido,
        null,
        email,
        tel_user
    );
    const result = await models.usuariosRepositorio.actualizarUsuario(usuario);
    res.send(result);
});

app.post('/activar', async (req, res) => {
    let usuario = new models.usuario(null, null, null, req.body.email, null);
    usuario.cve_estado = 1; // Activo
    const result = await models.usuariosRepositorio.activarUsuario(usuario);
    res.send(result);
});

app.post('/desactivar', async (req, res) => {
    let usuario = new models.usuario(null, null, null, req.body.email, null);
    usuario.cve_estado = 4; // Desactivado
    const result = await models.usuariosRepositorio.desactivarUsuario(usuario);
    res.send(result);
});

app.post('/suspender', async (req, res) => {
    let usuario = new models.usuario(null, null, null, req.body.email, null);
    usuario.cve_estado = 3; // Suspendido
    const result = await models.usuariosRepositorio.suspenderUsuario(usuario);
    res.send(result);
});

app.get('/consultar', async (req, res) => {
    
});


// Start the server
app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});