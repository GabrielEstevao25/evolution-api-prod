# Evolution API - Operacional Viana

Deployment do Evolution API com PostgreSQL e Redis para Operacional Viana.

## Componentes

- **Evolution API v2.3.7** - WhatsApp integration API
- **PostgreSQL 15** - Database
- **Redis 7** - Cache layer

## Variáveis de Ambiente

Configure no Railway antes de fazer deploy:

```env
# API
API_KEY=akh8wh3pze0v6f3oc3m55l
SERVER_URL=https://seu-app-prod-xyz.railway.app

# Database
DB_USER=evolution
DB_PASSWORD=evolution123
DB_NAME=evolution
```

## Como fazer Deploy no Railway

### 1. Criar repositório no GitHub

```bash
# Na pasta evolution-api-prod
git init
git add .
git commit -m "Deployment inicial Evolution API"
git remote add origin https://github.com/seu-usuario/evolution-api-prod.git
git branch -M main
git push -u origin main
```

### 2. Fazer Deploy no Railway

1. Vá em **railway.app**
2. Clique **New Project** → **Deploy from GitHub**
3. Selecione seu repositório `evolution-api-prod`
4. Railway detecta `docker-compose.yml` automaticamente
5. Clique **Deploy**

### 3. Configurar Variáveis de Ambiente

Após o deploy iniciar:

1. Vá em **Project** → seu projeto
2. Clique em **Variables**
3. Adicione as variáveis:
   - `API_KEY=akh8wh3pze0v6f3oc3m55l`
   - `SERVER_URL=https://seu-app-prod-xyz.railway.app` (substitua pela URL do Railway)
   - `DB_USER=evolution`
   - `DB_PASSWORD=evolution123`
   - `DB_NAME=evolution`

### 4. Acessar Painel da Evolution API

Após deploy bem-sucedido:

```
https://seu-app-prod-xyz.railway.app:8080
```

## Rodar Localmente

```bash
docker-compose up -d
```

Acesse em `http://localhost:8080`

## Portas

- Evolution API: `8080`
- PostgreSQL: `5432`
- Redis: `6379`

## URLs de Serviço (Internal)

- Evolution API: `http://evolution-api:8080`
- PostgreSQL: `postgresql://evolution:evolution123@evolution-postgres:5432/evolution`
- Redis: `redis://evolution-redis:6379`

## Notas para n8n

No seu workflow n8n.io, use:

```
https://seu-app-prod-xyz.railway.app:8080/message/sendText/operacionalViana-prod
```

Substitua `seu-app-prod-xyz` pela URL real que Railway te der.
