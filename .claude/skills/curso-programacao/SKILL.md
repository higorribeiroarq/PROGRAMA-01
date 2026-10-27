---
name: curso-programacao
description: Use quando a sessão indicar que o curso "Do zero a programador" está incompleto, ou quando pedirem para criar/continuar as aulas e exercícios baseados no roadmap 2026 (Node.js, NestJS, Next.js) em curso-programacao/.
---

# Curso "Do zero a programador" — criar e continuar

## Objetivo
Transformar o guia `curso-programacao/.roadmap-fonte.txt` (PDF "Como se tornar programador em 2026") em aulas de fácil entendimento para um aluno que começa do ZERO, com exercícios em 3 níveis, gabarito e projeto por etapa.

## Regras
- Siga `curso-programacao/GUIA-DE-ESTILO.md` à risca (é o contrato de qualidade).
- Índice e nomes das pastas: `curso-programacao/README.md`.
- O trabalho é RETOMÁVEL: nunca reescreva uma etapa que já está completa.

## Passo a passo
1. Anuncie: "Usando curso-programacao para continuar o curso".
2. Rode `bash .claude/hooks/status-curso.sh` para ver quais etapas faltam.
   Uma etapa está completa quando tem `README.md`, `exercicios.md`, `gabarito.md` e pelo menos uma `aula-*.md`
   (etapas 01 a 07 também precisam de `projeto-entregavel.md`).
3. Se tudo estiver completo: diga isso em uma linha e siga o pedido do usuário.
4. Se faltar algo: monte o squad com a skill `dispatching-parallel-agents` — um subagente por bloco ainda incompleto:
   - Squad 1: etapa-00-preparacao + etapa-01-fundamentos
   - Squad 2: etapa-02-javascript-typescript
   - Squad 3: etapa-03-backend-nestjs
   - Squad 4: etapa-04-frontend-nextjs
   - Squad 5: etapa-05-fullstack + etapa-06-portfolio + etapa-07-carreira
   Use o briefing de cada squad em `briefings.md` (nesta pasta). Cada subagente escreve só nas suas pastas, sem commit.
   Se uma etapa estiver pela metade, o subagente lê o que existe e completa só o que falta.
5. Quando os subagentes terminarem, revise (skill `verification-before-completion`):
   - rode `bash .claude/hooks/status-curso.sh` de novo;
   - confira por amostragem se as aulas seguem o guia de estilo e se o código JS roda com `node`;
   - confira se os links do `curso-programacao/README.md` apontam para pastas existentes.
6. Faça commit (`curso: ...`) e push no branch atual. Resuma ao usuário em poucas linhas: etapas criadas, nº de aulas e exercícios.
