# Prompt de abertura para o Claude Code (cloud)

Pré-requisitos: os repositórios já existem na org open-eda-labs (criados por você, via `bootstrap-repos.sh` num terminal com `gh` ou pela interface do GitHub), o app do Claude no GitHub está instalado na org com acesso a eles, e `CLAUDE.md`, `PROGRESS.md` e `docs/PLANO_MESTRE.md` estão commitados no repositório `open-eda-labs.github.io`.

Abra a sessão com o repositório `open-eda-labs.github.io` e cole (o `.github` não pode ser anexado a sessões cloud, por começar com ponto):

---

Leia CLAUDE.md, PROGRESS.md e docs/PLANO_MESTRE.md inteiros. Depois:

1. Resuma em 5 linhas o que entendeu e liste qualquer contradição que encontrar no plano.
2. Anexe à sessão os repositórios da org open-eda-labs que a tarefa precisar.
3. Monte o esqueleto de cada repositório marcado como "Agora" (inclusive o `.github`, se a sessão conseguir alcançá-lo; senão, me entregue os arquivos) (README com propósito e link ao plano, CODEOWNERS com @Raphonzius, .editorconfig, CI mínimo). Um PR por repositório, sem merge.
4. Comece o demo-service (D-39): proponha a lista de ~20 dependências Maven com CVEs reais antes de escrever código.
5. Ao fim de cada tarefa, atualize PROGRESS.md no repositório `open-eda-labs.github.io` (feito, pendente, decisões, próximo passo) num PR.

Trabalhe em branches. Não crie repositórios novos: se faltar algum, me avise.
