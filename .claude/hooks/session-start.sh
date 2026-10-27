#!/usr/bin/env bash
# Roda quando uma sessão do Claude Code abre neste projeto (PC ou nuvem).
# 1) Carrega a skill using-superpowers no contexto.
# 2) Se o curso estiver incompleto, manda o Claude continuar o curso com a skill curso-programacao.
set -uo pipefail

case "$0" in
  */*|*\\*) DIR="$(cd "${0%[/\\]*}" && pwd)" ;;
  *) DIR="$(pwd)" ;;
esac
ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$DIR/../.." && pwd)}"

skill_md="$ROOT/.claude/skills/using-superpowers/SKILL.md"
if [ -r "$skill_md" ]; then sp="$(<"$skill_md")"; else sp="(skill using-superpowers não encontrada)"; fi

status="$(CLAUDE_PROJECT_DIR="$ROOT" bash "$DIR/status-curso.sh")"
if [ $? -eq 0 ]; then
  curso="O curso em curso-programacao/ está completo. Não é preciso rodar a skill curso-programacao, a menos que o usuário peça."
else
  curso="TAREFA AUTOMÁTICA DESTE PROJETO: o curso em curso-programacao/ está incompleto.
Status atual:
$status

Na sua primeira resposta desta sessão, antes de qualquer outra coisa, invoque a skill curso-programacao e execute-a até o fim (squad de subagentes, revisão, commit e push). Se nesta mesma conversa os subagentes do curso já estiverem rodando, não dispare de novo. Se o usuário pedir explicitamente outra coisa ou mandar parar, obedeça ao usuário."
fi

esc() {
  local s="$1"
  s="${s//\\/\\\\}"; s="${s//\"/\\\"}"
  s="${s//$'\n'/\\n}"; s="${s//$'\r'/\\r}"; s="${s//$'\t'/\\t}"
  printf '%s' "$s"
}

ctx="<EXTREMELY_IMPORTANT>
Este projeto inclui as skills Superpowers em .claude/skills (chamadas sem o prefixo superpowers:).
Conteúdo da skill using-superpowers:

$sp
</EXTREMELY_IMPORTANT>

$curso"

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$(esc "$ctx")"
exit 0
