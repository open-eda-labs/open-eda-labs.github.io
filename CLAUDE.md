# open-eda-labs: workspace de bootstrap

Este diretório é o ponto de partida do laboratório **open-eda-labs**: workflows agênticos disparados por eventos (alertas por webhook e varredura de vulnerabilidades), com Argo Workflows e padrões abertos.

## Fonte da verdade

`docs/PLANO_MESTRE.md` (export da versão 1.8, de 14/11/2026) é o handoff completo: decisões D-01 a D-44, etapas P0 a P6 e E0 a E5, riscos, perguntas e próximos passos. O original vivo é o doc "Plano Mestre: Automação Agêntica por Alertas" no claude.ai. Em conflito, vale o doc vivo. Leia o plano e o `PROGRESS.md` antes de propor qualquer coisa; atualize o `PROGRESS.md` ao fim de cada tarefa. Não invente decisões: se faltar uma, pergunte.

## Regras que não se negociam

- Nenhum dado, código ou nome da empresa do Rafa entra na org (D-24, D-27). Só dados sintéticos ou públicos.
- Vendor-free na Fase 1: Argo e padrões abertos; gh-aw só na variante P6 (D-28). GitHub Actions só para CI.
- O agente nunca faz merge. Escrita só como branch + PR draft, via GitHub App com token curto (D-02, D-31).
- Classes de dado D0 a D3 (D-42): D3 nunca vai a modelo, trace ou MLflow.
- Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, recriar do zero com um comando (D-40).
- Ecossistema do vuln fixer: Maven (D-29). Detecção: OSV-Scanner em CronWorkflow (D-30).
- Convenção antes de configuração: o padrão da org vale sem arquivo de config por repositório (o lint mora no workflow reutilizável do `.github`). YAML para configuração, schemas e fixtures. gRPC entre serviços próprios (o intake-adapter fala com a API gRPC do Argo Server); HTTP+JSON só nas bordas externas: webhooks de alerta e API do modelo (preferência do Rafa em 15/11/2026, a registrar no plano como D-45).

## Hardware

Notebook Galaxy Book4 Ultra (32 GB, RTX 4070 Laptop 8 GB, Windows 11 + WSL2): k3s, Argo e Ollama. Desktop com RTX 3060 12 GB via Tailscale só se faltar potência (Q-10).

## Ordem de trabalho

1. Os repositórios "Agora" são criados pelo Rafa (`bootstrap-repos.sh` ou interface do GitHub). Sessões cloud não criam repositórios: se faltar algum, avise.
2. Esqueleto de cada repositório: README com propósito e link ao plano, CODEOWNERS, `.editorconfig`, CI mínimo.
3. `demo-service`: app Maven com cerca de 20 dependências de CVEs reais conhecidas (D-39), testes e CI no Actions.
4. P5 nível N1 em `agent-workflows`: CronWorkflow `vuln-scan` + WorkflowTemplate `vuln-fix` com `osv-scanner fix`, PR draft e Slack por incoming webhook com link em texto (D-41).
5. Medir a fatia resolvida pelo N1 antes de construir o N2.

Atualize o Plano Mestre (pedindo ao Rafa) sempre que uma decisão mudar.
