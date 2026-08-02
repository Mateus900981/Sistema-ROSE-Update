#!/bin/bash

echo "============================================="
echo "  🚀 ATUALIZAÇÃO 100% AUTOMÁTICA R.O.S.E. 🚀 "
echo "============================================="
echo ""

# Garante que o terminal vai rodar dentro da pasta certa
cd "$(dirname "$0")"

# 🛡️ Escudo para o Git Push não travar com arquivos grandes
# MUDANÇA: Agora o escudo protege os novos nomes de Windows e Linux!
echo "Sistema_ROSE_Linux.zip" > .gitignore
echo "Sistema_ROSE_Win.zip" >> .gitignore
echo "Launcher_ROSE.AppImage" >> .gitignore
echo "Launcher_ROSE.exe" >> .gitignore

# ==========================================
# 1. ATUALIZAR O SISTEMA
# ==========================================
echo "--- ATUALIZAÇÃO DO SISTEMA ---"
read -p "Digite a NOVA VERSÃO (ex: 1.0.5) ou Enter para pular: " VERSAO_SISTEMA

if [ ! -z "$VERSAO_SISTEMA" ]; then
    # ISSO AQUI FAZ A MÁGICA: Escreve a versão direto no arquivo txt!
    echo "$VERSAO_SISTEMA" > versao.txt
    echo "✅ Arquivo versao.txt atualizado sozinho para $VERSAO_SISTEMA!"
fi
echo ""

# ==========================================
# 2. ATUALIZAR O LAUNCHER
# ==========================================
echo "--- ATUALIZAÇÃO DO LAUNCHER ---"
read -p "Digite a nova versão do LAUNCHER (ex: 1.0.4) ou Enter para pular: " VERSAO_LAUNCHER

if [ ! -z "$VERSAO_LAUNCHER" ]; then
    # ISSO AQUI FAZ A MÁGICA: Escreve a versão direto no arquivo txt do Launcher!
    echo "$VERSAO_LAUNCHER" > versao_launcher.txt
    echo "✅ Arquivo versao_launcher.txt atualizado sozinho para $VERSAO_LAUNCHER!"
fi
echo ""

# ==========================================
# 3. SALVAR E ENVIAR TUDO
# ==========================================
echo "📦 Salvando os textos (versões) localmente..."
git add .
git commit -m "Atualização de versão pelo script automático"

echo "☁️  Enviando os textos para o GitHub..."
git push

# ==========================================
# 4. CRIAR O RELEASE AUTOMÁTICO COM OS ARQUIVOS PESADOS
# ==========================================
# O script cria uma tag baseada na versão do sistema ou na data atual
if [ ! -z "$VERSAO_SISTEMA" ]; then
    TAG="v$VERSAO_SISTEMA"
else
    TAG="v-$(date +'%Y%m%d%H%M')"
fi

echo ""
echo "🚀 UPLOAD TURBO INICIADO..."
echo "Criando o Release e enviando o ZIP e o AppImage pesados direto pro GitHub!"
echo "Isso pode demorar alguns minutos dependendo da sua internet..."

# O comando 'gh' que faz o serviço pesado por você
# MUDANÇA: Agora ele sobe o arquivo "Sistema_ROSE_Linux.zip"
gh release create "$TAG" Sistema_ROSE_Linux.zip Launcher_ROSE.AppImage --title "Atualização $TAG" --notes "Arquivos atualizados automaticamente pelo script."

echo ""
echo "============================================="
echo " 🎉 TUDO PRONTO! ATUALIZAÇÃO NO AR! 🎉       "
echo "============================================="
read -p "Aperte ENTER para fechar..."
