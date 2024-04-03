const express = require('express');
const app = express();
const axios = require('axios');



app.get('/boleto', async (req, res) => {
    try {
        const response = await axios.get('http://localhost:3000/boleto');
        res.json(response.data);
    } catch (error) {
        res.status(500).send(error.message);
    }
});