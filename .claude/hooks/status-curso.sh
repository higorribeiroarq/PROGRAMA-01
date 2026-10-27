#!/usr/bin/env bash
# Mostra quais etapas do curso estão completas. Saída: uma linha por etapa.
# Código de saída 0 = tudo completo; 1 = falta alguma coisa.
cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}" || exit 1
base="curso-programacao"
etapas="etapa-00-preparacao etapa-01-fundamentos etapa-02-javascript-typescript etapa-03-backend-nestjs etapa-04-frontend-nextjs etapa-05-fullstack etapa-06-portfolio etapa-07-carreira"
faltando=0
for e in $etapas; do
  falta=""
  for f in README.md exercicios.md gabarito.md; do
    [ -s "$base/$e/$f" ] || falta="$falta $f"
  done
  [ "$e" = "etapa-00-preparacao" ] || [ -s "$base/$e/projeto-entregavel.md" ] || falta="$falta projeto-entregavel.md"
  ls "$base/$e"/aula-*.md >/dev/null 2>&1 || falta="$falta aulas"
  if [ -z "$falta" ]; then
    echo "OK       $e"
  else
    echo "FALTA    $e:$falta"
    faltando=1
  fi
done
exit $faltando
