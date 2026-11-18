# Arquitetura alvo (idealizada)

Visão da estrutura final do laboratório, desenhada em 2026-11-18. É o alvo, não o estado atual. O que ainda não existe:
- o `intake-adapter` e o workflow de triagem (P3);
- o LiteLLM, as rotas e os modelos (ADR-0006, em proposta);
- o Switchyard (A/B em P4);
- o side node com vLLM.

O vuln fixer existe no `agent-workflows`, mas nunca rodou em cluster.

| Diagrama | O que mostra |
| --- | --- |
| [Workflow topology](workflows.html) ([PNG](workflows.png), [escuro](workflows-dark.png)) | Nós, k3s, os dois workflows do Argo, o gateway e as rotas de modelo |
| [OSV Scanner / Fixer](fixer.html) ([PNG](fixer.png), [escuro](fixer-dark.png)) | Passos do vuln fixer, o laço do fix (bump, verify, re-scan, bisect) e o sistema que cada passo usa (ADR-0005) |

Os HTML são autocontidos, com fontes e logos embutidos, e animam os fluxos principais. Foram gerados com o [stack-diagram](https://github.com/caru-ini/stack-diagram). Os logos são marcas dos donos.

Quando uma decisão mudar a arquitetura, atualize o diagrama no mesmo PR do ADR.
