# ADR-0005: Correção 100% na última versão e regra de ouro (parent e lib)

## Estado

Aceita em 2026-11-15 (Rafa). Substitui o critério de medição do ADR-0002 e muda a forma da medição de D-39. A espelhar no Plano Mestre.

## Contexto

A primeira medição do vuln fixer usou `osv-scanner fix` com a menor versão que corrige o advisory, um PR por advisory, tudo no `demo-service`. Resolveu 12 de 20 dependências (5 de 20 se o pacote inteiro tivesse de ficar limpo). O Rafa considerou a correção falha.

## Decisão

- **Corrigir 100%.** O alvo de cada dependência vulnerável é a última versão publicada no registro global do ecossistema (Maven Central; PyPI e npm quando esses ecossistemas entrarem). Pré-release não conta como versão publicada.
- **O que é "corrigido".** As três condições juntas, num laço de feedback: re-scan limpo, build verde e suíte de testes verde. Vulnerabilidade sem versão corrigida publicada não conta como falha.
- **Regra de ouro.** O fix nunca nasce no serviço. Nasce no POM pai (`demo-parent`) ou na biblioteca compartilhada (`demo-lib`); uma versão nova deles é publicada; o serviço só sobe a versão que consome. Nenhuma versão de dependência de terceiro fica declarada no serviço.
- **Onde moram e onde publicam.** `open-eda-labs/demo-parent` e `open-eda-labs/demo-lib`, publicados no GitHub Packages da org por workflow de CI disparado por tag. O agente continua sem fazer merge nem tag (D-02, D-31).
- **Ecossistema.** Só Maven por enquanto (D-29).
- **Mudança de major (2026-11-17).** A última versão vale mesmo quando muda de major: se o laço fecha limpo e verde, sobe sem passo com modelo. Isso revoga "bump de major conta como N2" do ADR-0002. Na medição, protobuf 3 para 4, okio 2 para 3 e kotlin-stdlib 1.4 para 2.4 fecharam assim.
- **Transitivos (2026-11-17).** Dependência transitiva acusada pelo scan passa a ser declarada no `dependencyManagement` do `demo-parent`, na última versão. É a única forma de o fix nascer no parent.
- **Exceção da regra de ouro (2026-11-17).** Versões sempre no parent e código compartilhado sempre na lib. A única exceção é o código do próprio servidor HTTP do serviço (hoje, Jetty e servlets): quando uma subida de versão o quebra, a migração entra no PR de bump do serviço. Um validador mecânico no passo de publicação impede o serviço de declarar versão de terceiro.

## Consequências

- O `osv-scanner fix` sai; a subida de versão passa a usar o `versions-maven-plugin` no `demo-parent`. O OSV-Scanner continua na detecção e no re-scan (D-30).
- Passa a haver um PR draft por repositório por rodada, com todos os pacotes juntos, na ordem parent, lib, service. O PR do serviço só existe depois da release de parent e lib.
- Subir para a última versão quebra build ou teste em mais casos que a menor versão corrigida. Fechar o laço nesses casos exige o passo com modelo (N2) migrando código na `demo-lib` ou no serviço. Sem o N2, "100%" não é atingível nesses casos; pacote que não fecha volta à versão anterior e sai listado no PR como não corrigido.
- A medição de G-P5 deixa de ser "20 PRs no demo-service" (D-39): passa a ser a fração dos pacotes vulneráveis com versão corrigida publicada que termina limpa e verde nos três repositórios.
- `demo-service/docs/bump-matrix.md` e `agent-workflows/docs/n1-measurement.md` ficam como registro histórico da abordagem anterior.
- O modelo padrão `qwen3:4b` (ADR-0004) provavelmente não sustenta migrações grandes, como Jetty 9 para 12; o plano já previa modelo maior ou endpoint remoto só nesse passo (Q-11, R-14). Nada disso foi medido.
