const express = require('express');
const env = require('./config/environment.js');
const models = require('./models/models.js');

const app = express();

// Set up middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Set up routes
app.get('/login:email:password', async (req, res) => {
    let usuario = new models.usuario();
    usuario.email = req.params.email;
    usuario.pass = req.params.password;
    let result = await models.usuariosRepositorio.autenticarUsuario(usuario);
    res.send(result);
});



// Start the server
app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});