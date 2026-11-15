# Plano Mestre: Automação Agêntica por Alertas

Nov 13, 2026 · @Rafael Pereira

## Como usar este documento

Este é o documento-fonte (handoff) do programa: tudo o que foi decidido, descartado e ainda está em aberto está aqui, para retomar em qualquer sessão sem reabrir a pesquisa.

**Convenções de identificação**

| Prefixo | O que identifica | Exemplo |
| --- | --- | --- |
| P0 a P6 | Etapas da Fase 1 (PoC) | P3 Intake e Workflow de 4 passos |
| E0 a E5 | Etapas da Fase 2 (Adoção Corporativa) | E2 Shadow em produção |
| G-xx | Gate de etapa ou de fase | G-P1, G-PoC |
| D-nn | Decisão técnica vigente | D-04 Intake adapter na frente do Argo |
| R-nn | Risco registrado | R-01 Injeção via payload do alerta |
| Q-nn | Pergunta em aberto que muda o plano | Q-02 Qual SCM |

**Marcação de evidência** (vale em todas as seções)

- **\[F\]** fato lido em fonte primária ou código, registrado nos relatórios de pesquisa.
- **\[I\]** inferência de arquitetura, sem teste.
- **\[P\]** proposta: limiar, critério ou ordem definidos por nós, a validar.
- **\[NV\]** não verificado: lacuna conhecida, não usar como premissa.

Nada neste plano foi executado ainda: todo \[F\] vem de leitura de documentação, código ou artigos até 13/11/2026.

**Como retomar numa nova sessão**

1. Cole o link deste documento e diga em que etapa está (por exemplo, "vamos executar P1").
2. Peça para ler primeiro as seções Decisões, Arquitetura e a etapa em questão.
3. Ao concluir uma etapa, atualize o status dela, registre resultados medidos e, se uma decisão mudar, edite a linha D-nn correspondente em vez de criar outra.
4. Registre a mudança no changelog abaixo.

**Glossário.** Termos que o texto usa sem expandir.

- **Rafa:** Rafael Pereira, dono do plano e da PoC; engenheiro de software numa squad de pagamentos. A squad dele é a dona da PoC (Q-13). O patrocinador é quem aprova a proposta na empresa, ainda sem nome.
- **open-eda-labs:** a GitHub organization do laboratório (D-27), criada em 14/11/2026; o nome eventloom estava tomado.
- **gh-aw:** GitHub Agentic Workflows, workflows agênticos escritos em Markdown e compilados para GitHub Actions.
- **Lightwell:** oferta da IBM com a Red Hat, lançada em julho de 2026, que corrige vulnerabilidades de open source por backport com motor de IA e engenheiros humanos. É a inspiração do vuln fixer (D-28).
- **Cline CLI e OpenHands:** harnesses de agente de código que rodam sem IDE, contra qualquer endpoint compatível com OpenAI. Cline CLI vem primeiro por ser mais simples de empacotar num pod; OpenHands é a segunda opção.
- **BFCL:** Berkeley Function Calling Leaderboard, benchmark independente de chamada de ferramentas.
- **Rule of Two:** regra da Meta: um agente reúne no máximo dois de três fatores (entrada não confiável, dado sensível, mudar estado ou comunicar).
- **Switchyard:** roteador de modelo da NVIDIA (NeMo) avaliado para o modelo virtual "Auto"; fora da Fase 1.
- **Code Agent Server:** serviço que roda harness de código em pod efêmero; aqui, o passo de agente de P5.
- **Classes de dado:** D0 operacional (métricas, códigos de erro, stack trace sem payload); D1 interno (hostnames, topologia, filas, configs não secretas); D2 pessoal, LGPD (CPF, e-mail, telefone, chave Pix, IP, valor de transação de um cliente); D3 proibido (segredos, tokens, chaves, PAN, senhas, conteúdo de mensagem de liquidação). Ver D-42.

**Changelog**

| Data | Versão | Mudança |
| --- | --- | --- |
| 2026-11-13 | 1.0 | Criado a partir de cinco relatórios de pesquisa e da revisão crítica (judge) |
| 2026-11-14 | 1.1 | Repositórios em org própria (D-27); vuln fixer Maven como primeiro workflow de código, sem gh-aw e com Actions só para CI (D-28 a D-31); P5 reescrita; P6 vira variante gh-aw |
| 2026-11-14 | 1.2 | Org eventloom (D-27); respostas a Q-01, Q-02, Q-04, Q-06, Q-07, Q-08, Q-10, Q-11 e Q-14: replay de laboratório em InfluxDB, GitHub Enterprise na empresa, MLflow em avaliação |
| 2026-11-14 | 1.3 | Respostas a Q-02, Q-03, Q-05, Q-09, Q-10, Q-12, Q-13 e Q-15: GHE assumido Cloud, nenhum endpoint sancionado, baseline prospectivo, card no Teams via Power Automate, squad como dona da PoC, reconstrução na empresa |
| 2026-11-14 | 1.4 | D-32 a D-36 (MLflow, publicação neutra Slack/Teams, gabarito JSONL, injeção de falhas, adapter por fonte incl. Datadog); Q-04, Q-06 e Q-07 atualizadas; primeiro teste definido |
| 2026-11-14 | 1.5 | Revisão sem contexto (40 pontos): Fase 1 inteira no laboratório (D-37); D-03, D-18 e D-26 substituídas; D-05 e D-19 fechadas; D-38 a D-41; P5 obrigatória em todo o texto; custos, canais, P2, P6 e próximos passos alinhados; glossário |
| 2026-11-14 | 1.6 | Diagramas redesenhados (Fase 1 no laboratório, P5 obrigatória, Datadog opcional); classes de dado D0 a D3 (D-42), controle por allowlist + detector (D-43), canários com gate 0 vazamento (D-44) |
| 2026-11-14 | 1.7 | Org criada como open-eda-labs (eventloom estava tomado); D-27, glossário, Q-02, checklist e roteiro atualizados |
| 2026-11-14 | 1.8 | Os 8 repositórios Agora e open-eda-labs.github.io criados; o .github.io vira a base das sessões cloud |

## Contexto executivo

O programa só continua se um replay offline de alertas históricos provar utilidade; todo o resto é condicionado a medições. Nada descrito aqui foi executado: os relatórios de origem são leitura de documentação e de código \[F\]. Este plano transforma essa leitura em etapas com gate.

### Problema

A hipótese é que a triagem inicial de alertas consome tempo de plantão que uma recomendação automática com evidência reduziria \[NV\]. Não há baseline medido de tempo até a primeira hipótese (MTTI) \[NV\]. Os alertas chegam majoritariamente por webhook, de Grafana Alerting e de Azure Monitor/Application Insights (premissa do dono do plano).

A evidência pública de valor é quase toda autorrelatada por fornecedores \[F\]. Por isso o plano mede antes de prometer.

### Objetivo

Entregar, em duas fases, um caminho de "alerta entra, recomendação sai". Só onde a medição justificar, entregar também "alerta entra, PR sai".

- **Fase 1 (PoC):** provar a utilidade da triagem read-only e provar a porta de entrada sob rajada e duplicata.
- **Fase 2 (Adoção Corporativa):** levar a triagem à produção por uma escada de autonomia, com governança.
- **Trilha de executor de código (P4 a P6 e E4):** P5 (vuln fixer) é obrigatória no laboratório desde a v1.1 (D-28); P4, P6 e E4 seguem condicionais.

### Princípios

- **Independência no contrato, não no produto.** As camadas seguem padrões abertos e o executor é trocável (ver D-01).
- **Read-only primeiro.** Nenhuma credencial de escrita em sistema até o degrau Aprovar (ver D-02).
- **Medir antes de escalar.** Limiares e critérios de morte são fixados antes de ligar (ver D-20).
- **Fase 1 enxuta.** O caminho mínimo é P0 → P1 → P3 → P5, todo no laboratório (D-37); P4 e P6 são condicionais. Enxuta quer dizer poucas peças, não peças improvisadas: tudo como código, versões pinadas e recriação do zero com um comando (D-40).
- **Custo de laboratório perto de zero.** Máquina própria; nuvem paga só pontual (ver D-23).

### Escopo

- Alertas de Grafana Alerting e de Azure Monitor/Application Insights recebidos por webhook; Datadog entra por adapter próprio se a empresa usar (D-36). Exceção ao webhook: a varredura agendada de vulnerabilidades do vuln fixer (OSV-Scanner em CronWorkflow, D-30).
- Triagem com saída estruturada: hipótese, evidência, confiança e ação sugerida.
- Três caminhos de consumo de IA, dos quais só a chamada direta entra no caminho mínimo (ver D-08).
- Executor de código com saída só em PR/MR draft e aprovação humana, para classes de alerta selecionadas.

### Não-escopo

- Ação automática em produção na Fase 1.
- Ambientes de liquidação e dados de classe D3 (segredos, chaves, dados de cartão), em qualquer fase.
- Roteamento "Auto", LoRA por tarefa e detectores de injeção como barreira (ver "Descartado ou adiado" em Decisões vigentes).
- Fontes que não falam webhook, como DLQ em Kafka.
- Aconselhamento jurídico: a camada regulatória é só apontamento para Jurídico e Compliance.

### Etapas das duas fases

| Etapas | Onde | O que fazem | Tipo |
| --- | --- | --- | --- |
| P0, P1 | Empresa, sem infraestrutura nova (ver D-26) | Replay de 50 a 100 alertas históricos, uma chamada estruturada, avaliação cega por duas pessoas do plantão | Caminho mínimo |
| P2, P3 | Laboratório, dados sintéticos | Base técnica reduzida e teste do intake sob rajada, duplicata e injeção | Caminho mínimo (P2 é suporte de P3) |
| P4, P6 | Laboratório, dados sintéticos | Medição de tool-calling local e variante gh-aw do executor de código | Condicionais |
| E0 | Empresa | Aceite de Segurança, Arquitetura e Compliance; endpoint de modelo e SCM decididos | Obrigatória |
| E1, E2, E3 | Empresa | Triagem em ambiente não produtivo, shadow em produção e recomendação ao plantão | Obrigatórias |
| E4 | Empresa | Executor de código com PR/MR draft e aprovação humana | Condicional |
| E5 | Empresa | Escala e auto-execução só de baixo risco, em catálogo fechado e com rollback | Condicional |
| P5 | Laboratório, dados públicos | Vuln fixer Maven: CVE e GHSA viram PR draft com evidência e aviso no Slack; humano revisa | Primeiro workflow de código (D-28) |

### O que mudou desde a ideia inicial

| Item | Ideia inicial | Posição em 14/11/2026 | Ver |
| --- | --- | --- | --- |
| Entrada de eventos | Argo Events (EventSource e Sensor) | Intake adapter próprio na frente do Argo Workflows | D-04 |
| Primeira etapa | Laboratório local completo | Replay no laboratório, com falhas injetadas e gabarito (D-34, D-35) | D-03 |
| Local da PoC | Um só laboratório | Tudo no laboratório; a empresa recebe a proposta (D-37) | D-26 |
| LoRA por tarefa | Peça central do serving | Fora da Fase 1; braço opcional de medição em P4 | D-18 |
| Roteador "Auto" e Switchyard | Modelo virtual no gateway | Fora; uma classe de tarefa pede um modelo fixo | "Descartado ou adiado" |
| Harness de código | Parte do fluxo desde o início | Em P5, no vuln fixer (D-28) | D-18 |
| Independência tecnológica | Escolher o produto mais aberto | Cobrar o contrato entre as peças | D-01 |
| CI nativo (gh-aw, GitLab Duo) | Em conflito com a regra de independência | Executor condicional, atrás de um driver fino | D-19 |
| Hardware do laboratório | "Uma GPU de 12 GB" | Notebook com 8 GB de VRAM; 12 GB só no desktop opcional | D-16 |
| Primeiro workflow de código | Harness genérico, só se P1 apontasse classes com saída em código | Vuln fixer Maven (CVE e GHSA), sem gh-aw; GitHub Actions só para CI | D-28 |
| Repositórios | Três repositórios sugeridos | GitHub organization própria, um repositório por peça trocável | D-27 |

## Decisões vigentes

São 44 decisões: 40 vigentes, 1 condicionada a resposta da empresa (D-07) e 3 substituídas (D-03, D-18, D-26). Em conflito entre relatórios, vale o mais recente (14/11/2026). Vereditos do judge são opinião fundamentada, não fato medido.

Para atualizar uma decisão, mude só a linha dela e a coluna Status. Uma decisão substituída não é apagada: recebe o status "substituída por D-nn".

