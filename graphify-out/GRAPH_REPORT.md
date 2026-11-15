# Graph Report - user  (2026-11-15)

## Corpus Check
- 103 files · ~53,087 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 27 file(s) not represented in the graph (top: (none) 24, .properties 2, .xml 1)
- WARNING: 27 of 133 files seen (20%) have no supported extractor and are missing from this graph entirely. It may look complete while representing only part of the codebase.

## Summary
- 1302 nodes · 2575 edges · 86 communities (69 shown, 17 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 111 edges (avg confidence: 0.82)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- triage-contract
- P5 Vuln fixer Maven, PR-only
- Scenario
- P2 Laboratório base no notebook
- test_schemas.py
- P0 Preparação e baseline
- org.junit.jupiter.api.Test
- P3 Intake e Workflow de 4 passos
- PLANO_MESTRE.md
- P6 Executor CI nativo atrás do contrato
- triage-contract/.github/workflows/ci.yml
- LatencyFault
- RoleBinding vuln-scan
- Scenarios.java
- demo-service/.github/workflows/ci.yml
- Chaos
- ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios
- Downstream.java
- NimbusJoseJwtTest.java
- Routes.java
- lab-infra/.github/workflows/ci.yml
- Metrics.java
- containers
- lint.yml
- Log4jCoreTest.java
- GuavaTest.java
- App.java
- body
- E0 Aprovação e governança
- agent-step-images/.github/workflows/ci.yml
- agent-workflows/.github/workflows/ci.yml
- StubServer.java
- intake-adapter/.github/workflows/ci.yml
- templates
- triage-eval/.github/workflows/ci.yml
- Chaos.java
- D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela
- .run
- P1 Replay offline
- scan.py
- Namespace argo
- containers
- templates
- run-scenarios.sh
- labs.demo:demo-service
- workflowSpec
- containers
- Service influxdb
- Service mlflow
- spec
- container
- spec
- container
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
- Medição do N1 (`osv-scanner fix`, override) sobre o demo-service
- securityContext
- securityContext
- ConfigMap grafana-datasources
- ADR-0004: Modelo padrão do laboratório
- vuln-fix.yaml
- backoff
- securityContext
- steps
- backoff
- OomFault
- footprint.sh
- metadata
- metadata
- volumes
- check-model.sh
- wslconfig.md

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
- `YAML como formato de configuração, schemas e fixtures (JSON Schema escrito em YAML)` --applies_to--> `triage-contract`  [INFERRED]
  open-eda-labs.github.io/docs/adr/0001-convencao-yaml-grpc.md → triage-contract/README.md
- `schemas/recommendation.yaml (saída da triagem e do vuln fixer)` --realizes--> `schemas/recommendation.schema.json`  [INFERRED]
  triage-contract/README.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `schemas/alert-event.yaml (envelope CloudEvents 1.0 com traceparent e dataref)` --realizes--> `schemas/alert-event.json`  [INFERRED]
  triage-contract/README.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `Skill vuln-fix-maven: repara build/testes quebrados pelo bump N1 (passo N2 do vuln fixer)` --part_of--> `AGENTS.md + .agents/skills/`  [INFERRED]
  triage-contract/.agents/skills/vuln-fix-maven/SKILL.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md
- `Skill vuln-fix-maven: repara build/testes quebrados pelo bump N1 (passo N2 do vuln fixer)` --references--> `GitHub App de curta duração`  [INFERRED]
  triage-contract/.agents/skills/vuln-fix-maven/SKILL.md → open-eda-labs.github.io/docs/PLANO_MESTRE.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Escada de autonomia (D-25): Shadow E2, Recomendar E3, Aprovar E4, Auto-executar E5** — open_eda_labs_github_io_docs_plano_mestre_e2, open_eda_labs_github_io_docs_plano_mestre_e3, open_eda_labs_github_io_docs_plano_mestre_e4, open_eda_labs_github_io_docs_plano_mestre_e5 [EXTRACTED 1.00]
- **Classes de dado D0 a D3 (D-42)** — dataclass_d0, dataclass_d1, dataclass_d2, dataclass_d3 [EXTRACTED 1.00]
- **Caminho mínimo da PoC: P0, P1, P3, P5 (todo no laboratório)** — open_eda_labs_github_io_docs_plano_mestre_p0, open_eda_labs_github_io_docs_plano_mestre_p1, open_eda_labs_github_io_docs_plano_mestre_p3, open_eda_labs_github_io_docs_plano_mestre_p5 [EXTRACTED 1.00]
- **Workflow de triagem de quatro passos** — open_eda_labs_github_io_docs_plano_mestre_workflow_passo_1, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_2, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_3, open_eda_labs_github_io_docs_plano_mestre_workflow_passo_4 [EXTRACTED 1.00]

## Communities (86 total, 17 thin omitted)

### Community 0 - "triage-contract"
Cohesion: 0.05
Nodes (63): D0 operacional, D1 interno, D2 pessoal (LGPD), D3 proibido, Regras da org (perfil): só dados sintéticos ou públicos; tudo como código; PR com agente sem merge; classes D0-D3; convenção antes de configuração, Lacuna: Quem cria o GitHub App do passo de publicação (D-31) e onde fica a chave, docs/replay-report.md, passo de publicação sem modelo (+55 more)

### Community 1 - "P5 Vuln fixer Maven, PR-only"
Cohesion: 0.09
Nodes (61): Aviso: dependências vulneráveis de propósito; não corrigir fora do pipeline do vuln fixer; ignorar Dependabot e alertas do GitHub, Matriz de bumps medida em 2026-11-15: 20 de 20 batem com a proposta (12 verdes, 8 falhas), Contenção do demo-service: escuta só 127.0.0.1; /chaos/* exige JWT HS256 (503 sem segredo); sem entrada HTTP crua em API vulnerável; NetworkPolicy de egress; container sem root, Dependência #1: log4j-core (+ log4j-api) 2.14.1 (CVE-2021-44228), Dependência #2: commons-text 1.9 (CVE-2022-42889), Dependência #3: guava 31.1-jre (CVE-2023-2976), Dependência #4: commons-io 2.6 (CVE-2021-29425), Dependência #5: httpclient 4.5.12 (CVE-2020-13956) (+53 more)

### Community 3 - "P2 Laboratório base no notebook"
Cohesion: 0.09
Nodes (34): Contradição 1: P0 "Roda na empresa, sem infraestrutura nova" e "conjunto guardado em repositório interno", Contradição 6: "P0 e P1 primeiro; P2 e P3 em paralelo" contra P0 depender de P2, eval/toolcalling/cases/, eval/toolcalling/report.md, eval/toolcalling/run.py, eval/toolcalling/tools/, lab/argo/values.yaml, lab/footprint.md (+26 more)

### Community 4 - "test_schemas.py"
Cohesion: 0.14
Nodes (16): load(), replaced(), string_leaves(), test_event_reference_matches_alert_event(), test_every_event_type_closes_data_with_ref(), test_every_invalid_example_has_a_rule(), test_invalid_example_fails_for_the_expected_reason(), test_minimum_number_of_examples() (+8 more)

### Community 5 - "P0 Preparação e baseline"
Cohesion: 0.14
Nodes (23): Contradição 2: Tabelas de etapas põem P0 e P1 na trilha Empresa, dependendo de Q-03, Q-04, Q-14, Contradição 3: G-P0 exige endpoint sancionado e autorização escrita: nunca passa, Contradição 7: G-PoC lista quatro condições sem G-P5, que D-37 exige, Contradição 10: Abertura de Perguntas diz que sem Q-03, Q-04, Q-14 P0 e P1 não rodam, Contradição 11: Exceção do G-PoC e R-19, R-27 tratam P1 não rodar como cenário vivo, docs/alert-inventory.md, docs/allowed-fields.md, docs/baseline-mtti.md (+15 more)

### Community 6 - "org.junit.jupiter.api.Test"
Cohesion: 0.08
Nodes (9): CommonsBeanutilsTest, CommonsCompressTest, CommonsIoTest, CommonsLang3Test, H2Test, CommonsConfiguration2Test, JacksonDatabindTest, OkioTest (+1 more)

### Community 7 - "P3 Intake e Workflow de 4 passos"
Cohesion: 0.17
Nodes (24): gRPC entre serviços próprios; HTTP+JSON só nas bordas externas, audit/, intake-adapter/, tests/burst/, tests/injection-pt/, D-04: Intake adapter próprio na frente do Argo; nunca expor o Argo Server, D-13: Guardrails por arquitetura: schema rígido, lista de campos permitidos, escrita fora do agente, D-21: Limitar tempestade e custo no adapter: semáforo, teto diário, disjuntor, kill switch (+16 more)

### Community 8 - "PLANO_MESTRE.md"
Cohesion: 0.13
Nodes (20): Contradição 8: Caminho mínimo: princípios P0, P1, P3, P5; tabela sem P5, Contradição 14: CLAUDE.md do handoff dizia "export da versão 1.7"; o plano é v1.8, Lacuna: Em que repositório ficam os entregáveis de P0 e P1, Lacuna: Linguagem do intake-adapter e dos passos sem modelo, Lacuna: Formato dos arquivos do contrato (JSON no plano, YAML desde 15/11/2026), Lacuna: gRPC entre serviços próprios (Argo Server gRPC a confirmar em P3), Lacuna: Licença dos repositórios (criados vazios, sem licença), Lacuna: Visibilidade dos repositórios (privados ou públicos) (+12 more)

### Community 9 - "P6 Executor CI nativo atrás do contrato"
Cohesion: 0.11
Nodes (31): Com 8 casos N2, a meta de 80% do G-P5 exige que o N2 resolva pelo menos 4, Contradição 5: Arquitetura de referência diz executor condicional (D-18), mas D-18 foi substituída, Contradição 9: Q-09 "Bloqueia P5, E4" e P6 "Condicional (Q-09, Q-02)" contra D-28, Contradição 12: Tabela de custo com trial GitLab Ultimate, variante fora do escopo desde v1.5, Contradição 13: P5 diz E4 recebe vuln fixer, mas E4 depende de G-P6, docs/executor-comparison.md, drivers/gh-aw/, D-08: Três caminhos de consumo de IA: IDE ao gateway, chamada direta, harness headless PR-only (+23 more)

### Community 10 - "triage-contract/.github/workflows/ci.yml"
Cohesion: 0.10
Nodes (20): jobs, lint, schemas, uses, name, on, pull_request, push (+12 more)

### Community 11 - "LatencyFault"
Cohesion: 0.15
Nodes (19): LatencyFault, ErrorFault, ErrorFault, OomFault, OomFault, kind, message, name (+11 more)

### Community 12 - "RoleBinding vuln-scan"
Cohesion: 0.09
Nodes (24): ServiceAccount vuln-scan, Role vuln-scan, RoleBinding vuln-scan, name, apiVersion, kind, metadata, rules (+16 more)

### Community 14 - "demo-service/.github/workflows/ci.yml"
Cohesion: 0.08
Nodes (24): permissions, runs-on, steps, timeout-minutes, jobs, build, lint, uses (+16 more)

### Community 16 - "ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios"
Cohesion: 0.05
Nodes (44): Checklist de PR: Nenhum dado ou nome de empresa, nenhum segredo, Checklist de PR: Versões pinadas (D-40), Checklist de PR: PROGRESS.md atualizado, se aplicável, Checklist de PR: Nenhuma classe D2 ou D3 em exemplos, fixtures ou logs (D-42), jobs, lint, uses, name (+36 more)

### Community 17 - "Downstream.java"
Cohesion: 0.16
Nodes (3): Downstream, HttpClientTest, SpringWebTest

### Community 19 - "Routes.java"
Cohesion: 0.13
Nodes (8): Endpoint GET /chaos/scenarios, Endpoint GET /health, Endpoint GET /metrics, Endpoint GET /work, Endpoint POST /chaos/scenario, Config, Health, Routes

### Community 20 - "lab-infra/.github/workflows/ci.yml"
Cohesion: 0.11
Nodes (18): jobs, lint, schema, uses, name, on, pull_request, push (+10 more)

### Community 22 - "containers"
Cohesion: 0.13
Nodes (15): env, image, livenessProbe, name, ports, readinessProbe, resources, securityContext (+7 more)

### Community 23 - "lint.yml"
Cohesion: 0.13
Nodes (14): jobs, yamllint, name, on, workflow_call, permissions, contents, run (+6 more)

### Community 25 - "GuavaTest.java"
Cohesion: 0.10
Nodes (5): GuavaTest, Ticker, JsonSmartTest, SnakeYamlTest, XStreamTest

### Community 27 - "body"
Cohesion: 0.15
Nodes (12): description, label, placeholder, body, attributes, id, type, validations (+4 more)

### Community 28 - "E0 Aprovação e governança"
Cohesion: 0.22
Nodes (11): ADR unificado de E0, kill-criteria.md da Fase 2, D-05: Argo Workflows é a camada neutra de triagem, D-09: Contrato de modelo: Chat Completions stateless, tools em JSON Schema, nomes lógicos, sem depender de tool_choice, E0 Aprovação e governança, G-E0, Q-01: A empresa já opera Argo Workflows em produção, com SSO, dono e janela de patch?, Q-13: Quem são os donos de intake, Workflow, prompt e conjunto de avaliação? (+3 more)

### Community 29 - "agent-step-images/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 30 - "agent-workflows/.github/workflows/ci.yml"
Cohesion: 0.10
Nodes (20): jobs, lint, test, uses, name, on, pull_request, push (+12 more)

### Community 33 - "intake-adapter/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 34 - "templates"
Cohesion: 0.17
Nodes (12): tasks, artifacts, parameters, artifacts, action, manifest, dag, inputs (+4 more)

### Community 35 - "triage-eval/.github/workflows/ci.yml"
Cohesion: 0.18
Nodes (10): jobs, lint, uses, name, on, pull_request, push, permissions (+2 more)

### Community 37 - "D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela"
Cohesion: 0.21
Nodes (9): imagem do harness em agent-step-images, D-01: Cobrar independência do contrato entre as peças, não do produto que executa, D-24: Separar projeto pessoal e proposta corporativa; dado da empresa não entra no laboratório, D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela, Q-15: A empresa autoriza por escrito o reuso de artefatos do laboratório?, R-25: Mistura entre projeto pessoal e proposta corporativa, Registro 2026-11-14: org open-eda-labs e repositórios criados vazios; Plano Mestre v1.7 (D-01 a D-44), agent-step-images (+1 more)

### Community 40 - "P1 Replay offline"
Cohesion: 0.20
Nodes (18): Cenários de falha (latência, erro, OOM simulado com teto de 16 MB) em scenarios.yaml e chaos/run-scenarios.sh, demo-service como alvo da injeção de falhas do replay (cenários em chaos/), Contradição 4: P1 pede endpoint sancionado e avaliação cega e dupla; D-38 diz só Rafa, Lacuna: Fonte Application Insights no replay (laboratório só tem Grafana, D-35), eval/blind-review.csv, prompts/triage.v1.md, replay/run_replay.py, D-03: Começar por replay offline de 50 a 100 alertas com desfecho, sem infraestrutura nova (+10 more)

### Community 41 - "scan.py"
Cohesion: 0.07
Nodes (43): die(), post(), recommendation(), ref(), validate(), main(), finish(), osv_fix() (+35 more)

### Community 42 - "Namespace argo"
Cohesion: 0.18
Nodes (11): Namespace argo, Namespace lab, pod-security.kubernetes.io/enforce, labels, name, apiVersion, kind, metadata (+3 more)

### Community 43 - "containers"
Cohesion: 0.18
Nodes (11): command, env, image, livenessProbe, name, ports, readinessProbe, resources (+3 more)

### Community 44 - "templates"
Cohesion: 0.24
Nodes (10): git, name, path, raw, artifacts, artifacts, templates, inputs (+2 more)

### Community 47 - "workflowSpec"
Cohesion: 0.20
Nodes (10): parameters, name, value, workflowSpec, emptyDir, name, arguments, entrypoint (+2 more)

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
Cohesion: 0.22
Nodes (9): parameters, name, spec, arguments, automountServiceAccountToken, entrypoint, volumes, emptyDir (+1 more)

### Community 52 - "container"
Cohesion: 0.22
Nodes (9): command, env, image, volumeMounts, name, valueFrom, container, mountPath (+1 more)

### Community 53 - "spec"
Cohesion: 0.22
Nodes (8): apiVersion, kind, metadata, name, spec, concurrencyPolicy, schedule, timezone

### Community 54 - "container"
Cohesion: 0.22
Nodes (9): command, env, image, securityContext, volumeMounts, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem (+1 more)

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

### Community 69 - "Medição do N1 (`osv-scanner fix`, override) sobre o demo-service"
Cohesion: 0.33
Nodes (5): Como foi medido, Fatia resolvida só pelo N1, Limitações do override observadas, Medição do N1 (`osv-scanner fix`, override) sobre o demo-service, Resultado por dependência

### Community 70 - "securityContext"
Cohesion: 0.33
Nodes (6): type, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 71 - "securityContext"
Cohesion: 0.33
Nodes (6): type, runAsGroup, runAsNonRoot, runAsUser, seccompProfile, securityContext

### Community 72 - "ConfigMap grafana-datasources"
Cohesion: 0.33
Nodes (5): apiVersion, data, kind, influxdb.yaml, ConfigMap grafana-datasources

### Community 73 - "ADR-0004: Modelo padrão do laboratório"
Cohesion: 0.33
Nodes (5): ADR-0004: Modelo padrão do laboratório, Consequências, Contexto, Decisão, Estado

### Community 74 - "vuln-fix.yaml"
Cohesion: 0.40
Nodes (4): apiVersion, kind, metadata, name

### Community 75 - "backoff"
Cohesion: 0.40
Nodes (5): duration, factor, backoff, limit, retryStrategy

### Community 76 - "securityContext"
Cohesion: 0.40
Nodes (5): drop, securityContext, allowPrivilegeEscalation, capabilities, readOnlyRootFilesystem

### Community 77 - "steps"
Cohesion: 0.40
Nodes (5): arguments, name, template, when, steps

### Community 78 - "backoff"
Cohesion: 0.40
Nodes (5): duration, factor, backoff, limit, retryStrategy

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

## Knowledge Gaps
- **44 isolated node(s):** `KUBECONFIG`, `KUBECONFIG`, `labs.demo:demo-service`, `io.github.open-eda-labs.alert.resolved`, `Reserva R3: jsoup 1.14.2 (CVE-2022-36033)` (+39 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 454 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **17 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `demo-service` connect `P5 Vuln fixer Maven, PR-only` to `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `P0 Preparação e baseline`, `P1 Replay offline`, `PLANO_MESTRE.md`, `demo-service/.github/workflows/ci.yml`, `ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios`, `Routes.java`?**
  _High betweenness centrality (0.104) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `P5 Vuln fixer Maven, PR-only` (e.g. with `Dependência #13: snakeyaml 1.33 (CVE-2022-1471)` and `Dependência #14: h2 1.4.200 (CVE-2021-42392)`) actually correct?**
  _`P5 Vuln fixer Maven, PR-only` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `KUBECONFIG`, `KUBECONFIG`, `labs.demo:demo-service` to the rest of the system?**
  _44 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `triage-contract` be split into smaller, more focused modules?**
  _Cohesion score 0.054945054945054944 - nodes in this community are weakly interconnected._
- **Why does `P5 Vuln fixer Maven, PR-only` connect `P5 Vuln fixer Maven, PR-only` to `triage-contract`, `P2 Laboratório base no notebook`, `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `P3 Intake e Workflow de 4 passos`, `PLANO_MESTRE.md`, `P6 Executor CI nativo atrás do contrato`?**
  _High betweenness centrality (0.075) - this node is a cross-community bridge._
- **Should `P5 Vuln fixer Maven, PR-only` be split into smaller, more focused modules?**
  _Cohesion score 0.08864767073722297 - nodes in this community are weakly interconnected._
- **Why does `triage-contract` connect `triage-contract` to `P5 Vuln fixer Maven, PR-only`, `D-27: Repositórios separados na GitHub organization open-eda-labs; dado ou código da empresa nunca entra nela`, `P0 Preparação e baseline`, `P3 Intake e Workflow de 4 passos`, `PLANO_MESTRE.md`, `P1 Replay offline`, `P6 Executor CI nativo atrás do contrato`, `triage-contract/.github/workflows/ci.yml`, `ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios`, `E0 Aprovação e governança`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._