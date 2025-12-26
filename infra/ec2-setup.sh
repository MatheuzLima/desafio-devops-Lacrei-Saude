#!/bin/bash
# 1. Atualizar o sistema
dnf update -y

# -------------------------------------------------------
# 2. INSTALAÇÃO E CONFIGURAÇÃO DO DOCKER
# -------------------------------------------------------
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Instalar CloudWatch Agent (para logs da AWS)
dnf install -y amazon-cloudwatch-agent

# -------------------------------------------------------
# 3. INSTALAÇÃO E CONFIGURAÇÃO DO NGINX
# -------------------------------------------------------
dnf install -y nginx

# Remover a configuração padrão do Nginx para não conflitar
rm -f /etc/nginx/conf.d/default.conf

# Criar a configuração de Proxy Reverso
# Isso redireciona a porta 80 (Internet) para a 3000 (Container)
cat <<EOF > /etc/nginx/conf.d/app.conf
server {
    listen 80;
    listen [::]:80;
    server_name https://desafio-lacrei.sparkflux.com.br; # Aceita qualquer domínio, alterar quando estiver definido o domínio

    location / {
        proxy_pass http://127.0.0.1:3000; # Redireciona para o Docker
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# Iniciar o Nginx
systemctl enable nginx
systemctl start nginx

# -------------------------------------------------------
# 4. INSTALAÇÃO DO CERTBOT (SSL/HTTPS)
# -------------------------------------------------------
# Prepara o ambiente para SSL (Let's Encrypt), mas NÃO roda o comando final
# pois requer que o DNS já esteja apontando para este IP.
dnf install -y certbot python3-certbot-nginx

echo "✅ Ambiente Configurado com Sucesso!"