| ID | Decisão | Por quê | Status | Revisitar quando |
| --- | --- | --- | --- | --- |
| D-01 | Cobrar independência do contrato entre as peças, não do produto que executa | Quebras de 2026 vieram de padrões abertos mudando, não só de fornecedor \[I\] | vigente | P5 mostrar que trocar executor custa mais que um adaptador |
| D-02 | Fase 1 e degraus Shadow e Recomendar são read-only, sem credencial de escrita. Exceção única: no laboratório, o passo de publicação do vuln fixer (P5) recebe token curto de GitHub App que só cria branch e PR draft no demo-service (D-31) | Reduz a superfície a leitura e publicação \[I\] | vigente | Entrada em E4 |
| D-03 | Começar por replay offline de 50 a 100 alertas com desfecho, sem infraestrutura nova | "Isso é útil?" se responde sem ingress nem risco \[I\] | substituída por D-34 e D-35 | Não houver histórico com desfecho, ou o replay não for autorizado |
| D-04 | Pôr um intake adapter próprio na frente do Argo; nunca expor o Argo Server | Endpoint nativo só autentica por token de ServiceAccount; assinatura só para github, gitlab e bitbucket \[F\] | vigente | PoC com Grafana direto sob rajada e Azure por Logic App ou Function dispensar o adapter |
| D-05 | Argo Workflows é a camada neutra de triagem | Regra de independência. Q-01: a empresa não opera Argo; Rafa o sugere na proposta, com o caminho Function/Logic App como alternativa \[I\] | vigente (laboratório); na empresa, proposta | Inventário mostrar que não há Argo em produção com dono e janela de patch |
| D-06 | Chamada direta estruturada antes de harness, com coleta determinística de evidência | Sem coleta, a saída vira paráfrase do alerta \[I\] | vigente | Shadow com menos de 30% de saídas úteis \[P\] |
| D-07 | AI Gateway: manter o princípio; na empresa, começar com `base_url` configurável; no laboratório, LiteLLM + Postgres é opcional | Um único consumidor não justifica produto \[I\] | condicionada (Q-03) | Segundo consumidor, quota por time ou exigência de Risco |
| D-08 | Três caminhos de consumo: IDE ao gateway, chamada direta, harness headless PR-only | Tipos de tarefa e superfícies de risco diferentes \[I\] | vigente (só a chamada direta no caminho mínimo; harness só em P5) | P1 e P3 medirem a fração de alertas com saída em código |
| D-09 | Contrato de modelo: Chat Completions stateless, `tools` em JSON Schema, nomes lógicos, sem depender de `tool_choice` | Denominador comum de vLLM, Ollama e LiteLLM \[F\]; desenho \[I\] | vigente | Open Responses publicar versão e matriz de conformidade |
| D-10 | Evento: envelope CloudEvents com `data` próprio; duplicata definida por `source` + `id` | Envelope estável \[F\]; conteúdo "alerta" sem padrão aberto encontrado \[F\]; esquema \[P\] | vigente | Surgir padrão aberto para conteúdo de alerta |
| D-11 | Saída: `recommendation.json` validado por schema e publicado por passo sem modelo | Concentra credencial de escrita onde não há modelo \[I\] | vigente | Nunca sem nova análise de segurança |
| D-12 | Auditoria append-only desde o dia 1, fora do OTel; tracing reduzido a `trace_id` propagado, com OTel Collector opcional | Convenções GenAI do OTel seguem em Development \[F\] | vigente | Dois ou mais saltos com latência a depurar |
| D-13 | Guardrails por arquitetura: schema rígido, lista de campos permitidos, escrita fora do agente | Detectores foram contornados em estudo independente \[F\] | vigente | Suíte de injeção em português falhar repetidamente |
| D-14 | Ferramentas por MCP read-only, revisão fixada por servidor, allowlist por digest | MCP quebrou compatibilidade na revisão 2026-07-28 \[F\] | vigente | Cada mudança de revisão do MCP |
| D-15 | Instruções em `AGENTS.md` e skills em `.agents/skills/`, fonte única | Formato é portável; o diretório não \[F\] | vigente | Um harness adotado não ler esse caminho |
| D-16 | Modelo local fora do cluster, como endpoint HTTP; llama.cpp ou Ollama no laboratório | vLLM só roda em Linux; GPU em k3s sobre WSL2 sem doc \[F\] | vigente | Laboratório migrar para Linux nativo |
| D-17 | Manter Windows 11 no notebook e rodar o laboratório em WSL2 | Periféricos dependem de correções em Linux \[F\] (relato de comunidade) | vigente | Suporte de hardware em Linux mudar |
| D-18 | Fase 1 enxuta: caminho mínimo P0 → P1 → P3; P4 a P6 são condicionais; LoRA só como braço opcional de P4 | O judge cortou LoRA, "Auto", harness e executor da fase 1 inicial; "trocável" é hipótese; saída útil de alerta raramente é PR \[I\] | substituída por D-28 e D-37 (P5 obrigatória; P4 e P6 condicionais) | P1 apontar classes com saída em código (Q-09) |
| D-19 | Executor de CI nativo é escolhido pelo SCM da empresa | O que a empresa já opera pesa mais que a preferência \[I\] | vigente: GitHub nos dois lados; empresa assumida GHE Cloud (Q-02) | Resposta de Q-02 |
| D-20 | Fixar limiares e critérios de morte antes de ligar qualquer etapa | Nenhum limiar vem de padrão publicado \[F\] | vigente | A cada etapa, antes do início |
| D-21 | Limitar tempestade e custo no adapter: semáforo, teto diário, disjuntor, kill switch | Sem o `rateLimit` do Sensor nada limita Workflows por minuto \[I\] | vigente | Teste de rajada em P3 |
| D-22 | Lista de campos permitidos antes do primeiro prompt; Workflow recebe chave e referência, não o payload | Parâmetros do Workflow ficam no etcd, na UI e no archive \[F\] | vigente | Segurança e DPO definirem outra regra |
| D-23 | Laboratório em máquina própria; nuvem paga só pontual | Restrição do dono do plano | vigente | P5 ou P6 exigirem endpoint remoto recorrente |
| D-24 | Separar projeto pessoal e proposta corporativa; dado da empresa não entra no laboratório | Reuso exige autorização escrita (opinião do judge); regra de dados \[I\] | vigente | Autorização escrita (Q-15) |
| D-25 | Escada de autonomia: Shadow, Recomendar, Aprovar, Auto-executar baixo risco | Proposta de projeto, não padrão publicado \[P\] | vigente (degraus altos adiados para E4 e E5) | Gate de cada degrau |
| D-26 | PoC em duas trilhas: P0 e P1 na empresa, com alertas reais e endpoint sancionado; P2 a P6 no laboratório, só com dados sintéticos | O replay pede histórico real e "endpoint já sancionado" \[F\]; o laboratório não recebe dado da empresa (D-24); a separação em trilhas é leitura nossa das fontes \[I\] | substituída por D-37 (Q-14 negada) | Q-14 negada: P1 não roda e E2 vira a primeira medida de valor (R-19, R-27) |
| D-27 | Repositórios separados numa GitHub organization própria chamada open-eda-labs (nome neutro, sem relação com a empresa); dado ou código da empresa nunca entra nela | Cada peça trocável vira um repositório que só depende do contrato versionado (D-01, D-24) \[I\] | vigente | Empresa exigir outro SCM para a versão corporativa |
| D-28 | Primeiro workflow de código: vuln fixer (CVE e GHSA), inspirado no Lightwell, sem gh-aw; GitHub Actions só para CI | Saída útil é mudança de código e os dados são públicos; o agente roda no Argo e só o driver de PR é específico do GitHub \[I\]; gh-aw vira variante posterior em P6 | vigente | Gate G-P5 |
| D-29 | Ecossistema inicial do vuln fixer: Maven | osv-scanner fix suporta Maven pela estratégia override, ainda marcada como experimental \[F\]; afinidade com a stack Java do dono do plano | vigente | Pedido de um segundo ecossistema |
| D-30 | Detecção por OSV-Scanner num CronWorkflow do Argo; webhook dependabot\_alert só como fonte extra, pelo intake adapter | Alertas do Dependabot não estão na lista de eventos que disparam workflow do Actions \[F\]; a base OSV é aberta e agrega GHSA \[I\] | vigente | Varredura agendada atrasar demais a correção |
| D-31 | Notificação no Slack com CTA "Revisar PR"; o human-in-the-loop é o review do PR, e o agente nunca faz merge | Botão Block Kit chama o endpoint de interatividade e mostra aviso sem resposta 200 \[F\] (resposta antiga de terceiros); no laboratório o CTA é link em texto via incoming webhook (D-41) | vigente | Necessidade de ação no próprio Slack |
| D-32 | MLflow para rastreio, avaliação e registro de prompts no laboratório; não é a trilha de auditoria | Registro do MLflow pode ser alterado; auditoria exige log encadeado com WORM \[I\] | vigente | Empresa já padronizar outra ferramenta de LLMOps |
| D-33 | Publicação num schema próprio e neutro; adapter Slack no laboratório agora, adapter Teams (card via Power Automate, atualizável por messageId) depois | A empresa usa Teams; o canal vira detalhe trocável, como o executor (D-01) \[I\] | vigente | Webhook do Power Automate não devolver messageId \[NV\] |
| D-34 | Replay: séries no InfluxDB; gabarito de desfecho em JSONL versionado no triage-eval, revisado por PR | Sem desfecho não há medida de acerto; arquivo versionado é imutável por versão e auditável \[I\] | vigente | Volume do gabarito passar do que um repo Git comporta bem |
| D-35 | Alertas do replay gerados por injeção de falhas scriptada no demo-service (latência, erro, OOM), com seed fixa | O alerta percorre o caminho real (métrica, Grafana, webhook) e o replay se repete igual \[I\] | vigente | Cenários injetados não representarem incidentes reais na avaliação da empresa |
| D-36 | Um adapter por fonte no intake (Grafana, Azure Monitor, Datadog se houver), todos normalizando para CloudEvents | A empresa pode usar Grafana self-hosted ou Datadog; o resto do fluxo não muda \[I\] | vigente | Fonte sem webhook (exige pull) |
| D-37 | Fase 1 inteira no laboratório, P0 a P6; P0 e P1 rodam sobre o replay com falhas injetadas; a empresa recebe a proposta com os números do laboratório | Q-14 negada: nada roda na empresa antes de E0; Q-03 sem endpoint sancionado \[P\] | vigente | Autorização escrita para replay com alertas reais |
| D-38 | Avaliação de P1: acerto de causa medido contra o gabarito JSONL (D-34); utilidade julgada por Rafa às cegas, sem saber a configuração | Não há plantão no laboratório; o gabarito dá a medida objetiva \[P\] | vigente | Um colega disponível para segunda avaliação cega |
| D-39 | G-P5 medido sobre 20 PRs no demo-service, com dependências Maven de CVEs reais conhecidas, misturando bump simples e bump que quebra o build | Amostra pequena o bastante para montar, grande o bastante para uma taxa (1 PR = 5 pontos) \[P\] | vigente | Resultado na faixa de 60% a 80%, que pede amostra maior |
| D-40 | Laboratório com poucas peças em padrão de produção: tudo como código, versões pinadas, segredos fora do Git, testes, recriação do zero com um comando; cada gate exige reprodução limpa | Concilia Fase 1 enxuta com escala reproduzível pedida por Rafa \[P\] | vigente | Proposta exigir HA ou backup já demonstrados |
| D-41 | Slack do laboratório por incoming webhook, com o CTA "Revisar PR" como link em texto; botão com feedback só depois do intake (P3) | Sem Slack App nem endpoint público, P5 não depende de P3 (D-31) \[I\] | vigente | Necessidade de feedback clicável no Slack |
| D-42 | Quatro classes de dado: D0 operacional vai a qualquer modelo sancionado; D1 interno só a modelo interno ou endpoint com contrato e residência; D2 pessoal só a modelo interno, redigido antes; D3 nunca sai. A regra vale também para traces e MLflow | Os relatórios citavam D1/D2 só em modelo interno e D3 fora, sem definir; faltava o nível operacional \[P\] | vigente | Política de classificação da empresa (mapear na proposta) |
| D-43 | Controle de classe: allowlist de campos no intake e nos coletores, mais detector (regex ou Presidio) que mascara D2 e bloqueia D3 em texto livre | Allowlist é previsível; mensagem de log em texto livre escapa dela e pede o detector \[I\] | vigente | Detector com falso negativo acima do gate de D-44 |
| D-44 | Canários sintéticos de D2 e D3 no replay (CPF falso, PAN de teste, token falso); gate em P1 e P3: nenhum canário chega ao modelo, ao MLflow ou ao trace | Prova a redação no laboratório e leva evidência à proposta \[P\] | vigente | Nenhum |

### Descartado ou adiado

| Item | Situação | Motivo | Volta quando |
| --- | --- | --- | --- |
| Argo Events | Descartado da entrada | Sem minor desde a 1.9.0 de 01/2024; ack do JetStream mesmo após falha do trigger \[F\] | P3 reprovar e for preciso broker durável |
| Langflow, n8n, Kestra, Windmill, Flowise, Dify como camada de controle ou executor | Descartado | Histórico de segurança e licenças \[F\] (parte por imprensa) | Requisito explícito de autoria low-code, só em triagem read-only |
| "Auto", Switchyard, qualquer roteador | Adiado | Uma classe de tarefa pede um modelo fixo; Switchyard é pre-1.0 \[F\] | Dois modelos em que o barato passa o mesmo eval, com pressão de custo medida |
| LoRA, multi-adapter, llm-d | Fora do caminho mínimo e da proposta corporativa; braço opcional em P4 | Única evidência direta: 0,17 a 0,34 ponto de Pass@1 em modelo de 1,3B \[F\] | A/B de três braços com ganho de 5 pontos percentuais ou mais \[P\] |
| NeMo Guardrails, Prompt Guard, Llama Guard, Garak | Adiado | Detectores aumentam superfície e prazo; o controle é arquitetural \[I\] | Suíte de injeção falhar repetidamente |
| Convenções GenAI do OTel completas, Langfuse | Adiado | Spec sem release, "Schema URL: TODO" \[F\]; Langfuse v3 exige quatro serviços \[F\] | Dois ou mais saltos com latência a depurar |
| Devin | Não avaliado como executor | O Devin dedicado não roda na VPC do cliente \[F\] (fornecedor); fere D-01 \[I\] | Sem condição prevista |
| Gate `suspend` com SSO | Adiado | Em read-only não há ação a aprovar \[I\] | Degrau Aprovar (E4) |
| Ponte de DLQ em Kafka | Adiado | Entrada é majoritariamente webhook | Fonte não webhook virar requisito |
| Temporal, Dapr Workflow | Adiado | Só se o modelo de pods não atender espera longa ou retry fino \[I\] | PoC de aprovação reprovar |
| A2A, Dagger | Descartado | Camada desnecessária para "alerta entra, PR sai" \[I\] | Sem condição prevista |
| Tiers pagos de nuvem (de €30 + US$ 17 por mês a €214 por mês fixos) | Adiado | O laboratório roda em máquina própria (D-23) | Máquina própria não bastar |
| xLAM e Hammer como modelos | Descartado | Licença cc-by-nc \[F\] | Sem condição prevista |
| gh-aw no vuln fixer | Adiado | A primeira versão fica sem fornecedor de agente (D-28) | Depois de G-P5, como variante atrás do mesmo contrato (P6) |

### Correções aplicadas

