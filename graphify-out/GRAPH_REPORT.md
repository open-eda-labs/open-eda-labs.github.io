# Graph Report - user  (2026-11-17)

## Corpus Check
- 115 files · ~63,193 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 34 file(s) not represented in the graph (top: (none) 31, .properties 2, .xml 1)
- WARNING: 34 of 154 files seen (22%) have no supported extractor and are missing from this graph entirely. It may look complete while representing only part of the codebase.

## Summary
- 1548 nodes · 2942 edges · 102 communities (92 shown, 10 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 120 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- triage-contract/README.md
- P5 Vuln fixer Maven, PR-only
- Scenario
- P2 Laboratório base no notebook
- test_schemas.py
- P0 Preparação e baseline
- org.junit.jupiter.api.Test
- E1 Plataforma mínima em ambiente não produtivo
- PLANO_MESTRE.md
- P6 Executor CI nativo atrás do contrato
- triage-contract/.github/workflows/ci.yml
- fix.py
- with
- test_fix.py
- demo-service/.github/workflows/ci.yml
- Chaos
- Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA)
- Downstream
- with
- Routes.java
- lab-infra/.github/workflows/ci.yml
- with
- containers
- lint.yml
- AppIntegrationTest.java
- Metrics.java
- RoleBinding vuln-fixer-executor
- body
- E0 Aprovação e governança
- agent-step-images/.github/workflows/ci.yml
- agent-workflows/.github/workflows/ci.yml
- P3 Intake e Workflow de 4 passos
- intake-adapter/.github/workflows/ci.yml
- test_scan.py
- triage-eval/.github/workflows/ci.yml
- build
- D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela
- AGENTS.md do triage-contract (instruções para qualquer harness de agente, fonte única D-15)
- LatencyFault
- PROGRESS.md
- publish.py
- Namespace argo
- containers
- parameters
- run-scenarios.sh
- labs.demo:demo-lib
- workflowSpec
- containers
- Service influxdb
- Service mlflow
- spec
- container
- test_publish_notify.py
- P1 Replay offline
- PersistentVolumeClaim influxdb
- images
- Service grafana
- spec
- PersistentVolumeClaim grafana
- spec
- spec
- PersistentVolumeClaim mlflow
- spec
- selector
- securityContext
- spec
- securityContext
- securityContext
- Medição do vuln fixer (ADR-0005): última release, parent, lib e service
- securityContext
- networkpolicy.yaml
- ConfigMap grafana-datasources
- ADR-0004: Modelo padrão do laboratório
- vuln-fix.yaml
- templates
- securityContext
- open-eda-labs.github.io/.github/workflows/ci.yml
- open-eda-labs.github.io
- D-42: Quatro classes de dado D0 a D3; D3 nunca sai; vale também para traces e MLflow
- footprint.sh
- metadata
- metadata
- volumes
- check-model.sh
- wslconfig.md
- demo-lib
- demo-parent
- ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib)
- D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando
- .github/.github/workflows/ci.yml
- StubServer.java
- container
- spec
- labs.demo:demo-parent
- WorkflowEventBinding + WorkflowTemplate alert-triage
- spec
- securityContext
- templates
- .cacheExpiraDepoisDeUmMinuto
- spec
- backoff

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
- `Regra de ouro (ADR-0005)` --references--> `App`  [INFERRED]
  demo-lib/README.md → demo-service/src/main/java/labs/demo/App.java
