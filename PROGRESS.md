# Progresso do laboratório open-eda-labs

Leia este arquivo no início de toda sessão e atualize-o ao fim de cada tarefa. Mais recente primeiro.

## Próximo passo

1. Rafa: revisar e fazer merge dos PRs draft do kickoff, começando pelo `.github`.
2. Rafa: aprovar ou ajustar a lista em `demo-service/docs/dependency-proposal.md` (D-39) e responder às perguntas dela.
3. Depois da aprovação: código do demo-service (app Maven, testes, CI com re-scan OSV e SBOM).

## Registro

| Data | Feito | Pendente | Decisões |
| --- | --- | --- | --- |
| 2026-11-15 | Revisão de enxugamento dos 9 PRs: lint por convenção no workflow reutilizável do `.github` (sem config por repositório), markdownlint removido, `.gitignore` especulativo e arquivos não pedidos apagados, schemas e exemplos do `triage-contract` convertidos para YAML (2 arquivos de exemplo no lugar de 55) | Merge do PR do `.github` primeiro: o CI dos outros 8 chama o `lint.yml` dele na `main` e fica vermelho até lá; se o `.github` for privado, liberar o acesso a Actions na org. Rafa: registrar D-45 no doc vivo | Convenção antes de configuração; YAML para config, schemas e fixtures; gRPC só entre serviços próprios, HTTP+JSON nas bordas (a virar D-45) |
| 2026-11-14 | Kickoff em sub-sessões: base neste repositório (CLAUDE.md, PROGRESS.md, Plano Mestre v1.8), esqueleto dos 8 repositórios "Agora" (README, CODEOWNERS, `.editorconfig`, lint de YAML e Markdown no CI), padrões da org no `.github` (perfil, templates de issue e PR, workflow reutilizável), contrato 0.1.0 no `triage-contract` (dois schemas, exemplos, testes, AGENTS.md, skills), proposta de dependências no `demo-service`, leitura crítica do plano em `docs/contradicoes-plano.md` | Revisar os PRs draft, um por repositório. Pinar actions por SHA (D-40). Licença e visibilidade dos repositórios. Rulesets da `main`, 2FA da org. Correções do plano listadas em `docs/contradicoes-plano.md`. Escolhas [P] do contrato a confirmar (ver README do `triage-contract`) | Fluxo de Git: `main` nasce com README vazio; depois disso, sempre PR draft, sem merge pelo agente. Nenhuma decisão D-nn alterada |
| 2026-11-14 | Org open-eda-labs e os 8 repositórios Agora + open-eda-labs.github.io criados (vazios); Plano Mestre v1.7 (D-01 a D-44) | 2FA da org, app do Claude na org, primeiro commit dos repositórios vazios | Nome da org: open-eda-labs (eventloom estava tomado) |
