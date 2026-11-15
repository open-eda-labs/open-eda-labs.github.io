# Graph Report - user  (2026-11-15)

## Corpus Check
- 113 files · ~60,670 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 33 file(s) not represented in the graph (top: (none) 30, .properties 2, .xml 1)
- WARNING: 33 of 149 files seen (22%) have no supported extractor and are missing from this graph entirely. It may look complete while representing only part of the codebase.

## Summary
- 1473 nodes · 2756 edges · 95 communities (81 shown, 14 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 111 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- triage-contract
- P5 Vuln fixer Maven, PR-only
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
- Scenario
- Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA)
- Downstream.java
- with
- Routes.java
- lab-infra/.github/workflows/ci.yml
- with
- containers
- lint.yml
- GuavaTest.java
- App.java
- body
- E0 Aprovação e governança
- agent-step-images/.github/workflows/ci.yml
- agent-workflows/.github/workflows/ci.yml
- Jwt.java
- intake-adapter/.github/workflows/ci.yml
- test_scan.py
- triage-eval/.github/workflows/ci.yml
- build
- D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela
- AppIntegrationTest
- LatencyFault
- PROGRESS.md
- publish.py
- Namespace argo
- containers
- templates
- run-scenarios.sh
- labs.demo:demo-lib
- workflowSpec
- containers
- Service influxdb
- Service mlflow
- spec
- container
- test_publish_notify.py
- scan.py
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
- ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios
- ConfigMap grafana-datasources
- ADR-0004: Modelo padrão do laboratório
- vuln-fix.yaml
- steps
- securityContext
- open-eda-labs.github.io/.github/workflows/ci.yml
- open-eda-labs.github.io
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
- on
- labs.demo:demo-parent

## God Nodes (most connected - your core abstractions)
1. `P5 Vuln fixer Maven, PR-only` - 56 edges
2. `demo-service` - 51 edges
3. `triage-contract` - 42 edges
4. `P3 Intake e Workflow de 4 passos` - 33 edges
5. `Proposta de dependências vulneráveis do demo-service (verificada 2026-11-14 no OSV; aprovada por Rafa)` - 32 edges
6. `P2 Laboratório base no notebook` - 31 edges
7. `Scenario` - 28 edges
8. `P1 Replay offline` - 27 edges
9. `P0 Preparação e baseline` - 26 edges
10. `Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas)` - 25 edges

## Surprising Connections (you probably didn't know these)
- `Regra de ouro (ADR-0005)` --references--> `App`  [INFERRED]
  demo-lib/README.md → demo-service/src/main/java/labs/demo/App.java
- `YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML)` --applies_to--> `triage-contract`  [INFERRED]
  open-eda-labs.github.io/docs/adr/0001-convencao-yaml-grpc.md → triage-contract/README.md
- `demo-lib` --references--> `Config`  [INFERRED]
  demo-lib/README.md → demo-lib/src/main/java/labs/demo/Config.java
- `demo-lib` --references--> `Downstream`  [INFERRED]
  demo-lib/README.md → demo-lib/src/main/java/labs/demo/Downstream.java
- `demo-lib` --references--> `Jwt`  [INFERRED]
  demo-lib/README.md → demo-lib/src/main/java/labs/demo/Jwt.java

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Escada de autonomia (D-25): Shadow E2, Recomendar E3, Aprovar E4, Auto-executar E5** — open_eda_labs_github_io_docs_plano_mestre_e2, open_eda_labs_github_io_docs_plano_mestre_e3, open_eda_labs_github_io_docs_plano_mestre_e4, open_eda_labs_github_io_docs_plano_mestre_e5 [EXTRACTED 1.00]
- **Classes de dado D0 a D3 (D-42)** — dataclass_d0, dataclass_d1, dataclass_d2, dataclass_d3 [EXTRACTED 1.00]
- **Caminho mínimo da PoC: P0, P1, P3, P5 (todo no laboratório)** — open_eda_labs_github_io_docs_plano_mestre_p0, open_eda_labs_github_io_docs_plano_mestre_p1, open_eda_labs_github_io_docs_plano_mestre_p3, open_eda_labs_github_io_docs_plano_mestre_p5 [EXTRACTED 1.00]
- **Workflow de triagem de quatro passos** — open_eda_labs_github_io_docs_plano_mestre_workflow_passo_1, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_2, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_3, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_4 [EXTRACTED 1.00]

## Communities (95 total, 14 thin omitted)

