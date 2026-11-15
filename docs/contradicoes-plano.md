# Leitura do Plano Mestre v1.8: resumo e contradições

Item 1 do `docs/handoff/KICKOFF.md`. Leitura feita em 14/11/2026 sobre `docs/PLANO_MESTRE.md` (v1.8). Nada aqui muda decisão: são pontos para o Rafa corrigir no doc vivo.

## Resumo em 5 linhas

1. O programa prova, em laboratório próprio e só com dados sintéticos ou públicos, um caminho "alerta entra, recomendação sai" e, para vulnerabilidades Maven, "achado entra, PR draft sai".
2. A Fase 1 roda inteira no laboratório (D-37), na ordem P2, P0, P1, P3 e P5; P4 e P6 são condicionais, e sem G-P1, G-P3 e G-P5 o G-PoC não fecha.
3. A arquitetura é um intake adapter próprio na frente do Argo Workflows, um Workflow de quatro passos e um contrato aberto por camada (CloudEvents, Chat Completions, MCP read-only, `AGENTS.md`, schema de recomendação, `trace_id`).
4. Os controles são de arquitetura: read-only, schema rígido, lista de campos permitidos, classes de dado D0 a D3 com canários, escrita só por passo sem modelo e só como branch + PR draft.
5. A empresa só recebe a proposta com os números do laboratório; a Fase 2 (E0 a E5) sobe uma escada de autonomia e depende de aceite formal, endpoint sancionado e donos nomeados.

## Contradições

A maioria é texto anterior à v1.5 (D-37) que não foi atualizado.

| # | Onde | O que diz | Conflita com | Sugestão |
| --- | --- | --- | --- | --- |
| 1 | P0, "Objetivo e escopo" e "Requisitos" | "Roda na empresa, sem infraestrutura nova"; "conjunto guardado em repositório interno; nada sai para o laboratório" | D-37 e a própria Classificação de P0 ("trilha laboratório"), que depende de P2 | Reescrever para o replay do laboratório |
| 2 | Tabela "Etapas" da visão geral da Fase 1 e tabela "Etapas das duas fases" | P0 e P1 na trilha "Empresa", dependendo de Q-03, Q-04 e Q-14; "avaliação cega por duas pessoas do plantão" | D-37, D-38 | Trilha laboratório; P0 depende de P2 |
| 3 | G-P0 | Go exige endpoint sancionado por escrito e autorização escrita do replay | Q-03 (nenhum sancionado) e Q-14 (negada): como está escrito, G-P0 nunca passa | Trocar por "modelo local alcançável" e remover a linha de autorização |
| 4 | P1, "Requisitos" e "Riscos" | "Estação com acesso ao endpoint sancionado"; "avaliação cega e dupla" | D-37; D-38 (só Rafa avalia, contra o gabarito) | Alinhar a D-38 |
| 5 | Arquitetura de referência (abertura e tabela "Onde roda") | Executor de código "é condicional (ver D-18)" | D-18 foi substituída; P5 é obrigatória (D-28, D-37) | Citar D-28 e marcar só P6 e E4 como condicionais |
| 6 | "Ordem recomendada" em "Duas trilhas" | "P0 e P1 primeiro. P2 e P3 podem correr em paralelo" | P0 depende de P2; a legenda do roteiro diz P2, P0, P1, P3, P5 | Manter só a ordem da legenda |
| 7 | G-PoC | "A PoC passa quando as quatro condições valem"; a tabela não lista G-P5 | O parágrafo seguinte e D-37 exigem G-P5 | Acrescentar a linha "G-P5 aprovado" |
| 8 | Caminho mínimo | Princípios: P0 → P1 → P3 → P5. Tabela "Caminho mínimo e etapas condicionais": P0, P1, P3 | Entre si | Incluir P5 na tabela |
| 9 | Q-09 e P6 | Q-09 "Bloqueia P5, E4"; P6 "Condicional (Q-09, Q-02)" | P5 não espera Q-09 (D-28); P6 depende de Q-08 e de G-P5 | Q-09 bloqueia só E4; P6 condicional a G-P5 e Q-08 |
| 10 | Abertura de "Perguntas em aberto" | "Sem essas três (Q-03, Q-04, Q-14), P0 e P1 não rodam" | D-37: as três estão respondidas e P0/P1 rodam no laboratório | Reescrever o parágrafo |
| 11 | Exceção do G-PoC e R-19, R-27 | Tratam "P1 não rodar por falta de histórico ou autorização" como cenário vivo | D-37 | Marcar como válidos só para uma futura rodada com alertas reais |
| 12 | Tabela de custo | Linha do trial GitLab Ultimate em P6 | Variante GitLab fora do escopo desde a v1.5 (Q-02) | Remover a linha |
| 13 | P5 "Saída" e tabela de condicionais | "E4 recebe o vuln fixer como primeira classe"; mas, se P6 não abrir, "E4 não abre" e E4 depende de G-P6 | Entre si: o harness de P5 não poderia ir a E4 sem o executor nativo | Decidir se E4 aceita o harness de P5 como executor |
| 14 | `CLAUDE.md` do handoff | "export da versão 1.7" | O plano enviado é a v1.8 | Corrigido neste repositório |

## Lacunas (o plano não decide)

- **Em que repositório ficam os entregáveis de P0 e P1** (`replay/run_replay.py`, `prompts/triage.v1.md`, `eval/blind-review.csv`, `docs/replay-report.md`, `docs/kill-criteria.md`, `docs/allowed-fields.md`, `runbooks/`). A tabela de repositórios sugere `triage-eval`, mas o prompt versionado poderia ficar em `triage-contract`.
- **Fonte Application Insights no replay.** P0 pede alertas "de Grafana e Application Insights"; o laboratório só tem Grafana (D-35). O adapter do Azure seria testado só com payload sintético.
- **Linguagem do `intake-adapter`** e dos passos sem modelo: não há decisão.
- **Formato dos arquivos do contrato.** D-10, D-11, P1, P3 e a tabela de repositórios citam `schemas/alert-event.json` e `schemas/recommendation.schema.json`. Desde 15/11/2026 o `triage-contract` guarda os mesmos JSON Schema em YAML (`schemas/alert-event.yaml`, `schemas/recommendation.yaml`). O arquivo que os passos emitem em runtime continua `recommendation.json`.
- **gRPC entre serviços próprios.** O plano descreve a submissão ao Argo pelo endpoint HTTP `/api/v1/events/{namespace}/{discriminator}`. A preferência nova é a API gRPC do Argo Server; falta confirmar em P3 que o serviço de eventos por gRPC se comporta igual na versão pinada.
- **Quem cria o GitHub App** do passo de publicação (D-31) e onde fica a chave: sessões cloud não criam apps nem segredos.
- **Licença dos repositórios.** O script de bootstrap do handoff previa Apache-2.0, mas os repositórios foram criados vazios, sem licença.
- **Visibilidade dos repositórios** (privados ou públicos): muda o custo de minutos do Actions e o secret scanning.
