---
name: social-media-IG-AuditEV
description: Use when auditing a public Instagram or Social Media profile and producing a client-ready report with public evidence, scope approval, Apify fallback, engagement analysis, bio/feed/Reels/copy diagnosis, editorial calendar, action plan, consolidated HTML, and presentation.
---

# Social Media IG Audit EV

Use this skill to produce a public Instagram/Social Media audit that any AI assistant or operator can execute with public data, documented evidence, and a client-ready delivery structure.

The audit must make clear what is confirmed public data, what is strategic interpretation, and what still requires private analytics access.

---

## 🚨 CRITICAL RULE: PRE-EXECUTION GATES, APIFY TOKEN & MANDATORY SCREENSHOTS

The agent **MUST NOT** start mapping, scraping, browsing tools, capturing screenshots, creating files, or auditing the profile until these three gates are complete:

1. **Gate 1 - Required Inputs and Links:** Ask the user, in Portuguese, for the minimum information and links needed to define the audit scope:
   > *"Antes de iniciar o mapeamento, preciso das informações e links que serão auditados: nome do cliente, nicho/mercado, cidade/região, objetivo principal, links do Instagram/Facebook/TikTok/LinkedIn ou outros canais sociais, site/landing page, WhatsApp ou link principal de conversão, concorrentes/benchmarks se houver e pasta de saída desejada."*

   If the user provides only part of the information, proceed only with what is available and mark missing items as limitations in the scope proposal.

2. **Gate 2 - APIFY API Token Verification & User Prompt:** Before any data mapping or evidence collection, check if the `APIFY_API_TOKEN` environment variable or credential is set. If it is NOT set, immediately prompt the user in Portuguese:
   > *"Por favor, me forneça o seu API Token do Apify antes de iniciar o mapeamento. Ele será usado para coletar dados públicos e registrar evidências/prints do Instagram do cliente."*

   The agent **CAN ONLY** proceed with the analysis under one of two conditions:
   * **Condition 1 (Token Provided):** The user provides the API token. The agent configures it and proceeds with the standard workflow using Apify for profile/posts scraping and image evidence.
   * **Condition 2 (Token Refused):** The user explicitly informs or confirms that they will not provide the token. In this case, the agent **MUST** warn the user in Portuguese:
     > *"Entendido. Sem o Token do Apify, a análise do Instagram não terá capturas automáticas de tela (prints) ou imagens do grid/posts integradas no HTML consolidado. O relatório prosseguirá utilizando apenas os dados públicos e as ferramentas alternativas a seguir:*
     >
     > *1. **AppSorteos** ou ferramenta similar para taxa de engajamento pública*
     > *2. **Navegação pública do Instagram/Facebook** para leitura visual manual*
     > *3. **Firecrawl Scrape ou scraper equivalente** para analisar o site institucional, se existir*
     > *4. **Firecrawl Search, busca pública na web ou ferramenta equivalente** para busca de mercado, benchmarking e concorrentes*
     >
     > *Deseja prosseguir com a análise mesmo sem imagens e prints automáticos do Instagram?"*

     The agent **MUST** wait for the user's approval. If approved, the agent proceeds without screenshots, exempting the HTML from the mandatory screenshot rules.

3. **Gate 3 - Scope Proposal Approval:** After receiving inputs and resolving the API token decision, the agent **MUST** deliver a clear scope proposal to the user and wait for approval. The proposal must state what will be audited, which links/channels are included, which sources/tools will be used, what will be delivered, known limitations, execution order, and what depends on missing access or data.

