# ADR-0002: Base do demo-service e regras da medição de P5

## Estado

Aceita em 2026-11-15 (Rafa), ao aprovar `demo-service/docs/dependency-proposal.md`. O critério de medição (itens sobre N2, PR por dependência e re-scan) foi substituído pelo ADR-0005; a base do app (JDK 21, sem Spring Boot, Jetty 9) continua valendo.

## Contexto

D-39 pede 20 PRs sobre dependências Maven com CVE real, misturando bump simples e bump que quebra. A proposta deixou em aberto como montar o app e como contar os casos.

## Decisão

- JDK 21, sem Spring Boot, Jetty 9 embarcado como servidor.
- 20 dependências com versão explícita: 12 bumps simples e 8 que quebram build ou teste.
- Bump de major conta como N2 (migração), não como N3.
- Pacotes da mesma família (mesma property ou BOM) contam no PR da dependência principal.
- Todos os PRs são medidos contra o mesmo commit base, sem empilhar.

## Consequências

- O resultado real de cada bump está em `demo-service/docs/bump-matrix.md`: 12 verdes e 8 falhas.
- Com 8 casos N2, a meta de 80% do G-P5 exige que o N2 resolva pelo menos 4 deles.
- Em aberto: se o re-scan do PR precisa zerar só o advisory alvo ou todos os do pacote. Decidir antes do P5 N1.
