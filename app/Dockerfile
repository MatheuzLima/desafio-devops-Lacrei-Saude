# Imagem alpine
FROM node:18-alpine

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia arquivos de dependência
COPY package*.json ./

# Instala apenas dependências de produção (mais rápido e seguro)
RUN npm ci --only=production

# Copia o restante do código
COPY . .

# A partir daqui, usa o usuário não-root 'node'
USER node

EXPOSE 3000

CMD [ "node", "server.js" ]