4. **Mandatory Screenshots in HTML (Only applicable if Condition 1 is met):** Under no circumstance can the final HTML deliverables be sent to the user with broken image links, placeholders, or empty spaces. The Instagram public profile screenshot and the 24 post thumbnails **must** be rendered.
   * **Fallback Route A (Apify Scraper + Base64):** Run the Apify Instagram scraper to fetch post URLs and image URLs. Download these images locally and convert them to Base64, embedding them directly into the HTML. Do not use direct external links to prevent them from breaking or being blocked by Instagram's hotlinking protection.
   * **Fallback Route B (Apify Screenshot Actor):** Use Apify screenshot actors (e.g., `apify/web-scraper` or a dedicated screenshot actor) to capture the IG profile page if direct browser capture fails, then convert the captured PNG/JPG to Base64.
   * **Fallback Route C (Manual Upload Request):** If automated browser and Apify scraping both fail to capture screenshots due to Instagram's login walls/blocks, the agent **MUST** ask the user to manually take a screenshot of the Instagram profile (bio, highlights, top grid) and save it as `evidencias/instagram-[client]-public-profile.png`. The agent must then convert this file to Base64 and compile it.
   * *Note for Condition 2:* If the user authorized proceeding without the token, all image spaces in the HTML must be replaced with the text: *"Imagem não disponível (Análise executada sem API Token do Apify)"*.

---

## Core Rules

- This skill must be self-contained. Do not require or invoke any other skill.
- The `SKILL.md` file is the source of truth and must be usable by any AI model, IDE, agent, or automation runner that can read Markdown instructions.
- Optional metadata files, such as `agents/openai.yaml`, are only convenience files for compatible environments. They are not required to understand or execute the workflow.
- External services and tools mentioned here (Apify, AppSorteos, Firecrawl, SimilarWeb, Ubersuggest, browser capture, public web search, or equivalents) are optional execution aids, not required skill dependencies.
- If a named external tool is unavailable, use an equivalent public-data method, manual browser review, user-provided screenshots/files, or mark the item as a limitation. Never stop execution only because another tool or service is missing, unless the user requires that specific source.
- Do not depend on local workspace scripts, private folders, MCP servers, plugins, connectors, or hidden files that are not included with this skill package.
- Work only with public data unless the user explicitly authorizes a logged browser/session.
- If Instagram credentials, browser cookies, or a stable logged session are unavailable, use Apify as the main fallback for public Instagram profile and post data.
- Never expose private browser data in screenshots. Crop or mask tabs, emails, messages, favorites, sidebars, IDE content, extensions, account details, and personal notifications.
- Do not invent metrics. If a tool does not provide traffic, reach, impressions, saves, shares, retention, clicks, indexed keywords, or visits, mark the item as a recommended next measurement.
- Preserve raw evidence: save tool inputs/outputs, screenshots, source URLs, and notes about limitations.
- The final HTML files MUST be completely independent and self-contained. To prevent images from breaking when the HTML is shared or sent to another person, all captured screenshots (such as the profile bio, highlights, AppSorteos graphs) and post thumbnails MUST be embedded directly in the HTML as Base64 data URIs (e.g., `src="data:image/png;base64,..."`). Local relative paths (like `src="evidencias/prints/..."`) or external links to those files are forbidden in the final deliverables.
- Write deliverables in clear client-facing language: what is good, what is not good, why it matters, and how to fix it.

---

## Required Inputs

Ask for these before starting the audit. Infer only when the information is public and obvious; otherwise mark as missing in the scope proposal:
- Client name, niche, market, city/region, and target audience.
- Main objective: leads, sales, authority, education, relationship, hiring, awareness, or local demand generation.
- Instagram handle or profile URL.
- Facebook, TikTok, LinkedIn, YouTube, Pinterest, Google Business Profile, or any other social/profile links that must be audited.
- Client website, landing page, catalog, store, WhatsApp link, scheduling link, or main conversion destination.
- Current offer, product/service lines, seasonal priorities, and commercial constraints.
- Competitors, benchmarks, or aspirational profiles, if comparison is part of the scope.
- Available access level: public only, logged browser/session, Instagram Insights screenshots, GA4, Search Console, CRM, ad account, or none.
- `APIFY_API_TOKEN` decision: token provided, token unavailable, or user explicitly approves continuing without token.
- Desired output folder.
- Expected deliverable format: single standalone HTML, HTML plus assets, presentation, PDF, or a combination.

