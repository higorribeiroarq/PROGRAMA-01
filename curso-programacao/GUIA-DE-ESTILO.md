# Guia de estilo do curso (regras obrigatórias para quem escreve as aulas)

Base: PDF "Como se tornar programador em 2026" (trilha Node.js + NestJS + Next.js, 12 meses, 7 etapas).
Público: aluno adulto, brasileiro, que começa do ABSOLUTO ZERO. Nunca programou, não sabe o que é terminal, arquivo .js ou servidor.

## Linguagem
- Português brasileiro, "você", frases curtas, tom de professor paciente e direto. Sem infantilizar.
- Todo termo técnico novo segue a regra: **nome → explicação em 1 frase simples → analogia do dia a dia → exemplo**.
  Ex.: "**Variável** é um nome que guarda um valor. Pense numa caixa com etiqueta: a etiqueta é o nome, o que está dentro é o valor."
- Termos em inglês: mostrar a tradução/pronúncia simples na primeira vez (ex.: *commit* — "registrar/salvar uma versão").
- Nada de "é simples", "obviamente", "trivial". Nada de elogio vazio.
- Analogias preferidas: cozinha/receita, obra/construção (planta, alicerce, pedreiro), escritório, restaurante (garçom = API), correios.

## Estrutura de cada AULA (arquivo `aula-XX-tema.md`)
1. `# Aula XX — Título`
2. **Nesta aula você vai aprender** (3 a 5 bullets)
3. **Tempo estimado** e **pré-requisito** (qual aula anterior)
4. **Explicação** em seções curtas (##), cada conceito com analogia
5. **Exemplo de código** comentado linha a linha (comentários em português). Código que roda de verdade. Mostrar também o que aparece na tela (saída esperada).
6. **Erros comuns** (tabela: Erro | Por que acontece | Como resolver), com a mensagem de erro real quando houver
7. **Usando IA do jeito certo** (1 prompt de exemplo para pedir explicação, e o alerta: confira e entenda antes de aceitar)
8. **Resumo** (5 bullets no máximo)
9. **Teste rápido** (3 perguntas de múltipla escolha ou V/F; respostas no gabarito)

Tamanho: 150 a 400 linhas por aula. Densidade controlada; prefira exemplos a teoria.

## EXERCÍCIOS (arquivo `exercicios.md` em cada etapa)
- Organizados por aula, em 3 níveis:
  - 🟢 **Aquecimento** — repetir o que viu com pequena mudança
  - 🟡 **Prática** — resolver um problema pequeno sem modelo pronto
  - 🔴 **Desafio** — combinar conceitos; problema do mundo real
- Mínimo por aula: 2 🟢, 2 🟡, 1 🔴. Cada exercício tem enunciado claro, exemplo de entrada/saída quando fizer sentido e uma **dica** escondida em `<details><summary>Dica</summary>...</details>`.
- Use contextos concretos e variados (loja, lista de compras, notas de aluno, obra, cupons de desconto, agenda).

## GABARITO (arquivo `gabarito.md`)
- Solução de TODOS os exercícios e dos testes rápidos, com código comentado e explicação do raciocínio ("por que assim").
- Quando houver mais de uma solução válida, dizer isso.

## PROJETO DA ETAPA (arquivo `projeto-entregavel.md`)
- Baseado no "Entregável" do PDF. Dividir em passos numerados pequenos, com checklist de "pronto quando…" e critérios de avaliação.
- Não entregar o código completo do projeto: entregar esqueleto, pistas e checklist (o aluno deve construir).

## README da etapa (`README.md`)
- Objetivo da etapa, lista de aulas com links, ordem de estudo, semana-modelo do PDF (2 dias conceito, 2 dias prática sem tutorial, 1 dia revisão), e "Você está pronto para a próxima etapa quando…" (checklist).

## Técnico
- Versões atuais em 2026: Node.js LTS (22 ou 24), TypeScript 5.x, NestJS 11, Next.js 15+ com App Router, React 19, PostgreSQL. Editor: VS Code. Comandos de terminal mostrados para Windows (PowerShell) e, se diferente, macOS/Linux.
- Todo código precisa estar correto e executável. Não invente APIs.
- Nomes de arquivo: minúsculas, hífen, sem acento.
