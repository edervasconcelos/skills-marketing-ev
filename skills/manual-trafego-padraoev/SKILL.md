---
name: manual-trafego-padraoev
description: Cria o Manual de Tráfego Pago completo de um cliente de consultoria em HTML com imagens, ensinando alguém sem experiência prévia a montar as primeiras campanhas em Meta Ads e Google Ads. Gera documento estruturado em 15 seções cobrindo pré-requisitos técnicos, estrutura de conta (com diagramas), orçamento por fase, segmentação (com funil visual), arquitetura de campanhas, mockups de criativo, rastreamento, cadência de otimização, KPIs e checklist de lançamento. Use quando o cliente tiver Manual de Copy pronto (ou diagnóstico + ICP definidos) e for hora de operacionalizar a aquisição paga.
---

# Manual de Tráfego Pago Padrão EV

## Objetivo
Gerar o Manual de Tráfego Pago completo e padronizado de um cliente de consultoria, permitindo que qualquer pessoa — mesmo sem experiência prévia em mídia paga — consiga criar, lançar e otimizar as primeiras campanhas de Meta Ads e/ou Google Ads com segurança.

## Quando usar
- O cliente já tem Manual de Copy, ICP, persona, objeções e CVBA definidos (via `/manual-copy-padraoev` ou diagnóstico equivalente)
- É hora de estruturar a operação de tráfego pago (primeira campanha ou reestruturação de conta existente)
- Alguém novo no projeto (júnior, cliente, estagiário) vai operar as campanhas e precisa de um guia autocontido
- Falta padronizar orçamento, segmentação, estrutura de campanha ou cadência de otimização entre contas

## Materiais necessários antes de começar

Solicite ao usuário o que não estiver no contexto:

1. **Manual de Copy ou diagnóstico do cliente** — ICP, persona, objeções, CVBA, arquétipo (fonte de toda a segmentação e mensagem)
2. **Plataformas ativas ou desejadas** — Meta Ads, Google Ads, LinkedIn Ads, TikTok Ads
3. **Situação técnica atual** — pixel/CAPI instalado? GTM configurado? Conta de anúncio e BM já existem? (ver `/tracking-web-and-capi` se não houver nada)
4. **Orçamento mensal disponível para mídia** — valor real, não estimativa do cliente
5. **Ticket médio e margem** — para calcular CPA-alvo com critério, não achismo
6. **Landing pages ou destinos de tráfego disponíveis** — se não houver LP, sinalizar como pendência crítica
7. **Histórico de campanhas anteriores** — se existiu tráfego pago antes, pedir resultados (CPL, CPA, CTR) como baseline

> Regra: nunca inicie sem ICP definido e sem saber se existe rastreamento de conversão. Sem isso, o manual vira dinheiro jogado fora — sinalize a pendência antes de montar a arquitetura de campanhas.

## Como executar