---

## Alinhamento de Escopo Antes da Execução

Antes de coletar dados, navegar em ferramentas, capturar prints, criar arquivos ou iniciar qualquer diagnóstico, alinhe o escopo com o usuário e peça aprovação explícita.
Se o usuário não enviar um escopo, envie uma proposta em português com:
- Objetivo da análise.
- Links e canais que serão auditados.
- O que será mapeado em cada canal: perfil, bio, destaques, feed, Reels, copy, engajamento público, jornada de conversão, site/destinos e concorrentes.
- Fontes e ferramentas previstas.
- Entregáveis esperados.
- Limitações conhecidas, incluindo dados privados indisponíveis.
- Dados/acessos necessários.
- Ordem de execução.
- Pontos que precisam de aprovação antes de iniciar.

The scope proposal must be client-readable and operational. It should make clear that the agent will produce a final standalone HTML report after approval and evidence collection.

Modelo recomendado de resposta para aprovação:
```md
# Proposta de Escopo para Aprovação

## Objetivo
Realizar uma análise pública de Social Media/Instagram para identificar pontos fortes, gargalos e oportunidades de melhoria em bio, feed, Reels, copy, engajamento, jornada do usuário, funil orgânico, calendário editorial e plano de ação.

## Canais e Links a Auditar
- Instagram: [link]
- Facebook/Meta: [link, se houver]
- Outros canais sociais: [links, se houver]
- Site/landing page/WhatsApp/destino de conversão: [links, se houver]

## Fontes Previstas
- Instagram público do cliente
- Facebook, TikTok, LinkedIn, YouTube ou outros canais enviados pelo usuário, quando aplicável
- Site público do cliente, se existir
- Apify (usando o Token fornecido), caso não exista acesso/sessão válida no Instagram
- Ferramentas públicas de engajamento, como AppSorteos ou similares
- Ferramentas de SEO/tráfego, quando disponíveis

## Entregáveis
- Diagnóstico do perfil (HTML)
- Evidências visuais e prints tratados (HTML)
- Análise de engajamento público (HTML)
- Jornada do usuário: o que ele vê hoje e quais caminhos pode seguir a partir de IG/FB/outros canais
- Raio-X da bio com pontos bons, pontos a melhorar e boas práticas
- Análise de bio, feed, copy, Reels e formatos de conteúdo
- Explicação dos formatos: função, para quem criar, quando usar e boas práticas
- Plano de mídia/calendário editorial de 30 dias em formato de calendário
- Plano de ação com checklist detalhado de melhorias para 30 e 60 dias
- HTML consolidado completo

## Limitações
Sem Instagram Insights, GA4 ou Search Console interno, alguns dados serão tratados como leitura pública, inferência estratégica ou próxima camada de medição recomendada.

## Aprovação
Posso seguir com este escopo?
```

---

## Source Hierarchy

1. **Authorized logged browser:** use only for public visual capture and navigation.
2. **Apify:** use with the user's `APIFY_API_TOKEN` when browser access is blocked or unstable. Save input and JSON output.
3. **Public engagement tools:** use AppSorteos or similar sources to get public engagement rates.
4. **Public website:** extract SEO, categories, products, CTAs, conversion paths via Firecrawl Scrape, another scraper, browser review, or manual review.
5. **SEO/traffic tools:** use SimilarWeb, Ubersuggest, Firecrawl Search, public search, or equivalent. If none are available, document the limitation and proceed with qualitative public evidence.

---

## Required Audit Modules

The final analysis must cover these modules, even when some items are marked as "not measurable with public data".

### 1. Jornada do Usuário