- `schemas/alert-event.yaml (envelope CloudEvents 1.0 com traceparent e dataref)` --realizes--> `schemas/alert-event.json`  [INFERRED]
  triage-contract/README.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML)` --applies_to--> `triage-contract`  [INFERRED]
  open-eda-labs.github.io/docs/adr/0001-convencao-yaml-grpc.md → triage-contract/README.md
- `demo-lib` --references--> `Downstream`  [INFERRED]
  demo-lib/README.md → demo-lib/src/main/java/labs/demo/lib/Downstream.java
- `demo-lib` --references--> `Jwt`  [INFERRED]
  demo-lib/README.md → demo-lib/src/main/java/labs/demo/lib/Jwt.java

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Escada de autonomia (D-25): Shadow E2, Recomendar E3, Aprovar E4, Auto-executar E5** — open_eda_labs_github_io_docs_plano_mestre_e2, open_eda_labs_github_io_docs_plano_mestre_e3, open_eda_labs_github_io_docs_plano_mestre_e4, open_eda_labs_github_io_docs_plano_mestre_e5 [EXTRACTED 1.00]
- **Classes de dado D0 a D3 (D-42)** — dataclass_d0, dataclass_d1, dataclass_d2, dataclass_d3 [EXTRACTED 1.00]
- **Caminho mínimo da PoC: P0, P1, P3, P5 (todo no laboratório)** — open_eda_labs_github_io_docs_plano_mestre_p0, open_eda_labs_github_io_docs_plano_mestre_p1, open_eda_labs_github_io_docs_plano_mestre_p3, open_eda_labs_github_io_docs_plano_mestre_p5 [EXTRACTED 1.00]
- **Workflow de triagem de quatro passos** — open_eda_labs_github_io_docs_plano_mestre_workflow_passo_1, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_2, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_3, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_4 [EXTRACTED 1.00]

## Communities (102 total, 10 thin omitted)

### Community 0 - "triage-contract/README.md"
Cohesion: 0.17
Nodes (21): schemas/recommendation.schema.json, D-09: Contrato de modelo: Chat Completions stateless, tools em JSON Schema, nomes lógicos, sem depender de tool_choice, D-10: Evento: envelope CloudEvents com data próprio; duplicata definida por source + id, D-11: Saída: recommendation.json validado por schema e publicado por passo sem modelo, G-P1, CloudEvents 1.0 (envelope), Campo/regra do contrato: dataref fora do evento (s3, https), Campo/regra do contrato: envelope CloudEvents (+13 more)

### Community 1 - "P5 Vuln fixer Maven, PR-only"
Cohesion: 0.08
Nodes (66): Aviso: dependências vulneráveis de propósito; não corrigir fora do pipeline do vuln fixer; ignorar Dependabot e alertas do GitHub, Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas), Dependência #1: log4j-core (+ log4j-api) 2.14.1 (CVE-2021-44228), Dependência #2: commons-text 1.9 (CVE-2022-42889), Dependência #3: guava 31.1-jre (CVE-2023-2976), Dependência #4: commons-io 2.6 (CVE-2021-29425), Dependência #5: httpclient 4.5.12 (CVE-2020-13956), Dependência #6: nimbus-jose-jwt 9.31 (CVE-2023-52428) (+58 more)

### Community 2 - "Scenario"
Cohesion: 0.07
Nodes (5): ErrorFault, LatencyFault, OomFault, Scenario, CommonsTextTest

### Community 3 - "P2 Laboratório base no notebook"
Cohesion: 0.10
Nodes (32): eval/toolcalling/cases/, eval/toolcalling/report.md, eval/toolcalling/run.py, eval/toolcalling/tools/, lab/argo/values.yaml, lab/footprint.md, lab/k3s/, lab/tailscale.md (+24 more)

### Community 4 - "test_schemas.py"
Cohesion: 0.13
Nodes (16): load(), replaced(), string_leaves(), test_event_reference_matches_alert_event(), test_every_event_type_closes_data_with_ref(), test_every_invalid_example_has_a_rule(), test_invalid_example_fails_for_the_expected_reason(), test_minimum_number_of_examples() (+8 more)

### Community 5 - "P0 Preparação e baseline"
Cohesion: 0.18
Nodes (19): Contradição 3: G-P0 exige endpoint sancionado e autorização escrita: nunca passa, Contradição 7: G-PoC lista quatro condições sem G-P5, que D-37 exige, Contradição 10: Abertura de Perguntas diz que sem Q-03, Q-04, Q-14 P0 e P1 não rodam, Contradição 11: Exceção do G-PoC e R-19, R-27 tratam P1 não rodar como cenário vivo, docs/alert-inventory.md, docs/baseline-mtti.md, docs/kill-criteria.md, docs/poc-gate.md (+11 more)

### Community 6 - "org.junit.jupiter.api.Test"
Cohesion: 0.07
Nodes (11): Resultado por pacote, Outcome, CommonsBeanutilsTest, CommonsCompressTest, CommonsIoTest, CommonsLang3Test, H2Test, XStreamTest (+3 more)

### Community 7 - "E1 Plataforma mínima em ambiente não produtivo"
Cohesion: 0.15
Nodes (17): D-06: Chamada direta estruturada antes de harness, com coleta determinística de evidência, D-25: Escada de autonomia: Shadow, Recomendar, Aprovar, Auto-executar baixo risco, E2 Shadow em produção, E3 Recomendação ao plantão com feedback, E5 Escala e auto-execução de baixo risco, Escada de autonomia (Shadow, Recomendar, Aprovar, Auto-executar baixo risco), G-E2, G-E3 (+9 more)

### Community 8 - "PLANO_MESTRE.md"
Cohesion: 0.16
Nodes (20): Contradição 1: P0 "Roda na empresa, sem infraestrutura nova" e "conjunto guardado em repositório interno", Contradição 4: P1 pede endpoint sancionado e avaliação cega e dupla; D-38 diz só Rafa, Contradição 6: "P0 e P1 primeiro; P2 e P3 em paralelo" contra P0 depender de P2, Contradição 8: Caminho mínimo: princípios P0, P1, P3, P5; tabela sem P5, Contradição 12: Tabela de custo com trial GitLab Ultimate, variante fora do escopo desde v1.5, Contradição 14: CLAUDE.md do handoff dizia "export da versão 1.7"; o plano é v1.8, Lacuna: Fonte Application Insights no replay (laboratório só tem Grafana, D-35), Lacuna: Linguagem do intake-adapter e dos passos sem modelo (+12 more)

### Community 9 - "P6 Executor CI nativo atrás do contrato"
Cohesion: 0.16
Nodes (24): Contradição 5: Arquitetura de referência diz executor condicional (D-18), mas D-18 foi substituída, Contradição 9: Q-09 "Bloqueia P5, E4" e P6 "Condicional (Q-09, Q-02)" contra D-28, Contradição 13: P5 diz E4 recebe vuln fixer, mas E4 depende de G-P6, docs/executor-comparison.md, drivers/gh-aw/, D-08: Três caminhos de consumo de IA: IDE ao gateway, chamada direta, harness headless PR-only, D-18: Fase 1 enxuta: caminho mínimo P0 → P1 → P3; P4 a P6 condicionais; LoRA só braço opcional de P4, D-19: Executor de CI nativo é escolhido pelo SCM da empresa (+16 more)

### Community 10 - "triage-contract/.github/workflows/ci.yml"
Cohesion: 0.10
Nodes (20): jobs, lint, schemas, uses, name, on, pull_request, push (+12 more)

### Community 11 - "fix.py"
Cohesion: 0.11
Nodes (21): ref(), apply(), count(), culprit(), edit_parent(), fail(), main(), mvn() (+13 more)

### Community 12 - "with"
Cohesion: 0.06
Nodes (32): permissions, runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, build (+24 more)

### Community 13 - "test_fix.py"
Cohesion: 0.12
Nodes (24): ev(), fake_trial(), mk(), trial(), git_repo(), hook(), run_main(), sh() (+16 more)

### Community 14 - "demo-service/.github/workflows/ci.yml"
Cohesion: 0.08
Nodes (26): permissions, runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, build (+18 more)

### Community 16 - "Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA)"
Cohesion: 0.27
Nodes (8): Checklist de PR: Nenhum dado ou nome de empresa, nenhum segredo, Checklist de PR: Versões pinadas (D-40), Checklist de PR: PROGRESS.md atualizado, se aplicável, Checklist de PR: Nenhuma classe D2 ou D3 em exemplos, fixtures ou logs (D-42), Convenções herdadas por todos os repositórios: issue form (tarefa), template de PR; CODEOWNERS e .editorconfig não são herdados, Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA), Convenção antes de configuração (lint no workflow reutilizável do .github), .github

### Community 17 - "Downstream"
Cohesion: 0.16
Nodes (3): Downstream, HttpClientTest, SpringWebTest

### Community 18 - "with"
Cohesion: 0.08
Nodes (25): runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, deploy, name (+17 more)

### Community 19 - "Routes.java"
Cohesion: 0.09
Nodes (10): Scenarios, JsonSmartTest, SnakeYamlTest, Endpoint GET /chaos/scenarios, Endpoint GET /health, Endpoint GET /metrics, Endpoint GET /work, Endpoint POST /chaos/scenario (+2 more)

### Community 20 - "lab-infra/.github/workflows/ci.yml"
Cohesion: 0.11
Nodes (18): jobs, lint, schema, uses, name, on, pull_request, push (+10 more)

### Community 21 - "with"
Cohesion: 0.08
Nodes (25): runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, deploy, name (+17 more)

### Community 22 - "containers"
Cohesion: 0.13
Nodes (15): env, image, livenessProbe, name, ports, readinessProbe, resources, securityContext (+7 more)

### Community 23 - "lint.yml"
Cohesion: 0.13
Nodes (14): jobs, yamllint, name, on, workflow_call, permissions, contents, run (+6 more)

### Community 24 - "AppIntegrationTest.java"
Cohesion: 0.06
Nodes (5): Jwt, NimbusJoseJwtTest, App, AppIntegrationTest, Log4jCoreTest

### Community 26 - "RoleBinding vuln-fixer-executor"
Cohesion: 0.07
Nodes (31): kubernetes.io/service-account.name, ServiceAccount vuln-fixer-executor, Secret vuln-fixer-executor.service-account-token, Role vuln-fixer-executor, RoleBinding vuln-fixer-executor, annotations, name, apiVersion (+23 more)

### Community 27 - "body"
Cohesion: 0.15
Nodes (12): description, label, placeholder, body, attributes, id, type, validations (+4 more)

### Community 28 - "E0 Aprovação e governança"
Cohesion: 0.28
Nodes (9): ADR unificado de E0, kill-criteria.md da Fase 2, D-05: Argo Workflows é a camada neutra de triagem, E0 Aprovação e governança, G-E0, Q-01: A empresa já opera Argo Workflows em produção, com SSO, dono e janela de patch?, Q-13: Quem são os donos de intake, Workflow, prompt e conjunto de avaliação?, R-17: Sistema sem dono e sem plantão próprio (+1 more)

### Community 29 - "agent-step-images/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 30 - "agent-workflows/.github/workflows/ci.yml"
Cohesion: 0.09
Nodes (24): runs-on, steps, timeout-minutes, jobs, image, lint, test, uses (+16 more)

### Community 31 - "P3 Intake e Workflow de 4 passos"
Cohesion: 0.18
Nodes (20): gRPC entre serviços próprios; HTTP+JSON só nas bordas externas, audit/, intake-adapter/, schemas/alert-event.json, tests/burst/, tests/injection-pt/, D-04: Intake adapter próprio na frente do Argo; nunca expor o Argo Server, D-21: Limitar tempestade e custo no adapter: semáforo, teto diário, disjuntor, kill switch (+12 more)

### Community 33 - "intake-adapter/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 34 - "test_scan.py"
Cohesion: 0.11
Nodes (20): check_trace(), n2_versions(), recommendation(), validate(), events(), test_check_trace_one_trace_per_round(), test_failed(), test_no_change() (+12 more)

### Community 35 - "triage-eval/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 36 - "build"
Cohesion: 0.09
Nodes (22): permissions, runs-on, steps, timeout-minutes, jobs, build, lint, uses (+14 more)

### Community 37 - "D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela"
Cohesion: 0.13
Nodes (15): Contenção do demo-service: escuta só 127.0.0.1; /chaos/* exige JWT HS256 (503 sem segredo); sem entrada HTTP crua em API vulnerável; NetworkPolicy de egress; container sem root, Regras da org (perfil): só dados sintéticos ou públicos; tudo como código; PR com agente sem merge; classes D0-D3; convenção antes de configuração, Lacuna: Em que repositório ficam os entregáveis de P0 e P1, imagem do harness em agent-step-images, D-01: Cobrar independência do contrato entre as peças, não do produto que executa, D-24: Separar projeto pessoal e proposta corporativa; dado da empresa não entra no laboratório, D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela, Q-15: A empresa autoriza por escrito o reuso de artefatos do laboratório? (+7 more)

### Community 38 - "AGENTS.md do triage-contract (instruções para qualquer harness de agente, fonte única D-15)"
Cohesion: 0.17
Nodes (11): D-13: Guardrails por arquitetura: schema rígido, lista de campos permitidos, escrita fora do agente, D-15: Instruções em AGENTS.md e skills em .agents/skills/, fonte única, R-01: Injeção de prompt por payload, log ou mensagem de exceção, R-02: Exfiltração por link ou imagem renderizada no canal de saída, AGENTS.md + .agents/skills/, AGENTS.md do triage-contract (instruções para qualquer harness de agente, fonte única D-15), triage-contract 0.1.0 (não lançada), Endurecimento após revisão independente: patterns $(?!\n), safeText barra //, tel:, domínio+caminho; sem @ e + em identifier; dataref só s3/https; failure_reason por kind (+3 more)

### Community 39 - "LatencyFault"
Cohesion: 0.15
Nodes (19): LatencyFault, ErrorFault, ErrorFault, OomFault, OomFault, kind, message, name (+11 more)

### Community 40 - "PROGRESS.md"
Cohesion: 0.24
Nodes (11): Perguntas para o Rafa na proposta (8): major bump N2 ou N3; critério do re-scan; família = 1 PR; caso artificial de groupId em property; Jetty como servidor; JDK 21 ou 25; quantas falhas no gate; ordem e base, N3: sem versão corrigida na mesma linha (backport); fora de P5, D-45 (a registrar no doc vivo): convenção antes de configuração, YAML, gRPC entre serviços próprios, ADR-0002: Base do demo-service e regras da medição de P5, Em aberto: o re-scan do PR zera só o advisory alvo ou todos os do pacote? (decidir antes de P5 N1), Próximo passo 1: Rafa: fazer merge dos PRs do open-eda-labs.github.io e do triage-contract, Próximo passo 3: Rafa: decidir o critério do re-scan do vuln fixer (ADR-0002) antes do P5 N1, Registro 2026-11-14: kickoff em sub-sessões (esqueleto dos 8 repositórios, padrões da org, contrato 0.1.0, proposta de dependências, leitura crítica do plano) (+3 more)

### Community 41 - "publish.py"
Cohesion: 0.15
Nodes (12): die(), post(), traceparent(), main(), message(), existing(), git(), open_pr() (+4 more)

### Community 42 - "Namespace argo"
Cohesion: 0.18
Nodes (11): Namespace argo, Namespace lab, pod-security.kubernetes.io/enforce, labels, name, apiVersion, kind, metadata (+3 more)

### Community 43 - "containers"
Cohesion: 0.18
Nodes (11): command, env, image, livenessProbe, name, ports, readinessProbe, resources (+3 more)

### Community 44 - "parameters"
Cohesion: 0.33
Nodes (6): parameters, parameters, name, value, arguments, inputs

### Community 47 - "workflowSpec"
Cohesion: 0.17
Nodes (12): parameters, serviceAccountName, name, value, workflowSpec, emptyDir, name, arguments (+4 more)

### Community 48 - "containers"
Cohesion: 0.20
Nodes (10): env, image, livenessProbe, name, ports, readinessProbe, resources, securityContext (+2 more)

### Community 49 - "Service influxdb"
Cohesion: 0.20
Nodes (10): Service influxdb, app, port, app, matchLabels, apiVersion, kind, spec (+2 more)

### Community 50 - "Service mlflow"
Cohesion: 0.20
Nodes (10): Service mlflow, app, port, app, matchLabels, apiVersion, kind, spec (+2 more)

### Community 51 - "spec"
Cohesion: 0.25
Nodes (8): serviceAccountName, spec, automountServiceAccountToken, entrypoint, executor, volumes, emptyDir, name

### Community 52 - "container"
Cohesion: 0.20
Nodes (10): command, env, image, volumeMounts, name, value, valueFrom, container (+2 more)

### Community 53 - "test_publish_notify.py"
Cohesion: 0.13
Nodes (22): check_patches(), main(), pr_body(), event_name(), test_contract_copy_matches_pinned_origin(), branch_of(), capture(), heads() (+14 more)

### Community 54 - "P1 Replay offline"
Cohesion: 0.22
Nodes (16): Cenários de falha (latência, erro, OOM simulado com teto de 16 MB) em scenarios.yaml e chaos/run-scenarios.sh, demo-service como alvo da injeção de falhas do replay (cenários em chaos/), Contradição 2: Tabelas de etapas põem P0 e P1 na trilha Empresa, dependendo de Q-03, Q-04, Q-14, docs/replay-report.md, eval/blind-review.csv, prompts/triage.v1.md, replay/run_replay.py, D-03: Começar por replay offline de 50 a 100 alertas com desfecho, sem infraestrutura nova (+8 more)

### Community 55 - "PersistentVolumeClaim influxdb"
Cohesion: 0.22
Nodes (8): PersistentVolumeClaim influxdb, apiVersion, kind, spec, storage, requests, accessModes, resources

### Community 56 - "images"
Cohesion: 0.22
Nodes (8): images, digest, name, newTag, replicas, count, name, resources

### Community 57 - "Service grafana"
Cohesion: 0.32
Nodes (8): metadata, Service grafana, name, namespace, metadata, apiVersion, kind, metadata

### Community 58 - "spec"
Cohesion: 0.25
Nodes (8): apiVersion, kind, metadata, spec, Deployment grafana, replicas, strategy, type

### Community 59 - "PersistentVolumeClaim grafana"
Cohesion: 0.25
Nodes (8): PersistentVolumeClaim grafana, apiVersion, kind, spec, storage, requests, accessModes, resources

### Community 60 - "spec"
Cohesion: 0.25
Nodes (8): app, labels, template, volumes, metadata, spec, name, persistentVolumeClaim

### Community 61 - "spec"
Cohesion: 0.25
Nodes (7): apiVersion, kind, spec, Deployment mlflow, replicas, strategy, type

### Community 62 - "PersistentVolumeClaim mlflow"
Cohesion: 0.25
Nodes (8): PersistentVolumeClaim mlflow, apiVersion, kind, spec, storage, requests, accessModes, resources

### Community 63 - "spec"
Cohesion: 0.25
Nodes (8): app, labels, template, volumes, metadata, spec, name, persistentVolumeClaim

### Community 64 - "selector"
Cohesion: 0.29
Nodes (7): app, port, app, matchLabels, spec, ports, selector

### Community 65 - "securityContext"
Cohesion: 0.29
Nodes (7): type, fsGroup, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 66 - "spec"
Cohesion: 0.29
Nodes (7): apiVersion, kind, spec, Deployment influxdb, replicas, strategy, type

### Community 67 - "securityContext"
Cohesion: 0.29
Nodes (7): type, fsGroup, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 68 - "securityContext"
Cohesion: 0.29
Nodes (7): type, fsGroup, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 69 - "Medição do vuln fixer (ADR-0005): última release, parent, lib e service"
Cohesion: 0.25
Nodes (6): Como foi medido, Conferência final, Fecho, Limites desta medição, Medição do vuln fixer (ADR-0005): última release, parent, lib e service, Reexecução depois da revisão externa (2026-11-17)

### Community 70 - "securityContext"
Cohesion: 0.29
Nodes (7): type, fsGroup, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 71 - "networkpolicy.yaml"
Cohesion: 0.12
Nodes (15): apiVersion, ports, kind, key, operator, metadata, name, namespace (+7 more)

### Community 72 - "ConfigMap grafana-datasources"
Cohesion: 0.33
Nodes (5): apiVersion, data, kind, influxdb.yaml, ConfigMap grafana-datasources

### Community 73 - "ADR-0004: Modelo padrão do laboratório"
Cohesion: 0.33
Nodes (5): ADR-0004: Modelo padrão do laboratório, Consequências, Contexto, Decisão, Estado

### Community 74 - "vuln-fix.yaml"
Cohesion: 0.29
Nodes (6): apiVersion, kind, metadata, name, volumeClaimTemplates, metadata

### Community 75 - "templates"
Cohesion: 0.29
Nodes (7): templates, arguments, name, template, when, name, steps

### Community 76 - "securityContext"
Cohesion: 0.40
Nodes (5): drop, securityContext, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem

### Community 77 - "open-eda-labs.github.io/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 78 - "open-eda-labs.github.io"
Cohesion: 0.22
Nodes (10): ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios, YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML), ADR-0003: Repositório central, página do projeto e memória em grafo, Pendente: pacote e versão do Graphify, diretório do grafo, quem o atualiza (sessão de agente ou CI), Convenção de ADR: NNNN-titulo-curto.md, seções Estado, Contexto, Decisão, Consequências; decisão substituída muda Estado, Próximo passo 2: Rafa: dizer qual pacote e versão do Graphify self-hosted usar, para gerar o primeiro grafo (ADR-0003), open-eda-labs.github.io, Astryx (@astryxdesign/core) (+2 more)

### Community 79 - "D-42: Quatro classes de dado D0 a D3; D3 nunca sai; vale também para traces e MLflow"
Cohesion: 0.29
Nodes (10): D0 operacional, D1 interno, D2 pessoal (LGPD), D3 proibido, docs/allowed-fields.md, D-22: Lista de campos permitidos antes do primeiro prompt; Workflow recebe chave e referência, não o payload, D-42: Quatro classes de dado D0 a D3; D3 nunca sai; vale também para traces e MLflow, D-43: Controle de classe: allowlist de campos no intake e coletores, mais detector (regex ou Presidio) que mascara D2 e bloqueia D3 em texto livre (+2 more)

### Community 80 - "footprint.sh"
Cohesion: 0.50
Nodes (3): bloco(), KUBECONFIG, footprint.sh script

### Community 81 - "metadata"
Cohesion: 0.60
Nodes (5): metadata, name, namespace, metadata, metadata

### Community 82 - "metadata"
Cohesion: 0.60
Nodes (5): metadata, name, namespace, metadata, metadata

### Community 83 - "volumes"
Cohesion: 0.50
Nodes (4): volumes, configMap, name, persistentVolumeClaim

### Community 86 - "demo-lib"
Cohesion: 0.15
Nodes (7): Construir e publicar, Contexto, demo-lib, Estado, Regra de ouro (ADR-0005), Config, CommonsConfiguration2Test

### Community 87 - "demo-parent"
Cohesion: 0.29
Nodes (6): Construir e publicar, Contexto, demo-parent, Estado, Regra de ouro (ADR-0005), Release

### Community 88 - "ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib)"
Cohesion: 0.33
Nodes (5): ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib), Consequências, Contexto, Decisão, Estado

### Community 89 - "D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando"
Cohesion: 0.46
Nodes (6): D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando, triage-contract, jsonschema==4.23.0, pytest==8.3.4, PyYAML==6.0.3, rfc3339-validator==0.1.4

### Community 90 - ".github/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 92 - "container"
Cohesion: 0.22
Nodes (9): command, env, image, securityContext, volumeMounts, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem (+1 more)

### Community 93 - "spec"
Cohesion: 0.25
Nodes (8): metadata, name, requests, accessModes, resources, metadata, spec, volumeClaimTemplates

### Community 95 - "WorkflowEventBinding + WorkflowTemplate alert-triage"
Cohesion: 0.36
Nodes (8): WorkflowEventBinding + WorkflowTemplate alert-triage, D-12: Auditoria append-only desde o dia 1, fora do OTel; tracing reduzido a trace_id propagado, Passo 1: checar dedup e orçamento, Passo 2: coletar evidência por consultas read-only fixas, Passo 3: uma chamada ao modelo com saída no schema de recomendação, Passo 4: passo sem modelo valida a saída e publica pelo contrato neutro, Auditoria append-only encadeada por hash, MCP read-only (mcp-grafana --disable-write)

### Community 96 - "spec"
Cohesion: 0.29
Nodes (6): apiVersion, kind, spec, concurrencyPolicy, schedule, timezone

### Community 97 - "securityContext"
Cohesion: 0.29
Nodes (7): type, fsGroup, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 98 - "templates"
Cohesion: 0.33
Nodes (6): tasks, parameters, dag, name, outputs, templates

### Community 100 - "spec"
Cohesion: 0.40
Nodes (5): storage, requests, accessModes, resources, spec

### Community 101 - "backoff"
Cohesion: 0.40
Nodes (5): duration, factor, backoff, limit, retryStrategy

## Knowledge Gaps
- **46 isolated node(s):** `labs.demo:demo-lib`, `labs.demo:demo-parent`, `labs.demo:demo-service`, `KUBECONFIG`, `KUBECONFIG` (+41 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 563 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **10 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `demo-service` connect `P5 Vuln fixer Maven, PR-only` to `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `P0 Preparação e baseline`, `PLANO_MESTRE.md`, `PROGRESS.md`, `open-eda-labs.github.io`, `Routes.java`, `P1 Replay offline`?**
  _High betweenness centrality (0.100) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `P5 Vuln fixer Maven, PR-only` (e.g. with `Dependência #13: snakeyaml 1.33 (CVE-2022-1471)` and `Dependência #14: h2 1.4.200 (CVE-2021-42392)`) actually correct?**
  _`P5 Vuln fixer Maven, PR-only` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `labs.demo:demo-lib`, `labs.demo:demo-parent`, `labs.demo:demo-service` to the rest of the system?**
  _46 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `P5 Vuln fixer Maven, PR-only` be split into smaller, more focused modules?**
  _Cohesion score 0.07511737089201878 - nodes in this community are weakly interconnected._
- **Why does `P5 Vuln fixer Maven, PR-only` connect `P5 Vuln fixer Maven, PR-only` to `triage-contract/README.md`, `P2 Laboratório base no notebook`, `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `AGENTS.md do triage-contract (instruções para qualquer harness de agente, fonte única D-15)`, `PROGRESS.md`, `PLANO_MESTRE.md`, `P6 Executor CI nativo atrás do contrato`, `D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando`, `P3 Intake e Workflow de 4 passos`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Should `Scenario` be split into smaller, more focused modules?**
  _Cohesion score 0.06775510204081632 - nodes in this community are weakly interconnected._
- **Why does `Dependência #19: jetty-server (+ jetty-servlet) 9.4.40.v20210413 (CVE-2026-6790)` connect `P5 Vuln fixer Maven, PR-only` to `AppIntegrationTest.java`, `Routes.java`?**
  _High betweenness centrality (0.057) - this node is a cross-community bridge._