| Tema | O que estava errado | Versão certa |
| --- | --- | --- |
| Status do gh-aw | "Public Preview, versão 0.x" | GA em github.com desde 28/10/2026; tag v1.2.3 em 12/11/2026; sem estabilidade de API \[F\] |
| gh-aw em GHES | "Suportado até 3.21.x" | Disponibilidade ponta a ponta não confirmada pela própria doc \[F\] |
| Runners do gh-aw | Windows citado por changelog antigo | Só Linux com Docker; macOS e Windows não suportados \[F\] |
| "Each trigger produces one run" | Lida como garantia de entrega | Frase é sobre custo; dispatch devolve 204 sem ID de run \[F\] |
| Envoy AI Gateway | Recomendado com o nome antigo | Renomeado para Agent Router em 09/09/2026, sob a Agentic AI Foundation \[F\] |
| Hardware do laboratório | "Uma GPU de consumidor de 12 GB" | Notebook tem 8 GB de VRAM; 12 GB só no desktop \[F\] |
| Colisão de nome de Workflow | Funcionaria como deduplicação benigna | Vira erro de criação e, no modo síncrono, erro ao emissor \[F\] (código) |
| Dispatch de eventos do Argo | "Sem retry" | Erros transitórios são retentados \[F\] (código) |
| `--event-worker-count` | "Default não informado" | Default é 4 \[F\] (código da v4.1.6) |
| Assinatura de webhook no Argo | "Não verificado" | Só github, gitlab, bitbucket e bitbucketserver; sem HMAC genérico nem Entra \[F\] |
| Doc do Argo v4.1.6 | Endpoint assíncrono com 64 eventos | Código da mesma tag: síncrono por padrão; assíncrono com fila de 16 e 503 \[F\] |
| Reenvio pelo emissor | Azure reenviaria em falha | Action Group só retenta 408, 429, 503 e 504 \[F\]; reenvio em erro interno não ocorre \[I\] |
| Perda ao sair do Argo Events | "Só a dedup de 300 s" | Saem também `rateLimit`, filtros, transformação e desacoplamento do ingress \[I\] |
| `atLeastOnce` no Argo Events | Garantia com retry e DLQ | Ack sempre após o trigger; default é `false` \[F\] (código) |
| Rule of Two na chamada direta | "Fica dentro da regra" | Só com controle de saída: schema rígido e links montados pelo workflow \[I\] |
| LoRA e tool-calling | "Duas notas apontam o risco de forma independente" | Duas inferências do mesmo processo; sem fonte \[F\] |
| Custo do piloto | "Ordem de dezenas de dólares" | US$ 260 a 350 por mês, com 15 a 20 investigações por semana a US$ 4 (número de fornecedor) \[F\] |
| Cronograma 30/60/90 | Laboratório nos dias 0 a 30 | Mesma fonte estima 132 a 210 h, ou 16 a 26 semanas em meio período \[F\]; este plano não usa datas |
| "Aprovação humana" na Fase 1 | Gate de aprovação | Em read-only é feedback; nada é aprovado \[I\] |

## Arquitetura de referência

A arquitetura é um intake próprio, um Workflow de quatro passos e um contrato aberto de seis camadas. O executor de código fica atrás desse contrato e é condicional (ver D-18). O adapter autentica, normaliza e deduplica antes de qualquer orquestrador. O desenho é inferência de arquitetura, não testada \[I\].

&#91;embedded content: arquitetura de referência · 13 componentes, vuln fixer obrigatório\]

Nada à esquerda do intake fala direto com o Argo; a única saída com escrita é o PR draft do vuln fixer, que depende de review humano. Tracejado: Datadog, só se a empresa usar.

### Fluxo ponta a ponta

1. Grafana Alerting ou Azure Monitor/Application Insights emite o alerta por webhook.
2. O intake adapter autentica a origem: HMAC, mTLS ou Bearer no Grafana; token Entra do Secure Webhook no Azure.
3. O adapter valida schema e tamanho, e explode `alerts[]` do Grafana em eventos individuais.
4. O adapter normaliza para CloudEvents, gera um trace ID novo e deduplica com janela de tempo (ver D-10).
5. O adapter aplica limites de tempestade e responde 2xx rápido, sem chamar o modelo (ver D-21).
6. O adapter submete o Workflow ao Argo Server interno, com nome determinístico; passa só chave e referência (ver D-22).
7. Passo 1 do Workflow: checar dedup e orçamento.
8. Passo 2: coletar evidência por consultas read-only fixas por tipo de alerta.
9. Passo 3: uma chamada ao modelo pelo AI Gateway ou por `base_url`, com saída no schema de recomendação (ver D-07).
10. Passo 4: um passo sem modelo valida a saída e publica pelo contrato de publicação neutro (D-33), em Slack no laboratório e card no Teams na empresa, com botões "útil / não útil / errado" (ver D-11).
11. Cada execução grava um registro de auditoria append-only com o `trace_id` (ver D-12).
12. Só na trilha de executor (P5, P6 e E4): um driver fino traduz o evento para o executor de código. O executor devolve status e patch. Um passo sem modelo abre o PR/MR draft e um humano aprova.

A submissão do passo 6 usa `/api/v1/events/{namespace}/{discriminator}` com `WorkflowEventBinding` \[F\]. O adapter repassa `x-ce-id` e `x-ce-source`, porque o Argo só expõe headers `x-` às expressões \[F\]. O uso é inferido, não testado \[I\].

### Contrato aberto por camada

| Camada | Padrão | Maturidade | Nossa escolha | Marcação |
| --- | --- | --- | --- | --- |
| Evento de entrada | Envelope CloudEvents 1.0.x; extensões `traceparent` e `dataref` | Envelope estável; conteúdo "alerta" sem padrão | `schemas/alert-event.json`: envelope CloudEvents com `data` próprio e pequeno | \[F\] envelope; \[P\] `data` |
| Modelo | Chat Completions (padrão de fato); Open Responses na AAIF desde 22/10/2026 | Estável na prática; Open Responses sem versão publicada | `/v1/chat/completions` stateless, nomes lógicos no gateway, suíte fixa de tool-calling por rota | \[F\] APIs; \[I\] contrato |
| Ferramentas | MCP, Streamable HTTP, OAuth 2.1 com RFC 8707 | Adotado, com quebra na revisão 2026-07-28 e histórico de CVEs | Revisão fixada por servidor, allowlist por digest, somente leitura na triagem | \[F\] spec; \[I\] contrato |
| Instruções | `AGENTS.md`; Agent Skills (`SKILL.md`) | `AGENTS.md` simples e muito adotado; skills com partes experimentais | Fonte única em `.agents/skills/`, só `name` e `description` | \[F\] formatos; \[I\] diretório |
| Saída | SARIF 2.1.0 para achado em arquivo e linha | Sem padrão para recomendação | `schemas/recommendation.schema.json`; status final `pr_opened`, `no_change` ou `failed` | \[P\] |
| Trace e auditoria | W3C Trace Context; RFC 9162; storage WORM | Trace Context estável; semconv GenAI sem release | `trace_id` no evento, na saída e na auditoria; registro encadeado por hash | \[F\] padrões; \[I\] contrato |
| Empacotamento do passo | Imagem OCI | OCI estável; definição de workflow não é portável | Entrada em `/in`, saída em `/out`, variáveis `OPENAI_BASE_URL`, `MODEL`, `MCP_CONFIG`, `TRACEPARENT` | \[P\] |

A sétima linha é a interface do passo do agente; as seis anteriores são o contrato. HMAC do Grafana e token Entra ficam no adapter, fora do contrato, porque a spec de webhook do CloudEvents não define assinatura do corpo \[F\].

### Onde roda

| Componente | Laboratório | Empresa |
| --- | --- | --- |
| Emissores | Payloads sintéticos, ou capturados pelo botão "Test" de um Grafana de laboratório \[P\] | Grafana Alerting e Azure Monitor/Application Insights |
| Intake adapter | Pod no k3s do notebook; exposto por Tailscale Funnel só se um emissor SaaS precisar | Atrás de ingress privado, na mesma rede do orquestrador |
| Orquestrador | Argo Workflows no k3s sobre WSL2, com 2 réplicas do Argo Server | Argo Workflows se já operado; senão o que existe (ver D-05, Q-01) |
| Coletores read-only | mcp-grafana com `--disable-write` contra o Grafana de laboratório | mcp-grafana read-only; query API do Azure com identidade Reader e KQL pré-aprovado |
| AI Gateway | `base_url` direto ao modelo; LiteLLM + Postgres pequeno é opcional | `base_url` configurável para o endpoint sancionado (ver D-07, Q-03) |
| Modelo | llama.cpp ou Ollama fora do cluster: notebook (8 GB) ou desktop (12 GB) pela tailnet (ver D-16) | Endpoint de modelo sancionado \[NV\] (ver Q-03) |
| Publicação e feedback | Slack por incoming webhook (D-41) | Card no Teams via webhook do Power Automate (D-33, Q-12) |
| Auditoria | Arquivo append-only encadeado por hash | Registro encadeado por hash com checkpoint em storage WORM |
| Tracing | `trace_id` em log; OTel Collector para MLflow é opcional | Stack de observabilidade existente \[NV\] |
| Executor de código (condicional) | Vuln fixer: harness em container sob o Argo, PR por GitHub App no demo-service; gh-aw como variante posterior | Conforme o SCM (ver D-19, Q-02) |

## Fase 1 PoC: visão geral

O caminho mínimo da PoC é P0 → P1 → P3 → P5, todo no laboratório (D-37), e só ele é obrigatório. P1 responde "a triagem é útil?" e decide se o programa continua. P3 responde "a porta de entrada aguenta rajada e duplicata?". P2 é a base técnica de P3 e P5. P5 responde "o agente abre PR que passa no CI?" (D-28). P4 e P6 são condicionais.

&#91;embedded content: roteiro sem datas · Fase 1 no laboratório, 13 etapas, 14 gates\]

A Fase 1 corre inteira no laboratório, em ordem P2, P0, P1, P3 e P5; P4 alimenta o N2 de P5 e P6 é a variante gh-aw. Sem G-P5, o G-PoC não fecha. A largura das faixas não representa duração.

### Caminho mínimo e etapas condicionais

| Grupo | Etapas | Abre quando | Se não abrir |
| --- | --- | --- | --- |
| Caminho mínimo | P0, P1, P3 (com P2 reduzida como suporte) | Nenhuma pergunta da empresa: tudo roda no laboratório (D-37) | Sem P1, vale a exceção do gate G-PoC |
| Condicional barata | P4 | O nível N2 de P5 precisar de modelo local com ferramentas | Triagem segue; ela não depende de tool-calling (ver R-14) |
| Condicional de executor | P6 | P5 passar em G-P5 e a licença Copilot ser providenciada (Q-08) | O harness próprio de P5 continua sendo o executor; decisão de executor nativo é "nenhum por ora"; E4 não abre |

**Atualização de 14/11/2026 (D-28).** P5 virou o vuln fixer Maven e deixou de ser condicional no laboratório: vulnerabilidade em dependência já é uma classe com saída em código, com dados públicos. Q-09 continua valendo para a empresa. P6 passa a ser a variante gh-aw do mesmo fluxo.

P4 custa de 1 a 2 dias e pode ser antecipada \[P\]. Ela não bloqueia o caminho mínimo.

### Duas trilhas (ver D-26)

- **Trilha empresa (substituída por D-37):** nada roda na empresa antes de E0 (Q-14); P0 e P1 rodam no laboratório sobre o replay com falhas injetadas (D-34, D-35). A empresa recebe a proposta com os números do laboratório.
- **Trilha laboratório (P0 a P6):** usa só dados sintéticos ou públicos, em máquina própria (ver D-24).

A separação é leitura nossa das fontes \[I\] e depende de autorização da empresa (ver Q-14). As trilhas não trocam dados. O laboratório só entrega à empresa desenho e resultados de teste; reuso de código pede autorização escrita (ver Q-15).

**Ordem recomendada \[P\].** P0 e P1 primeiro. P2 e P3 podem correr em paralelo, porque custam só tempo de laboratório. Se P1 reprovar, P3 perde a função no programa.

**Prazo indicativo.** As fontes só estimam três trechos \[F\]. Replay: 1 a 2 semanas. Medição de tool-calling: 1 a 2 dias. Testes de intake e de duplicata: uma tarde cada. As demais etapas não têm estimativa \[NV\].

### Ambiente de laboratório

| Máquina | Hardware | Papel | Limites |
| --- | --- | --- | --- |
| Notebook | 32 GB de RAM; RTX 4070 Laptop com 8 GB de VRAM; Windows 11 | k3s, Argo e adapter dentro do WSL2; modelo nativo no Windows para demo offline | Modelo de cerca de 8B em Q4, com contexto de 8k a 16k \[I\] |
| Desktop (opcional) | RTX 3060 com 12 GB de VRAM; Ollama | Backend primário de modelo, pela tailnet | Modelos de até cerca de 14B em Q4, com 8k a 16k \[I\] |
| Tailscale | Tailnet entre as duas máquinas | Tráfego cifrado; tag de máquina no desktop e regra por porta | Funnel só serve `*.ts.net` nas portas 443, 8443 e 10000 \[F\] |

| Limite | Efeito no plano |
| --- | --- |
| 8 GB de VRAM no notebook | Qwen3-8B Q4\_K\_M (5,2 GB) cabe com 8k a 16k; 12B ou mais não cabe \[I\]; acima de 8 GB há offload para CPU |
| vLLM só roda em Linux ou WSL2 \[F\] | Serving do laboratório é llama.cpp ou Ollama (ver D-16) |
| Contexto padrão de 4k no Ollama para GPU com menos de 24 GiB \[F\] | Definir `OLLAMA_CONTEXT_LENGTH`; sem isso o prompt é truncado \[I\] (ver R-16) |
| WSL2 dá à VM 50% da RAM por padrão \[F\] | Orçamento estimado da stack completa é de 14 a 21 GB de 32 GB, não medido \[I\] |
| GPU dentro do k3s sobre WSL2 sem doc \[F\] | Modelo fica fora do cluster, como endpoint HTTP (ver D-16) |
| Modelo de 8B com 8k a 16k | Provavelmente serve para triagem, não para agente de código \[I\] (ver Q-11) |

### Custo esperado

O caminho mínimo custa perto de zero, porque roda em máquina própria com modelo local (Ollama); nenhum endpoint está sancionado (Q-03). Gastos pontuais possíveis: endpoint remoto só se o N2 de P5 precisar, minutos do Actions acima da cota gratuita e, na empresa, licença Copilot (Q-08). Slack free, GitHub App, MLflow, InfluxDB OSS e Grafana OSS não custam nada \[I\].

| Gasto possível | Etapa | Valor lido | Marcação |
| --- | --- | --- | --- |
| Endpoint remoto de modelo, se o local não sustentar o loop de agente | P5, P6 | US$ 7,20 a US$ 17,20 por mês, para 20M de tokens de entrada e 4M de saída | \[F\] preço de lista; volume não medido \[NV\] |
| GitLab: trial Ultimate de 30 dias, com 24 créditos por usuário | P6 | Sem custo no trial | \[NV\] (uma leitura) |
| GitHub Actions: minutos em repositório privado com runner hospedado | P6 | Não estimado | \[NV\] |