Map the current user journey starting from each audited channel, especially Instagram and Facebook:
- Entry point: where the user arrives first (profile, post, Reel, story highlight, ad, search result, tagged post, or recommendation).
- First impression: what the user sees in the first 3 to 5 seconds.
- Information path: bio, pinned posts, highlights, captions, link in bio, WhatsApp, site, catalog, checkout, booking page, or DM.
- Decision friction: missing price, unclear offer, weak CTA, too many links, broken links, confusing highlights, lack of proof, lack of location, or unclear next step.
- Conversion paths: DM, WhatsApp, site, checkout, form, phone, physical store, scheduling, or lead magnet.
- Recommended journey: show the ideal path with fewer steps and clearer CTAs.
- Evidence: include screenshots, URLs, notes, and limitations for each step.

The report must explain "what the user sees today", "how the user understands it", "where the user can go next", and "what should change to improve conversion".

### 2. Raio-X do Perfil e Bio

Audit the bio point by point. For each item, the report must state:
- **O que está legal:** what already helps clarity, credibility, search, conversion, or positioning.
- **O que precisa melhorar:** what creates friction, ambiguity, weak differentiation, weak CTA, or missed keyword opportunity.
- **Boa prática:** the recommended pattern and why it matters.
- **Ajuste sugerido:** a concrete rewrite or implementation instruction.

Evaluate at least these bio/profile dimensions:
- Name field/searchability.
- Profile picture/logo clarity.
- Category and positioning.
- First line/value proposition.
- Proof/authority.
- Offer clarity.
- Location and service region.
- CTA.
- Link in bio.
- Contact buttons.
- Highlights order and labels.
- Pinned posts.

### 3. Formatos de Conteúdo

The report must explain the role of each relevant format, not only recommend it. For each format, include:
- What the format does in the funnel.
- Who it should be created for.
- When to use it.
- Best practices.
- Common mistakes to avoid.
- Example idea/script adapted to the client's niche.

Cover at minimum:
- Reels.
- Carrossel.
- Post estático.
- Stories.
- Destaques.
- Live.
- Collab post.
- Depoimento/prova social.
- Bastidores.
- Oferta/conversão.

### 4. Plano de Mídia e Calendário Editorial de 30 Dias

The final deliverable must include a 30-day content plan in calendar format. It must be practical enough for the user to execute:
- Day/date.
- Channel.
- Format.
- Content pillar.
- Objective.
- Hook or opening angle.
- CTA.
- Production note.
- Priority.

The calendar must balance awareness, education, proof, relationship, offer, and conversion. If the client has B2B and B2C audiences, identify the intended audience for each day.

### 5. Plano de Ação 30 e 60 Dias

The final deliverable must include a detailed checklist for improvements:
- **0-30 dias:** urgent fixes and quick wins, including bio, links, highlights, pinned posts, CTA, posting routine, tracking basics, and content formats.
- **31-60 dias:** structural improvements, including testing cadence, content series, landing/WhatsApp optimization, proof assets, paid/organic alignment, CRM or pipeline tracking, and measurement routines.

Each checklist item must include priority, owner suggestion, effort level, expected impact, deadline, and success metric.

---

## CONSOLIDATED DESIGN GUIDELINES (Dark Mode)

Every HTML file produced by this skill must incorporate these CSS styles and layout patterns. Do not reference external styling files; write them inline or in a `<style>` block.

### Visual System Variables & Base
```css
:root {
  --bg: #0a0f1a;
  --card: #111827;
  --card2: #1a2535;
  --border: #1e2d3d;
  --red: #e63946;
  --orange: #f97316;
  --text: #f1f5f9;
  --muted: #94a3b8;
  --good-bg: #052e16;
  --good: #4ade80;
  --bad-bg: #450a0a;
  --bad: #f87171;
  --warn-bg: #422006;
  --warn: #fbbf24;
  --blue: #3b82f6;
  --purple: #a855f7;
}
* { box-sizing: border-box; margin: 0; padding: 0; }
body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Segoe UI', -apple-system, Arial, sans-serif;
  line-height: 1.6;
  font-size: 15px;
}
a { color: var(--orange); text-decoration: none; transition: 0.2s; }
a:hover { text-decoration: underline; }
```

