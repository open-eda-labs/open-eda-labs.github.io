# ADR-0003: Repositório central, página do projeto e memória em grafo

## Estado

Aceita em 2026-11-15 (Rafa) para o papel do repositório. A página está decidida, mas adiada. A memória em grafo tem um primeiro grafo versionado.

## Contexto

O `open-eda-labs.github.io` nasceu como base das sessões cloud. O projeto precisa de um lugar único para arquitetura, de uma página pública e de memória que sobreviva entre computadores e VMs efêmeras das sessões de agente.

## Decisão

- **Repositório central.** Este repositório guarda o Plano Mestre, os ADRs, o progresso e as instruções das sessões.
- **Página do projeto.** O GitHub Pages deste repositório será a página do projeto, construída com componentes do Astryx (`@astryxdesign/core`) e seguindo as diretrizes de interface da Apple. A criação fica para depois: um primeiro rascunho (um `index.html` sem build, com Astryx por CDN) foi descartado em 2026-11-15 por não ter a qualidade visual esperada.
- **Memória em grafo.** O Graphify roda self-hosted, não na nuvem, indexa o conteúdo de todos os repositórios da organização open-eda-labs, e o grafo gerado fica versionado neste repositório para servir de memória persistente entre computadores e VMs das sessões de agente.

## Consequências

- O Astryx está em beta e é uma biblioteca de componentes React, não um gerador de site: a página vai precisar de um desenho próprio, e a versão fica pinada (D-40).
- **Como o grafo é gerado.** Graphify `graphifyy==0.9.109` (repositório `Graphify-Labs/graphify`), usado pela skill `/graphify` dentro da sessão do Claude Code, sem chave de API: o código é extraído localmente e os documentos são lidos pela própria sessão. O alvo é a pasta que contém os repositórios da organização lado a lado, para que os caminhos fiquem relativos à raiz da org.
- **O que é versionado.** `graphify-out/graph.json`, `graphify-out/GRAPH_REPORT.md` e `graphify-out/manifest.json`. Caches e o `graph.html` ficam fora do Git (o HTML se regenera com `graphify export html`).
- **Como consultar.** `graphify query "<pergunta>" --seed <nó> --graph graphify-out/graph.json`, `graphify explain "<nó>"` e `graphify god-nodes`. Sem `--seed`, a busca por palavra-chave não segue bem as relações entre decisões e repositórios.
- **Limites do primeiro grafo (2026-11-15).** 854 nós e 1.968 arestas; todos os ids D, R e Q do plano viraram nós. A extração dos 27 documentos foi feita por uma sessão de agente e não foi conferida aresta por aresta; 6% das arestas são inferidas.
- **Em aberto.** Quem atualiza o grafo e quando (sessão de agente ao fim da tarefa, ou CI), e se uma atualização incremental preserva as arestas semânticas.
