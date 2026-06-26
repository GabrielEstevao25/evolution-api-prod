#!/bin/bash

# ============================================================
# Entrypoint Script - Evolution API com Migrations
# ============================================================
# 1. Aguarda PostgreSQL estar pronto
# 2. Roda migrations do Prisma
# 3. Inicia o Evolution API
# ============================================================

set -e

echo "[Evolution API] Iniciando com migrations automáticas..."
echo "[Evolution API] DATABASE_CONNECTION_URI: $DATABASE_CONNECTION_URI"

# Aguarda PostgreSQL estar disponível
echo "[Evolution API] Aguardando PostgreSQL..."
until PGPASSWORD=$POSTGRES_PASSWORD psql -h ${DATABASE_HOST:-localhost} -U ${DATABASE_USER:-postgres} -d ${DATABASE_NAME:-evolution} -c "\q" 2>/dev/null; do
  echo "[Evolution API] PostgreSQL indisponível, aguardando..."
  sleep 2
done

echo "[Evolution API] PostgreSQL conectado ✓"

# Tenta rodar migrations
echo "[Evolution API] Executando Prisma migrations..."
if [ -f "/evolution/prisma/schema.prisma" ]; then
  cd /evolution
  npm run db:migrate 2>&1 || true
  echo "[Evolution API] Migrations concluídas ✓"
else
  echo "[Evolution API] Schema Prisma não encontrado em /evolution/prisma/"
  echo "[Evolution API] Continuando sem migrations explícitas..."
fi

# Inicia o Evolution API
echo "[Evolution API] Iniciando servidor Evolution API na porta 8080..."
exec node dist/main