### Components CSS

* **Navigation Menu:**
  ```css
  nav { position: sticky; top: 0; z-index: 100; background: #050a12; border-bottom: 2px solid var(--red); padding: 0 20px; display: flex; align-items: center; gap: 8px; overflow-x: auto; white-space: nowrap; height: 48px; }
  nav .logo { font-weight: 800; font-size: 13px; color: var(--red); margin-right: 12px; flex-shrink: 0; }
  nav a { color: var(--muted); font-size: 12px; padding: 4px 10px; border-radius: 4px; transition: .2s; }
  nav a:hover { color: var(--text); background: var(--card); text-decoration: none; }
  ```
* **Hero Section:**
  ```css
  .hero { background: linear-gradient(135deg, #0a0f1a 0%, #1a0a12 50%, #0a1428 100%); padding: 60px 24px 40px; border-bottom: 1px solid var(--border); }
  .hero-inner { max-width: 1200px; margin: 0 auto; }
  .eyebrow { font-size: 11px; font-weight: 700; color: var(--red); text-transform: uppercase; letter-spacing: .12em; margin-bottom: 12px; }
  .hero h1 { font-size: clamp(28px, 4vw, 48px); font-weight: 900; line-height: 1.1; margin-bottom: 16px; }
  .hero h1 span { color: var(--red); }
  .hero-sub { font-size: 17px; color: var(--muted); max-width: 700px; margin-bottom: 28px; }
  .hero-meta { display: flex; flex-wrap: wrap; gap: 12px; }
  .pill { background: var(--card); border: 1px solid var(--border); padding: 6px 14px; border-radius: 999px; font-size: 12px; color: var(--muted); }
  .pill b { color: var(--text); }
  ```
* **Cards & Grids:**
  ```css
  .grid-2 { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 16px; }
  .grid-3 { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 14px; }
  .grid-4 { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 12px; }
  .card { background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 20px; }
  .card.good { background: var(--good-bg); border-color: #166534; }
  .card.bad { background: var(--bad-bg); border-color: #7f1d1d; }
  .card.warn { background: var(--warn-bg); border-color: #92400e; }
  .card.accent { border-color: var(--red); }
  ```
* **KPI Metrics:**
  ```css
  .kpi { font-size: 38px; font-weight: 900; line-height: 1; margin-bottom: 4px; }
  .kpi.red { color: var(--red); }
  .kpi.green { color: var(--good); }
  .kpi.warn { color: var(--warn); }
  .kpi-label { font-size: 12px; color: var(--muted); }
  .kpi-sub { font-size: 11px; color: var(--muted); margin-top: 4px; }
  ```
* **Score Bars (Raio-X):**
  ```css
  .score-bar { display: flex; align-items: center; gap: 12px; margin-bottom: 10px; }
  .score-bar .label { flex: 1; font-size: 13px; color: var(--muted); }
  .bar-track { flex: 2; height: 8px; background: var(--border); border-radius: 4px; overflow: hidden; }
  .bar-fill { height: 100%; border-radius: 4px; }
  .score-bar .val { font-size: 13px; font-weight: 700; width: 40px; text-align: right; }
  ```
* **Organic Funnel:**
  ```css
  .funnel { display: flex; flex-direction: column; gap: 4px; max-width: 600px; margin: 20px auto; }
  .funnel-step { display: flex; align-items: center; gap: 16px; padding: 12px 20px; border-radius: 8px; font-size: 13px; }
  .funnel-step .num { font-size: 22px; font-weight: 900; width: 36px; flex-shrink: 0; text-align: center; }
  .funnel-step .info { flex: 1; }
  .funnel-step .metric { font-size: 12px; color: var(--muted); text-align: right; flex-shrink: 0; }
  .fs1 { background: #1a0a12; border: 1px solid var(--red); }
  .fs2 { background: #1a1205; border: 1px solid var(--orange); }
  .fs3 { background: #0a1428; border: 1px solid var(--blue); }
  .fs4 { background: #0a1a14; border: 1px solid #22c55e; }
  .fs5 { background: #1a0a28; border: 1px solid var(--purple); }
  ```
