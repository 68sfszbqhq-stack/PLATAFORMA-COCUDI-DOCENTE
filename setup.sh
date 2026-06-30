#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════
#  COCUDI — Configuración automática
#  Plataforma PLE / PLN para Docentes Universitarios
#  Creado por José Roberto Mendoza Mendoza · IBERO Puebla
# ═══════════════════════════════════════════════════════════
set -euo pipefail

BOLD='\033[1m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; RED='\033[0;31m'; NC='\033[0m'

TEMPLATE_REPO="68sfszbqhq-stack/PLATAFORMA-COCUDI-DOCENTE"
FORK_NAME="PLATAFORMA-COCUDI-DOCENTE"

step() { echo -e "\n${YELLOW}→ $1${NC}"; }
ok()   { echo -e "${GREEN}✓ $1${NC}"; }
fail() { echo -e "${RED}✗ $1${NC}"; exit 1; }

clear
echo -e "${BOLD}"
echo "  ╔═══════════════════════════════════════════╗"
echo "  ║   🎓  COCUDI — Configuración automática   ║"
echo "  ║   Plataforma PLE / PLN para Docentes      ║"
echo "  ╚═══════════════════════════════════════════╝"
echo -e "${NC}"
echo -e "  Creado por ${BOLD}José Roberto Mendoza Mendoza${NC}"
echo -e "  IBERO Puebla\n"

# ─── 1. Verificar / instalar gh CLI ────────────────────────
step "Verificando GitHub CLI (gh)..."
if ! command -v gh &>/dev/null; then
  step "Instalando GitHub CLI..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &>/dev/null; then
      fail "Homebrew no está instalado. Instálalo en https://brew.sh y vuelve a ejecutar este script."
    fi
    brew install gh
  elif command -v apt-get &>/dev/null; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg 2>/dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-get update -q && sudo apt-get install -y gh
  else
    fail "No puedo instalar gh automáticamente. Descárgalo en https://cli.github.com"
  fi
fi
ok "GitHub CLI listo"

# ─── 2. Autenticar con GitHub ──────────────────────────────
step "Verificando tu cuenta de GitHub..."
if ! gh auth status &>/dev/null; then
  echo ""
  echo -e "  Se abrirá el navegador."
  echo -e "  Solo haz clic en ${BOLD}\"Authorize GitHub CLI\"${NC} y regresa aquí."
  echo ""
  gh auth login --web --git-protocol https
fi

GITHUB_USER=$(gh api user --jq '.login')
ok "Conectado como: ${BOLD}${GITHUB_USER}${NC}"

# ─── 3. Fork del repositorio ───────────────────────────────
step "Creando tu copia del repositorio en GitHub..."
if gh repo view "${GITHUB_USER}/${FORK_NAME}" &>/dev/null 2>&1; then
  ok "El repositorio ya existe en tu cuenta — omitiendo"
else
  gh repo fork "${TEMPLATE_REPO}" --clone=false 2>&1 | grep -v "^✓" || true
  ok "Repositorio creado: ${BOLD}github.com/${GITHUB_USER}/${FORK_NAME}${NC}"
  step "Esperando a que GitHub prepare el repositorio..."
  sleep 8
fi

# ─── 4. Activar GitHub Pages ───────────────────────────────
step "Activando GitHub Pages (tu sitio web)..."
if gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  "/repos/${GITHUB_USER}/${FORK_NAME}/pages" \
  -f "source[branch]=main" \
  -f "source[path]=/" \
  &>/dev/null; then
  ok "GitHub Pages activado correctamente"
else
  PAGES_ENABLED=$(gh api "/repos/${GITHUB_USER}/${FORK_NAME}/pages" --jq '.status' 2>/dev/null || echo "")
  if [[ -n "$PAGES_ENABLED" ]]; then
    ok "GitHub Pages ya estaba activado"
  else
    echo -e "${YELLOW}⚠ Actívalo tú manualmente en 30 segundos:${NC}"
    echo -e "  github.com/${GITHUB_USER}/${FORK_NAME} → Settings → Pages → main → Save"
  fi
fi

# ─── 5. Resultado final ────────────────────────────────────
PAGES_URL="https://${GITHUB_USER}.github.io/${FORK_NAME}/"
REPO_URL="https://github.com/${GITHUB_USER}/${FORK_NAME}"

echo ""
echo -e "${BOLD}${GREEN}"
echo "  ╔═══════════════════════════════════════════╗"
echo "  ║           🎉  ¡Todo listo!                ║"
echo -e "  ╚═══════════════════════════════════════════╝${NC}"
echo ""
echo -e "  📁 Repositorio:  ${BLUE}${REPO_URL}${NC}"
echo -e "  🌐 Tu sitio:     ${BLUE}${PAGES_URL}${NC}"
echo ""
echo -e "  ${YELLOW}⏳ El sitio tarda 2-3 minutos en aparecer la primera vez.${NC}"
echo ""
echo -e "  Ábrelo y sigue los 7 pasos del builder para"
echo -e "  personalizar tu PLE y tu PLN."
echo ""
echo -e "  💾 ${BOLD}Guarda esta URL — es única para ti:${NC}"
echo -e "     ${BOLD}${PAGES_URL}${NC}"
echo ""
