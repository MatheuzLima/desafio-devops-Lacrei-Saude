# Desafio DevOps Lacrei Saúde 🏥

Este projeto implementa uma infraestrutura como código (IaC) para hospedar uma aplicação web Node.js simples. O objetivo é demonstrar um fluxo de CI/CD completo, desde o provisionamento da infraestrutura na AWS com Terraform até o deploy automatizado com GitHub Actions.

---

### 🔧 Tecnologias usadas

- **Aplicação:** Node.js, Express.js
- **Infraestrutura como Código (IaC):** Terraform
- **Cloud Provider:** AWS (EC2, EIP, Security Groups, IAM)
- **Contêinerização:** Docker
- **CI/CD:** GitHub Actions

---

### ✅ Pré-requisitos

- Node.js (v18.x ou superior)
- Terraform (v1.x ou superior)
- Docker
- Conta AWS com credenciais configuradas localmente
- Git

---

### 🚀 Etapas — Instruções de instalação

1.  **Clonar o repositório:**
    ```bash
    git clone https://github.com/SEU-USUARIO/desafio-devops-Lacrei-Saude.git
    cd desafio-devops-Lacrei-Saude
    ```

2.  **Provisionar a Infraestrutura (Terraform):**
    *Atenção: Este passo criará recursos na sua conta AWS que podem gerar custos.*
    ```bash
    cd infra
    terraform init
    terraform apply
    ```

3.  **Instalar dependências da aplicação:**
    ```bash
    cd ../src
    npm install
    ```

4.  **Rodar a aplicação localmente:**
    ```bash
    npm start
    ```
    A aplicação estará disponível em `http://localhost:3000`.

---

### 💡 Instruções de uso

O principal uso deste projeto é através do fluxo de CI/CD.

- **Deploy em Staging:** Ao abrir ou atualizar um Pull Request para a branch `main`, a action `deploy-staging.yml` é acionada para fazer o deploy no ambiente de homologação.
- **Deploy em Produção:** Ao fazer um merge ou push direto na branch `main`, a action `deploy-production.yml` é acionada para o deploy em produção.
- **Destruir a Infraestrutura:** Para remover todos os recursos da AWS, use o comando:
    ```bash
    cd infra
    terraform destroy
    ```

---

### 📂 Estrutura de pastas

```
.
├── .github/
│   └── workflows/
│       ├── deploy-production.yml
│       ├── deploy-staging.yml
│       └── destroy-infra.yml
├── infra/
│   └── main.tf
├── src/
│   ├── Dockerfile
│   ├── server.js
│   └── package.json
├── .gitignore
├── LICENSE
└── README.md
```

---

### 🤝 Contribuição

1.  Faça um fork do projeto.
2.  Crie uma nova branch (`git checkout -b feature/sua-feature`).
3.  Faça commit de suas alterações (`git commit -m 'Adiciona sua-feature'`).
4.  Faça push para a branch (`git push origin feature/sua-feature`).
5.  Abra um Pull Request.

---

### 📄 Licença

Distribuído sob a licença [**MIT**](./LICENSE) `LICENSE`

---