* **Journey Map:**
  ```css
  .journey-map { display: grid; grid-template-columns: repeat(auto-fit, minmax(190px, 1fr)); gap: 10px; margin-top: 16px; }
  .journey-step { background: var(--card); border: 1px solid var(--border); border-radius: 8px; padding: 14px; position: relative; min-height: 120px; }
  .journey-step .step-label { font-size: 10px; color: var(--orange); text-transform: uppercase; letter-spacing: .08em; margin-bottom: 6px; }
  .journey-step h4 { font-size: 14px; margin-bottom: 6px; }
  .journey-step p { font-size: 12px; color: var(--muted); margin: 0; }
  .journey-step.good { border-color: #166534; background: var(--good-bg); }
  .journey-step.warn { border-color: #92400e; background: var(--warn-bg); }
  .journey-step.bad { border-color: #7f1d1d; background: var(--bad-bg); }
  ```
* **Calendar Grid:**
  ```css
  .cal-grid { display: grid; grid-template-columns: repeat(7, 1fr); gap: 4px; margin-top: 16px; }
  .cal-header { text-align: center; font-size: 10px; text-transform: uppercase; letter-spacing: .08em; color: var(--muted); padding: 6px 0; }
  .cal-day { background: var(--card); border: 1px solid var(--border); border-radius: 6px; padding: 8px 6px; min-height: 80px; }
  .cal-day .date { font-size: 10px; color: var(--muted); margin-bottom: 4px; }
  .cal-day .type { font-size: 9px; font-weight: 700; text-transform: uppercase; letter-spacing: .06em; margin-bottom: 3px; }
  .cal-day .content { font-size: 10px; color: #cbd5e1; line-height: 1.4; }
  .cal-day.launch { border-color: var(--red); background: #1a0a12; }
  .cal-day.b2b { border-color: var(--blue); background: #0a1428; }
  .cal-day.bastidor { border-color: var(--orange); background: #1a0f05; }
  .cal-day.social { border-color: var(--good); background: #052e16; }
  .cal-day.lifestyle { border-color: var(--purple); background: #1a0a28; }
  .cal-day.off { background: #070c16; opacity: .5; }
  ```
* **Action Items:**
  ```css
  .action-item { display: flex; gap: 16px; padding: 16px; background: var(--card); border: 1px solid var(--border); border-radius: 8px; margin-bottom: 10px; }
  .action-prio { width: 60px; flex-shrink: 0; text-align: center; font-size: 10px; font-weight: 700; text-transform: uppercase; padding: 4px 0; border-radius: 4px; }
  .prio-hot { background: #450a0a; color: var(--bad); }
  .prio-high { background: #422006; color: var(--warn); }
  .prio-med { background: #0c2240; color: var(--blue); }
  .action-body h4 { font-size: 14px; margin-bottom: 4px; }
  .action-body p { font-size: 12px; margin: 0; color: var(--muted); }
  .action-meta { display: flex; gap: 8px; margin-top: 6px; flex-wrap: wrap; }
  .action-tag { font-size: 10px; background: var(--card2); padding: 2px 8px; border-radius: 999px; color: var(--muted); }
  ```

---

## CONSOLIDATED COPYWRITING & TONE GUIDELINES

Every diagnosis, copy rewrite, and template must follow this copywriting framework:

### 1. Tone of Voice Definition
* **Direto (Direct):** State facts clearly. Avoid corporate puffery or vague promises.
  * *Errado:* "Temos condições super exclusivas e imperdíveis de atacado esperando por você!"
  * *Correto:* "Pedido mínimo de 10 peças. Desconto automático no carrinho."
