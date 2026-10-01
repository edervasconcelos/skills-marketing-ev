# Skill Handoff
**skill_vasconcelos** | Versão 1.1 | Criado por: Eder Vasconcelos

> Workflow completo para criar o documento de handoff estratégico de um cliente de consultoria — cobrindo cada semana de consultoria, funis, ICPs, materiais produzidos, alertas críticos e links para todos os entregáveis HTML publicados.

---

## REGRA ABSOLUTA — NÃO GERE NADA SEM COMPLETAR O BRIEFING

**PROIBIDO** criar qualquer arquivo HTML, escrever qualquer seção do handoff ou publicar no Surge antes de coletar TODOS os blocos A, B, C, D, E, F, G e H do briefing.

O Bloco E (links dos materiais) é o bloqueador mais crítico: **sem as URLs reais do Surge, o handoff não pode ser criado**. Placeholder `#` ou links fictícios são proibidos.

Se o usuário pedir para "ir em frente" sem fornecer os links — perguntar novamente. Nunca assumir, nunca inventar URL.

---

## REGRA ABSOLUTA — Paleta padrão (sem azul jamais)

Todo HTML gerado por esta skill deve usar **exclusivamente** a paleta abaixo.
**Azul é proibido em qualquer tom** — navy, indigo, `#315c96`, `#356b8c`, `#7b9fd4`, `rgba(100,160,255,...)`, `rgba(123,159,212,...)` e qualquer variação. Sem exceção.

```css
/* Cole este bloco EXATAMENTE no <style> do handoff. Não altere os valores. */
:root {
  --bg-950:    #080809;
  --bg-900:    #10100f;
  --bg-800:    #18181a;
  --bg-700:    #242426;
  --gold:      #f1b52f;
  --gold-2:    #c9a96e;
  --amber:     #b8956a;
  --steel-300: #c8c0b0;
  --steel-200: #e6dfd6;
  --paper:     #f5f2ee;
  --green:     #22c55e;
  --red:       #ef4444;
  --warning:   #f59e0b;
}
body {
  background: linear-gradient(180deg, #070707 0%, #0e0d0c 100%);
  color: var(--steel-300);
  font-family: system-ui, -apple-system, sans-serif;
  margin: 0;
}
.topbar-inner { max-width: min(1500px, calc(100vw - 40px)); margin: 0 auto; }
.page-content  { max-width: min(1360px, calc(100vw - 32px)); margin: 0 auto; padding: 0 16px; }
```

**Antes de salvar o HTML, grep por:** `blue`, `navy`, `indigo`, `#3`, `rgba(1` — se encontrar, substituir por `var(--amber)`.

---

## Como funciona o fluxo

```
FASE 0 — Briefing (blocos A→H, um por vez, aguardando resposta)
  ↓  [SÓ avança após TODOS os blocos respondidos]
FASE 1 — Verificação NotebookLM
  ↓
FASE 2 — Deploy dos HTMLs auxiliares (a partir dos links do Bloco E)
  ↓
FASE 3 — Geração do handoff HTML (com paleta padrão, sem azul)
  ↓
FASE 4 — Checklist de qualidade
  ↓
FASE 5 — Publicação no Surge
```

---

## FASE 0 — Briefing Guiado

Apresente **um bloco por vez**. Aguarde o usuário responder antes de apresentar o próximo. Não pule blocos. Não assuma respostas.

Comece assim:
> "Vou coletar as informações do cliente para montar o handoff. Vamos bloco por bloco. **Bloco A — Identidade do cliente:**"

---

### Bloco A — Identidade do cliente
Aguarde resposta completa antes de prosseguir para o Bloco B.

- **A1.** Qual o nome do cliente/empresa? *(nome exato, sigla interna, @ Instagram principal)*
- **A2.** Qual o segmento e produto/serviço principal?
- **A3.** Qual a cidade/estado e abrangência de mercado?
- **A4.** Há quanto tempo existe? Há quanto tempo está no digital?
- **A5.** Faturamento atual (mensal) e meta de faturamento?
- **A6.** Ticket médio? Há sazonalidade relevante?

---

### Bloco B — ICP e funis
Aguarde resposta completa antes de prosseguir para o Bloco C.