Nenhum tier pago de nuvem é necessário (ver "Descartado ou adiado" em Decisões vigentes).

### Etapas

| ID | Etapa | Tipo | Trilha | Depende de | Gate | Critério principal do gate \[P\] |
| --- | --- | --- | --- | --- | --- | --- |
| P0 | Preparação e baseline | Caminho mínimo | Empresa | Q-03, Q-04, Q-14 | G-P0 | 50 ou mais alertas com desfecho; limiares assinados; endpoint sancionado |
| P1 | Replay offline | Caminho mínimo | Empresa | P0 | G-P1 | 60% ou mais de recomendações úteis, n de 50 ou mais; abaixo de 30% o programa para |
| P2 | Laboratório base (reduzida) | Suporte de P3 | Laboratório | Nenhuma | G-P2 | Pod no k3s alcança o modelo; RAM ociosa até 21 GB |
| P3 | Intake e Workflow de 4 passos | Caminho mínimo | Laboratório | P2 | G-P3 | 0 perda silenciosa; duplicatas até 1%; suíte de injeção em 100% |
| P4 | Medição de tool-calling local | Condicional | Laboratório | P2 | G-P4 | 90% de schema válido e 80% de ferramenta correta, ou seguir com endpoint remoto |
| P5 | Vuln fixer Maven, PR-only | Primeiro workflow de código | Laboratório | P2 (P3 e P4 opcionais) | G-P5 | 80% ou mais de 20 PRs com CI verde (D-39); 0 escrita fora do PR draft |
| P6 | Executor de CI nativo | Condicional | Laboratório | P5, Q-02, Q-08 | G-P6 | Suíte de injeção em 100% sem recurso experimental no caminho principal |

Os critérios completos de cada gate estão em "Fase 1 PoC: etapas detalhadas".

### Gate final da PoC (G-PoC)

A PoC passa quando as quatro condições abaixo valem ao mesmo tempo.

| Condição | Evidência |
| --- | --- |
| G-P1 aprovado | `docs/replay-report.md` com os limiares de utilidade atingidos |
| G-P3 aprovado | Relatório de rajada, duplicata, injeção e auditoria |
| Artefatos do contrato versionados | Dois schemas, `AGENTS.md`, skills e suíte de avaliação em `triage-contract` |
| Decisão escrita sobre o executor de código | `docs/poc-gate.md`: qual executor e para quais classes, ou "nenhum por ora" |

"Nenhum por ora" vale só para o executor de CI nativo (P6), quando ele não abre; P5 sempre roda no laboratório e o G-PoC exige G-P5 (D-37). O resultado alimenta o ADR unificado de E0.

**Exceção \[P\].** Se P1 não rodar por falta de histórico ou de autorização (Q-04, Q-14), G-PoC não fecha. E0 só abre com decisão escrita do patrocinador, e E2 vira a primeira medida de valor (ver R-19).

**Se P1 reprovar.** O programa para. A entrega útil é o baseline de MTTI.

## Fase 1 PoC: etapas detalhadas

Cada etapa tem um gate numérico, e todos os limiares são proposta a fixar antes de começar \[P\]. Nenhum limiar vem de padrão publicado \[F\]. Nomes de arquivos e repositórios são sugestão \[P\].

**Como manter.** Toda etapa tem os mesmos nove campos, na mesma ordem. São eles: Status, Classificação, Depende de, Objetivo e escopo, Entregáveis, Go/No-Go, Riscos e mitigação, Requisitos e Saída para a próxima etapa. Uma etapa é atualizada sem tocar nas outras. Valores de Status: Não iniciada, Em andamento, Bloqueada (com o ID que bloqueia), Concluída (Go), Encerrada (No-Go), Não aberta (condição não atendida).

**Repositórios (D-27).** Ficam na GitHub organization open-eda-labs (nome neutro, criada em 14/11/2026). Na empresa, os mesmos nomes valem em repositórios internos, sem cópia do laboratório (ver D-24).

| Repositório | Conteúdo | Quando |
| --- | --- | --- |
| `.github` | Perfil da org, templates de issue e PR, CODEOWNERS padrão, workflows reutilizáveis de CI | Agora |
| `triage-contract` | `schemas/alert-event.json`, `schemas/recommendation.schema.json`, `AGENTS.md`, `.agents/skills/`; versionado por tag semver | Agora |
| `triage-eval` | Runner de replay, suíte de injeção em português, casos de tool-calling, relatórios; só dados sintéticos ou públicos | Agora |
| `intake-adapter` | HMAC, normalização CloudEvents, dedup com janela, limites, kill switch, ack 200 do Slack | Agora |
| `agent-workflows` | `WorkflowEventBinding`, `WorkflowTemplate` de triagem, `CronWorkflow` e `WorkflowTemplate` do vuln fixer, imagens dos passos sem modelo (scan, fix, publicação); a imagem do harness fica em agent-step-images | Agora |
| `lab-infra` | WSL2, k3s, values do Argo, ACLs da Tailscale, footprint medido | Agora |
| `demo-service` | App Maven com cerca de 20 dependências com CVEs reais conhecidas (D-39), testes e CI no GitHub Actions. Dois papéis: alvo dos PRs do vuln fixer e alvo da injeção de falhas do replay, exportando métricas para o Grafana e o InfluxDB do laboratório (D-35); o script de cenários fica em chaos/ | Agora (D-28) |
| `agent-step-images` | Imagens OCI do passo de agente (Cline CLI, OpenHands) com contrato `/in` e `/out` | Agora (nível N2 de P5) |
| `executor-drivers` | Driver do gh-aw e, se houver, do GitLab Duo | Só em P6 |
| open-eda-labs.github.io | Base das sessões do Claude Code cloud: CLAUDE.md, PROGRESS.md e docs/PLANO\_MESTRE.md; site do projeto no GitHub Pages. O .github não serve de base porque sessões cloud não anexam repositório cujo nome começa com ponto | Agora (criado em 14/11/2026) |

O contrato fica separado do eval porque precisa ser estável, e o eval muda toda semana \[P\].

### P0 Preparação e baseline

**Status.** Não iniciada.

**Classificação.** Caminho mínimo; trilha laboratório (D-37).

**Depende de.** P2 (G-P2), que sobe InfluxDB, Grafana e demo-service do replay; nenhuma pergunta da empresa (D-37).

**Objetivo e escopo.** Deixar pronto o que o replay precisa: dados, baseline e regras de parada. Roda na empresa, sem infraestrutura nova.

**Entregáveis.**

- `docs/alert-inventory.md`: tipos de alerta, volume, emissor e dono.
- `eval/replay-set/`: 50 a 100 alertas de Grafana e Application Insights com desfecho conhecido, congelados e versionados.
- `docs/baseline-mtti.md`: tempo do alerta até a primeira hipótese, medido antes de qualquer automação (fecha Q-05).
- `docs/kill-criteria.md`: limiares de valor e de morte, assinados.
- `docs/allowed-fields.md`: lista de campos permitidos no prompt.
- `runbooks/`: catálogo de 3 a 5 tipos de alerta bem compreendidos, com dono.

**Go/No-Go (G-P0) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| Alertas com desfecho no conjunto | 50 ou mais | Menos de 50: ver Q-04 |
| Baseline de MTTI | Medido nos tipos-alvo | Ausente: nenhuma métrica de tempo vale |
| Limiares e critérios de morte | Fixados e assinados | Em aberto |
| Endpoint de modelo | Sancionado por escrito para os campos permitidos | Não sancionado: P1 não roda |
| Autorização do replay | Registrada por escrito (Q-14) | Ausente: P1 não roda |

**Riscos e mitigação.**

- Sem histórico com desfecho, o shadow vira a única fonte de dados (ver R-19).
- Dado pessoal no conjunto é tratado pela lista de campos permitidos (ver R-07).
- Replay antes do aceite de E0 pede sanção limitada e escrita (ver R-27).
- Endpoint sancionado ainda não confirmado (ver R-13).

**Requisitos.**

- Infraestrutura: nenhuma nova; export de alertas e um diretório versionado.
- Segurança: conjunto guardado em repositório interno; nada sai para o laboratório.
- Dados: só campos da lista permitida; desfecho confirmado por quem atendeu o incidente.

**Saída para a próxima etapa.** P1 recebe `eval/replay-set/`, `kill-criteria.md`, `allowed-fields.md` e o endpoint sancionado. E3 recebe `baseline-mtti.md`.

### P1 Replay offline

**Status.** Não iniciada.

**Classificação.** Caminho mínimo; trilha laboratório (D-37).

**Depende de.** P0 (G-P0).

**Objetivo e escopo.** Medir se uma chamada estruturada produz recomendação útil. Um script, um modelo, um prompt versionado; nenhum webhook.

**Entregáveis.**

- `replay/run_replay.py`: monta contexto (payload mais evidência de consultas fixas) e faz uma chamada por alerta.
- `schemas/recommendation.schema.json`: hipótese, evidência, confiança, ação sugerida, `not_enough_evidence`, versões.
- `prompts/triage.v1.md`: prompt versionado.
- `eval/blind-review.csv`: avaliação cega feita por Rafa, sem saber qual configuração gerou cada recomendação, conferida contra o gabarito JSONL do triage-eval (D-38).
- `docs/replay-report.md`: resultado contra `kill-criteria.md` e fração de alertas com saída em código (alimenta Q-09).

**Go/No-Go (G-P1) \[P\].**

| Métrica (n de 50 ou mais) | Go (prova valor) | No-Go (mata a ideia) |
| --- | --- | --- |
| Recomendações úteis na avaliação cega (D-38) | 60% ou mais | Menos de 30% |
| Causa provável entre as 3 hipóteses | 50% ou mais | Menos de 25% |
| Hipótese errada com confiança alta | Até 5% | Mais de 15% |
| Saídas "dados insuficientes" | Até 30% | Mais de 60% |
| Dado sensível em prompt, log ou saída | 0 | Qualquer ocorrência suspende |

Entre os dois limiares, a decisão é repetir uma vez, com evidência melhor \[P\]. Com menos de 30% de saídas úteis, o programa para. Uma retomada futura começaria por um investigador read-only com ferramentas, não por um harness de PR.

**Riscos e mitigação.**

- Avaliador enviesado: avaliação cega e dupla.
- Paráfrase do alerta ou causa alucinada: coleta determinística de evidência (ver D-06, R-15).
- Dado sensível no prompt: lista de campos permitidos (ver R-07).

**Requisitos.**

- Infraestrutura: estação com acesso ao endpoint sancionado e às APIs de leitura.
- Segurança: credencial somente leitura; saída sem markdown livre.
- Dados: conjunto de P0; no laboratório, o script só é ensaiado com dados sintéticos.

**Saída para a próxima etapa.** G-PoC recebe `replay-report.md`. P5 e E4 recebem a lista de classes com saída em código (Q-09). E2 recebe schema, prompt e limiares.

### P2 Laboratório base no notebook

**Status.** Não iniciada.

**Classificação.** Suporte de P3; trilha laboratório. Versão reduzida no caminho mínimo.

**Depende de.** Nenhuma etapa.

**Objetivo e escopo.** Ter a plataforma mínima de pé no notebook. Não inclui intake nem agente. Inclui as peças do replay e da avaliação: InfluxDB OSS, Grafana OSS de laboratório e MLflow, todos no k3s e declarados em lab-infra (D-32, D-34). O consumo de RAM de cada um entra na medição de footprint \[NV\].

**Entregáveis.**

- `lab/wslconfig.md`: memória da VM WSL2 e systemd.
- `lab/k3s/`: instalação de server único (k3d ou kind como alternativa).
- `lab/argo/values.yaml`: Argo Workflows na versão pinada (v4.1.6 é a versão lida nas fontes; pinar a última patch estável no dia da instalação e registrar em lab-infra, como as de k3s, osv-scanner, Ollama e modelo), com 2 réplicas do Argo Server.
- `lab/tailscale.md`: tag do desktop, regra por porta, servidor de modelo escutando só na tailnet.
- `lab/footprint.md`: RAM e VRAM medidas.
- Opcional \[P\]: `lab/gateway/`, com LiteLLM de 1 worker, Postgres pequeno e nomes lógicos de modelo.
- Opcional \[P\]: `lab/otel/`, com OTel Collector exportando para MLflow em `/v1/traces`.

Os dois itens opcionais não fazem parte do caminho mínimo (ver D-07, D-12). Sem eles, o Workflow usa `base_url` direto e `trace_id` em log.

**Go/No-Go (G-P2) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| RAM total com a stack ociosa | Até 21 GB | Acima de 21 GB: cortar os itens opcionais |
| Pod no k3s alcança o modelo (Windows e tailnet) | Chamada a `/v1/chat/completions` responde | Sem rota: servidor de modelo dentro do WSL2 (ver Q-10) |
| VRAM livre no notebook | `nvidia-smi` mostra o modelo inteiro na GPU | Offload para CPU registrado |

**Riscos e mitigação.**

- Rede entre pods, Windows e tailnet não verificada: testar primeiro (ver R-26).
- Offload para CPU ou contexto de 4k mascaram o resultado: medir e fixar o contexto (ver R-16).
- Supply chain do LiteLLM, se o gateway for instalado: imagem pinada por digest (ver R-09).

**Requisitos.**

- Infraestrutura: WSL2 com driver NVIDIA do Windows; k3s pede no mínimo 2 CPU e 2 GB \[F\].
- Segurança: portas 6443, 10250 e 8472 do k3s não expostas; modelo nunca no Funnel.
- Dados: nenhum dado da empresa.

**Saída para a próxima etapa.** P3 e P4 recebem cluster, Argo Server interno e um endpoint de modelo alcançável. Q-10 fica respondida.

### P3 Intake e Workflow de 4 passos

**Status.** Não iniciada.

**Classificação.** Caminho mínimo; trilha laboratório.

**Depende de.** P2 (G-P2). Ordem recomendada: depois de P1 \[P\].

**Objetivo e escopo.** Provar a porta de entrada e o caminho de triagem sob rajada e duplicata. Um caminho, um template.

**Entregáveis.**

