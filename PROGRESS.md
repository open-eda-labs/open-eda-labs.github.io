# Progresso do laboratório open-eda-labs

Leia este arquivo no início de toda sessão e atualize-o ao fim de cada tarefa. Mais recente primeiro.

## Próximo passo

1. Rafa: fazer merge dos PRs do `open-eda-labs.github.io` e do `triage-contract` (os outros 7 já entraram).
2. Rafa: dizer qual pacote e versão do Graphify self-hosted usar, para gerar o primeiro grafo neste repositório (ADR-0003).
3. Rafa: decidir o critério do re-scan do vuln fixer (ADR-0002) antes do P5 N1.
4. Depois: P5 nível N1 no `agent-workflows`, que depende do cluster do `lab-infra` (P2).

## Registro

| Data | Feito | Pendente | Decisões |
| --- | --- | --- | --- |
| 2026-11-15 | 7 PRs do kickoff em `main`; `demo-service` com o app, 33 testes e a matriz real de bumps (12 verdes, 8 falhas). Neste repositório: ADRs 0001 a 0003, script de bootstrap removido; o rascunho da página do projeto foi descartado e a página fica para depois. `triage-contract`: skills reescritas em inglês e enxugadas | Grafo do Graphify self-hosted ainda não gerado: a instalação do pacote não foi autorizada na sessão. | ADR-0001 (convenção, YAML, gRPC), ADR-0002 (base do demo-service), ADR-0003 (repositório central, página, memória em grafo) |
| 2026-11-15 | PR do `.github` em `main`. Lista de dependências do `demo-service` aprovada pelo Rafa, com as propostas do documento | Critério do re-scan (pergunta 2 da proposta) | JDK 21; sem Spring Boot; Jetty 9 como servidor; major bump conta como N2; pacotes da mesma família no mesmo PR; 8 casos que quebram; todos os PRs contra o mesmo commit base. Escolhas [P] do contrato aceitas |
| 2026-11-15 | Revisão de enxugamento dos 9 PRs: lint por convenção no workflow reutilizável do `.github` (sem config por repositório), markdownlint removido, `.gitignore` especulativo e arquivos não pedidos apagados, schemas e exemplos do `triage-contract` convertidos para YAML (2 arquivos de exemplo no lugar de 55) | Merge do PR do `.github` primeiro: o CI dos outros 8 chama o `lint.yml` dele na `main` e fica vermelho até lá; se o `.github` for privado, liberar o acesso a Actions na org. Rafa: registrar D-45 no doc vivo | Convenção antes de configuração; YAML para config, schemas e fixtures; gRPC só entre serviços próprios, HTTP+JSON nas bordas (a virar D-45) |
| 2026-11-14 | Kickoff em sub-sessões: base neste repositório (CLAUDE.md, PROGRESS.md, Plano Mestre v1.8), esqueleto dos 8 repositórios "Agora" (README, CODEOWNERS, `.editorconfig`, lint de YAML e Markdown no CI), padrões da org no `.github` (perfil, templates de issue e PR, workflow reutilizável), contrato 0.1.0 no `triage-contract` (dois schemas, exemplos, testes, AGENTS.md, skills), proposta de dependências no `demo-service`, leitura crítica do plano em `docs/contradicoes-plano.md` | Revisar os PRs draft, um por repositório. Pinar actions por SHA (D-40). Licença e visibilidade dos repositórios. Rulesets da `main`, 2FA da org. Correções do plano listadas em `docs/contradicoes-plano.md`. Escolhas [P] do contrato a confirmar (ver README do `triage-contract`) | Fluxo de Git: `main` nasce com README vazio; depois disso, sempre PR draft, sem merge pelo agente. Nenhuma decisão D-nn alterada |
| 2026-11-14 | Org open-eda-labs e os 8 repositórios Agora + open-eda-labs.github.io criados (vazios); Plano Mestre v1.7 (D-01 a D-44) | 2FA da org, app do Claude na org, primeiro commit dos repositórios vazios | Nome da org: open-eda-labs (eventloom estava tomado) |