* **Próximo (Proximate):** Speak like a partner or advisor, not a distant brand. Use conversational Brazilian Portuguese.
  * *Errado:* "Nossos atendentes estão de prontidão para responder a sua solicitação."
  * *Correto:* "Chama a gente aqui no WhatsApp que te mandamos o catálogo."
* **Confiante (Confident):** Focus on proof, history, and real manufacturing. No need to shout or use capital letters everywhere.
  * *Errado:* "O MELHOR PRODUTO FITNESS DO BRASIL!!!"
  * *Correto:* "Fabricação própria há 12 anos. Caimento testado em modelos reais."
* **Animado sem Excesso (Enthusiastic but grounded):** Show excitement for new drops but remain professional and business-focused.

### 2. Forbidden vs. Allowed Vocabulary
* **Forbidden (Do NOT use):** "Qualidade premium" (cliché), "Produto diferenciado" (lazy), "Incrível/Imperdível" (hype), "Valores sob consulta" (creates friction), "Prezado(a) cliente" (too distant).
* **Allowed (Use these instead):** "Fabricação própria", "Caimento/Costura resistente", "Pedido mínimo de X peças", "Coleção nova toda semana", "Lojista/Revendedor/Parceiro".

### 3. Objection Handling Script Framework (B2B/B2C)
Every script must follow: **Reconhece** (Acknowledge) → **Diferencia** (Differentiate) → **Prova** (Provide Proof) → **Convida** (Invite Action).
* *Exemplo (Preço alto):* "Entendo que preço seja uma prioridade para você. [Reconhece] Nossas peças são fabricadas aqui em São Paulo com tecidos que não ficam transparentes e costura reforçada para treinos intensos. [Diferencia] Lojistas parceiros relatam que a taxa de troca é zero e a margem de lucro é protegida. [Prova] Qual é a linha de preço com a qual seu público está mais acostumado hoje? Posso indicar os modelos de maior giro. [Convida]"

---

## Workflow

1. **Input Intake:** Ask for client information, links/channels to audit, conversion destinations, competitors/benchmarks, objective, output folder, and expected deliverable format.
2. **Apify API Check:** Ask the user for `APIFY_API_TOKEN` if not set. Do this before any mapping, scraping, screenshot capture, or evidence collection.
3. **Scope Agreement:** Draft and get user approval on the scope before execution. Include links/channels, planned sources, deliverables, limitations, API/token status, and execution order. Save the approved scope file as `00-ESCOPO-SEMANA-[N]-[CLIENT]-APROVADO.md` when a project folder exists.
4. **Initialize Project:** After approval, create project directory, `evidencias/`, and `evidencias/prints/`.
5. **Evidence Collection:**
   * Browser capture or manual screenshot of Instagram profile -> Save to `evidencias/instagram-[client]-public-profile.png`.
   * Run Apify public profile scraper -> Save JSON inputs/outputs to `evidencias/`.
   * Run AppSorteos or public engagement calculators -> Save screenshots and text outputs.
   * Scrape or manually review the public website (if exists) via Firecrawl, another scraper, browser review, or equivalent public-data method.
   * Download/screenshot 24 post thumbnails -> Save as `evidencias/prints/post-01.jpg` to `post-24.jpg`.
6. **Analyze & Audit:** Evaluate profile bio, keywords, traffic origins, positioning, engagement rate, content categories, user journey, content formats, digital ecosystem, and actions.
7. **Generate Deliverables:** Create the auxiliary files (Diagnóstico, Evidências, Jornada, Plano de Mídia/Calendário, Plano de Ação 30/60) and compile them into the consolidated `ANALISE-COMPLETA-IG-[CLIENT].html` ensuring all screenshots/prints are fully loaded as Base64.

---

## Required Sections for the Complete HTML

