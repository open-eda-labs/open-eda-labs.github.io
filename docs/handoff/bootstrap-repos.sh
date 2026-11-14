#!/usr/bin/env bash
# Cria os repositórios "Agora" da org open-eda-labs (Plano Mestre, D-27).
# Idempotente: pula repositório que já existe.
# Pré-requisito: gh auth login com uma conta owner da org (escopos repo e admin:org).
# Uso: ORG=open-eda-labs VISIBILITY=private ./bootstrap-repos.sh
set -euo pipefail

ORG="${ORG:-open-eda-labs}"
VISIBILITY="${VISIBILITY:-private}"   # private | public

# nome|descrição  (executor-drivers fica de fora: só em P6)
REPOS=(
  ".github|Perfil da org, templates de issue e PR, CODEOWNERS padrão e workflows reutilizáveis de CI"
  "triage-contract|Contrato versionado: schemas CloudEvents e de recomendação, AGENTS.md e skills"
  "triage-eval|Replay, gabarito JSONL, canários D2/D3 e suítes de avaliação (só dados sintéticos ou públicos)"
  "intake-adapter|Fronteira de confiança: autenticação, normalização CloudEvents, dedup, limites e kill switch"
  "agent-workflows|WorkflowTemplates de triagem e do vuln fixer, CronWorkflow vuln-scan e imagens dos passos sem modelo"
  "lab-infra|Laboratório como código: WSL2, k3s, Argo, InfluxDB, Grafana, MLflow e ACLs da Tailscale"
  "demo-service|App Maven com dependências de CVEs reais conhecidas, testes, CI no Actions e cenários de injeção de falhas"
  "agent-step-images|Imagens OCI do passo de agente (Cline CLI, OpenHands) com contrato /in e /out"
)

gh auth status >/dev/null || { echo "Rode 'gh auth login' antes."; exit 1; }
gh api "orgs/${ORG}" >/dev/null || { echo "Org ${ORG} não encontrada ou sem acesso."; exit 1; }

for entry in "${REPOS[@]}"; do
  name="${entry%%|*}"; desc="${entry#*|}"
  if gh repo view "${ORG}/${name}" >/dev/null 2>&1; then
    echo "= ${ORG}/${name} já existe"
    continue
  fi
  gh repo create "${ORG}/${name}" "--${VISIBILITY}" --description "${desc}" \
    --add-readme --license apache-2.0 --disable-wiki
  echo "+ ${ORG}/${name} criado"

  # Ruleset na branch padrão: PR obrigatório, sem force push nem deleção.
  gh api -X POST "repos/${ORG}/${name}/rulesets" --input - >/dev/null <<JSON || echo "  ! ruleset não aplicado em ${name} (plano da conta?)"
{
  "name": "main-protegida",
  "target": "branch",
  "enforcement": "active",
  "conditions": { "ref_name": { "include": ["~DEFAULT_BRANCH"], "exclude": [] } },
  "rules": [
    { "type": "deletion" },
    { "type": "non_fast_forward" },
    { "type": "pull_request", "parameters": {
        "required_approving_review_count": 0,
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": true } }
  ]
}
JSON

  # GITHUB_TOKEN só leitura por padrão; Actions não aprova PR.
  gh api -X PUT "repos/${ORG}/${name}/actions/permissions/workflow" \
    -f default_workflow_permissions=read -F can_approve_pull_request_reviews=false >/dev/null \
    || echo "  ! permissões do Actions não ajustadas em ${name}"

  # Dependabot alerts e secret scanning (secret scanning em repo privado pode exigir plano pago).
  gh api -X PUT "repos/${ORG}/${name}/vulnerability-alerts" >/dev/null || true
  gh api -X PATCH "repos/${ORG}/${name}" --input - >/dev/null <<'JSON' || echo "  ! secret scanning indisponível neste plano"
{ "security_and_analysis": { "secret_scanning": { "status": "enabled" },
                             "secret_scanning_push_protection": { "status": "enabled" } } }
JSON
done

echo "Pronto. Confira em https://github.com/${ORG}"
