# ADR-0007: N2 roda dentro do pod do fix

## Estado

Aceita em 2026-11-18 (Rafa). Revê a descrição do N2 de P5 como template Argo separado (tabela de repositórios do plano e o item de próximos passos do `PROGRESS.md`).

## Contexto

O passo `fix` do vuln fixer prova cada unidade de subida num laço com bisseção (ADR-0005) e, antes de desistir de uma unidade, chama o gancho N2 (`$N2_HOOK <in> <out>`). Um template Argo separado partiria esse laço em dois pods, duplicaria o build e exigiria um segundo `fix` para revalidar. O harness também precisa de JDK e Maven para iterar sobre o próprio patch.

## Decisão

- O harness roda como subprocesso no pod do `fix`. O `N2_HOOK` aponta para o `n2-adapter` do `agent-step-images`.
- A imagem dos passos do `agent-workflows` é construída `FROM` a imagem do harness, que tem Cline CLI 3.0.74, JDK 21 e Maven. Trocar de harness continua custando só a imagem e o adaptador (G-P5).
- O adaptador trabalha numa cópia, sem segredo no ambiente do agente e com Maven offline. Só grava `patch.diff` se o `mvn verify` dele passar, e recusa os mesmos caminhos que o `publish` recusa, mais linhas de versão em `pom.xml` e testes desligados ou apagados.

## Consequências

- O agente não tem sandbox próprio: lê o que o pod do `fix` lê, inclusive a config do Cline com a chave virtual do gateway. O pod do `fix` não tem credencial de escrita.
- O pod do `publish`, que tem o token de escrita, carrega o binário do Cline sem nunca executá-lo. A alternativa é uma imagem separada só para o `fix`.
- O N2 não fecha migração que precise de dependência nova: versão vem só do parent (ADR-0005), numa rodada anterior.
- O CI da imagem do `agent-workflows` depende da imagem do harness publicada no GHCR.