- **B1.** ICP principal — descreva: perfil demográfico, dores (3–5), objeções (3–5), motivadores de compra, LTV estimado, canal onde está.
- **B2.** ICPs secundários (P2, P3...) — mesmo nível de detalhe.
- **B3.** Funil do ICP P1: Topo (como descobre?) → Meio (o que convence?) → Fundo (como converte?) → Pós-venda (régua/CRM/recompra?)
- **B4.** Funil separado para outros ICPs?

---

### Bloco C — Diagnóstico digital
Aguarde resposta completa antes de prosseguir para o Bloco D.

- **C1.** Instagram: @, seguidores, engajamento, conta comercial?
- **C2.** Site: URL, está no ar? Indexado no Google?
- **C3.** Pixel Meta: instalado? Em quais páginas?
- **C4.** Google Analytics / GA4: instalado?
- **C5.** CRM ou e-mail marketing: qual ferramenta? Tamanho da base?
- **C6.** WhatsApp Business: catálogo e respostas automáticas configurados?

---

### Bloco D — Semanas de consultoria
Aguarde resposta completa antes de prosseguir para o Bloco E.

Para **cada semana** já realizada, coletar:
- Data da sessão
- Tema central
- **Link da gravação** (Meet, Zoom, Loom — ou "gravação não disponível")
- Principais pontos discutidos (3–7 bullets)
- Entregáveis produzidos nessa semana
- Próximos passos combinados

---

### Bloco E — Materiais e links ⚠️ BLOQUEADOR CRÍTICO
**NÃO avance para a FASE 1 sem este bloco completo.**
Aguarde resposta completa antes de prosseguir para o Bloco F.

Para **cada HTML já produzido**, coletar:
- Nome do arquivo
- O que ele contém (descrição curta)
- Caminho local completo do arquivo
- **URL já publicada no Surge** *(se não publicado ainda, anotar como "pendente — publicar na FASE 2")*

Perguntas obrigatórias:
- **E1.** Liste todos os HTMLs produzidos com os dados acima.
- **E2.** Qual o domínio Surge.sh do cliente? *(Ex: `nomedocliente.surge.sh`)*
- **E3.** Há links externos relevantes? *(Google Drive, apresentações, planilhas)*

> Se o usuário não souber as URLs ainda: anotar os arquivos como pendentes e publicá-los na FASE 2 antes de criar o handoff. Nunca usar `href="#"` ou URLs inventadas.

---

### Bloco F — Estratégia e concorrentes
Aguarde resposta completa antes de prosseguir para o Bloco G.

- **F1.** Três principais diferenciais competitivos do cliente.
- **F2.** Concorrentes diretos: @ Instagram, seguidores, anúncios ativos, posicionamento, principal fraqueza.
- **F3.** Posicionamento estratégico recomendado para o cliente.
- **F4.** Proposta de valor central (uma frase direta).

---

### Bloco G — Alertas e próximos passos
Aguarde resposta completa antes de prosseguir para o Bloco H.

- **G1.** Bloqueadores críticos ainda não resolvidos.
- **G2.** Prioridades para as próximas semanas (máximo 5, ordenadas por impacto).
- **G3.** Riscos que o cliente precisa ser alertado urgentemente.

---

### Bloco H — Identidade visual do handoff
Após este bloco, confirme com o usuário que todos os dados foram coletados antes de avançar.

- **H1.** Cor primária da marca do cliente (hex ou nome).
- **H2.** Existe logotipo ou foto do espaço físico para usar no hero?
- **H3.** Nome do consultor responsável.

**Confirmação obrigatória antes de avançar:**
> "Coletei todos os blocos A a H. Posso avançar para gerar o handoff?"
Aguarde "sim" ou ajustes do usuário.

---

## FASE 1 — Verificação de NotebookLM

```
1. Chamar mcp__notebooklm__get_health
2. Se authenticated: true → perguntar ao usuário se há notebook do projeto
   - Se sim: list_notebooks → selecionar → ask_question para enriquecer seções
   - Perguntas úteis: "Quais descobertas do diagnóstico?", "Quais objeções o cliente levantou?",
     "Quais próximos passos foram combinados na última sessão?"
3. Se não autenticado → setup_auth
4. Se MCP indisponível → continuar sem ele, registrar alerta no handoff
```

---

## FASE 2 — Deploy dos HTMLs auxiliares

Para cada arquivo marcado como "pendente" no Bloco E:

```powershell
# Estrutura _deploy padrão
_deploy/
├── handoff.html
├── planejamento/index.html
├── manual-copy/index.html
├── copy-anuncios/index.html
├── organograma/index.html
├── analise-ig/index.html
├── analise-ig/diagnostico.html
├── analise-ig/plano-acao.html
├── apresentacao-sm/index.html
├── jornada/index.html
└── [outros conforme o projeto]

# Copiar sem risco de encoding:
Copy-Item -Path $origem -Destination $destino

# NUNCA usar Get-Content -Raw + Set-Content (corrompe acentos PT-BR)
# Para editar texto: sempre usar
[System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText($path, $content, (New-Object System.Text.UTF8Encoding $false))

# Publicar
cd "_deploy"
npx surge . [cliente].surge.sh
```

Após publicar, registrar as URLs finais e usá-las nos link-cards do handoff.

---

## FASE 3 — Geração do handoff HTML

Use o CSS da seção "Paleta padrão" no topo deste documento. Não use outra paleta.

### Estrutura completa do handoff

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Handoff — [CLIENTE] | [SUA EMPRESA]</title>
  <style>
    /* Cole aqui o bloco CSS da paleta padrão do topo desta skill */
    /* Adicione estilos de componentes abaixo */

    .topbar {
      position: sticky; top: 0; z-index: 100;
      background: rgba(8,8,7,0.92); backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--bg-700);
      padding: 0 20px;
    }
    .topbar-inner {
      display: flex; align-items: center; justify-content: space-between;
      height: 52px;
    }
    .topbar-brand { display: flex; align-items: center; gap: 10px; }
    .topbar-logo {
      background: var(--gold); color: #000;
      font-weight: 800; font-size: 13px;
      padding: 3px 8px; border-radius: 4px;
    }
    .topbar-client { font-weight: 600; color: var(--steel-200); font-size: 15px; }
    .topbar-tag { font-size: 11px; color: var(--gold-2); text-transform: uppercase; letter-spacing: .06em; }
    .topbar-nav { display: flex; gap: 24px; }
    .topbar-nav a { color: var(--steel-300); text-decoration: none; font-size: 13px; }
    .topbar-nav a:hover { color: var(--gold); }

    .hero {
      padding: 64px 20px 48px;
      text-align: center;
      border-bottom: 1px solid var(--bg-700);
    }
    .hero-tag {
      font-size: 11px; text-transform: uppercase; letter-spacing: .1em;
      color: var(--gold-2); margin-bottom: 16px;
    }
    .hero h1 { font-size: clamp(32px,5vw,52px); color: #fff; margin: 0 0 8px; }
    .hero-subtitle { color: var(--steel-300); font-size: 16px; margin: 0 0 32px; }
    .hero-stats { display: flex; justify-content: center; gap: 40px; flex-wrap: wrap; }
    .stat { display: flex; flex-direction: column; align-items: center; }
    .stat-val { font-size: 24px; font-weight: 700; color: var(--gold); }
    .stat-label { font-size: 11px; color: var(--steel-300); text-transform: uppercase; letter-spacing: .06em; }

    .section { padding: 48px 20px; border-bottom: 1px solid var(--bg-700); }
    .section h2 {
      font-size: 20px; font-weight: 700; color: var(--gold);
      text-transform: uppercase; letter-spacing: .06em;
      margin: 0 0 24px; padding-bottom: 12px;
      border-bottom: 1px solid var(--bg-700);
    }

    /* Sessões */
    .session-card {
      background: var(--bg-900); border: 1px solid var(--bg-700);
      border-radius: 10px; padding: 20px 24px; margin-bottom: 16px;
    }
    .session-header { display: flex; align-items: center; gap: 12px; margin-bottom: 12px; flex-wrap: wrap; }
    .session-week {
      background: var(--gold); color: #000;
      font-size: 11px; font-weight: 700; padding: 3px 10px; border-radius: 999px;
    }
    .session-date { color: var(--steel-300); font-size: 13px; }
    .session-theme { color: var(--steel-200); font-weight: 600; font-size: 14px; }
    .session-card ul { margin: 0 0 16px; padding-left: 18px; color: var(--steel-300); }
    .session-card li { margin-bottom: 6px; font-size: 14px; }
    .session-footer { display: flex; align-items: center; gap: 16px; flex-wrap: wrap; }
    .btn-link {
      display: inline-flex; align-items: center; gap: 6px;
      background: var(--bg-800); border: 1px solid var(--bg-700);
      color: var(--steel-200); text-decoration: none;
      font-size: 13px; padding: 6px 14px; border-radius: 6px;
    }
    .btn-link:hover { border-color: var(--gold); color: var(--gold); }
    .session-deliverables { font-size: 12px; color: var(--steel-300); }

    /* ICP */
    .icp-card {
      background: var(--bg-900); border: 1px solid var(--bg-700);
      border-radius: 10px; padding: 20px 24px; margin-bottom: 16px;
    }
    .icp-header { display: flex; align-items: center; gap: 12px; margin-bottom: 16px; }
    .icp-tag {
      font-size: 11px; font-weight: 700; padding: 3px 10px;
      border-radius: 999px; text-transform: uppercase; letter-spacing: .05em;
    }
    .icp-tag.p1 { background: rgba(241,181,47,.15); color: var(--gold); }
    .icp-tag.p2 { background: rgba(34,197,94,.12); color: var(--green); }
    .icp-tag.p3 { background: rgba(184,149,106,.12); color: var(--amber); }
    .icp-header h3 { margin: 0; color: var(--steel-200); font-size: 17px; }
    .icp-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px,1fr)); gap: 16px; margin-bottom: 16px; }
    .icp-col h4 { font-size: 11px; text-transform: uppercase; letter-spacing: .06em; color: var(--amber); margin: 0 0 8px; }
    .icp-col ul { margin: 0; padding-left: 16px; color: var(--steel-300); }
    .icp-col li { font-size: 13px; margin-bottom: 4px; }
    .icp-footer { display: flex; gap: 24px; font-size: 12px; color: var(--steel-300); }
    .icp-ltv { color: var(--gold-2); font-weight: 600; }

    /* Funis */
    .funnel-card {
      background: var(--bg-900); border: 1px solid var(--bg-700);
      border-radius: 10px; padding: 20px 24px; margin-bottom: 16px;
    }
    .funnel-card h3 { margin: 0 0 16px; color: var(--steel-200); font-size: 16px; }
    .funnel-stages { display: grid; grid-template-columns: repeat(4,1fr); gap: 12px; }
    @media (max-width: 700px) { .funnel-stages { grid-template-columns: 1fr 1fr; } }
    .funnel-stage { background: var(--bg-800); border-radius: 8px; padding: 14px; }
    .stage-label {
      font-size: 10px; font-weight: 700; text-transform: uppercase;
      letter-spacing: .08em; margin-bottom: 8px;
    }
    .funnel-stage.topo   .stage-label { color: var(--gold); }
    .funnel-stage.meio   .stage-label { color: var(--amber); }
    .funnel-stage.fundo  .stage-label { color: var(--green); }
    .funnel-stage.pos-venda .stage-label { color: var(--steel-300); }
    .stage-q { font-size: 11px; color: var(--steel-300); margin: 0 0 6px; font-style: italic; }
    .funnel-stage ul { margin: 0; padding-left: 14px; }
    .funnel-stage li { font-size: 12px; color: var(--steel-300); margin-bottom: 3px; }

    /* Estratégia */
    .strategy-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px,1fr)); gap: 16px; }
    .strategy-card {
      background: var(--bg-900); border: 1px solid var(--bg-700);
      border-radius: 10px; padding: 20px;
    }
    .strategy-card h4 { font-size: 11px; text-transform: uppercase; letter-spacing: .06em; color: var(--amber); margin: 0 0 10px; }
    .strategy-card p, .strategy-card li { font-size: 14px; color: var(--steel-300); }

    /* Alertas */
    .alert {
      display: flex; align-items: flex-start; gap: 12px;
      border-radius: 8px; padding: 14px 16px; margin-bottom: 10px;
      font-size: 14px;
    }
    .alert.error   { background: rgba(239,68,68,.08); border: 1px solid rgba(239,68,68,.25); color: #fca5a5; }
    .alert.warning { background: rgba(245,158,11,.08); border: 1px solid rgba(245,158,11,.25); color: #fcd34d; }
    .alert-icon { flex-shrink: 0; }

    /* Link-cards materiais */
    .links-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px,1fr)); gap: 12px; }
    .link-card {
      display: flex; align-items: center; gap: 14px;
      background: var(--bg-900); border: 1px solid var(--bg-700);
      border-radius: 10px; padding: 16px 18px;
      text-decoration: none; transition: border-color .15s;
    }
    .link-card:hover { border-color: var(--gold); }
    .link-icon { font-size: 24px; flex-shrink: 0; }
    .link-text strong { display: block; color: var(--steel-200); font-size: 14px; margin-bottom: 2px; }
    .link-text span { font-size: 12px; color: var(--steel-300); }
  </style>