### Community 0 - "triage-contract"
Cohesion: 0.06
Nodes (63): D0 operacional, D1 interno, D2 pessoal (LGPD), D3 proibido, audit/, docs/allowed-fields.md, intake-adapter/, schemas/alert-event.json (+55 more)

### Community 1 - "P5 Vuln fixer Maven, PR-only"
Cohesion: 0.08
Nodes (65): Aviso: dependências vulneráveis de propósito; não corrigir fora do pipeline do vuln fixer; ignorar Dependabot e alertas do GitHub, Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas), Dependência #1: log4j-core (+ log4j-api) 2.14.1 (CVE-2021-44228), Dependência #2: commons-text 1.9 (CVE-2022-42889), Dependência #3: guava 31.1-jre (CVE-2023-2976), Dependência #4: commons-io 2.6 (CVE-2021-29425), Dependência #5: httpclient 4.5.12 (CVE-2020-13956), Dependência #6: nimbus-jose-jwt 9.31 (CVE-2023-52428) (+57 more)

### Community 3 - "P2 Laboratório base no notebook"
Cohesion: 0.11
Nodes (31): gRPC entre serviços próprios; HTTP+JSON só nas bordas externas, eval/toolcalling/cases/, eval/toolcalling/report.md, eval/toolcalling/run.py, eval/toolcalling/tools/, lab/argo/values.yaml, lab/footprint.md, lab/k3s/ (+23 more)

### Community 4 - "test_schemas.py"
Cohesion: 0.08
Nodes (17): Scenarios, load(), replaced(), string_leaves(), test_event_reference_matches_alert_event(), test_every_event_type_closes_data_with_ref(), test_every_invalid_example_has_a_rule(), test_invalid_example_fails_for_the_expected_reason() (+9 more)

### Community 5 - "P0 Preparação e baseline"
Cohesion: 0.13
Nodes (33): Cenários de falha (latência, erro, OOM simulado com teto de 16 MB) em scenarios.yaml e chaos/run-scenarios.sh, demo-service como alvo da injeção de falhas do replay (cenários em chaos/), Contradição 2: Tabelas de etapas põem P0 e P1 na trilha Empresa, dependendo de Q-03, Q-04, Q-14, Contradição 3: G-P0 exige endpoint sancionado e autorização escrita: nunca passa, Contradição 4: P1 pede endpoint sancionado e avaliação cega e dupla; D-38 diz só Rafa, Contradição 10: Abertura de Perguntas diz que sem Q-03, Q-04, Q-14 P0 e P1 não rodam, Contradição 11: Exceção do G-PoC e R-19, R-27 tratam P1 não rodar como cenário vivo, docs/alert-inventory.md (+25 more)

### Community 6 - "org.junit.jupiter.api.Test"
Cohesion: 0.08
Nodes (9): CommonsBeanutilsTest, CommonsCompressTest, CommonsIoTest, CommonsLang3Test, H2Test, JsonSmartTest, SnakeYamlTest, CommonsConfiguration2Test (+1 more)

### Community 7 - "E1 Plataforma mínima em ambiente não produtivo"
Cohesion: 0.11
Nodes (26): D-06: Chamada direta estruturada antes de harness, com coleta determinística de evidência, D-07: AI Gateway: manter o princípio; na empresa começar com base_url configurável; no laboratório LiteLLM + Postgres opcional, D-09: Contrato de modelo: Chat Completions stateless, tools em JSON Schema, nomes lógicos, sem depender de tool_choice, D-25: Escada de autonomia: Shadow, Recomendar, Aprovar, Auto-executar baixo risco, E1 Plataforma mínima em ambiente não produtivo, E2 Shadow em produção, E3 Recomendação ao plantão com feedback, E5 Escala e auto-execução de baixo risco (+18 more)

### Community 8 - "PLANO_MESTRE.md"
Cohesion: 0.11
Nodes (24): Contradição 1: P0 "Roda na empresa, sem infraestrutura nova" e "conjunto guardado em repositório interno", Contradição 6: "P0 e P1 primeiro; P2 e P3 em paralelo" contra P0 depender de P2, Contradição 7: G-PoC lista quatro condições sem G-P5, que D-37 exige, Contradição 8: Caminho mínimo: princípios P0, P1, P3, P5; tabela sem P5, Contradição 12: Tabela de custo com trial GitLab Ultimate, variante fora do escopo desde v1.5, Contradição 14: CLAUDE.md do handoff dizia "export da versão 1.7"; o plano é v1.8, Lacuna: Em que repositório ficam os entregáveis de P0 e P1, Lacuna: Fonte Application Insights no replay (laboratório só tem Grafana, D-35) (+16 more)

