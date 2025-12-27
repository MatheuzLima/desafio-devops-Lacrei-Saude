const express = require('express');
const app = express();

// Lê as variáveis de ambiente (Definida no Pipeline)
// Se não houver variável, usa valores padrão seguros
const PORT = process.env.PORT || 3000;
const DOMAIN = process.env.DOMAIN_NAME || 'localhost';

// Rota de Status (Usada pelo seu Smoke Test da Pipeline)
app.get('/status', (req, res) => {
  res.status(200).json({ 
    status: 'ok',
    message: `Aplicação rodando atrás do Nginx!`,
    domain: DOMAIN,
    environment: process.env.NODE_ENV || 'development'
  });
});

// Rota Principal (Para não dar erro 404 na home)
app.get('/', (req, res) => {
  res.send(`<h1>Desafio Lacrei Saúde</h1><p>Servidor respondendo corretamente para: <strong>${DOMAIN}</strong></p>`);
});

// Inicia o servidor apenas em HTTP (O Nginx cuida da segurança lá na frente)
app.listen(PORT, () => {
  console.log(`🚀 Servidor iniciado na porta ${PORT}`);
  console.log(`📡 Esperando conexões vindas do Nginx...`);
});

// (Opcional) Tratamento para desligamento gracioso pelo Docker
process.on('SIGTERM', () => {
  console.log('SIGTERM recebido. Encerrando servidor...');
  process.exit(0);
});