</head>
<body>

  <!-- TOPBAR -->
  <header class="topbar">
    <div class="topbar-inner">
      <div class="topbar-brand">
        <span class="topbar-logo">[SIGLA]</span>
        <span class="topbar-client">[NOME DO CLIENTE]</span>
        <span class="topbar-tag">Consultoria</span>
      </div>
      <nav class="topbar-nav">
        <a href="#semanas">Semanas</a>
        <a href="#icp">ICP</a>
        <a href="#funis">Funis</a>
        <a href="#estrategia">Estratégia</a>
        <a href="#crm">CRM</a>
        <a href="#alertas">Alertas</a>
        <a href="#materiais">Materiais</a>
      </nav>
    </div>
  </header>

  <div class="page-content">

    <!-- HERO -->
    <section class="hero">
      <div class="hero-tag">Documento de Handoff · [DATA]</div>
      <h1>[NOME DO CLIENTE]</h1>
      <p class="hero-subtitle">[SEGMENTO] · [CIDADE] · [N]ª Semana · Consultor: [NOME]</p>
      <div class="hero-stats">
        <div class="stat"><span class="stat-val">[TICKET]</span><span class="stat-label">Ticket Médio</span></div>
        <div class="stat"><span class="stat-val">[FATURAMENTO]</span><span class="stat-label">Faturamento Atual</span></div>
        <div class="stat"><span class="stat-val">[META]</span><span class="stat-label">Meta Mensal</span></div>
        <div class="stat"><span class="stat-val">[SEGUIDORES]</span><span class="stat-label">Seguidores IG</span></div>
      </div>
    </section>

    <!-- SEMANAS -->
    <section id="semanas" class="section">
      <h2>Sessões de Consultoria</h2>
      <!-- Repetir para cada semana do Bloco D -->
      <div class="session-card">
        <div class="session-header">
          <span class="session-week">Semana N</span>
          <span class="session-date">[DATA]</span>
          <span class="session-theme">[TEMA]</span>
        </div>
        <ul>
          <li>[Ponto 1]</li>
          <li>[Ponto 2]</li>
        </ul>
        <div class="session-footer">
          <a class="btn-link" href="[LINK REAL DA GRAVAÇÃO]" target="_blank">▶ Ver gravação</a>
          <span class="session-deliverables">Entregáveis: [lista]</span>
        </div>
      </div>
    </section>

    <!-- ICP -->
    <section id="icp" class="section">
      <h2>ICP — Perfil do Cliente Ideal</h2>
      <!-- Repetir para cada ICP do Bloco B -->
      <div class="icp-card">
        <div class="icp-header">
          <span class="icp-tag p1">P1 · B2B</span>
          <h3>[Nome do perfil]</h3>
        </div>
        <div class="icp-grid">
          <div class="icp-col"><h4>Perfil</h4><ul><li>...</li></ul></div>
          <div class="icp-col"><h4>Dores</h4><ul><li>...</li></ul></div>
          <div class="icp-col"><h4>Objeções</h4><ul><li>...</li></ul></div>
          <div class="icp-col"><h4>Motivadores</h4><ul><li>...</li></ul></div>
        </div>
        <div class="icp-footer">
          <span class="icp-ltv">LTV estimado: [VALOR]</span>
          <span>Canal: [CANAL]</span>
        </div>
      </div>
    </section>

    <!-- FUNIS -->
    <section id="funis" class="section">
      <h2>Funis Estratégicos</h2>
      <!-- Repetir para cada ICP do Bloco B/B3/B4 -->
      <div class="funnel-card">
        <h3>Funil [ICP NOME]</h3>
        <div class="funnel-stages">
          <div class="funnel-stage topo">
            <div class="stage-label">Topo</div>
            <p class="stage-q">Como descobre?</p>
            <ul><li>...</li></ul>
          </div>
          <div class="funnel-stage meio">
            <div class="stage-label">Meio</div>
            <p class="stage-q">O que convence?</p>
            <ul><li>...</li></ul>
          </div>
          <div class="funnel-stage fundo">
            <div class="stage-label">Fundo</div>
            <p class="stage-q">Como converte?</p>
            <ul><li>...</li></ul>
          </div>
          <div class="funnel-stage pos-venda">
            <div class="stage-label">Pós-Venda</div>
            <p class="stage-q">Como fideliza?</p>
            <ul><li>...</li></ul>
          </div>
        </div>
      </div>
    </section>

    <!-- ESTRATÉGIA -->
    <section id="estrategia" class="section">
      <h2>Estratégia</h2>
      <div class="strategy-grid">
        <div class="strategy-card"><h4>Posicionamento</h4><p>[...]</p></div>
        <div class="strategy-card"><h4>Proposta de Valor</h4><p>[...]</p></div>
        <div class="strategy-card"><h4>Diferenciais</h4><ul><li>...</li></ul></div>
        <div class="strategy-card"><h4>Concorrentes</h4><ul><li>...</li></ul></div>
      </div>
    </section>

    <!-- CRM -->
    <section id="crm" class="section">
      <h2>CRM e Régua de Relacionamento</h2>
      <!-- Status atual + régua recomendada por touchpoint (Bloco C5) -->
    </section>

    <!-- ALERTAS -->
    <section id="alertas" class="section">
      <h2>Alertas Críticos</h2>
      <!-- Bloqueadores do Bloco G — ordenar do mais crítico para o menos -->
      <div class="alert error">
        <span class="alert-icon">🔴</span>
        <div><strong>[BLOQUEADOR]:</strong> [descrição e impacto]</div>
      </div>
      <div class="alert warning">
        <span class="alert-icon">🟡</span>
        <div><strong>[ATENÇÃO]:</strong> [descrição e impacto]</div>
      </div>
    </section>

    <!-- MATERIAIS -->
    <section id="materiais" class="section">
      <h2>Materiais Produzidos</h2>
      <!-- Usar APENAS URLs reais do Surge coletadas no Bloco E -->
      <!-- NUNCA usar href="#" ou URLs fictícias -->
      <div class="links-grid">
        <a class="link-card" href="https://[cliente].surge.sh/[rota]" target="_blank">
          <div class="link-icon">[EMOJI]</div>
          <div class="link-text">
            <strong>[Nome do entregável]</strong>
            <span>[Breve descrição]</span>
          </div>
        </a>
      </div>
    </section>

  </div><!-- /page-content -->
