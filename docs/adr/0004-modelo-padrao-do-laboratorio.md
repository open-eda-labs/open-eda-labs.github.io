# ADR-0004: Modelo padrão do laboratório

## Estado

Aceita em 2026-11-15 (Rafa).

## Contexto

O plano lista candidatos de cerca de 8B para o notebook (8 GB de VRAM) e deixa a escolha para a medição de P4. Para subir a base e rodar a triagem, o Rafa pediu um modelo mais confortável de rodar, e citou `qwen3:4b` e `gemma4:e4b`.

## Decisão

O modelo padrão do laboratório é o `qwen3:4b`, servido pelo Ollama fora do cluster (D-16). É o padrão do `lab-infra/check-model.sh`; outro modelo entra pela variável `MODEL`.

O `gemma4:e4b` fica como alternativa a medir, não como padrão: P4 pede licença Apache-2.0 nos candidatos, a família Qwen já está na tabela de candidatos do plano, e a licença do Gemma não foi conferida nesta sessão.

## Consequências

- Sobra VRAM para contexto maior (o plano estima que um modelo de 4B cabe no notebook com até 32k), mas `OLLAMA_CONTEXT_LENGTH` continua precisando ser definido (R-16).
- Um modelo de 4B deve bastar para a triagem com saída estruturada; para tool-calling e para o loop do N2, o plano já previa modelo maior ou endpoint remoto (R-14, Q-11). Nada disso foi medido.
- **Critério de troca.** A escolha vale até P4 medir os candidatos com os limiares do G-P4 do plano (90% de schema válido, 80% de ferramenta correta, p95 abaixo de 30 s, nenhum offload para CPU). O `gemma4:e4b` só entra na medição depois de conferida a licença; se não for compatível com o requisito de P4, sai da lista. Para o vuln fixer, o critério é outro e objetivo: as 7 unidades que a medição do fixer deixou para o passo com modelo, cada uma com build, testes e re-scan como juiz.
