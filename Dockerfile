# ============================================================
# Evolution API v2.3.7 com Migrations Automáticas
# ============================================================
# Essa imagem:
# 1. Roda as migrations do Prisma automaticamente
# 2. Depois inicia o Evolution API
# ============================================================

FROM evoapicloud/evolution-api:v2.3.7

# Instala ferramentas necessárias
RUN apt-get update && apt-get install -y \
    curl \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Cria script que roda migrations antes de iniciar
RUN mkdir -p /app/scripts
COPY entrypoint.sh /app/scripts/entrypoint.sh
RUN chmod +x /app/scripts/entrypoint.sh

# Define o entrypoint customizado
ENTRYPOINT ["/app/scripts/entrypoint.sh"]

# Expõe porta 8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1
