# ADR-0001: Convenção antes de configuração; YAML; gRPC entre serviços próprios

## Estado

Aceita em 2026-11-15 (Rafa). A espelhar no Plano Mestre como D-45.

## Contexto

O kickoff copiou a mesma configuração de lint para nove repositórios e escreveu o contrato em JSON, com um arquivo por exemplo. A revisão de complexidade pediu menos peças e um padrão único para o que ainda vai ser escrito.

## Decisão

- **Convenção antes de configuração.** O padrão da org vale sem arquivo de configuração por repositório. O lint mora no workflow reutilizável do repositório `.github`; cada repositório só o chama.
- **YAML** é o formato de configuração, schemas e fixtures. O contrato continua sendo JSON Schema, escrito em YAML.
- **gRPC** nas chamadas entre serviços próprios (o intake-adapter fala com a API gRPC do Argo Server). **HTTP+JSON** só nas bordas externas: webhooks de alerta e API do modelo (D-09).

## Consequências

- Mudar uma regra de lint é um PR no `.github`, não um por repositório.
- D-10, D-11 e a tabela de repositórios do plano ainda citam os schemas como `.json`; o arquivo que os passos emitem em runtime continua `recommendation.json`.
- Falta confirmar em P3 que o serviço de eventos do Argo por gRPC se comporta como o endpoint HTTP descrito no plano, na versão pinada.
- Nenhum `.proto` próprio existe ainda: só será escrito quando houver um segundo serviço próprio para chamá-lo.
