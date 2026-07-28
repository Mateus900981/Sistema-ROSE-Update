#!/bin/bash

echo "============================================="
echo "  🚀 ENVIANDO ATUALIZAÇÃO PARA O GITHUB 🚀  "
echo "============================================="
echo ""

# Garante que o terminal vai rodar dentro da pasta certa
cd "$(dirname "$0")"

# =======================================================
# 🛡️ TRAVA DE PROTEÇÃO CONTRA ARQUIVOS GIGANTES
# Ignora o ZIP e o Launcher para não travar o terminal!
# =======================================================
echo "Sistema_ROSE.zip" > .gitignore
echo "Launcher_ROSE.AppImage" >> .gitignore

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

echo "☁️  Enviando para a nuvem do GitHub (Apenas Textos)..."
git push

echo ""
echo "============================================="
echo " 🎉 ARQUIVOS ENVIADOS COM SUCESSO! 🎉      "
echo "============================================="
echo " ⚠️  LEMBRETE MUITO IMPORTANTE:            "
echo " Os arquivos Sistema_ROSE.zip e o         "
echo " Launcher_ROSE.AppImage NÃO foram enviados"
echo " por aqui para evitar lentidão e erros.   "
echo ""
echo " Vá na aba 'Releases' do seu GitHub e faça "
echo " o upload manual dos DOIS arquivos lá!     "
echo "============================================="
echo ""
read -p "Aperte ENTER para fechar..."