The consolidated HTML should include all important information from the auxiliary files, in this exact order:

1. **Resumo Executivo** — Blockquote explaining the core problem + 4 KPI cards (Followers, Engagement Rate, Volume of posts, Critical Alert).
2. **Escopo Executado e Limitações** — Channels audited, links included, Apify/token status, public-data limitations, and missing private analytics.
3. **SEO / Palavras-Chave** — Searchable name audit, bio keywords, missed local search keywords, site SEO gaps.
4. **Tráfego e Origem** — Table mapping visitor sources (Direct, IG, FB, WhatsApp, Paid, Organic, Search, Referral) vs evidence.
5. **Jornada do Usuário** — Current path from Instagram/Facebook/other channels to conversion, what the user sees today, friction points, and recommended journey.
6. **O Que Está Bom / O Que Não Está** — Two-column grid (`.card.good` vs `.card.bad`) with practical impact.
7. **Posicionamento** — Current positioning vs recommended positioning narrative, competitor list, market opportunities.
8. **Insights Estratégicos** — Exactly 3 numbered strategic insights with actionable next steps.
9. **Raio-X do Perfil** — Score bars (0-10) for at least 7 dimensions and a weighted overall score badge.
10. **Diagnóstico da Bio** — Point-by-point bio/profile review with "o que está legal", "o que precisa melhorar", "boa prática", and "ajuste sugerido"; include original bio vs 3 recommended versions (Hybrid, B2B, B2C).
11. **Destaques** — Current highlights order (with `.bad` items marked) vs recommended order (with `.good` items).
12. **Engajamento Público** — AppSorteos or similar data table compared against expected benchmarks per follower tier.
13. **Análise de Conteúdos** — 24-post gallery grid ranked by public signals, identifying best/worst performers and content patterns.
14. **Copy e Reels** — Caption copywriting patterns (hook, body, CTA) and Reels visual hook analysis.
15. **Guia de Formatos** — Explain each recommended format (Reels, carrossel, stories, estático, live, collab, prova social, bastidores, oferta): what it does, who it is for, when to use, best practices, mistakes, and example scripts.
16. **Funil Orgânico** — Steps from Discovery to Conversion (separate B2B and B2C funnels if applicable).
17. **Diagnóstico Digital** — Grid mapping site speed, checkout, Meta Pixel installation, UTM usage, WhatsApp catalog, CRM status.
18. **Linha Editorial** — 5 content pillars, each color-coded with details on goal, frequency, audience, and sample post ideas.
19. **Plano de Mídia de 30 Dias** — Execution plan with day/date, channel, format, pillar, objective, hook, CTA, production note, and priority.
20. **Calendário Editorial de 30 Dias** — Full 30-day calendar grid (`.cal-grid`) with color-coded days and clear posting rhythm.
21. **Métricas** — Expected metrics: current state vs 30-day target vs 60-day target vs 90-day target.
22. **Plano de Ação 30 e 60 Dias** — Detailed `.action-item` checklist split into 0-30 days and 31-60 days with priority, owner, effort, impact, deadline, and success metric.
23. **Próxima Camada** — List of data, accesses, and tools needed to deepen the analysis (Instagram Insights, GA4, Search Console, CRM, ad account).
24. **Fontes** — A table list of all sources used, URLs, access dates, and data limitations.

---

## Print and Evidence Standards

* **IG Profile Screenshot:** Crop out browser tabs, address bar, IDE, personal bookmarks, extensions, and notifications. Only the IG page content should remain.
* **AppSorteos Screenshot:** Show only the engagement result box. Crop out the surrounding advertisements and browser chrome.
* **Mandatory Base64 Embedding:** Programmatically convert all saved screenshots, engagement charts, and post thumbnails in `evidencias/` to base64 encoding and replace the `src` attribute of all `<img>` tags in the final HTML deliverables. This guarantees the files are 100% standalone, self-contained, and portable when shared.