- `schemas/alert-event.json`: envelope CloudEvents com `data` do alerta (ver D-10).
- `intake-adapter/`: autenticação HMAC com timestamp, validação de schema e tamanho, normalização, dedup com janela.
- `intake-adapter/`, limites: semáforo, teto diário, disjuntor e kill switch por feature flag (ver D-21).
- `WorkflowEventBinding` e `WorkflowTemplate` `alert-triage`, com os quatro passos da arquitetura de referência.
- Nome determinístico do Workflow: hash da chave mais janela; conflito tratado como "já em processamento".
- `audit/`: registro append-only por execução, com hash do contexto e da saída, versões e feedback.
- `tests/burst/`: rajada, duplicata dupla e queda de uma réplica, em modo síncrono e com `--event-async-dispatch`.
- `tests/injection-pt/`: suíte de injeção em português por payload, log e exceção.

**Go/No-Go (G-P3) \[P\].**

| Métrica | Go | No-Go |
| --- | --- | --- |
| Eventos perdidos sem registro | 0 | Qualquer perda silenciosa recorrente |
| Duplicatas que geram segundo Workflow | Até 1% | Acima de 1% |
| Suíte de injeção | 100% sem saída fora do schema e sem URL não permitida | Falha repetida |
| Registro de auditoria | 1 por execução, com `trace_id` | Execução sem registro |
| Escrita em sistema | 0 | Qualquer ocorrência |

Gate de canários (D-44), em P1 e P3: 0 canário de D2 ou D3 no prompt enviado ao modelo, no MLflow e nos spans do trace. Um vazamento reprova a etapa.

O tempo do alerta até a hipótese é só registrado nesta etapa. Com dados sintéticos e modelo local ele não é critério; o limiar vale em E3.

**Riscos e mitigação.**

- Colisão de nome devolve erro ao emissor no modo síncrono: o adapter absorve (ver R-12).
- Nome só pelo fingerprint bloqueia recorrência até o TTL: a janela entra no hash.
- Doc e código da v4.1.6 divergem: só vale o que for testado na versão pinada.
- Injeção, exfiltração por link e tempestade: ver R-01, R-02 e R-10.
- Argo Server exposto e quebra de revisão do MCP: ver R-08 e R-22.

**Requisitos.**

- Infraestrutura: 2 réplicas do Argo Server; Argo Server sem exposição externa.
- Segurança: token de ServiceAccount do adapter com RBAC mínimo; nenhum segredo em URL; links de evidência montados pelo workflow.
- Dados: payloads sintéticos ou capturados de um Grafana de laboratório; Workflow recebe chave e referência (ver D-22).

**Saída para a próxima etapa.** G-PoC recebe o relatório de testes. P5 recebe adapter, template e suítes. E1 recebe o desenho e a lista do que foi testado na versão pinada.

### P4 Medição de tool-calling local

**Status.** Não iniciada.

**Classificação.** Condicional; trilha laboratório. Barata: pode ser antecipada sem bloquear o caminho mínimo.

**Depende de.** P2 (G-P2). A métrica "sucesso do fluxo no Argo" usa P3.

**Objetivo e escopo.** Decidir qual modelo e servidor servem ao laboratório além da triagem. LoRA entra só como braço opcional. BFCL serve só como referência.

**Entregáveis.**

- `eval/toolcalling/cases/`: 30 a 50 payloads em faixas de cerca de 2k, 4k e 8k tokens, com gabarito.
- `eval/toolcalling/cases/`, casos extras: 5 a 10 negativos e 5 com duas chamadas.
- `eval/toolcalling/tools/`: 3 a 5 ferramentas com JSON Schema estrito.
- `eval/toolcalling/run.py`: `tool_choice: auto`, 3 repetições, temperatura fixa, thinking desligado.
- `eval/toolcalling/report.md`: matriz de 3 modelos, 2 máquinas e contextos de 8k e 16k.
- Opcional \[P\]: `lora/`, com adapter pequeno sobre Qwen3-8B em GGUF, alternado por `POST /lora-adapters`.

| Candidato | Arquivo | Onde cabe \[I\] | Evidência de tool-calling \[F\] |
| --- | --- | --- | --- |
| Qwen3-8B Q4\_K\_M | 5,2 GB | Notebook, 8k a 16k | Independente: 42,57% no BFCL V4 |
| Qwen3.5-9B Q4\_K\_M | 6,6 GB | Notebook só com cerca de 8k; desktop até cerca de 32k | Fornecedor: 66,1 no BFCL V4 |
| Qwen3.5-4B Q4\_K\_M | 3,3 GB | Notebook até 32k | Fornecedor, por compilação de terceiros |
| Granite 4.1 8B Q4\_K\_M | Cerca de 5 GB \[NV\] | Notebook, provável | Fornecedor: 68,27 no BFCL v3 |
| Qwen3-14B Q4\_K\_M | 9,3 GB | Só desktop, 8k a cerca de 16k | Independente: 41,03% no BFCL V4 |

**Go/No-Go (G-P4) \[P\].**

| Métrica | Go | No-Go |
| --- | --- | --- |
| Schema válido, faixas de 2k a 4k | 90% ou mais | Abaixo: modelo fora |
| Ferramenta correta, faixas de 2k a 4k | 80% ou mais | Abaixo: modelo fora |
| Latência ponta a ponta | p95 abaixo de 30 s | p95 de 30 s ou mais |
| Offload para CPU | Nenhum | Qualquer offload registrado |
| Braço LoRA (se rodar) | Não reduz as duas primeiras métricas frente à base | Reduz: LoRA encerrado |

Se nenhum candidato passar, o laboratório segue com endpoint remoto e a discussão de LoRA termina. As fontes dizem que o critério é arbitrário e deve ser ajustado.

**Riscos e mitigação.**

- Números de fornecedor e do BFCL não medem alertas de 2k a 8k com poucas ferramentas (ver R-14).
- Offload ou truncamento de contexto falseiam a medida (ver R-16).
- A conversão do adapter PEFT para GGUF não foi testada \[NV\]; por isso o braço LoRA é opcional.

**Requisitos.**

- Infraestrutura: `llama-server` com `--jinja`; Ollama com `OLLAMA_CONTEXT_LENGTH` definido; `nvidia-smi` em laço.
- Segurança: licenças Apache-2.0 nos candidatos; carregar adapter em runtime só em ambiente isolado.
- Dados: payloads sintéticos; nenhum alerta real.

**Saída para a próxima etapa.** P5 recebe o modelo e o servidor escolhidos, ou a decisão por endpoint remoto. Q-11 fica parcialmente respondida.

### P5 Vuln fixer Maven, PR-only

**Status.** Não iniciada.

**Classificação.** Primeiro workflow de código; trilha laboratório (ver D-28). No laboratório não espera Q-09: vulnerabilidade em dependência já é uma classe com saída em código.

**Depende de.** P2 (G-P2). P3 só para o webhook opcional `dependabot_alert`. P4 só para o nível N2.

**Objetivo e escopo.** Detectar CVE e GHSA nas dependências Maven do `demo-service` e abrir PR draft com correção e evidência, com aviso no Slack. Um humano revisa e faz o merge (ver D-31). Inspiração: Lightwell, que corrige vulnerabilidades com motor de IA e engenheiros humanos revisando \[F\].

| Nível | Caso | Quem corrige | Nesta etapa |
| --- | --- | --- | --- |
| N1 | Bump compatível resolve | `osv-scanner fix`, estratégia override, sem modelo | Sim |
| N2 | Bump quebra build ou testes | Harness em container recebe repo e erro; devolve `patch.diff` | Sim |
| N3 | Sem versão corrigida na mesma linha: backport do patch | Harness, com revisão reforçada | Não; só depois de medir N1 e N2 |

**Entregáveis.**

- `demo-service`: app Maven com dependências vulneráveis conhecidas, testes e `.github/workflows/ci.yml` (build, testes, re-scan OSV, SBOM CycloneDX).
- `CronWorkflow` `vuln-scan`: OSV-Scanner nos `pom.xml`; saída em `alert-event.json` com `source` OSV e `id` = advisory, repositório e pacote (ver D-30).
- `WorkflowTemplate` `vuln-fix`: triagem determinística (pacote na árvore, versão corrigida, nível), N1, N2 e publicação.
- Imagem do harness em `agent-step-images` (Cline CLI; OpenHands como segunda), sem credencial de escrita.
- Passo de publicação sem modelo: branch e PR draft por GitHub App de curta duração.
- Corpo do PR: CVE ou GHSA, severidade, de/para da versão, re-scan, diff de SBOM, nível usado e `trace_id`.
- Mensagem no Slack: vulnerabilidade, status do CI e CTA "Revisar PR" (ver D-31).
- Ruleset e CODEOWNERS no `demo-service`: aprovação humana e CI verde obrigatórios.
- `docs/exit-cost.md`: linhas alteradas ao trocar Cline CLI por OpenHands no N2.

**Go/No-Go (G-P5) \[P\].**

| Métrica | Go | No-Go |
| --- | --- | --- |
| PRs com CI verde | 80% ou mais | Menos de 50% |
| Vulnerabilidade ausente no re-scan | 100% dos PRs com CI verde | Algum PR verde com a vulnerabilidade presente |
| Escrita fora do PR draft; merge pelo agente | 0; 0 | Qualquer ocorrência |
| Fatia resolvida só pelo N1 | Registrada; decide se o N2 se justifica | Não se aplica |
| Troca de harness no N2 | Só a imagem e um adaptador de até 300 linhas | Mudança no Workflow ou nos schemas |
| `trace_id` do scan ao PR e ao Slack | 100% | Ausente em qualquer um |

Amostra (D-39): 20 PRs no demo-service, cada um sobre uma dependência Maven com CVE real conhecida (ex.: log4j-core, jackson-databind, commons-text), misturando bump simples e bump que quebra build ou teste. A lista exata entra no README do demo-service quando ele for criado.

**Riscos e mitigação.**

- `osv-scanner fix` é experimental; o override tem limitações com properties em `groupId`/`artifactId` e com profiles \[F\]: versão fixada e N2 como saída.
- Bump que passa no CI e quebra em runtime: testes do `demo-service` e review humano.
- Injeção pelo texto de advisory ou changelog lido pelo agente: ver R-01; agente sem credencial: ver R-04.
- Modelo de 8B fraco para o loop do N2 (ver Q-11, R-14): desktop de 12 GB ou endpoint remoto pontual só nesse passo.
- "Executor trocável" segue hipótese: a troca no N2 é a medição (ver R-24).

**Requisitos.**

- Infraestrutura: org GitHub (D-27); runner hospedado do Actions só para CI; Argo no k3s; desktop ou endpoint remoto só para N2.
- Segurança: GitHub App com permissão de contents e pull requests só no `demo-service`; token emitido no passo de publicação; incoming webhook do Slack em segredo, com o CTA como link em texto, sem Slack App nem endpoint público (D-41); egress do pod do agente só para Maven Central, Git e gateway.
- Dados: só repositórios e advisories públicos.

**Saída para a próxima etapa.** P6 recebe as tarefas de correção e a taxa de sucesso como referência para a variante gh-aw. E4 recebe o vuln fixer como primeira classe com saída em código.

### P6 Executor CI nativo atrás do contrato

**Status.** Não iniciada.

**Classificação.** Condicional (Q-09, Q-02); trilha laboratório.

**Depende de.** P5 (G-P5), Q-02 e Q-08. Q-02 respondida: GitHub nos dois lados, então a variante GitLab sai do escopo; falta a licença Copilot (Q-08), que é possível providenciar.

**Objetivo e escopo.** Comparar um executor de CI nativo com o harness de P5, pelo mesmo conjunto de tarefas. O executor é escolhido pelo SCM (ver D-19).

**Entregáveis.**

- `drivers/gh-aw/` ou `drivers/gitlab-duo/`: driver fino que traduz o evento interno para o gatilho.
- Variante gh-aw, gatilho: `repository_dispatch` com `types` fixo e GitHub App de curta duração.
- Variante gh-aw, endurecimento: `min-integrity` explícito, threat detection em modo strict, teto de AI Credits abaixo do default.
- Variante gh-aw, saída e runner: `create-pull-request` como único safe output; runner em VM Linux descartável.
- Fora do escopo desde a v1.5 (Q-02). Variante GitLab, ambiente: GitLab.com com trial Ultimate e runner Docker local com a tag `gitlab--duo`.
- Fora do escopo desde a v1.5 (Q-02). Variante GitLab, endurecimento: sandbox exigido e API de flows com `allow_agent_to_request_user: false`.
- `docs/executor-comparison.md`: as sete dimensões abaixo.
- `docs/poc-gate.md`: decisão de G-PoC sobre o executor.

**Go/No-Go (G-P6) \[P\].**

| Dimensão | Como medir | Go | No-Go |
| --- | --- | --- | --- |
| Runs que terminam em PR ou MR draft válido | Taxa sobre o conjunto de tarefas | \[NV\] a fixar no fim de P5, com a taxa do harness como referência | Abaixo do limiar fixado |
| Suíte de injeção pelo payload | Escrita fora do draft, conteúdo de outro repositório, URL fora da lista | 0 ocorrência nas três | Qualquer ocorrência com a configuração endurecida |
| Recurso experimental no caminho principal | Contagem de recursos em beta ou atrás de flag | 0 | 1 ou mais |
| Correlação de trace | `trace_id` do adapter ao PR, sem campo interno | Presente em 100% dos runs | Ausente em qualquer run |
| Custo por run | Inferência, minutos e créditos somados | Registrado; teto \[NV\] a fixar no fim de P5 | Acima do teto fixado |
| Esforço de manutenção em 4 semanas | Recompilações de lock, patches, quebras | Só registro; informa a decisão | Não se aplica |
| Portabilidade | O mesmo passo roda no laboratório sem a plataforma | Sim ou não; informa a decisão | Não se aplica |

**Riscos e mitigação.**

- A variante GitLab em trial não valida modelo próprio nem air-gap.
- Token de escrita, CVEs e controles que falham abertos: ver R-04, R-05 e R-06.
- Instabilidade do gh-aw e custo do GitLab Duo: ver R-20 e R-21.

**Requisitos.**

- Infraestrutura: runner Linux com Docker (gh-aw não suporta Windows); VM descartável no notebook.
- Segurança: token restrito a um repositório; saída só como PR draft em repositório privado; threat detection não conta como barreira.
- Dados: só repositório e tarefas de laboratório.

**Saída para a próxima etapa.** G-PoC e E0 recebem `executor-comparison.md` e a decisão escrita. E4 recebe o driver e a configuração endurecida.

## Fase 2 Adoção Corporativa: visão geral

