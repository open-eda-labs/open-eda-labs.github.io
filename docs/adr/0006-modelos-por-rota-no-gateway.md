# ADR-0006: Modelos por rota no gateway: Decision-1.1, Switchyard, NVIDIA NIM e vLLM

## Estado

Proposta em 2026-11-18 (Rafa). Revê o ADR-0004 (modelo padrão), o D-07 (AI Gateway), o D-16 (modelo local), a linha "'Auto', Switchyard, qualquer roteador" de "Descartado ou adiado" e a entrada do Switchyard no glossário ("fora da Fase 1"). A espelhar no Plano Mestre.

## Contexto

Rodar modelo local no notebook (8 GB de VRAM) é pesado, e o `qwen3:4b` (ADR-0004) provavelmente não sustenta as migrações do N2: Jetty 9 para 12, Spring 5 para 7 e os outros 8 pacotes que voltaram na medição do fixer (ADR-0005). Há modelos hospedados de custo zero ou quase zero: no free tier do NVIDIA NIM, o `google/gemma-4-31b-it` (respondeu em 18/11/2026; o `moonshotai/kimi-k3.1-pro` está em ajuste e o `deepseek-ai/deepseek-v4.1-flash` saiu de linha em 16/11/2026, HTTP 410); e o `Microsoft-Decision-1.1` (GA em 17/11/2026), um modelo de decisão que devolve escolha e probabilidade calibrada, e não texto. O Switchyard, roteador de modelo da NVIDIA (NeMo) adiado no plano por ser pre-1.0, é a alternativa hospedada no próprio laboratório para a mesma função de roteamento.

## Decisão

- **Gateway.** LiteLLM com Postgres pequeno passa a ser obrigatório no laboratório (D-07 deixa de ser opcional). Os passos só enxergam `OPENAI_BASE_URL` e `MODEL`, este com nome lógico (D-09).
- **Rotas.**

| Rota | Backend | Uso |
| --- | --- | --- |
| `fix-n2` | `google/gemma-4-31b-it` no NVIDIA NIM (free tier) | Migração de código no passo N2 do vuln fixer |
| `simple` | vLLM com modelo pequeno de licença Apache-2.0 (ex.: família Qwen) | Tarefas simples: triagem estruturada, resumo, extração |
| `internal` | Só vLLM | Qualquer dado de classe D1 ou D2 |
| `classify` | A definir em P4, entre `Microsoft-Decision-1.1` pela OpenRouter e Switchyard (NVIDIA NeMo) hospedado no laboratório | Smart routing: escolher entre `simple` e `fix-n2` por dificuldade ou tipo de tarefa |

- **Classe de dado antes do roteador.** A classe (D-42) escolhe a rota por regra determinística no gateway, antes de qualquer modelo. Endpoint externo (NIM, OpenRouter) só recebe D0. Nenhum roteador, nem o Decision-1.1 nem o Switchyard, decide classe de dado ou substitui dedup, orçamento ou o bloqueio de D3 (D-13, D-43). O Switchyard, mesmo hospedado no laboratório, roda depois da regra de classe e só escolhe entre rotas que a classe já permite.
- **Roteador condicionado à medição.** A rota `classify` só entra em uso depois de P4 mostrar que o modelo da rota `simple` passa no mesmo eval em parte dos casos. É a condição de volta registrada em "Descartado ou adiado". Até lá, a rota é fixa por tipo de tarefa.
- **Roteador: A/B em P4.** Decision-1.1 e Switchyard são braços concorrentes da rota `classify`.
  - Os dois recebem as mesmas decisões rotuladas (`simple` contra `fix-n2`).
  - Métricas: acerto, latência, custo por decisão, e quantas rotas erradas derrubam o eval da tarefa.
  - Calibração (Brier) só para o braço que devolve probabilidade: o Decision-1.1, e o Switchyard se expuser score.
  - O vencedor fica com a rota. Em empate, fica o Switchyard, que não depende de endpoint externo nem manda prompt para fora.
- **Rota `fix-n2`.** Único candidato hoje: Gemma 4 31B. Outro modelo do NIM (o Kimi, se voltar) entra rodando as mesmas unidades do N2; fica o que fechar mais unidades com build, testes e re-scan verdes, e, em empate, o de menor latência. O NIM não suporta saída estruturada para esse modelo: o harness não depende de `response_format`.
- **Fine-tuning: descartado (18/11/2026).** O NeMo Automodel ajusta o Gemma 4 31B, mas pede 8 GPUs H100 de 80 GB, entre R$ 200 e R$ 600 por rodada alugada, e o modelo ajustado não cabe no side node (cerca de 62 GB em bf16). Custo fora do orçamento do laboratório (D-23). Volta só com patrocínio de GPU ou modelo pequeno que caiba na RTX 3060.
- **Limites.** Teto diário e disjuntor por rota no LiteLLM (D-21). Sem fallback pago automático: passar a um endpoint pago pede decisão nova.
- **Ollama** sai do caminho padrão e fica só para desenvolvimento.

## Consequências

- O ADR-0004 fica substituído na escolha do modelo; o critério de troca dele (limiares do G-P4) continua valendo para cada rota.
- D-16 muda: o modelo deixa de ser só local. D-23 continua valendo: custo perto de zero. Estimativa do Decision-1.1: US$ 0,042 por 1M tokens de entrada (preço da Vercel), cerca de US$ 0,00008 por decisão de 2.000 tokens.
- O vLLM precisa de GPU em Linux nativo: o desktop com RTX 3060 12 GB pela tailnet (Q-10) ou GPU alugada só na medição (D-23). Sem isso, a rota `simple` usa Ollama provisoriamente, e a rota `internal` fica indisponível.
- P4 passa a comparar backends na mesma suíte: as unidades do N2 e o replay de P1, com acerto, latência e custo por rota no MLflow (D-32). Para `classify`, o A/B entre Decision-1.1 e Switchyard, contra decisões rotuladas.
- O Switchyard é pre-1.0: versão e imagem pinadas por digest (D-40). Uma quebra de API reabre a escolha da rota `classify`.
- O braço Switchyard roda no cluster ou ao lado do gateway. O custo dele é CPU ou GPU local, a medir em P4.
- Segredos (chave do NIM, chave da OpenRouter) fora do Git (D-40).
- Na proposta à empresa, as rotas externas são trocáveis pelo endpoint sancionado (Q-03). Um provedor de origem chinesa pode ser vetado.
- **Não verificado em 2026-11-18.** Conferir antes de aceitar:
  - termos do free tier do NIM ("NVIDIA API Trial Terms of Service"), e se ele retém ou treina com os prompts;
  - licença do Gemma 4: a página do NIM cita a NVIDIA Open Model License e também a Apache-2.0, sem dizer qual vale para quê;
  - suporte a tool calling do Gemma 4 31B no NIM;
  - preço, limites e retenção de prompts do Decision-1.1 na OpenRouter (a página respondeu 404 na consulta);
  - versão publicada e licença do Switchyard;
  - se o Switchyard expõe API compatível com OpenAI ou precisa de integração própria no LiteLLM;
  - se o Switchyard exige GPU, e se devolve score ou probabilidade.
- Os ids de modelo ficam pinados, e cada medição registra a data: modelo hospedado pode mudar ou sair do catálogo e quebrar a reprodução (D-40).