1. Parta de `references/template.html` (HTML final, com diagramas SVG e mockups de criativo já embutidos) — use `references/template.md` só como checklist de conteúdo caso precise conferir texto de alguma seção
2. Preencha seção por seção com dados reais do cliente — nunca deixe `[MARCADOR]` visível; se faltar dado, mantenha o texto `⚠️ Pendente: [o que precisa coletar]`
3. Puxe ICP, persona, objeções e CVBA diretamente do Manual de Copy do cliente (não reinvente — referencie e adapte para linguagem de segmentação/campanha)
4. **Diagramas (SVG embutido, sempre gerar):** ajuste os textos dentro das tags `<text>` dos diagramas de estrutura de conta (seção 4), timeline de orçamento (seção 6) e funil de públicos (seção 7) para refletir a estrutura real definida para o cliente — não são imagens externas, são código; edite o SVG diretamente
5. **Mockups de criativo (seção 10, sempre gerar):** preencha os componentes `.ig-post`, `.ig-story` e `.serp` com a copy real do Banco de Copy do cliente (headline, texto principal, CTA) — nunca com texto genérico de exemplo
6. **Guias passo a passo (sempre manter, é a espinha dorsal do manual):** todo o manual é escrito no formato de tutorial literal — blocos `<details class="guide-box">` (menu sanfona/accordion, sempre — nunca `<div>` estático) com passos numerados (não parágrafos de resumo) em: seção 4 (criar conta do zero, configurar pixel, escolher posicionamento), seção 9 (os 8 tipos de campanha do cardápio Meta Ads, cada um com a sequência real de telas/cliques no Gerenciador de Anúncios), seção 11 (detalhamento de métricas, colunas personalizadas) e seção 12 (fase de aprendizado). Ao adaptar para um cliente novo, mantenha o formato passo a passo e o accordion — não resuma de volta para parágrafo nem volte para `<div>` fixo. Conteúdo procedural reescrito em linguagem própria a partir de tutoriais reais analisados. **Nunca inclua nome, foto ou marca pessoal de terceiros no manual entregue ao cliente** — o conteúdo é reescrito, não linkado ou creditado. A lista de fontes originais fica só no catálogo interno (`catálogo interno de fontes (não incluído neste pacote)`), nunca no documento do cliente.
   - **Por que accordion:** quem recebe este manual normalmente nunca configurou uma campanha antes — 8+ tutoriais completos abertos ao mesmo tempo intimidam e dificultam achar o guia certo. Cada `<summary>` mostra título + contexto de uma linha; o leitor abre só o que precisa no momento.
   - **Ilustrações genéricas de tela (`.ui-mock`, `.ui-path`) — obrigatório em todo guia, não opcional:** o cliente que recebe este manual é visual e nunca operou uma conta de anúncios — texto puro em lista numerada não basta. Todo `guide-box` precisa de pelo menos uma ilustração de tela simplificada (`.obj-grid` para seleção de objetivo/formato/tipo de correspondência, `.toggle-row`/`.sw` para on-off, `.field-grid` para campos preenchidos, `.check-list-mock` para checklist de itens/colunas/estrutura de formulário) além da trilha de cliques (`.ui-path`, ex: `Gerenciador de Anúncios › Criar › Vendas`). São mockups construídos com HTML/CSS — nunca screenshots reais de conta de terceiro. Use nomes/valores genéricos, nunca dados de um cliente específico (a menos que seja o próprio cliente deste manual, depois do lançamento). Ao adaptar para um cliente novo, mantenha uma ilustração por guia — não regrida para lista de texto puro.
   - **Screenshots reais de terceiro (guias externos, cursos, tutoriais):** antes de usar qualquer print de um tutorial de terceiro, abra a imagem e confira se aparece nome de Business Manager, conta, público, campanha ou foto pessoal — qualquer um desses invalida o print (ver auditoria em `catalogo-guias-trafego-pago.md`/`.html`). Só é seguro usar telas 100% genéricas (ex: tela pública de login de uma plataforma), sem dado de conta.
   - **Botão de link para o guia original de terceiro (`.src-btn`):** por padrão, evite linkar direto para o guia/curso de terceiro que serviu de fonte, porque a maioria mostra conta real de outro negócio (nome de BM, campanhas, verba — ver auditoria). **Só inclua o botão se o próprio cliente pedir isso explicitamente depois de ser avisado do risco** (foi o caso do template atual, decisão de 09/09/2026 — ver nota no catálogo). Quando incluído, sempre junto de `<p class="src-note">Tutorial de terceiro (curso) — pode conter tela de conta/negócio não relacionado a este projeto.</p>` logo abaixo, para deixar claro que o link sai do documento e mostra material de terceiro. Ao adaptar para um cliente novo sem esse pedido explícito, remova os botões `.src-btn` e mantenha só a ilustração genérica.
   - **Accordion de tópico/referência (`<details class="topic-box">`, para conteúdo que não é guia passo a passo):** blocos de explicação/tabela — comparativos, conceitos, glossários — também viram menu sanfona, não só os guias de tutorial. Visual neutro (cinza/branco, sem o ícone 🧭 do `guide-box`) para o leitor distinguir na hora "isto é referência" de "isto é passo a passo". Markup: `<details class="topic-box"><summary><span class="chev">▸</span><span class="summary-text"><h3>Título</h3></span></summary><div class="topic-body">...conteúdo...</div></details>`. Pode aninhar um `guide-box` dentro de um `topic-box` quando o tópico tem um guia associado (ex: seção 4, "Posicionamentos" com o guia "Escolher o posicionamento" dentro). Aplicado nas seções 4, 7 e 9 (ambas as plataformas) em 09/09/2026, a pedido do cliente, para não deixar essas seções compridas demais com tudo sempre aberto — ver decisão no catálogo. Ao adaptar para um cliente novo, mantenha o padrão: todo h3 de explicação/tabela vira `topic-box`, exceto o h3 introdutório que só antecede uma lista de `guide-box` (ex: "Cardápio de campanhas — passo a passo de cada tipo"), que fica solto porque os próprios guias já colapsam individualmente.

