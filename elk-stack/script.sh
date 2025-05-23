#!/bin/bash

# Script para inicializar o stack ELK

echo "🚀 Iniciando o stack ELK..."

# Limpa containers anteriores (caso existirem)
echo "🧹 Limpando containers anteriores..."
docker-compose down -v


docker system prune -f

# Constrói e inicia os serviços
echo "🏗️  Iniciando serviços..."
docker-compose up -d elasticsearch

echo "⏳ Aguardando Elasticsearch ficar pronto..."
sleep 30

# Verifica se o Elasticsearch está funcionando
until curl -s http://localhost:9200/_cluster/health | grep -q "yellow\|green"; do
  echo "⏳ Aguardando Elasticsearch..."
  sleep 5
done

echo "✅ Elasticsearch está pronto!"

# Inicia Kibana
echo "🔄 Iniciando Kibana..."
docker-compose up -d kibana

# Inicia Logstash
echo "🔄 Iniciando Logstash..."
docker-compose up -d logstash

echo "📊 Verificando status dos serviços..."
docker-compose ps

echo ""
echo "🎉 Stack ELK iniciado com sucesso!"
echo ""
echo "📍 URLs de acesso:"
echo "   • Elasticsearch: http://localhost:9200"
echo "   • Kibana: http://localhost:5601"
echo "   • Logstash API: http://localhost:9600"
echo ""
echo "📝 Para acompanhar os logs:"
echo "   docker-compose logs -f logstash"
echo ""
echo "🔍 Para verificar se os dados chegaram no Elasticsearch:"
echo "   curl 'http://localhost:9200/meu-logstash-index-*/_search?pretty'"