#!/bin/bash

echo "============================================="
echo "  🚀 ENVIANDO ATUALIZAÇÃO PARA O GITHUB 🚀  "
echo "============================================="
echo ""

# Garante que o terminal vai rodar dentro da pasta certa
cd "$(dirname "$0")"

# Pergunta qual é a nova versão para deixar o histórico bonitinho
read -p "Digite a nova versão (ex: 1.0.3) ou aperte Enter para pular: " VERSAO

# Se apertar Enter sem digitar nada, ele usa a data e hora atual
if [ -z "$VERSAO" ]; then
    MENSAGEM="Atualização do sistema - $(date +'%d/%m/%Y %H:%M')"
else
    MENSAGEM="Lançamento da versão $VERSAO"
fi

echo ""
echo "📦 Preparando arquivos novos..."
git add .

echo "💾 Salvando o pacote localmente..."
git commit -m "$MENSAGEM"

echo "☁️  Enviando para a nuvem do GitHub (isso pode demorar dependendo da internet)..."
git push

echo ""
echo "============================================="
echo " 🎉 ATUALIZAÇÃO ENVIADA COM SUCESSO! 🎉     "
echo "============================================="
echo ""
read -p "Aperte ENTER para fechar..."