7. **Separação por plataforma (`.platform-block`, sempre que o conteúdo de uma seção misturar Meta Ads e Google Ads):** todo bloco de conteúdo exclusivo de uma plataforma fica dentro de `<div class="platform-block meta">` / `.google` / `.linkedin` / `.shared`, com o badge `<div class="platform-badge">` no topo (ex: "META ADS — início") e a linha `— fim do bloco [Plataforma] —` no fechamento. Isso vale para as seções 4, 7, 9, 10, 11 e 12 no template atual.
   - **Toggle "Meta Ads / Google Ads" (`.view-toggle`, sempre presente):** uma barra fixa no topo (`position:sticky`) logo depois de `<body>` deixa o leitor alternar entre as duas plataformas com um clique — clicar em "Meta Ads" esconde todo `.platform-block.google` da página inteira e vice-versa; blocos `.shared` e seções sem par (ex: só Meta em uma seção sem Google equivalente) continuam sempre visíveis, para nunca sumir conteúdo sem substituto. Lógica pura em JS vanilla inline (função `setView()`), sem biblioteca externa, com o estado lembrado via `localStorage`. Ao adaptar para um cliente com só uma plataforma ativa, apague o `.view-toggle` inteiro (não faz sentido alternar entre algo que não existe).
   Ao adaptar para um cliente:
   - Nunca misture conteúdo das duas plataformas dentro do mesmo `.platform-block`.
   - Se o cliente só usa uma plataforma, mantenha o bloco dela e **apague** o(s) bloco(s) da(s) outra(s) — não deixe bloco vazio ou com `[MARCADOR]`.
   - A seção 9 tem cardápio de campanhas completo tanto para Meta Ads (8 tipos) quanto para Google Ads (Pesquisa, Performance Max, Remarketing) — mantenha esse paralelismo se adicionar uma nova plataforma (ex: LinkedIn Ads), criando o `.platform-block.linkedin` equivalente em vez de misturar com os outros dois.
   - Seções que são genuinamente cruzadas entre plataformas (ex: seção 5 Rastreamento, seção 6 Orçamento por fase, seção 8 Alocação de verba, tabela principal de KPIs da seção 11) não usam `.platform-block` — a coluna/linha já identifica a plataforma quando relevante.
8. **Screenshots reais do painel (condicional — só se houver acesso à conta):**
   - Se você tiver acesso navegável à conta de anúncios do cliente (Meta Ads Manager / Google Ads, autenticado), capture os prints indicados nos blocos `.screenshot-slot` das seções 4, 9, 10 e 13 via navegador/automação, salve em `Projetos/{CLIENTE}/Manual_de_Trafego_Pago/assets/screenshots/` e substitua o bloco `.screenshot-slot` por `<img src="assets/screenshots/{arquivo}.png" alt="...">`
   - Se não houver acesso à conta ainda (ex: conta nova, marco zero), mantenha os blocos `.screenshot-slot` como estão — eles funcionam como lembrete visual de "capturar depois do lançamento", não como falha do manual
