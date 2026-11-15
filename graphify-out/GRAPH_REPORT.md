# Graph Report - user  (2026-11-15)

## Corpus Check
- Corpus is ~39,163 words - fits in a single context window. You may not need a graph.

## Summary
- 854 nodes · 1968 edges · 47 communities (34 shown, 13 thin omitted)
- Extraction: 94% EXTRACTED · 6% INFERRED · 0% AMBIGUOUS · INFERRED: 110 edges (avg confidence: 0.82)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Contrato, dados D0-D3 e escrita só via PR
- Dependências vulneráveis e bumps
- Chaos: injeção de falhas (Java)
- CI lab-infra
- Testes de schema (pytest)
- Contradições: G-P0, Q-03, D-37
- Testes CommonsCompress e asserts
- P3: intake adapter e riscos
- READMEs dos repositórios
- Contradições: executor P6/E4
- CI triage-contract
- Falhas: latência, erro, OOM
- Fase 2 E2-E5: escada e riscos
- Guava, Jackson e cache
- CI demo-service (build)
- Chaos.java e History
- CLAUDE.md e regras inegociáveis
- Downstream e HttpClient
- JWT e teste de integração
- Routes e Health
- Endpoints do demo-service
- Metrics e protobuf
- Template de PR e CI .github
- Workflow reutilizável de lint
- Testes Guava e cache
- App.java: servidor
- Issue form tarefa
- Governança E0 e independência
- CI agent-step-images
- CI agent-workflows
- StubServer de testes
- CI intake-adapter
- CI open-eda-labs.github.io
- CI triage-eval
- Proposta de deps e ADR-0002
- ADR-0001 e progresso
- Config e commons-configuration
- Testes Beanutils e IO
- Replay e injeção de falhas
- Okio, protobuf e métricas
- Gatilhos de CI
- Job lint
- run-scenarios.sh
- Artefato Maven demo-service

## God Nodes (most connected - your core abstractions)
1. `P5 Vuln fixer Maven, PR-only` - 56 edges
2. `demo-service` - 51 edges
3. `triage-contract` - 42 edges
4. `P3 Intake e Workflow de 4 passos` - 33 edges
5. `Proposta de dependências vulneráveis do demo-service (verificada 2026-11-14 no OSV; aprovada por Rafa)` - 32 edges
6. `P2 Laboratório base no notebook` - 31 edges
7. `Scenario` - 29 edges
8. `P1 Replay offline` - 27 edges
9. `P0 Preparação e baseline` - 26 edges
10. `Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas)` - 25 edges

## Surprising Connections (you probably didn't know these)
- `YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML)` --applies_to--> `triage-contract`  [INFERRED]
  open-eda-labs.github.io/docs/adr/0001-convencao-yaml-grpc.md → triage-contract/README.md
- `lab/footprint.md` --lives_in--> `lab-infra`  [INFERRED]
  open-eda-labs.github.io/docs/PLANO_MESTRE.md → lab-infra/README.md
- `Regra do AGENTS.md: Mudança incompatível em schema exige major (D-01)` --references--> `D-01: Cobrar independência do contrato entre as peças, não do produto que executa`  [EXTRACTED]
  triage-contract/AGENTS.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `Checklist de PR: Versões pinadas (D-40)` --references--> `D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando`  [EXTRACTED]
  .github/.github/PULL_REQUEST_TEMPLATE.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `Checklist de PR: Nenhuma classe D2 ou D3 em exemplos, fixtures ou logs (D-42)` --references--> `D-42: Quatro classes de dado D0 a D3; D3 nunca sai; vale também para traces e MLflow`  [EXTRACTED]
  .github/.github/PULL_REQUEST_TEMPLATE.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Classes de dado D0 a D3 (D-42)** — dataclass_d0, dataclass_d1, dataclass_d2, dataclass_d3 [EXTRACTED 1.00]
