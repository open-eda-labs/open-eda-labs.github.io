# ADR-0003: Repositório central, página do projeto e memória em grafo

## Estado

Aceita em 2026-11-15 (Rafa) para o papel do repositório. A página e a memória em grafo estão decididas, mas ainda não implementadas.

## Contexto

O `open-eda-labs.github.io` nasceu como base das sessões cloud. O projeto precisa de um lugar único para arquitetura, de uma página pública e de memória que sobreviva entre computadores e VMs efêmeras das sessões de agente.

## Decisão

- **Repositório central.** Este repositório guarda o Plano Mestre, os ADRs, o progresso e as instruções das sessões.
- **Página do projeto.** O GitHub Pages deste repositório será a página do projeto, construída com componentes do Astryx (`@astryxdesign/core`) e seguindo as diretrizes de interface da Apple. A criação fica para depois: um primeiro rascunho (um `index.html` sem build, com Astryx por CDN) foi descartado em 2026-11-15 por não ter a qualidade visual esperada.
- **Memória em grafo.** O Graphify roda self-hosted, não na nuvem, indexa o conteúdo de todos os repositórios da organização open-eda-labs, e o grafo gerado fica versionado neste repositório para servir de memória persistente entre computadores e VMs das sessões de agente.

## Consequências

- O Astryx está em beta e é uma biblioteca de componentes React, não um gerador de site: a página vai precisar de um desenho próprio, e a versão fica pinada (D-40).
- Pendente para a memória em grafo: qual pacote e versão do Graphify usar, em que diretório o grafo é gravado e quem o atualiza (sessão de agente ao fim da tarefa, ou CI).
