# Decisões de arquitetura (ADRs)

O [Plano Mestre](../PLANO_MESTRE.md) guarda as decisões D-01 a D-44. Toda decisão tomada depois dele entra aqui, um arquivo por decisão, e o Rafa a espelha no doc vivo do plano quando for o caso.

Convenção: `NNNN-titulo-curto.md`, numeração sequencial, com as seções Estado, Contexto, Decisão e Consequências. Uma decisão substituída não é apagada: muda o Estado para "substituída por ADR-NNNN".

| ADR | Decisão | Estado |
| --- | --- | --- |
| [0001](0001-convencao-yaml-grpc.md) | Convenção antes de configuração; YAML; gRPC entre serviços próprios | aceita |
| [0002](0002-base-do-demo-service.md) | Base do demo-service e regras da medição de P5 | aceita; critério de medição substituído pelo ADR-0005 |
| [0003](0003-repositorio-central-pagina-e-memoria.md) | Repositório central, página do projeto e memória em grafo | aceita em parte |
| [0004](0004-modelo-padrao-do-laboratorio.md) | Modelo padrão do laboratório: `qwen3:4b` | aceita |
| [0005](0005-correcao-total-e-regra-de-ouro.md) | Correção 100% na última versão; fix sempre no parent ou na lib | aceita |
| [0006](0006-modelos-por-rota-no-gateway.md) | Modelos por rota no gateway; roteador por A/B em P4 (Decision-1.1 ou Switchyard) | proposta |
| [0007](0007-n2-dentro-do-pod-do-fix.md) | N2 roda dentro do pod do fix, harness do agent-step-images como base da imagem | aceita |