### Community 9 - "P6 Executor CI nativo atrás do contrato"
Cohesion: 0.17
Nodes (23): Contradição 5: Arquitetura de referência diz executor condicional (D-18), mas D-18 foi substituída, Contradição 9: Q-09 "Bloqueia P5, E4" e P6 "Condicional (Q-09, Q-02)" contra D-28, Contradição 13: P5 diz E4 recebe vuln fixer, mas E4 depende de G-P6, docs/executor-comparison.md, drivers/gh-aw/, D-08: Três caminhos de consumo de IA: IDE ao gateway, chamada direta, harness headless PR-only, D-18: Fase 1 enxuta: caminho mínimo P0 → P1 → P3; P4 a P6 condicionais; LoRA só braço opcional de P4, D-19: Executor de CI nativo é escolhido pelo SCM da empresa (+15 more)

### Community 10 - "triage-contract/.github/workflows/ci.yml"
Cohesion: 0.10
Nodes (20): jobs, lint, schemas, uses, name, on, pull_request, push (+12 more)

### Community 11 - "fix.py"
Cohesion: 0.12
Nodes (18): ref(), apply(), count(), culprit(), edit_parent(), fail(), main(), mvn() (+10 more)

### Community 12 - "with"
Cohesion: 0.07
Nodes (29): permissions, runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, build (+21 more)

### Community 13 - "test_fix.py"
Cohesion: 0.12
Nodes (21): units(), ev(), fake_trial(), trial(), git_repo(), run_main(), status(), test_edit_parent_builds_plugin_commands() (+13 more)

### Community 14 - "demo-service/.github/workflows/ci.yml"
Cohesion: 0.08
Nodes (26): permissions, runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, build (+18 more)

### Community 15 - "Scenario"
Cohesion: 0.05
Nodes (8): Chaos, Outcome, ErrorFault, History, LatencyFault, OomFault, Scenario, CommonsTextTest

### Community 16 - "Workflow reutilizável de lint (yamllint, config embutida; ci.yml de cada repo o chama via @main, a virar SHA)"
Cohesion: 0.15
Nodes (14): Checklist de PR: Nenhum dado ou nome de empresa, nenhum segredo, Checklist de PR: Versões pinadas (D-40), Checklist de PR: PROGRESS.md atualizado, se aplicável, Checklist de PR: Nenhuma classe D2 ou D3 em exemplos, fixtures ou logs (D-42), jobs, lint, uses, name (+6 more)

### Community 17 - "Downstream.java"
Cohesion: 0.16
Nodes (3): Downstream, HttpClientTest, SpringWebTest

### Community 18 - "with"
Cohesion: 0.08
Nodes (25): runs-on, steps, timeout-minutes, GITHUB_ACTOR, GITHUB_TOKEN, jobs, deploy, name (+17 more)

### Community 19 - "Routes.java"
Cohesion: 0.06
Nodes (10): Config, Metrics, StubServer, Endpoint GET /chaos/scenarios, Endpoint GET /health, Endpoint GET /metrics, Endpoint GET /work, Endpoint POST /chaos/scenario (+2 more)

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

### Community 25 - "GuavaTest.java"
Cohesion: 0.08
Nodes (5): GuavaTest, Ticker, XStreamTest, OkioTest, ProtobufJavaTest

### Community 27 - "body"
Cohesion: 0.15
Nodes (12): description, label, placeholder, body, attributes, id, type, validations (+4 more)

### Community 28 - "E0 Aprovação e governança"
Cohesion: 0.15
Nodes (16): Com 8 casos N2, a meta de 80% do G-P5 exige que o N2 resolva pelo menos 4, ADR unificado de E0, docs/poc-gate.md, docs/replay-report.md, kill-criteria.md da Fase 2, D-05: Argo Workflows é a camada neutra de triagem, E0 Aprovação e governança, G-E0 (+8 more)

### Community 29 - "agent-step-images/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 30 - "agent-workflows/.github/workflows/ci.yml"
Cohesion: 0.10
Nodes (20): jobs, lint, test, uses, name, on, pull_request, push (+12 more)

### Community 33 - "intake-adapter/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 34 - "test_scan.py"
Cohesion: 0.14
Nodes (16): recommendation(), validate(), events(), test_failed(), test_no_change(), test_pr_opened(), test_schema_rejects_inconsistent_documents(), ev() (+8 more)

### Community 35 - "triage-eval/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 36 - "build"
Cohesion: 0.09
Nodes (22): permissions, runs-on, steps, timeout-minutes, jobs, build, lint, uses (+14 more)

