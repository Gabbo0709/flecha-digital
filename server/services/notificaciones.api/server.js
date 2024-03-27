const express = require('express');
const env = require('../config/enviroment.js');
const modles = require('../models');

app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.listen(env.puertoServidor, () => {
    console.log(`Server listening on port ${env.port}`);
});