---
name: skill_vasconcelos_EV
description: Framework de Arquitetura da Informação e UI/UX ultra-detalhado. Define dimensões, grids e comportamento para funis, dashboards, drawflows e scorecards.
---

# skill_vasconcelos_EV: Arquitetura Visual e Estrutural

Esta skill transforma os padrões visuais dos catálogos de referência em regras matemáticas e estruturais de código (HTML/CSS).
Sempre que acionada (ou ao identificar que o usuário deseja um relatório, slide ou dashboard analítico), você deve estruturar a informação com extrema precisão geométrica e hierárquica.

## 1. Design Tokens & Agnosticismo Visual
Nunca se engesse em cores estáticas (como vermelho/dourado fixos) a menos que exigido. Use tokens semânticos flexíveis:
- `--brand-primary`: Cor principal de ação/destaque.
- `--bg-deep`: Cor de fundo da apresentação/sistema.
- `--text-main`: Cor de texto padrão.
- `--accent`: Cor secundária para destaques menores.
- Cores de Sentimento: `--status-success`, `--status-warning`, `--status-danger`.

**Regras de Tipografia Estritas:**
- **Headers, Títulos e Labels:** Fonte *Sans-serif* (ex: Inter).
- **Números e Dados Tabulares:** Fonte *Monospace* (ex: JetBrains Mono) obrigatória para alinhamento e leitura perfeita.

**Hierarquia Numérica:**
- **Dado Herói (KPI Principal):** Tamanho entre 48px e 72px. Peso Bold.
- **Dado Secundário:** Tamanho entre 16px e 24px.
- **Labels / Rótulos:** Tamanho entre 11px e 14px, sempre em `UPPERCASE` com `letter-spacing: 1px`.

---

## 2. Fórmulas Geométricas de Componentes (Frame a Frame)

Ao gerar HTML, Markdown ou descrições estruturais, aplique as seguintes fórmulas:

### FÓRMULA 01: Scorecards & KPIs
Substitui as listas de métricas soltas. Todo número importante vive em um Scorecard.
- **Dimensões:** Box/Card com padding uniforme (ex: 24px).
- **Estrutura Y (Vertical):**
  1. Topo: Label da métrica (Uppercase, 70% opacidade).
  2. Centro: Número Herói (Monospace, Bold).
  3. Base: Delta / Variação percentual (ex: `▲ +[XX%]`) colorido de acordo com sentimento (verde para crescimento de receita, vermelho para queda). Opcionalmente acompanhado de um texto descritivo.

### FÓRMULA 02: Tabelas de Dados (Data Tables & Pipelines Kanban)
- **Estrutura:** Proibição de bordas verticais. Proibição de bordas externas fechadas padrão Excel. Apenas uma borda horizontal sutil na base de cada linha (`border-bottom: 1px solid rgba(255,255,255,0.1)`).
- **Alinhamento:**
  - Strings e Textos (Nomes, Campanhas): Alinhamento à ESQUERDA.
  - Números, Moedas (R$) e Porcentagens (%): Alinhamento à DIREITA com fonte MONO.
- **Cabeçalho:** Labels muito pequenos e em caixa alta.

### FÓRMULA 03: Funis (Pirâmides Invertidas e Horizontais)
- **Funil Vertical:** Blocos trapezoidais ou retângulos em tamanhos decrescentes (ex: width de `100% → 80% → 60% → 40%`).
- **A Regra de Ouro (Gargalo):** Entre cada camada/fatia de funil, deve existir obrigatoriamente o dado de `Conv. Step` (Taxa de passagem entre a etapa anterior e a atual, ex: 32%), alinhado ao centro ou justificado à direita, destacando onde há atrito.
- **Funil Horizontal:** Blocos em Chevron (setas engatadas) ou retângulos adjacentes indicando estágios lineares com progressão da esquerda para a direita (TOFU → MOFU → BOFU).

### FÓRMULA 04: Fluxos & Drawflows (CRM, Jornadas e Arquitetura de Mídia)
- **Grid:** Organização estrutural em *Swimlanes* (raias horizontais ou verticais que separam responsabilidades, plataformas ou níveis de consciência).
- **Nós (Nodes):**
  - **Retângulos** (`border-radius: 4px a 8px`): Para ações, estados, campanhas, e-mails enviados.
  - **Losangos**: Exclusivos para pontos de decisão lógica (Sim/Não / If/Else).
- **Arestas (Edges):** Conectores estritamente ortogonais (ângulos retos de 90 graus horizontais/verticais). Proibido usar curvas suaves orgânicas, mantendo o aspecto técnico ("Drawflow"). Uso de linhas tracejadas para fluxos condicionais ou "fallbacks/erros".

### FÓRMULA 05: Cronogramas (Gantt, Roadmaps e Evolução MoM)
- **Eixo X:** Representa estritamente a linha do tempo (Meses M1/M2/M3, Semanas S1/S2 ou Q1/Q2).
- **Barras:** Blocos horizontais esticados representando o prazo da etapa. Devem iniciar exatmente em `[Start]` e terminar em `[End]`.
- **Milestones (Marcos):** Sinalizados por ícones (◆, ▲, ◐) e/ou linhas verticais pontilhadas atravessando o grid inteiro para marcar dias de deploy/kick-off.

### FÓRMULA 06: Dimensionamento de Mercado (TAM SAM SOM)
- **Visualização 2D:** Círculos concêntricos alinhados ao centro ou encostados na borda inferior. SOM é o círculo escuro interno, SAM o intermediário, TAM o contorno externo vazio.
- **Visualização 3D/Blocos:** Barras sobrepostas/empilhadas horizontais onde o tamanho da barra SOM deve refletir matematicamente (e visualmente) sua pequenez relativa ao TAM, causando impacto no pitch para investidores.

---

## 3. Diretriz de Execução para a I.A. (Como operar)
No momento em que gerar saídas com esta skill ativada:
1. **Audite tabelas:** Revise se você está prestes a imprimir tabelas MD ou HTML convencionais e as transforme automaticamente na FÓRMULA 02 (Alinhamento numérico à direita, sem bordas verticais).
2. **Uso de Placeholders:** Certifique-se de preencher `[XXX]` com dados reais da conversa ou mantenha-os como placeholders impecáveis em colchetes se for um template.
3. **Uso de HTML/CSS:** Se o output for código, crie utilitários CSS correspondentes como `.hero-number { font-family: 'JetBrains Mono', monospace; font-size: 56px; }` e priorize fortemente o uso de `display: flex` e `display: grid`.
