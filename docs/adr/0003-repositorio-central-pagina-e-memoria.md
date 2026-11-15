# ADR-0003: Repositório central, página do projeto e memória em grafo

## Estado

Aceita em 2026-11-15 (Rafa) para o papel do repositório e a página. A parte da memória em grafo está decidida, mas ainda não implementada.

## Contexto

O `open-eda-labs.github.io` nasceu como base das sessões cloud. O projeto precisa de um lugar único para arquitetura, de uma página pública e de memória que sobreviva entre computadores e VMs efêmeras das sessões de agente.

## Decisão

- **Repositório central.** Este repositório guarda o Plano Mestre, os ADRs, o progresso e as instruções das sessões.
- **Página do projeto.** GitHub Pages serve o `index.html` da raiz da `main`. A página usa componentes do Astryx (`@astryxdesign/core`, tema neutral) por CDN, sem build, com versões pinadas (D-40), e segue as diretrizes de interface da Apple: fonte do sistema, hierarquia clara, modo escuro pelo sistema, alvos de toque de 44 px, respeito a movimento reduzido e conteúdo legível sem JavaScript.
- **Memória em grafo.** O Graphify roda self-hosted, não na nuvem, e o grafo gerado fica versionado neste repositório para servir de memória persistente entre máquinas.

## Consequências

- A página depende de dois CDNs (jsDelivr e esm.sh) em tempo de carga; sem JavaScript, mostra só o título e três links.
- O Astryx está em beta: a versão fica pinada e a troca é manual.
- O Pages precisa ser habilitado nas configurações do repositório (branch `main`, raiz).
- Pendente para a memória em grafo: qual pacote e versão do Graphify usar, em que diretório o grafo é gravado e quem o atualiza (sessão de agente ao fim da tarefa, ou CI).