A adoção é uma escada de quatro degraus, e os pré-requisitos mais pesados são organizacionais e de dados, não técnicos. O primeiro prompt em produção só sai depois de dono nomeado, endpoint sancionado, campos permitidos e validação de Jurídico e Compliance. A Fase 2 só começa com o gate G-PoC fechado, ou pela exceção descrita nele.

### Escada de autonomia (ver D-25)

A escada é proposta de projeto, não padrão publicado \[P\]. Cada etapa declara em que degrau está antes de começar.

| Degrau | O que o sistema pode fazer | Quem aprova | Etapa | Gate para subir |
| --- | --- | --- | --- | --- |
| Shadow | Roda sobre alertas reais; o plantão não vê a saída, ou só um grupo piloto vê | Ninguém; não há ação | E2 | G-E2 |
| Recomendar | Publica a recomendação em ticket ou chat, com evidência e botões de feedback | Ninguém; o retorno é feedback, não aprovação | E3 | G-E3 |
| Aprovar | Propõe PR/MR draft ou ação de catálogo fechado; a execução é de pipeline existente | Humano identificado, por ação, com `default` de reprovação | E4 | G-E4 |
| Auto-executar baixo risco | Executa sozinho ações reversíveis e idempotentes em escopo estreito | Aprovação prévia da classe de ação, não de cada execução | E5 | Degrau final |

O degrau máximo de um serviço é o mínimo entre criticidade do serviço, classe da ação e classe do dado \[P\]. Ambientes de liquidação e dados D3 ficam fora em qualquer degrau.

### Pré-requisitos organizacionais

- **Donos nomeados por papel:** dono do intake, do Workflow, do prompt e do conjunto de avaliação (ver Q-13).
- **Plantão do próprio sistema:** quem responde quando ele cai e quando uma recomendação errada é seguida.
- **Tempo de plantão orçado para feedback:** sem feedback não há métrica.
- **Governança de risco de modelo:** inventário de IA, registro do caso de uso, validação independente, gestão de mudança de prompt e de modelo.
- **Canal de aprovação e de feedback:** em read-only é feedback; a partir de Aprovar, é gate com identidade humana.
- **Catálogo inicial de 3 a 5 tipos de alerta** com runbook e dono, como latência p95, taxa de 5xx e lag de fila.
- **Conjunto de avaliação congelado e versionado,** rodado a cada mudança de prompt, modelo ou skill.

### Pré-requisitos regulatórios

Esta lista só aponta o que Jurídico e Compliance precisam validar; não é conclusão jurídica. A LGPD não foi lida \[NV\]. As Resoluções CMN 4.893/2021 e BCB 85/2021 foram lidas por resumo \[NV\]. A CMN 5.274/2025, que altera a 4.893, só foi lida em fonte secundária \[NV\].

| Tema | O que validar | Com quem |
| --- | --- | --- |
| Contratação de processamento e nuvem (CMN 4.893/2021, alterada pela 5.274/2025; BCB 85/2021) | Se enviar telemetria a um modelo hospedado por terceiro configura contratação relevante e que comunicações exige | Jurídico, Compliance |
| Rastreabilidade e trilhas de auditoria (CMN 5.274/2025) | Se o registro de auditoria proposto atende; o que reter e por quanto tempo | Compliance, Segurança |
| Residência e trânsito de dados | Onde o endpoint de modelo e os Action Groups do Azure processam os dados | Compliance |
| LGPD | Base legal, minimização e retenção de prompts e saídas | DPO, Jurídico |
| Segregação de ambientes | Exclusão dos ambientes de liquidação | Segurança, Arquitetura |
| Escopo PCI | Se algum alerta pode conter dado de titular de cartão | Segurança |

As respostas entram por Q-07 e são gate de E0 (ver R-23).

### Etapas

| ID | Etapa | Tipo | Degrau | Depende de | Gate | Critério principal do gate \[P\] |
| --- | --- | --- | --- | --- | --- | --- |
| E0 | Aprovação e governança | Obrigatória | Nenhum | G-PoC; Q-01, Q-02, Q-03, Q-07, Q-13 | G-E0 | Aceite escrito de Segurança, Arquitetura e Compliance; donos nomeados |
| E1 | Plataforma mínima em ambiente não produtivo | Obrigatória | Nenhum | E0; Q-06, Q-15 | G-E1 | 0 perda silenciosa; duplicatas até 1%; injeção em 100%; 0 dado sensível na redação |
| E2 | Shadow em produção | Obrigatória | Shadow | E1 | G-E2 | Limiares de utilidade de G-P1 em 30 dias, n de 50 ou mais; custo dentro do teto |
| E3 | Recomendação ao plantão com feedback | Obrigatória | Recomendar | E2; Q-05, Q-12 | G-E3 | Engajamento de 40% ou mais; úteis em 60% ou mais; p50 abaixo de 3 min e do baseline |
| E4 | Executor de código com PR/MR | Condicional (Q-09) | Aprovar | E3; G-P6; Q-02, Q-08, Q-09 | G-E4 | Injeção em 100%; 0 escrita fora do draft; aprovador humano em 100% das mudanças |
| E5 | Escala e auto-execução de baixo risco | Condicional | Auto-executar baixo risco | E4 | G-E5 | Catálogo fechado aprovado; rollback testado em 100% das ações; kill switch exercitado |

Os critérios completos de cada gate estão em "Fase 2 Adoção Corporativa: etapas detalhadas". Se Q-09 não apontar classe com saída em código, a Fase 2 termina em E3.

## Fase 2 Adoção Corporativa: etapas detalhadas

Cada etapa sobe no máximo um degrau da escada e só abre com o gate da anterior fechado. Os limiares são proposta a fixar em E0 \[P\]. Onde as fontes não dão número, o texto diz em que etapa ele será fixado \[NV\].

**Como manter.** Os campos e os valores de Status são os mesmos da Fase 1, na mesma ordem. Em Requisitos, toda etapa da Fase 2 traz Infraestrutura, Segurança, Governança e Escalabilidade.

### E0 Aprovação e governança

**Status.** Não iniciada.

**Classificação.** Obrigatória; sem degrau.

**Depende de.** G-PoC (ou sua exceção); Q-01, Q-02, Q-03, Q-07 e Q-13.

**Objetivo e escopo.** Obter aceite formal e fechar as decisões externas ao laboratório. Não constrói nada.

**Entregáveis.**

- ADR unificado que substitui os relatórios: contexto, decisão, alternativas, modelo de ameaça e classes de dado.
- ADR, parte operacional: degraus, auditoria e plano de desligamento.
- Respostas escritas a Q-01, Q-02, Q-03, Q-07 e Q-13.
- Registro do caso de uso no inventário de IA.
- Matriz de donos por papel e escala de plantão do sistema.
- `kill-criteria.md` da Fase 2, assinado, com teto de custo por alerta e limiares de E2 a E4.

**Go/No-Go (G-E0) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| Aceite do ADR | Escrito, de Segurança, Arquitetura e Compliance | Falta qualquer um dos três |
| Endpoint de modelo | Sancionado para produção, com campos permitidos | Não sancionado |
| Donos por papel e plantão do sistema | 4 papéis nomeados; escala publicada | Qualquer papel vago |
| Parecer regulatório (Q-07) | Recebido por escrito | Ausente |
| Limiares e teto de custo | Assinados em `kill-criteria.md` | Em aberto |

**Riscos e mitigação.**

- Governança de modelo e pedido de endpoint são o caminho mais lento: abrir os dois no primeiro dia.
- Sistema sem dono e enquadramento regulatório não validado: ver R-17 e R-23.
- Dependência do endpoint sancionado: ver R-13.

**Requisitos.**

- Infraestrutura: nenhuma nova; decisão escrita sobre o orquestrador (ver D-05, Q-01).
- Segurança: modelo de ameaça cobrindo injeção pelo payload, exfiltração pelo canal de saída e humano manipulado.
- Governança: inventário de IA, validação independente, gestão de mudança de prompt e modelo; reuso do laboratório só com autorização escrita (ver D-24).
- Escalabilidade: teto de custo por alerta e teto diário de tokens definidos no ADR.

**Saída para a próxima etapa.** E1 recebe ADR aceito, endpoint sancionado, orquestrador decidido e donos nomeados.

### E1 Plataforma mínima em ambiente não produtivo

**Status.** Não iniciada.

**Classificação.** Obrigatória; sem degrau.

**Depende de.** E0 (G-E0); Q-06 e Q-15.

**Objetivo e escopo.** Reconstruir intake e Workflow dentro da empresa, com os controles reais. Sem tráfego de produção.

**Entregáveis.**

- Intake adapter implantado atrás de ingress privado.
- `WorkflowTemplate` de quatro passos na versão pinada do orquestrador.
- Coletores read-only configurados e testados contra tentativa de escrita.
- Registro de auditoria com checkpoint em storage WORM.
- Relatório de testes: rajada, duplicata, queda de réplica, injeção e redação.

**Go/No-Go (G-E1) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| Eventos perdidos sem registro | 0 | Qualquer perda silenciosa |
| Duplicatas | Até 1% | Acima de 1% |
| Tentativa de escrita pelos coletores | 100% recusadas | Qualquer uma aceita |
| Suíte de injeção em português | 100% | Falha repetida |
| Dado sensível em prompt ou log no teste de redação | 0 | Qualquer ocorrência |

**Riscos e mitigação.**

- Retry, timeout e limite de payload do webhook do Grafana não constam na doc \[NV\]: tratar como entrega com perda até testar.
- O alcance de `--disable-write` e de `azureMcp.readOnly` precisa de teste \[NV\].
- Injeção, dado sensível e Argo Server exposto: ver R-01, R-07 e R-08.
- Supply chain do gateway, tempestade e perda de evento: ver R-09, R-10 e R-12.

**Requisitos.**

- Infraestrutura:
  - Argo Server interno, nunca exposto, com 2 réplicas ou mais.
  - Grafana self-hosted: chamada interna ao adapter por mTLS.
  - Grafana Cloud: API gateway ou WAF com allow-list de IPs de saída (lista \[NV\]).
  - Azure Monitor: Event Hubs com Private Link até um consumidor interno, ou Logic App ou Function com managed identity.
  - Secure Webhook com Entra ID só se um endpoint público atrás de WAF for aceito \[I\].
- Segurança:
  - HMAC-SHA256 com timestamp ou mTLS no contact point do Grafana; nenhum segredo na URL.
  - Identidade de workload: managed identity por padrão, identidade distinta por agente, privilégio mínimo por ferramenta.
  - Segredos: token de emissor com rotação e escopo; credenciais de leitura por serviço, com expiração.
  - NetworkPolicy com egress default-deny; saída só para o endpoint de modelo e APIs de Grafana e Azure.
  - Redaction antes do modelo: Custom Payload enxuto no Grafana e lista de campos permitidos no adapter.
  - Regex no adapter para CPF, CNPJ, cartão, e-mail e tokens.
- Governança:
  - Auditoria guarda metadados por padrão; conteúdo completo só com aprovação de Segurança e DPO.
  - Registro único de agentes: dono, propósito e escopo.
  - Retenção definida por Compliance (ver Q-07).
- Escalabilidade:
  - Semáforo global, limite por serviço, teto diário de tokens e disjuntor no adapter (ver D-21).
  - Kill switch por feature flag no adapter e limite de concorrência no Argo.
  - Dimensionar pelo limite do emissor: até 1.500 chamadas de webhook por minuto por assinatura Azure \[F\] (a reconferir).

**Saída para a próxima etapa.** E2 recebe a plataforma testada, o relatório de testes e os limites configurados.

### E2 Shadow em produção

**Status.** Não iniciada.

**Classificação.** Obrigatória; degrau Shadow.

**Depende de.** E1 (G-E1).

**Objetivo e escopo.** Medir utilidade sobre alertas reais por 30 dias, sem publicar ao plantão ou publicando só a um grupo piloto. Um modelo, um prompt versionado, dois tipos de alerta, um time.

**Entregáveis.**

- Webhooks de produção apontados para o intake.
- Painel das métricas de 30 dias e relatório contra os critérios de morte.
- Comparação de cada saída com o diagnóstico real.
- Conjunto de avaliação ampliado com os casos do shadow.

**Go/No-Go (G-E2) \[P\].**

| Métrica (30 dias, n de 50 ou mais) | Go | No-Go |
| --- | --- | --- |
| Quatro métricas de utilidade de G-P1 | Mesmos limiares de Go de G-P1 | Mesmos limiares de No-Go de G-P1 |
| Eventos perdidos sem registro | 0 | Perda silenciosa recorrente |
| Duplicatas | Até 1% | Acima de 1% |
| Dado sensível; escrita em sistema | 0; 0 | Qualquer ocorrência suspende |
| Custo por alerta | Dentro do teto de E0 | Acima do teto sem ganho de tempo |

**Riscos e mitigação.**

- Se P1 não rodou, esta etapa é a primeira medida de valor (ver R-19).
- Tempestade real pode superar o teste: os limites do adapter valem desde o primeiro dia (ver R-10, R-12).
- Custo, dado sensível e causa alucinada: ver R-11, R-07 e R-15.

**Requisitos.**

- Infraestrutura: mesma de E1, em produção; HA do Argo Server validada com queda de réplica.
- Segurança: credenciais somente leitura; nenhuma publicação em canal amplo; revisão de quem lê Workflows no Argo.
- Governança: registro de cada execução; revisão semanal das métricas pelo dono do prompt.
- Escalabilidade: tratamento de `resolved` decidido (filtrar ou encerrar triagens); agrupamento do Grafana revisto contra os defaults de 30 s, 5 min e 4 h \[F\].

**Saída para a próxima etapa.** E3 recebe o relatório de 30 dias, o conjunto de avaliação ampliado e o custo medido por alerta.

### E3 Recomendação ao plantão com feedback

**Status.** Não iniciada.

**Classificação.** Obrigatória; degrau Recomendar.

**Depende de.** E2 (G-E2); Q-05 e Q-12.

**Objetivo e escopo.** Publicar a recomendação para o plantão e medir adoção. Começa com um time e dois tipos de alerta; amplia dentro do catálogo de 3 a 5 tipos.

**Entregáveis.**

- Publicação em ticket ou chat com botões "útil / não útil / errado".
- Saída com schema rígido, evidência bruta ao lado e rótulo "não verificado".
- Rotina de regressão: conjunto de avaliação rodado a cada mudança de prompt, modelo ou skill.
- Relatório de classes de alerta cuja recomendação recorrente é mudança de código (fecha Q-09).
- Limiar de taxa de PR/MR aceitos para E4, fixado e assinado.

