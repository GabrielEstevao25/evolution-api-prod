# ============================================================
# Evolution API v2.3.7 com Migrations Automáticas
# ============================================================

FROM evoapicloud/evolution-api:v2.3.7

# Cria diretório para scripts
RUN mkdir -p /app/scripts

# Copia script que roda migrations antes de iniciar
COPY entrypoint.sh /app/scripts/entrypoint.sh

# Garante permissão de execução
RUN chmod +x /app/scripts/entrypoint.sh && \
    ls -la /app/scripts/

# Executa o script
CMD ["/app/scripts/entrypoint.sh"]

# Expõe porta 8080
EXPOSE 8080
