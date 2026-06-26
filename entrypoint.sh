#!/bin/sh

# ============================================================
# Entrypoint Script - Evolution API com Migrations
# ============================================================
# 1. Aguarda PostgreSQL estar pronto
# 2. Roda migrations do Prisma
# 3. Inicia o Evolution API
# ============================================================

set -e

echo "[Evolution API] Iniciando com migrations automáticas..."
echo "[Evolution API] DATABASE_URL: $DATABASE_URL"

# Se DATABASE_URL não estiver setada, tenta construir de variáveis individuais
if [ -z "$DATABASE_URL" ]; then
  DATABASE_URL="postgresql://${DATABASE_USER:-postgres}:${DATABASE_PASSWORD:-postgres}@${DATABASE_HOST:-localhost}:${DATABASE_PORT:-5432}/${DATABASE_NAME:-evolution}"
  echo "[Evolution API] DATABASE_URL construída: $DATABASE_URL"
fi

# Inicia o Evolution API
echo "[Evolution API] Iniciando servidor Evolution API na porta 8080..."
echo "[Evolution API] Deixando Prisma criar as tabelas automaticamente..."
exec npm run start:prod
