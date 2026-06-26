# Evolution API - Operacional Viana

Deployment do Evolution API com PostgreSQL e Redis (Add-ons do Railway) para Operacional Viana.

## Stack

- **Evolution API v2.3.7** - WhatsApp integration API
- **PostgreSQL 15** - Database (Add-on do Railway)
- **Redis 7** - Cache layer (Add-on do Railway)

## Como foi deployado

1. Dockerfile simples que aponta para imagem oficial do Evolution API
2. PostgreSQL e Redis adicionados como Add-ons do Railway (gerenciados automaticamente)
3. Variáveis de ambiente configuradas no painel do Railway

## Variáveis de Ambiente Necessárias

Configure no Railway em **Variables**:

```
API_KEY=akh8wh3pze0v6f3oc3m55l
SERVER_URL=https://seu-app-prod-xyz.railway.app
```

**Automáticas (criadas pelos Add-ons):**
- `DATABASE_URL` - PostgreSQL (criado automaticamente)
- `REDIS_URL` - Redis (criado automaticamente)

## Acessar Evolution API

Após deployment:

```
https://seu-app-prod-xyz.railway.app:8080
```

Você ve o painel completo da Evolution API.

## Portas

- Evolution API: `8080`

## URLs Internas (para n8n)

```
https://seu-app-prod-xyz.railway.app:8080/message/sendText/operacionalViana-prod
```

## Integração com n8n.io

No seu workflow `Gutim` no n8n.io, configure a URL:

```
POST https://seu-app-prod-xyz.railway.app:8080/message/sendText/operacionalViana-prod
```

Headers:
```
apikey: akh8wh3pze0v6f3oc3m55l
```

## Estrutura de Arquivos

```
evolution-api-prod/
├── Dockerfile          (imagem do Evolution API)
├── railway.json        (configuração do Railway)
├── README.md           (este arquivo)
└── .gitignore          (arquivos ignorados)
```

## Deploy Local (para testes)

```bash
docker build -t evolution-api .
docker run -p 8080:8080 evolution-api
```

## Troubleshooting

Se houver problema de conexão com PostgreSQL/Redis:
1. Verifique se os Add-ons estão "Online" no painel do Railway
2. Confirme que `DATABASE_URL` e `REDIS_URL` estão nas Variables
3. Verifique os logs em **Deploy Logs** no painel do Railway
