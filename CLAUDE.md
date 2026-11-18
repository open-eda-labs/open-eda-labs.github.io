# open-eda-labs: repositório central

Este repositório é o centro do laboratório **open-eda-labs**: workflows agênticos disparados por eventos (alertas por webhook e varredura de vulnerabilidades), com Argo Workflows e padrões abertos.

## Fonte da verdade

`docs/PLANO_MESTRE.md` (export da versão 1.8, de 14/11/2026) é o handoff completo: decisões D-01 a D-44, etapas P0 a P6 e E0 a E5, riscos, perguntas e próximos passos. O original vivo é o doc "Plano Mestre: Automação Agêntica por Alertas" no claude.ai. Em conflito, vale o doc vivo. Leia o plano e o `PROGRESS.md` antes de propor qualquer coisa; atualize o `PROGRESS.md` ao fim de cada tarefa. Não invente decisões: se faltar uma, pergunte.

Decisão nova, tomada depois do plano, vira um ADR em `docs/adr/` (convenção em `docs/adr/README.md`). `graphify-out/graph.json` é o grafo do Graphify self-hosted com toda a organização indexada, a memória entre máquinas: consulte com `graphify query "<pergunta>" --seed <nó> --graph graphify-out/graph.json` antes de reler os documentos inteiros, e regenere pela skill `/graphify` quando documentos ou código mudarem. A página do projeto no GitHub Pages fica para depois (ADR-0003).

## Regras que não se negociam

- Nenhum dado, código ou nome da empresa do Rafa entra na org (D-24, D-27). Só dados sintéticos ou públicos.
- Vendor-free na Fase 1: Argo e padrões abertos; gh-aw só na variante P6 (D-28). GitHub Actions só para CI.
- O agente nunca faz merge. Escrita só como branch + PR draft, via GitHub App com token curto (D-02, D-31).
- Classes de dado D0 a D3 (D-42): D3 nunca vai a modelo, trace ou MLflow.
- Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, recriar do zero com um comando (D-40).
- Ecossistema do vuln fixer: Maven (D-29). Detecção: OSV-Scanner em CronWorkflow (D-30).
- Vuln fixer (ADR-0005): o alvo é a última versão publicada no Maven Central; corrigido é re-scan limpo com build e testes verdes; o fix nasce no `demo-parent` ou na `demo-lib`, nunca no serviço, que só sobe a versão que consome.
- Convenção antes de configuração: o padrão da org vale sem arquivo de config por repositório (o lint mora no workflow reutilizável do `.github`). YAML para configuração, schemas e fixtures. gRPC entre serviços próprios (o intake-adapter fala com a API gRPC do Argo Server); HTTP+JSON só nas bordas externas: webhooks de alerta e API do modelo (ADR-0001).

## Hardware

Notebook Galaxy Book4 Ultra (32 GB, RTX 4070 Laptop 8 GB, Windows 11 + WSL2): k3s, Argo e Ollama. Desktop com RTX 3060 12 GB via Tailscale só se faltar potência (Q-10).

## Ordem de trabalho

1. Os repositórios são criados pelo Rafa. Sessões cloud não criam repositórios: se faltar algum, avise.
2. Esqueleto de cada repositório: README com propósito e link ao plano, CODEOWNERS, `.editorconfig`, CI mínimo.
3. `demo-service`: app Maven com cerca de 20 dependências de CVEs reais conhecidas (D-39), testes e CI no Actions.
4. P5 nível N1 em `agent-workflows`: CronWorkflow `vuln-scan` + WorkflowTemplate `vuln-fix` com `osv-scanner fix`, PR draft e Slack por incoming webhook com link em texto (D-41).
5. Medir a fatia resolvida pelo N1 antes de construir o N2.

Atualize o Plano Mestre (pedindo ao Rafa) sempre que uma decisão mudar.

## Manutenção do grafo (ADR-0003)

Ao fim de toda tarefa que criou, alterou ou removeu arquivos em qualquer repositório da org, com os repositórios clonados lado a lado e a partir da pasta que os contém:

1. `GRAPHIFY_OUT=open-eda-labs.github.io/graphify-out graphify update .` para o código (sem modelo).
2. `/graphify . --update` pela skill para os documentos.
3. Se arquivos foram removidos, repita com `--force`: sem ele o Graphify não grava um grafo menor que o anterior.
4. Inclua `graphify-out/graph.json`, `GRAPH_REPORT.md` e `manifest.json` no PR do `open-eda-labs.github.io`.

Se o Graphify ou a skill não estiverem instalados na sessão, não improvise: registre em `PROGRESS.md` que o grafo ficou desatualizado.