### Community 37 - "D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela"
Cohesion: 0.39
Nodes (6): Contenção do demo-service: escuta só 127.0.0.1; /chaos/* exige JWT HS256 (503 sem segredo); sem entrada HTTP crua em API vulnerável; NetworkPolicy de egress; container sem root, Regras da org (perfil): só dados sintéticos ou públicos; tudo como código; PR com agente sem merge; classes D0-D3; convenção antes de configuração, D-24: Separar projeto pessoal e proposta corporativa; dado da empresa não entra no laboratório, D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela, Q-15: A empresa autoriza por escrito o reuso de artefatos do laboratório?, R-25: Mistura entre projeto pessoal e proposta corporativa

### Community 38 - "AppIntegrationTest"
Cohesion: 0.18
Nodes (4): Resultado por pacote, Jwt, NimbusJoseJwtTest, AppIntegrationTest

### Community 39 - "LatencyFault"
Cohesion: 0.15
Nodes (19): LatencyFault, ErrorFault, ErrorFault, OomFault, OomFault, kind, message, name (+11 more)

### Community 40 - "PROGRESS.md"
Cohesion: 0.23
Nodes (11): Perguntas para o Rafa na proposta (8): major bump N2 ou N3; critério do re-scan; família = 1 PR; caso artificial de groupId em property; Jetty como servidor; JDK 21 ou 25; quantas falhas no gate; ordem e base, N3: sem versão corrigida na mesma linha (backport); fora de P5, ADR-0002: Base do demo-service e regras da medição de P5, Em aberto: o re-scan do PR zera só o advisory alvo ou todos os do pacote? (decidir antes de P5 N1), Fluxo de Git: main nasce com README vazio; depois sempre PR draft, sem merge pelo agente, Próximo passo 1: Rafa: fazer merge dos PRs do open-eda-labs.github.io e do triage-contract, Próximo passo 3: Rafa: decidir o critério do re-scan do vuln fixer (ADR-0002) antes do P5 N1, Registro 2026-11-14: kickoff em sub-sessões (esqueleto dos 8 repositórios, padrões da org, contrato 0.1.0, proposta de dependências, leitura crítica do plano) (+3 more)

### Community 41 - "publish.py"
Cohesion: 0.15
Nodes (10): post(), main(), message(), git(), main(), open_pr(), pr_body(), test_notify_dry_run_one_message_with_pr_links() (+2 more)

### Community 42 - "Namespace argo"
Cohesion: 0.18
Nodes (11): Namespace argo, Namespace lab, pod-security.kubernetes.io/enforce, labels, name, apiVersion, kind, metadata (+3 more)

### Community 43 - "containers"
Cohesion: 0.18
Nodes (11): command, env, image, livenessProbe, name, ports, readinessProbe, resources (+3 more)

### Community 44 - "templates"
Cohesion: 0.28
Nodes (9): git, name, path, artifacts, artifacts, templates, inputs, name (+1 more)

### Community 47 - "workflowSpec"
Cohesion: 0.04
Nodes (46): apiVersion, parameters, duration, factor, command, env, image, securityContext (+38 more)

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
Cohesion: 0.20
Nodes (10): parameters, name, value, spec, arguments, automountServiceAccountToken, entrypoint, volumes (+2 more)

### Community 52 - "container"
Cohesion: 0.20
Nodes (10): command, env, image, volumeMounts, name, value, valueFrom, container (+2 more)

### Community 53 - "test_publish_notify.py"
Cohesion: 0.27
Nodes (9): event_name(), capture(), heads(), sh(), test_dry_run_one_draft_pr_per_repo_in_order_without_service(), test_dry_run_service_pr_only_after_releases(), test_publish_rejects_invalid_fix(), test_real_run_pushes_branch_never_merges_and_writes_pr_opened() (+1 more)

### Community 54 - "scan.py"
Cohesion: 0.29
Nodes (6): die(), fixed_version(), _line(), main(), scan(), _ver()

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
Cohesion: 0.17
Nodes (10): Como foi medido, Conferência final, Fecho, Limites desta medição, Medição do vuln fixer (ADR-0005): última release, parent, lib e service, Como foi medido, Fatia resolvida só pelo N1, Limitações do override observadas (+2 more)

### Community 70 - "securityContext"
Cohesion: 0.33
Nodes (6): type, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 71 - "ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios"
Cohesion: 0.21
Nodes (5): ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios, D-45 (a registrar no doc vivo): convenção antes de configuração, YAML, gRPC entre serviços próprios, YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML), Convenção de ADR: NNNN-titulo-curto.md, seções Estado, Contexto, Decisão, Consequências; decisão substituída muda Estado, Registro 2026-11-15: revisão de enxugamento dos 9 PRs (lint no workflow reutilizável do .github; schemas e exemplos em YAML; D-45 a registrar)

### Community 72 - "ConfigMap grafana-datasources"
Cohesion: 0.33
Nodes (5): apiVersion, data, kind, influxdb.yaml, ConfigMap grafana-datasources

### Community 73 - "ADR-0004: Modelo padrão do laboratório"
Cohesion: 0.33
Nodes (5): ADR-0004: Modelo padrão do laboratório, Consequências, Contexto, Decisão, Estado

### Community 74 - "vuln-fix.yaml"
Cohesion: 0.40
Nodes (4): apiVersion, kind, metadata, name

### Community 75 - "steps"
Cohesion: 0.18
Nodes (10): duration, factor, backoff, limit, arguments, name, template, when (+2 more)

### Community 76 - "securityContext"
Cohesion: 0.40
Nodes (5): drop, securityContext, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem

### Community 77 - "open-eda-labs.github.io/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 78 - "open-eda-labs.github.io"
Cohesion: 0.33
Nodes (7): ADR-0003: Repositório central, página do projeto e memória em grafo, Pendente: pacote e versão do Graphify, diretório do grafo, quem o atualiza (sessão de agente ou CI), Próximo passo 2: Rafa: dizer qual pacote e versão do Graphify self-hosted usar, para gerar o primeiro grafo (ADR-0003), open-eda-labs.github.io, Astryx (@astryxdesign/core), Página do projeto no GitHub Pages, Graphify self-hosted (memória em grafo)

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
Cohesion: 0.33
Nodes (5): Construir e publicar, Contexto, demo-lib, Estado, Regra de ouro (ADR-0005)

### Community 87 - "demo-parent"
Cohesion: 0.33
Nodes (5): Construir e publicar, Contexto, demo-parent, Estado, Regra de ouro (ADR-0005)

### Community 88 - "ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib)"
Cohesion: 0.33
Nodes (5): ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib), Consequências, Contexto, Decisão, Estado

### Community 89 - "D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando"
Cohesion: 0.53
Nodes (5): D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando, jsonschema==4.23.0, pytest==8.3.4, PyYAML==6.0.3, rfc3339-validator==0.1.4

### Community 90 - "on"
Cohesion: 0.50
Nodes (4): on, pull_request, push, branches

## Knowledge Gaps
- **46 isolated node(s):** `labs.demo:demo-lib`, `labs.demo:demo-parent`, `labs.demo:demo-service`, `KUBECONFIG`, `KUBECONFIG` (+41 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 545 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **14 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `demo-service` connect `P5 Vuln fixer Maven, PR-only` to `triage-contract`, `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `P0 Preparação e baseline`, `ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios`, `PLANO_MESTRE.md`, `PROGRESS.md`, `open-eda-labs.github.io`, `Routes.java`?**
  _High betweenness centrality (0.111) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `P5 Vuln fixer Maven, PR-only` (e.g. with `Dependência #13: snakeyaml 1.33 (CVE-2022-1471)` and `Dependência #14: h2 1.4.200 (CVE-2021-42392)`) actually correct?**
  _`P5 Vuln fixer Maven, PR-only` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `labs.demo:demo-lib`, `labs.demo:demo-parent`, `labs.demo:demo-service` to the rest of the system?**
  _46 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `triage-contract` be split into smaller, more focused modules?**
  _Cohesion score 0.06160506160506161 - nodes in this community are weakly interconnected._
- **Why does `Dependência #19: jetty-server (+ jetty-servlet) 9.4.40.v20210413 (CVE-2026-6790)` connect `P5 Vuln fixer Maven, PR-only` to `Log4jCoreTest.java`, `App.java`, `Routes.java`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Should `P5 Vuln fixer Maven, PR-only` be split into smaller, more focused modules?**
  _Cohesion score 0.07950310559006211 - nodes in this community are weakly interconnected._
- **Why does `P5 Vuln fixer Maven, PR-only` connect `P5 Vuln fixer Maven, PR-only` to `triage-contract`, `P2 Laboratório base no notebook`, `PROGRESS.md`, `PLANO_MESTRE.md`, `P6 Executor CI nativo atrás do contrato`, `D-40: Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando`, `E0 Aprovação e governança`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._