**Go/No-Go (G-E3) \[P\].**

| Métrica | Go | No-Go |
| --- | --- | --- |
| Engajamento (abertas ou com feedback) | 40% ou mais | Menos de 15% |
| Recomendações úteis | 60% ou mais | Menos de 30% |
| Tempo do alerta até a primeira hipótese | p50 abaixo de 3 min e menor que o baseline | Sem diferença para o baseline |
| Hipótese errada com confiança alta | Até 5% | Mais de 15% |

A janela de medição é \[NV\], a fixar em E0; a referência das fontes é 30 dias.

**Riscos e mitigação.**

- Recomendação errada seguida pelo plantão: evidência ao lado e confiança explícita (ver R-03, R-15).
- Baixa adoção: tempo de feedback orçado (ver R-18).
- Injeção, exfiltração pelo canal e dado sensível: ver R-01, R-02 e R-07.

**Requisitos.**

- Infraestrutura: integração com o canal do plantão; sem mudança de rede.
- Segurança: sem markdown livre; links montados pelo workflow; lista de domínios permitidos.
- Governança: gestão de mudança para prompt e modelo; dono do conjunto de avaliação aprova cada promoção.
- Escalabilidade: limite por serviço revisto a cada tipo de alerta novo; segundo consumidor reabre D-07.

**Saída para a próxima etapa.** E4 recebe as classes com saída em código e o limiar de PR/MR aceitos. Sem classes, a Fase 2 termina aqui.

### E4 Executor de código com PR/MR e aprovação humana

**Status.** Não iniciada.

**Classificação.** Condicional (Q-09); degrau Aprovar.

**Depende de.** E3 (G-E3); G-P6; Q-02, Q-08 e Q-09 com ao menos uma classe.

**Objetivo e escopo.** Ligar o executor escolhido em P6 para as classes apontadas em E3. A saída é só PR/MR draft; um humano aprova.

**Entregáveis.**

- Driver fino do executor em produção e passo de publicação sem modelo.
- Política de PR/MR: draft obrigatório, branches protegidas, revisores exigidos.
- Registro do aprovador humano em cada mudança.
- Runbook de atualização do executor (patches e recompilação de locks).
- Limiar de acerto para E5, fixado e assinado.

**Go/No-Go (G-E4) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| Suíte de injeção pelo payload | 100% | Qualquer escrita fora do draft |
| Aprovador humano registrado | 100% das mudanças | Aprovação por token de serviço |
| Recurso experimental no caminho principal | 0 | 1 ou mais |
| Taxa de PR/MR aceitos | \[NV\] a fixar em E3 | Abaixo do limiar fixado |
| Custo por run | Dentro do teto de créditos | Acima do teto |

**Riscos e mitigação.**

- Injeção por texto de alerta virando instrução de agente: ver R-01.
- Token de escrita, CVEs e controles que falham abertos: ver R-04, R-05 e R-06.
- Custo, instabilidade do gh-aw e licença do GitLab Duo: ver R-11, R-20 e R-21.
- Quebra de revisão do MCP: ver R-22.

**Requisitos.**

- Infraestrutura:
  - gh-aw: runner Linux com Docker; só em github.com até haver compromisso para GHES.
  - GitLab Duo: versão 19.6 ou superior para exigir o sandbox; AI Gateway isolado.
  - Harness em container: pod por tarefa com gVisor ou Kata e egress por proxy.
- Segurança:
  - Agente sem credencial de escrita; publicação por passo separado.
  - Token restrito a um repositório; GitHub App de curta duração em vez de PAT longo.
  - GitLab: criação de flows restrita; `setup_script` revisado, pois roda fora do sandbox.
  - Gate com `default` de reprovação; nenhum `resume` automatizado.
- Governança:
  - Aprovação humana é a do PR/MR, com regras de aprovação e branches protegidas.
  - Janela de patch do executor com dono; advisories lidos em fonte primária antes da adoção.
- Escalabilidade:
  - Dedup e limite de taxa no adapter, antes do gatilho; no gh-aw, N alertas viram N runs em série \[F\].
  - Teto de créditos por run e por dia abaixo do default (gh-aw: 1.000 e 5.000 AI Credits \[F\]).

**Saída para a próxima etapa.** E5 recebe o histórico de mudanças aprovadas, o limiar de acerto e o runbook do executor.

### E5 Escala e auto-execução de baixo risco

**Status.** Não iniciada.

**Classificação.** Condicional (E4 concluída); degrau Auto-executar baixo risco.

**Depende de.** E4 (G-E4).

**Objetivo e escopo.** Ampliar times e tipos de alerta. Permitir execução sem aprovação por evento só para ações reversíveis e idempotentes, em catálogo fechado.

**Entregáveis.**

- Catálogo fechado de ações, cada uma com classe de risco, dono e rollback testado.
- Política por classe de risco: o que exige revisão e o que é autônomo.
- Exercício de kill switch documentado.
- Revisão de D-07 (gateway como produto) e do roteamento, se houver segundo modelo.

**Go/No-Go (G-E5) \[P\].**

| Critério | Go | No-Go |
| --- | --- | --- |
| Catálogo fechado | Aprovado por Segurança e pelo dono do serviço | Qualquer ação fora do catálogo |
| Rollback | Testado em 100% das ações do catálogo | Ação sem rollback testado |
| Kill switch | Exercitado ao menos 1 vez, com registro | Não exercitado |
| Acerto das ações propostas em E4 | \[NV\] a fixar em E4 | Abaixo do limiar fixado |
| Escopo | 0 ação em ambiente de liquidação ou com dado D3 | Qualquer ocorrência |

**Riscos e mitigação.**

- O LLM propõe; um catálogo fechado executa.
- Tempestade, custo e dependência de modelo: ver R-10, R-11 e R-13.

**Requisitos.**

- Infraestrutura: escala do intake por réplicas; fila e workers de eventos do Argo dimensionados por teste; broker durável na frente só se o teste reprovar.
- Segurança: ações só por templates fechados; credencial de execução fora do componente que lê entrada não confiável.
- Governança: budgets por time; revisão periódica do catálogo; plano para desativar um agente preservando logs.
- Escalabilidade: budgets e chaves por consumidor no gateway; alerta de gasto ao se aproximar do orçamento.

**Saída para a próxima etapa.** Não há etapa seguinte. A saída é a operação contínua, com revisão periódica do catálogo e dos limiares.

## Registro de riscos

Os riscos que mais pesam são injeção pelo texto do alerta, ausência de dono e perda silenciosa de evento. Os dois executores de CI nativo chegam ao mesmo ponto fraco: texto de alerta virando instrução de agente. Probabilidade e impacto são julgamento nosso, não medida \[P\].

Para atualizar um risco, mude só a linha dele. A coluna Etapa lista onde o risco é tratado; as etapas citam o risco pelo ID.

| ID | Risco | Probabilidade | Impacto | Mitigação | Dono (papel) | Etapa |
| --- | --- | --- | --- | --- | --- | --- |
| R-01 | Injeção de prompt por payload, log ou mensagem de exceção; um usuário externo pode pôr texto numa exceção \[I\] | Alta | Alto | Schema rígido de saída; lista de campos permitidos; suíte de injeção em português como gate (D-13) | Segurança | P3, E1, E3, E4 |
| R-02 | Exfiltração por link ou imagem renderizada no canal de saída | Média | Alto | Sem markdown livre; links montados pelo workflow; lista de domínios permitidos (D-11) | Segurança | P3, E3 |
| R-03 | Humano manipulado ou induzido por recomendação errada ou injetada | Média | Alto | Evidência bruta ao lado; rótulo "não verificado"; confiança explícita | Dono do prompt | E3 |
| R-04 | Token de escrita ao alcance do executor: PAT do dispatch exige "Contents: write"; no GitLab Duo o agente tem token de escrita no job \[F\] | Média | Alto | Agente sem credencial; publicação por passo sem modelo; token por repositório; GitHub App de curta duração | Segurança | P5, P6, E4 |
| R-05 | CVEs nos executores: GHSA crítica no gh-aw (CVSS 9.1, 27/08/2026); dois CVEs 9.9 no AI Gateway do GitLab em 2026 \[F\] | Alta | Alto | Janela de patch com dono; AI Gateway isolado; criação de flows restrita; ler advisories primários | Dono de plataforma | P6, E4 |
| R-06 | Controle que falha aberto: sandbox do GitLab Duo roda sem confinamento se não for exigido; threat detection do gh-aw em modo warn; `min-integrity` é `none` em repositório privado \[F\] | Média | Alto | Exigir sandbox (19.6); modo strict; `min-integrity` explícito; não tratar detector como barreira | Segurança | P5, P6, E4 |
| R-07 | Dado pessoal ou sensível em prompt, log, saída ou parâmetros do Workflow | Média | Alto | Lista de campos permitidos; Custom Payload enxuto; passar chave e referência (D-22); qualquer ocorrência suspende | Segurança, DPO | P0, P1, E1, E2, E3 |
| R-08 | Argo Server exposto ou desatualizado; houve 10 advisories em 2026, um crítico \[F\] (não conferido um a um) | Baixa | Alto | Nunca expor; intake na frente (D-04); versão pinada e janela de patch | Dono de plataforma | P3, E1 |
| R-09 | Supply chain do gateway: versões PyPI do LiteLLM comprometidas em 24/03/2026; CVE-2026-42208 \[F\] | Média | Alto | Imagem pinada por digest; rede restrita; adiar o produto na empresa e torná-lo opcional no laboratório (D-07) | Dono de plataforma | P2, E1 |
| R-10 | Tempestade de alertas gera Workflows e chamadas sem limite \[I\] | Alta | Médio | Semáforo global, limite por serviço, disjuntor e kill switch no adapter (D-21) | Dono do intake | P3, E1, E2, E5 |
| R-11 | Custo acima do teto; conta de referência é US$ 260 a 350 por mês em piloto \[F\] (número de fornecedor) | Média | Médio | Teto diário de tokens; teto de créditos por run; custo por alerta como critério de morte | Patrocinador | E2, E4, E5 |
| R-12 | Perda ou duplicata de evento: Argo não garante ordem nem deduplica; Azure não chama por 15 min após falhas \[F\] | Média | Alto | Resposta 2xx rápida; dedup com janela; nome determinístico; 2 réplicas; teste de rajada | Dono do intake | P3, E1, E2 |
| R-13 | Dependência de modelo ou endpoint: descontinuação de modelo em janelas de 3 a 6 meses \[F\] (página de um fornecedor); endpoint sancionado ainda não confirmado \[NV\] | Média | Alto | Nomes lógicos no gateway; contrato Chat Completions (D-09); regressão a cada troca | Dono do prompt | P0, E0, E5 |
| R-14 | Tool-calling fraco em modelo pequeno; BFCL independente dá 42,57% ao Qwen3-8B \[F\] | Alta | Médio | Suíte fixa por rota de modelo (P4); endpoint remoto como saída; triagem não depende de tool-calling | Dono do laboratório | P4, P5 |
| R-15 | Alucinação de causa: hipótese errada com confiança alta | Média | Alto | Coleta determinística (D-06); opção "dados insuficientes"; limiar de até 5% \[P\] | Dono do prompt | P1, E2, E3 |
| R-16 | Laboratório engana: offload para CPU ou contexto de 4k do Ollama truncando o prompt | Média | Baixo | `OLLAMA_CONTEXT_LENGTH` definido; `nvidia-smi` em laço; registrar qualquer offload | Dono do laboratório | P2, P4 |
| R-17 | Sistema sem dono e sem plantão próprio | Alta | Alto | Donos nomeados por papel e escala de plantão como gate de E0 | Patrocinador | E0 |
| R-18 | Plantão não adota ou não dá feedback; sem feedback não há métrica | Média | Alto | Tempo de feedback orçado; botões de um clique; engajamento como critério de morte | Líder do plantão | E3 |
| R-19 | Sem histórico de alertas com desfecho e sem baseline de MTTI | Média | Alto | Responder Q-04 antes de P0; se faltar, shadow vira a primeira medida e traz ingress ao caminho crítico | Patrocinador | P0, E2 |
| R-20 | Instabilidade de API do gh-aw: 7 tags em 18 dias; `compat.json` pode bloquear locks antigos em runtime \[F\] | Alta | Médio | Driver fino e descartável; versão pinada; runbook de recompilação de locks | Dono de plataforma | P6, E4 |
| R-21 | Custo e licença do GitLab Duo: crédito cobrado mesmo com modelo próprio; exige Premium ou Ultimate \[F\] | Média | Médio | Confirmar em Q-08; alternativa é job de CI com `image:` rodando o harness | Patrocinador | P6, E4 |
| R-22 | MCP revisão 2026-07-28 quebra compatibilidade \[F\]; revisão de cada executor não verificada \[NV\] | Média | Médio | Revisão fixada por servidor (D-14); teste de coletores a cada atualização | Dono do Workflow | P3, P5, E4 |
| R-23 | Enquadramento regulatório não validado: nuvem, residência, retenção de prompts | Média | Alto | Validação de Jurídico e Compliance como gate de E0 (Q-07) | Compliance | E0 |
| R-24 | "Executor trocável" é hipótese; o custo de saída pode ser alto | Média | Médio | Medir linhas alteradas na troca em P5 antes de qualquer adoção | Arquitetura | P5 |
| R-25 | Mistura entre projeto pessoal e proposta corporativa | Baixa | Alto | Dados e código separados; reuso só com autorização escrita (D-24, Q-15) | Dono do plano | Todas |
| R-26 | Rede do laboratório: pods no k3s em WSL2 podem não alcançar a tailnet ou o Windows | Média | Baixo | Testar em P2; alternativa é servidor de modelo dentro do WSL2 | Dono do laboratório | P2 |
| R-27 | Replay com alertas reais antes do aceite de E0: endpoint não sancionado a tempo, ou uso dos dados sem autorização \[I\] | Média | Alto | Sanção limitada aos campos permitidos e autorização escrita antes de P1 (D-26, Q-03, Q-14); sem elas P1 não roda | Patrocinador | P0 |

## Perguntas em aberto e próximos passos