</body>
</html>
```

---

## FASE 4 — Checklist antes de publicar

- [ ] Todos os blocos A–H foram respondidos pelo usuário
- [ ] Todos os link-cards têm URLs Surge reais (sem `href="#"`)
- [ ] Todos os funis têm 4 estágios (Topo / Meio / Fundo / Pós-Venda)
- [ ] Todos os cards de sessão têm link de gravação (ou texto "gravação não disponível")
- [ ] Nenhum tom de azul no CSS — grep por `blue`, `navy`, `#3`, `rgba(1`
- [ ] `<meta charset="UTF-8">` presente, arquivo salvo UTF-8 sem BOM
- [ ] Alertas ordenados por severidade (bloqueadores primeiro)
- [ ] Topbar com âncoras funcionando para todas as seções

---

## FASE 5 — Publicação no Surge

```powershell
Copy-Item "handoff-[cliente].html" "_deploy\handoff.html"
cd "_deploy"
npx surge . [cliente].surge.sh
```

URL final: `https://[cliente].surge.sh/handoff.html`

---

## Regras gerais

- **Briefing completo antes de qualquer geração** — sem os blocos A–H, não gerar nada
- **Bloco E é bloqueador** — sem URLs reais, não criar o handoff
- **Paleta padrão sem azul** — gold + amber + charcoal + branco; nunca navy/blue/indigo
- **UTF-8 sem BOM** — `[System.IO.File]::WriteAllText($path, $content, (New-Object System.Text.UTF8Encoding $false))`
- **Nunca `Get-Content -Raw` sem `-Encoding UTF8`** — corrompe acentos PT-BR
- **Funis obrigatórios** — um funil por ICP, sempre 4 estágios
- **NotebookLM: verificar na FASE 1** — enriquece muito o conteúdo
- **Fonte do projeto**: ler `CONTEXTO_PROJETO.md` da pasta do cliente se existir

---

## Referência de uso

- Acionamento: `/skill_vasconcelos`
