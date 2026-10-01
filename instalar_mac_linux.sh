#!/usr/bin/env bash
# Instala as skills deste pacote no Claude Code e nas outras ferramentas (Codex, Gemini CLI, Cursor).
# Nao sobrescreve skills que ja existam com o mesmo nome.
set -e
ORIGEM="$(cd "$(dirname "$0")" && pwd)/skills"
for DEST in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  mkdir -p "$DEST"
  for S in "$ORIGEM"/*/; do
    N="$(basename "$S")"
    if [ -e "$DEST/$N" ]; then echo "Ja existe, mantido: $DEST/$N"
    else cp -R "$S" "$DEST/$N"; echo "Instalada: $DEST/$N"; fi
  done
done
echo
echo "Pronto. Abra o Claude Code e digite / para ver as skills."