- **Workflow de triagem de quatro passos** — open_eda_labs_github_io_docs_plano_mestre_workflow_passo_1, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_2, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_3, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_4 [EXTRACTED 1.00]
- **Caminho mínimo da PoC: P0, P1, P3, P5 (todo no laboratório)** — open_eda_labs_github_io_docs_plano_mestre_p0, open_eda_labs_github_io_docs_plano_mestre_p1, open_eda_labs_github_io_docs_plano_mestre_p3, open_eda_labs_github_io_docs_plano_mestre_p5 [EXTRACTED 1.00]
- **Escada de autonomia (D-25): Shadow E2, Recomendar E3, Aprovar E4, Auto-executar E5** — open_eda_labs_github_io_docs_plano_mestre_e2, open_eda_labs_github_io_docs_plano_mestre_e3, open_eda_labs_github_io_docs_plano_mestre_e4, open_eda_labs_github_io_docs_plano_mestre_e5 [EXTRACTED 1.00]

## Communities (47 total, 13 thin omitted)

### Community 0 - "Contrato, dados D0-D3 e escrita só via PR"
Cohesion: 0.05
Nodes (66): D0 operacional, D1 interno, D2 pessoal (LGPD), D3 proibido, Contenção do demo-service: escuta só 127.0.0.1; /chaos/* exige JWT HS256 (503 sem segredo); sem entrada HTTP crua em API vulnerável; NetworkPolicy de egress; container sem root, Regras da org (perfil): só dados sintéticos ou públicos; tudo como código; PR com agente sem merge; classes D0-D3; convenção antes de configuração, passo de publicação sem modelo, schemas/alert-event.json (+58 more)

### Community 1 - "Dependências vulneráveis e bumps"
Cohesion: 0.08
Nodes (65): Aviso: dependências vulneráveis de propósito; não corrigir fora do pipeline do vuln fixer; ignorar Dependabot e alertas do GitHub, Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas), Dependência #1: log4j-core (+ log4j-api) 2.14.1 (CVE-2021-44228), Dependência #2: commons-text 1.9 (CVE-2022-42889), Dependência #3: guava 31.1-jre (CVE-2023-2976), Dependência #4: commons-io 2.6 (CVE-2021-29425), Dependência #5: httpclient 4.5.12 (CVE-2020-13956), Dependência #6: nimbus-jose-jwt 9.31 (CVE-2023-52428) (+57 more)

### Community 2 - "Chaos: injeção de falhas (Java)"
Cohesion: 0.07
Nodes (5): ErrorFault, LatencyFault, OomFault, Scenario, CommonsTextTest

### Community 3 - "CI lab-infra"
Cohesion: 0.07
Nodes (41): jobs, lint, uses, name, on, pull_request, push, permissions (+33 more)

### Community 4 - "Testes de schema (pytest)"
Cohesion: 0.11
Nodes (17): cases(), load(), replaced(), string_leaves(), test_event_reference_matches_alert_event(), test_every_event_type_closes_data_with_ref(), test_every_invalid_example_has_a_rule(), test_invalid_example_fails_for_the_expected_reason() (+9 more)

### Community 5 - "Contradições: G-P0, Q-03, D-37"
Cohesion: 0.13
Nodes (32): Contradição 1: P0 "Roda na empresa, sem infraestrutura nova" e "conjunto guardado em repositório interno", Contradição 2: Tabelas de etapas põem P0 e P1 na trilha Empresa, dependendo de Q-03, Q-04, Q-14, Contradição 3: G-P0 exige endpoint sancionado e autorização escrita: nunca passa, Contradição 4: P1 pede endpoint sancionado e avaliação cega e dupla; D-38 diz só Rafa, Contradição 7: G-PoC lista quatro condições sem G-P5, que D-37 exige, Contradição 10: Abertura de Perguntas diz que sem Q-03, Q-04, Q-14 P0 e P1 não rodam, Contradição 11: Exceção do G-PoC e R-19, R-27 tratam P1 não rodar como cenário vivo, docs/alert-inventory.md (+24 more)

### Community 6 - "Testes CommonsCompress e asserts"
Cohesion: 0.13
Nodes (6): Outcome, CommonsCompressTest, H2Test, SnakeYamlTest, CommonsConfiguration2Test, JacksonDatabindTest

### Community 7 - "P3: intake adapter e riscos"
Cohesion: 0.14
Nodes (25): gRPC entre serviços próprios; HTTP+JSON só nas bordas externas, Contradição 6: "P0 e P1 primeiro; P2 e P3 em paralelo" contra P0 depender de P2, Contradição 8: Caminho mínimo: princípios P0, P1, P3, P5; tabela sem P5, audit/, docs/allowed-fields.md, intake-adapter/, tests/burst/, tests/injection-pt/ (+17 more)

### Community 8 - "READMEs dos repositórios"
Cohesion: 0.17
Nodes (13): Contradição 14: CLAUDE.md do handoff dizia "export da versão 1.7"; o plano é v1.8, Lacuna: Em que repositório ficam os entregáveis de P0 e P1, Lacuna: Linguagem do intake-adapter e dos passos sem modelo, Lacuna: Formato dos arquivos do contrato (JSON no plano, YAML desde 15/11/2026), Lacuna: gRPC entre serviços próprios (Argo Server gRPC a confirmar em P3), Lacuna: Quem cria o GitHub App do passo de publicação (D-31) e onde fica a chave, Lacuna: Licença dos repositórios (criados vazios, sem licença), Lacuna: Visibilidade dos repositórios (privados ou públicos) (+5 more)

### Community 9 - "Contradições: executor P6/E4"
Cohesion: 0.17
Nodes (21): Contradição 5: Arquitetura de referência diz executor condicional (D-18), mas D-18 foi substituída, Contradição 9: Q-09 "Bloqueia P5, E4" e P6 "Condicional (Q-09, Q-02)" contra D-28, Contradição 12: Tabela de custo com trial GitLab Ultimate, variante fora do escopo desde v1.5, Contradição 13: P5 diz E4 recebe vuln fixer, mas E4 depende de G-P6, docs/executor-comparison.md, drivers/gh-aw/, D-18: Fase 1 enxuta: caminho mínimo P0 → P1 → P3; P4 a P6 condicionais; LoRA só braço opcional de P4, D-19: Executor de CI nativo é escolhido pelo SCM da empresa (+13 more)

### Community 10 - "CI triage-contract"
Cohesion: 0.10
Nodes (20): jobs, lint, schemas, uses, name, on, pull_request, push (+12 more)

### Community 11 - "Falhas: latência, erro, OOM"
Cohesion: 0.15
Nodes (19): LatencyFault, ErrorFault, ErrorFault, OomFault, OomFault, kind, message, name (+11 more)

### Community 12 - "Fase 2 E2-E5: escada e riscos"
Cohesion: 0.13
Nodes (20): D-06: Chamada direta estruturada antes de harness, com coleta determinística de evidência, D-07: AI Gateway: manter o princípio; na empresa começar com base_url configurável; no laboratório LiteLLM + Postgres opcional, D-09: Contrato de modelo: Chat Completions stateless, tools em JSON Schema, nomes lógicos, sem depender de tool_choice, D-25: Escada de autonomia: Shadow, Recomendar, Aprovar, Auto-executar baixo risco, E2 Shadow em produção, E3 Recomendação ao plantão com feedback, E5 Escala e auto-execução de baixo risco, Escada de autonomia (Shadow, Recomendar, Aprovar, Auto-executar baixo risco) (+12 more)

### Community 14 - "CI demo-service (build)"
Cohesion: 0.11
Nodes (19): permissions, runs-on, steps, timeout-minutes, jobs, build, lint, uses (+11 more)

### Community 16 - "CLAUDE.md e regras inegociáveis"
Cohesion: 0.18
Nodes (9): ADR-0003: Repositório central, página do projeto e memória em grafo, Pendente: pacote e versão do Graphify, diretório do grafo, quem o atualiza (sessão de agente ou CI), Convenção de ADR: NNNN-titulo-curto.md, seções Estado, Contexto, Decisão, Consequências; decisão substituída muda Estado, Próximo passo 1: Rafa: fazer merge dos PRs do open-eda-labs.github.io e do triage-contract, Próximo passo 2: Rafa: dizer qual pacote e versão do Graphify self-hosted usar, para gerar o primeiro grafo (ADR-0003), open-eda-labs.github.io, Astryx (@astryxdesign/core), Página do projeto no GitHub Pages (+1 more)

### Community 17 - "Downstream e HttpClient"
Cohesion: 0.16
Nodes (3): Downstream, HttpClientTest, SpringWebTest

### Community 18 - "JWT e teste de integração"
Cohesion: 0.24
Nodes (3): Jwt, AppIntegrationTest, NimbusJoseJwtTest

### Community 19 - "Routes e Health"
Cohesion: 0.24
Nodes (4): Health, Routes, CommonsLang3Test, OrgJsonTest

### Community 20 - "Endpoints do demo-service"
Cohesion: 0.15
Nodes (5): Endpoint GET /chaos/scenarios, Endpoint GET /health, Endpoint GET /metrics, Endpoint GET /work, Endpoint POST /chaos/scenario

### Community 22 - "Template de PR e CI .github"
Cohesion: 0.18
Nodes (12): Checklist de PR: Nenhum dado ou nome de empresa, nenhum segredo, Checklist de PR: Versões pinadas (D-40), Checklist de PR: PROGRESS.md atualizado, se aplicável, Checklist de PR: Nenhuma classe D2 ou D3 em exemplos, fixtures ou logs (D-42), name, permissions, contents, Convenções herdadas por todos os repositórios: issue form (tarefa), template de PR; CODEOWNERS e .editorconfig não são herdados (+4 more)

### Community 23 - "Workflow reutilizável de lint"
Cohesion: 0.13
Nodes (14): jobs, yamllint, name, on, workflow_call, permissions, contents, run (+6 more)

### Community 25 - "Testes Guava e cache"
Cohesion: 0.14
Nodes (3): GuavaTest, Ticker, XStreamTest

### Community 27 - "Issue form tarefa"
Cohesion: 0.15
Nodes (12): description, label, placeholder, body, attributes, id, type, validations (+4 more)

### Community 28 - "Governança E0 e independência"
Cohesion: 0.20
Nodes (12): ADR unificado de E0, kill-criteria.md da Fase 2, D-01: Cobrar independência do contrato entre as peças, não do produto que executa, D-05: Argo Workflows é a camada neutra de triagem, D-33: Publicação em schema próprio e neutro; adapter Slack agora, adapter Teams (Power Automate) depois, E0 Aprovação e governança, G-E0, Q-01: A empresa já opera Argo Workflows em produção, com SSO, dono e janela de patch? (+4 more)

### Community 29 - "CI agent-step-images"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 30 - "CI agent-workflows"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 33 - "CI intake-adapter"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 34 - "CI open-eda-labs.github.io"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 35 - "CI triage-eval"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 36 - "Proposta de deps e ADR-0002"
Cohesion: 0.39
Nodes (6): Perguntas para o Rafa na proposta (8): major bump N2 ou N3; critério do re-scan; família = 1 PR; caso artificial de groupId em property; Jetty como servidor; JDK 21 ou 25; quantas falhas no gate; ordem e base, N3: sem versão corrigida na mesma linha (backport); fora de P5, ADR-0002: Base do demo-service e regras da medição de P5, Em aberto: o re-scan do PR zera só o advisory alvo ou todos os do pacote? (decidir antes de P5 N1), Próximo passo 3: Rafa: decidir o critério do re-scan do vuln fixer (ADR-0002) antes do P5 N1, Registro 2026-11-15: lista de dependências do demo-service aprovada (JDK 21; sem Spring Boot; Jetty 9; major bump conta como N2; mesma família no mesmo PR; 8 casos que quebram; mesmo commit base)

### Community 37 - "ADR-0001 e progresso"
Cohesion: 0.31
Nodes (7): ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios, D-45 (a registrar no doc vivo): convenção antes de configuração, YAML, gRPC entre serviços próprios, YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML), Registro 2026-11-14: kickoff em sub-sessões (esqueleto dos 8 repositórios, padrões da org, contrato 0.1.0, proposta de dependências, leitura crítica do plano), Registro 2026-11-14: org open-eda-labs e repositórios criados vazios; Plano Mestre v1.7 (D-01 a D-44), Registro 2026-11-15: 7 PRs do kickoff em main; demo-service com app, 33 testes e matriz real de bumps (12 verdes, 8 falhas); ADRs 0001 a 0003, Registro 2026-11-15: revisão de enxugamento dos 9 PRs (lint no workflow reutilizável do .github; schemas e exemplos em YAML; D-45 a registrar)

### Community 40 - "Replay e injeção de falhas"
Cohesion: 0.38
Nodes (7): Cenários de falha (latência, erro, OOM simulado com teto de 16 MB) em scenarios.yaml e chaos/run-scenarios.sh, demo-service como alvo da injeção de falhas do replay (cenários em chaos/), Lacuna: Fonte Application Insights no replay (laboratório só tem Grafana, D-35), D-35: Alertas do replay gerados por injeção de falhas scriptada no demo-service (latência, erro, OOM), com seed fixa, Grafana OSS de laboratório, InfluxDB OSS, io.github.open-eda-labs.alert.firing

### Community 43 - "Gatilhos de CI"
Cohesion: 0.50
Nodes (4): on, pull_request, push, branches

### Community 44 - "Job lint"
Cohesion: 0.67
Nodes (3): jobs, lint, uses

## Knowledge Gaps
- **42 isolated node(s):** `labs.demo:demo-service`, `G-P2`, `G-P4`, `G-E0`, `G-E1` (+37 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 224 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **13 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `demo-service` connect `Dependências vulneráveis e bumps` to `Contrato, dados D0-D3 e escrita só via PR`, `Proposta de deps e ADR-0002`, `ADR-0001 e progresso`, `Contradições: G-P0, Q-03, D-37`, `Replay e injeção de falhas`, `READMEs dos repositórios`, `CLAUDE.md e regras inegociáveis`, `Endpoints do demo-service`, `Template de PR e CI .github`, `Governança E0 e independência`?**
  _High betweenness centrality (0.277) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `P5 Vuln fixer Maven, PR-only` (e.g. with `Dependência #13: snakeyaml 1.33 (CVE-2022-1471)` and `Dependência #14: h2 1.4.200 (CVE-2021-42392)`) actually correct?**
  _`P5 Vuln fixer Maven, PR-only` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `labs.demo:demo-service`, `G-P2`, `G-P4` to the rest of the system?**
  _42 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Contrato, dados D0-D3 e escrita só via PR` be split into smaller, more focused modules?**
  _Cohesion score 0.05280437756497948 - nodes in this community are weakly interconnected._
- **Why does `P5 Vuln fixer Maven, PR-only` connect `Dependências vulneráveis e bumps` to `Contrato, dados D0-D3 e escrita só via PR`, `CI lab-infra`, `Proposta de deps e ADR-0002`, `P3: intake adapter e riscos`, `READMEs dos repositórios`, `Contradições: executor P6/E4`?**
  _High betweenness centrality (0.153) - this node is a cross-community bridge._
- **Should `Dependências vulneráveis e bumps` be split into smaller, more focused modules?**
  _Cohesion score 0.08296751536435469 - nodes in this community are weakly interconnected._
- **Why does `Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA)` connect `Template de PR e CI .github` to `Contrato, dados D0-D3 e escrita só via PR`, `Dependências vulneráveis e bumps`, `CI intake-adapter`, `CI lab-infra`, `CI open-eda-labs.github.io`, `CI triage-eval`, `CI triage-contract`, `Workflow reutilizável de lint`, `CI agent-step-images`, `CI agent-workflows`?**
  _High betweenness centrality (0.072) - this node is a cross-community bridge._