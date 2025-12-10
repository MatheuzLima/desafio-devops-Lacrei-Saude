const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/status', (req, res) => {
  res.status(200).json({ 
    status: "ok", 
    message: "Desafio DevOps Lacrei Saúde ativo e rodando na AWS EC2!",
    timestamp: new Date().toISOString(),});
});

app.listen(PORT, () => {
  console.log(`✅ Servidor rodando na porta ${PORT}`);
});