9. Seções condicionais de conteúdo:
   - **B2B / ticket alto / ciclo longo** → priorizar Google Ads Rede de Pesquisa + LinkedIn Ads + Remarketing; Meta entra como geração de demanda, não conversão direta
   - **B2C / ticket baixo / ciclo curto** → priorizar Meta Ads (funil completo) + Google Ads Performance Max/Shopping se e-commerce
   - **Sem rastreamento de conversão implementado** → seção 5 (Rastreamento) vira pré-requisito bloqueante; registrar isso com destaque no início do manual
   - **Primeira campanha do cliente (marco zero)** → dar peso maior à seção 12 (Erros Comuns) e à seção 13 (Checklist de Lançamento), pois quem vai operar não tem histórico
10. Use valores de orçamento e CPA-alvo realistas: baseie-se no ticket médio, margem e orçamento mensal informados — nunca invente benchmark de mercado sem sinalizar que é estimativa (badge `⚠ Estimativa`)
11. Antes de entregar, extraia o texto visível do HTML e rode revisão PT-BR: `python3 scripts/revisar_md_ptbr.py caminho/arquivo-texto.md` — corrija manualmente no HTML os pontos sinalizados (o script não roda direto em `.html`)
12. Abra o HTML final num navegador e confira: nenhum `[MARCADOR]` visível, diagramas legíveis, mockups com copy real, responsivo em mobile, e cada seção com plataformas separadas por `.platform-block` visualmente clara

## Output esperado

Arquivo `.html` salvo em:
```
Projetos/{CLIENTE}/Manual_de_Trafego_Pago/manual-de-trafego-pago-{cliente-slug}.html
Projetos/{CLIENTE}/Manual_de_Trafego_Pago/assets/screenshots/   (se houver screenshots reais capturados)
```

15 seções completas, sem dependência de arquivo externo (CSS e SVG inline no próprio HTML — abre offline em qualquer navegador). Arquitetura de Campanhas (seção 9) deve ter no mínimo 3 campanhas estruturadas por plataforma ativa, cada uma com dor/objetivo, segmentação e destino de tráfego definidos — no padrão "1 dor = 1 campanha = 1 landing page" quando aplicável.

## Leia também
- `references/template.html` — template HTML completo das 15 seções, com diagramas SVG, mockups de criativo e o conteúdo educativo já embutido (nomenclatura, CBO/ABO, Advantage, cardápio de objetivos/campanhas, estratégia de lance, fase de aprendizado, método de otimização)
- `references/template.md` — checklist de conteúdo por seção (texto puro, sem HTML)
- `catálogo interno de fontes (não incluído neste pacote)` (+ versão `.html` com os links em botão) — catálogo com a origem de cada bloco de conteúdo educativo (guias Tango + PDFs do curso) e a auditoria de quais prints reais foram aprovados/rejeitados por brand-safety. Mantenha os dois formatos sincronizados a cada atualização.
- `references/assets/meta-login-ferramentas-corporativas.png` — único print real do Meta aprovado na auditoria (tela pública de login, sem dado de conta); usado no guia "Criar a conta do zero" da seção 4.
- `references/assets/google-ads-real/` — 17 prints reais do Google Ads aprovados na auditoria de 09/09/2026 (conta do zero, conceder acesso, públicos-alvo, GA4), usados nos guias das seções 4, 7 e 9. Todos passaram por recorte de segurança (mínimo: remover os primeiros ~50px do topo, onde o Google às vezes vaza e-mail/telefone da conta) — nunca reincorporar a versão sem recortar. Antes de adicionar qualquer outro print real de terceiro ao template (Meta, Google ou qualquer plataforma), repita a checagem: nome de Business Manager/agência, público/campanha real ou foto pessoal visível = rejeitar ou recortar.
- `/manual-copy-padraoev` — fonte de ICP, persona, objeções e CVBA usados neste manual
- `/tracking-web-and-capi` — usar antes deste manual se pixel/CAPI/GTM ainda não estiverem implementados