Cinco respostas da empresa decidem mais do que qualquer medição de laboratório. Q-01 e Q-02 dizem o que a empresa já opera e qual SCM usa. Q-03, Q-04 e Q-14 tratam de endpoint sancionado, histórico com desfecho e autorização do replay. Sem essas três, P0 e P1 não rodam. As demais perguntas se fecham com teste barato.

Para atualizar, mude só a linha da pergunta e preencha a coluna Resposta. Uma pergunta respondida não é apagada. A coluna Bloqueia lista só as etapas bloqueadas diretamente; as seguintes ficam bloqueadas por dependência.

| ID | Pergunta | Por que muda o plano | Como responder | Bloqueia | Resposta |
| --- | --- | --- | --- | --- | --- |
| Q-01 | A empresa já opera Argo Workflows em produção, com SSO, dono e janela de patch? | Se não, a triagem roda no que existe: Function, Logic App, Event Hubs ou função durável (D-05) | Inventário com o time de plataforma | E0 | Não. Rafa pode sugerir o Argo na proposta; até lá vale o caminho do D-05 |
| Q-02 | Qual SCM: GitHub.com, GitHub Enterprise Server ou GitLab? | Define o executor de CI nativo e o que significa "PR" (D-19) | Consulta a Arquitetura | P6, E0, E4 | Laboratório: GitHub, org open-eda-labs (D-27). Empresa: GitHub Enterprise, assumido Cloud até a confirmação (se for Server, P6 sai da proposta) |
| Q-03 | Qual endpoint de modelo é sancionado, e para quais campos? | Define residência, contratação, retenção de prompts e se `base_url` única basta (D-07) | Pedido formal a Segurança e Compliance | P0, E0 | Nenhum sancionado ainda. A proposta inclui o pedido formal a Segurança e Compliance; até lá, só laboratório |
| Q-04 | Existe histórico de alertas com desfecho conhecido? | Sem ele não há replay; o shadow vira a única fonte de dados (D-03) | Export de Grafana, Application Insights e da ferramenta de incidentes | P0 | Laboratório: séries no InfluxDB geradas por injeção de falhas no demo-service; gabarito em JSONL no triage-eval (D-34, D-35). Empresa, depois da E0: ferramenta de incidentes (desfecho) cruzada com annotations de Grafana e App Insights |
| Q-05 | Há baseline de MTTI medido para os tipos-alvo? | Sem baseline, nenhuma métrica de tempo vale | Medir nos registros de incidente, em P0 | E3 (fecha em P0) | Não há. Começar a medir agora (baseline prospectivo); a comparação de tempo atrasa algumas semanas |
| Q-06 | O Grafana é self-hosted ou Cloud? O Azure pode usar Event Hubs com Private Link? | Define o desenho de ingress e de autenticação | Consulta a plataforma e rede | E1 | Laboratório: ingress e autenticação em escala reproduzível, no padrão de produção com poucas peças (D-40). Empresa: a confirmar; provável Grafana self-hosted, talvez Datadog. Um adapter por fonte no intake cobre os casos (D-36) |
| Q-07 | Enviar telemetria a um modelo configura contratação relevante? Que retenção vale para prompts? | Pode exigir comunicação ao regulador e mudar a auditoria | Parecer de Jurídico e Compliance sobre o texto oficial | E0 | Parecer jurídico em aberto. MLflow decidido para rastreio, avaliação e registro de prompts (D-32); a trilha de auditoria continua no registro encadeado por hash com checkpoint WORM |
| Q-08 | Há licença Copilot, ou GitLab Premium ou Ultimate com créditos? | Sem licença, o executor nativo não roda ou cobra por uso (R-21) | Consulta a compras e ao dono do SCM | P6, E4 | Não há hoje, mas é possível providenciar |
| Q-09 | Quais classes de alerta têm como saída útil uma mudança de código? | Sem essas classes, P5, P6 e E4 não abrem (D-18) | Relatório de P1; confirmado em E3 | P5, E4 | Para P5 e E4: vulnerabilidade em dependência (D-28), que vem do OSV-Scanner e não de alerta. Para alertas de Grafana ou Azure com saída em código: em aberto, fecha em P1 e E3 |
| Q-10 | Pods no k3s sobre WSL2 alcançam a tailnet e um servidor no Windows? | Define onde o modelo do laboratório roda (R-26) | Teste em P2 | Nenhuma (fecha em P2) | Começar com Ollama no Galaxy Book4 Ultra (o Notebook da tabela de Ambiente); se faltar potência, Tailscale (login da tailnet por SSO OAuth, ex.: conta GitHub) até o desktop com RTX 3060. O alcance dos pods ainda se testa em P2 |
| Q-11 | Um modelo de 8B com 8k a 16k sustenta o loop de um agente de código? | Se não, P5 e P6 usam endpoint remoto | Medição em P4 e ensaio em P5 | Nenhuma (fecha em P5) | Abordagem: experimentar modelos otimizados e eficientes para as ações de workflow; a resposta sai da medição em P4 e P5 |
| Q-12 | O canal de saída renderiza links ou imagens? Qual canal o plantão usa? | Define o controle de exfiltração e o formato da publicação (R-02) | Consulta ao líder do plantão; teste do canal | E3 | Empresa: card no Teams via webhook do Power Automate; a automação pode atualizar o card pelo messageId \[NV\]. Laboratório: Slack (D-31) |
| Q-13 | Quem são os donos de intake, Workflow, prompt e conjunto de avaliação? | Sem dono não há tráfego (R-17) | Indicação do patrocinador | E0 | A squad de Rafa, sozinha, como PoC; donos definitivos ficam para quando sair da PoC (R-17) |
| Q-14 | O replay com alertas reais pode rodar na empresa antes do aceite de E0? Quem autoriza e onde ficam os artefatos? | Se não, P1 não roda e E2 vira a primeira medida de valor (D-26, R-27) | Autorização escrita do patrocinador e de Segurança | P0 | Não antes de E0. O laboratório experimenta com dados próprios para levar como proposta; P1 roda sobre o replay do laboratório (Q-04) |
| Q-15 | A empresa autoriza por escrito o reuso de artefatos do laboratório (schemas, adapter, suítes)? | Se não, E1 reconstrói tudo a partir do desenho (D-24, R-25) | Pedido formal, com aviso ao Jurídico | E1 | Não reusar: E1 reconstrói dentro da empresa a partir do desenho (D-24) |

Marcação das respostas: cada resposta da coluna Resposta é declaração de Rafa em 14/11/2026 e vale como premissa a confirmar \[P\], salvo onde está marcada \[NV\].

### Não verificado

- Nada foi executado: comportamento do endpoint de eventos do Argo sob rajada, perda de réplica e duplicata.
- Código HTTP exato que o Argo Server devolve em colisão de nome e em falha de dispatch.
- Retry, timeout e limite de payload do webhook do Grafana; timeout do webhook do Action Group.
- Texto da LGPD e textos oficiais das resoluções do CMN e do BCB.
- Alcance real de `--disable-write` no mcp-grafana e de `azureMcp.readOnly`.
- Se o BYOK do gh-aw roda sem licença Copilot; se o sidecar alcança um modelo no host do runner.
- Que token e escopo a API de flows do GitLab aceita, e se conta de serviço pode dispará-la.
- Qual revisão do MCP cada executor implementa; se algum aceita `TRACEPARENT` de entrada.
- Ajuste real de VRAM por contexto e throughput da RTX 4070 Laptop; não há medição pública.
- Qualquer evidência do efeito de LoRA sobre tool-calling.
- Footprint real de qualquer componente do laboratório.

### Próximos passos imediatos

- [ ] Fechar o que falta da empresa: confirmar GHE Cloud (Q-02), fonte de alertas Grafana ou Datadog (Q-06) e parecer jurídico (Q-07).
- [ ] Donos: a squad de Rafa durante a PoC (Q-13); a proposta nomeia quem assume depois.
- [ ] Incluir na proposta o pedido de endpoint sancionado e a governança de modelo (Q-03, Q-07); nada é pedido à empresa antes do G-PoC.
- [ ] P0: definir campos permitidos, regra de redação, retenção e catálogo de 3 a 5 tipos de alerta com runbook.
- [ ] P0: começar a medir o MTTI real nos incidentes do time (Q-05), usar o tempo do gabarito como baseline do laboratório e assinar `docs/kill-criteria.md`.
- [ ] P1: rodar o replay do laboratório com avaliação cega (D-37, D-38) e decidir pelas métricas de G-P1.
- [ ] P2 e P3, no laboratório: subir a base reduzida e rodar os testes de rajada e de duplicata (uma tarde cada).
- [ ] Opcional: antecipar a medição de tool-calling de P4 (1 a 2 dias).
- [ ] Fechar G-PoC em `docs/poc-gate.md` e só então escrever o ADR unificado de E0.

### Próximos passos do laboratório (vuln fixer)

- [ ] Criar a GitHub organization open-eda-labs (feito em 14/11/2026; falta conferir 2FA e o restante), com 2FA, rulesets na main, secret scanning e Dependabot.
- [ ] Criar os repositórios marcados como "Agora" em Fase 1 PoC: etapas detalhadas.
- [ ] Depois de P2 de pé, primeiro teste de P3: endpoint de eventos do Argo sob rajada e duplicata, e retry e timeout do webhook do Grafana OSS do laboratório.
- [ ] Montar o demo-service Maven com dependências vulneráveis conhecidas, testes e CI no Actions.
- [ ] P5, nível N1: CronWorkflow vuln-scan e WorkflowTemplate vuln-fix só com osv-scanner fix, PR draft e Slack.
- [ ] Medir a fatia resolvida pelo N1 antes de construir o N2.

## Fontes

Este plano se apóia em cinco relatórios e nas notas de pesquisa por trás deles, todos de leitura, sem execução. Os arquivos estão no workspace da sessão de 13/11/2026 e podem não existir numa nova sessão. Cópias foram entregues a Rafa como arquivos nas conversas de 13 e 14/11/2026; peça-as a ele se o caminho não existir. Por isso o documento é autocontido: decisões, números e limiares necessários à execução estão nas seções anteriores.

Em conflito entre relatórios, vale o mais recente. Os relatórios usam legendas próprias: no "Plano revisado", \[P\] significa "pesquisador paralelo", não "proposta", e \[O\] é opinião do judge.

### Relatórios

| Relatório | O que cobre | Quando consultar |
| --- | --- | --- |
| `/home/claude/reports/Executores CI nativo e PoC no notebook.md` | Contrato aberto por camada; gh-aw, GitLab Duo e harness em container; hardware, modelos e plano de medição do laboratório | Ao executar P2, P4, P5 e P6; ao decidir D-19 |
| `/home/claude/reports/Plano revisado e infra para alertas.md` | Veredito do judge; fase 1 revisada; métricas e critérios de morte; fatos de Grafana e Azure; intake adapter; pré-requisitos da empresa; tiers de custo | Ao executar P0, P1, P3 e E0 a E3; ao revisar D-26 |
| `/home/claude/reports/Alternativas ao Argo e Langflow.md` | Endpoint nativo de eventos do Argo; comparação de motores; três caminhos de consumo de IA | Ao revisar D-05 e D-08, ou se alguém propuser outro motor |
| `/home/claude/reports/Automação agêntica gateway e roteamento 2.md` | Gateway, "Auto" e Switchyard, LoRA, Code Agent Server, telemetria, guardrails | Ao reabrir itens de "Descartado ou adiado" |
| `/home/claude/reports/Automação agêntica orientada a eventos.md` | Ideia original com Argo Events; classes de serviço, ação e dado; proposta corporativa inicial | Só como histórico; parte foi superada |

### Notas de pesquisa mais usadas

| Nota | O que cobre |
| --- | --- |
| `/home/claude/research_notes/Infra cloud e webhook de alertas/critica_judge.md` | Crítica completa e 17 spot-checks |
| `/home/claude/research_notes/Infra cloud e webhook de alertas/requisitos_empresa_webhook.md` | Webhooks de Grafana e Azure; governança; escada de autonomia |
| `/home/claude/research_notes/Infra cloud e webhook de alertas/infra_pessoal.md` | Preços e stack leve do projeto pessoal |
| `/home/claude/research_notes/Executores CI nativo e PoC no notebook/contrato_aberto.md` | Padrões por camada do contrato |
| `/home/claude/research_notes/Executores CI nativo e PoC no notebook/gh_aw_executor.md` | gh-aw: gatilho, segurança, custo, incidentes |
| `/home/claude/research_notes/Executores CI nativo e PoC no notebook/gitlab_duo_executor.md` | GitLab Duo: API de flows, créditos, sandbox, CVEs |
| `/home/claude/research_notes/Executores CI nativo e PoC no notebook/notebook_poc.md` | Hardware, modelos, serving, WSL2 e Tailscale |

### Links primários mais usados

- [Argo Workflows: eventos](https://argo-workflows.readthedocs.io/en/latest/events/)
- [Argo Workflows: webhooks](https://raw.githubusercontent.com/argoproj/argo-workflows/main/docs/webhooks.md)
- [Grafana: webhook notifier](https://grafana.com/docs/grafana/latest/alerting/configure-notifications/manage-contact-points/integrations/webhook-notifier/)
- [Azure Monitor: action groups](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups)
- [Azure Monitor: common alert schema](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-common-schema)
- [CloudEvents: spec](https://raw.githubusercontent.com/cloudevents/spec/main/cloudevents/spec.md)
- [MCP: changelog da revisão 2026-07-28](https://modelcontextprotocol.io/specification/2026-07-28/changelog)
- [Agent Skills: spec](https://agentskills.io/specification)
- [gh-aw: repositório](https://github.com/github/gh-aw)
- [gh-aw: anúncio de GA](https://github.blog/changelog/2026-10-28-github-agentic-workflows-generally-available)
- [GitLab Duo Agent Platform](https://docs.gitlab.com/user/duo_agent_platform/)
- [GitLab: Flows API](https://docs.gitlab.com/api/duo_agent_platform_flows)
- [BFCL: leaderboard](https://gorilla.cs.berkeley.edu/leaderboard.html)
- [llama.cpp: server](https://raw.githubusercontent.com/ggml-org/llama.cpp/master/tools/server/README.md)
- [Ollama: context length](https://docs.ollama.com/context-length)
- [vLLM: tool calling](https://docs.vllm.ai/en/latest/features/tool_calling/)
- [mcp-grafana: README](https://raw.githubusercontent.com/grafana/mcp-grafana/main/README.md)
- [Tailscale Funnel](https://tailscale.com/kb/1223/funnel)
