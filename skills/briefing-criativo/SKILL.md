---
name: briefing-criativo
description: "Gera briefings estruturados para solicitação de materiais criativos (criativos estáticos, landing pages, e-mails, posts, peças gráficas). Use esta skill SEMPRE que o usuário pedir para criar um briefing, solicitação de criativo, briefing de peça, briefing de landing page, briefing de banner, briefing de e-mail, ou qualquer variação de \"preciso de um briefing para X\". Também acione quando o usuário disser \"quero solicitar um criativo\", \"precisa briefar isso\", \"escreve o briefing pra mim\" ou mencionar entregas criativas para designers, agências ou ferramentas de gestão de tarefas como Ekyte, Trello, Asana. O output é sempre uma solicitação de trabalho com referências e direcionamentos — nunca copy pronta, nunca prévia de conteúdo."
---

# Briefing Criativo

Esta skill gera briefings estruturados para solicitação de materiais criativos. O briefing é uma **ordem de trabalho para quem vai executar** — designer, desenvolvedor ou redator. Ele direciona sem executar.

## Princípios invioláveis

**O que um briefing É:**
- Uma solicitação clara e completa de um entregável
- Um conjunto de referências, direcionamentos e restrições
- O contexto estratégico mínimo necessário para o executor entender o objetivo
- Especificações técnicas do material

**O que um briefing NÃO É:**
- Copy pronta, headlines redigidas, textos finais — isso é execução, não briefing
- Prévia do conteúdo ou "sugestão de como poderia ficar"
- Tabelas — não usar tabelas pois dificultam importação em ferramentas de gestão como Ekyte
- Lista genérica de boas práticas sem relação com o cliente/projeto

## Perguntas obrigatórias antes de gerar o briefing

Antes de gerar qualquer briefing, colete as seguintes informações com o usuário. Se alguma já estiver clara na conversa, não pergunte de novo.

1. **Tipo de material:** criativo estático, landing page, e-mail, post orgânico, outro
2. **Produto ou campanha:** qual produto, serviço ou oferta é o foco da peça
3. **Canal de veiculação:** Instagram, Google Display, e-mail, landing page, etc.
4. **Etapa do funil:** topo (descoberta/consciência), meio (consideração/comparação) ou fundo (conversão/decisão) — essa informação define o tom, a objeção central e o CTA da peça
5. **Objetivo da peça:** o que ela precisa fazer acontecer (gerar lead, gerar clique, nutrir, converter, etc.)
6. **Ângulo:** se o usuário tem um ângulo definido ou prefere que a skill proponha com base no contexto

A etapa do funil é especialmente crítica: uma peça de topo exige tom de descoberta e baixa fricção; uma de fundo exige quebra de objeção direta e CTA de ação imediata. Sem essa informação, o briefing pode direcionar o executor para o tom errado.

## Quando pesquisar o contexto do projeto

Após coletar as respostas acima, use `project_knowledge_search` para recuperar:
- Posicionamento, PUV e diferenciadores do cliente
- Persona/ICP definido
- Dores, objeções e gatilhos de conversão mapeados
- Identidade visual: cores, restrições, logos
- Produto/serviço específico do briefing
- Canal e objetivo da peça

Se o contexto já estiver na conversa, use-o diretamente.

---

## Estrutura obrigatória do briefing

Use exatamente esta sequência de seções. Escreva em **prosa e listas**, sem tabelas.

---

### 1. Identificação

Nome do projeto, cliente, responsável, data e prazo de entrega. Uma linha por item.

### 2. Objetivo do material

Um parágrafo curto respondendo: qual é o papel desta peça no funil? O que ela precisa fazer acontecer? Para onde o lead vai após interagir com ela?

Não descrever o conteúdo — descrever o **resultado esperado** da peça.

### 3. Público-alvo

Descrever em prosa: cargo/perfil, segmento de mercado, momento de jornada (consciência do problema, comparando soluções, pronto para comprar), e a principal dor ou motivação que esta peça deve endereçar.

### 4. Canais e formatos

Listar onde a peça será veiculada e as especificações técnicas exigidas:
- Canal (Google Display, Instagram, e-mail, landing page, etc.)
- Dimensões ou formato (px, proporção, tipo de arquivo)
- Quantidade de variações
- Restrições técnicas (peso máximo de arquivo, plataforma de publicação, etc.)

### 5. Direcionamentos estratégicos

O coração do briefing. Explicar em prosa o que guia as decisões criativas:

- **Ângulo principal:** qual tensão, dor ou desejo esta peça explora
- **Objeção que precisa ser quebrada:** o que impede o público de agir
- **Tom e linguagem:** como deve soar (técnico, urgente, consultivo, direto, etc.)
- **O que deve estar presente:** elementos obrigatórios (ex: credencial, produto específico, CTA tipo)
- **O que deve ser evitado:** restrições de mensagem, concorrentes que não citar, abordagens que não funcionam para este público

### 6. Identidade visual e assets

Listar os insumos disponíveis e as regras de uso:
- Paleta de cores principal e cores a evitar (com justificativa quando relevante)
- Logos disponíveis e regras de uso (ex: manual de marca do fabricante)
- Banco de imagens disponível
- Fontes ou referências visuais
- Restrições visuais

### 7. CTA e próximo passo

Indicar qual é a ação esperada do usuário ao ver a peça, e para onde ele deve ser direcionado. Não redigir o CTA — indicar o tipo de ação e o destino.

### 8. Referências

Listar referências de estética, tom ou estrutura que o executor pode usar como inspiração. Incluir links quando disponíveis. Diferenciar:
- Referências de estilo visual
- Referências de linguagem/copy
- Referências de estrutura ou formato

Se não houver referências externas, indicar materiais internos do cliente que podem servir como base.

### 9. Critérios de aprovação

O que torna esta peça aprovada? Listar de 3 a 5 critérios objetivos que o executor pode usar para autoavaliar antes de entregar. Exemplo: "A peça comunica o diferencial técnico sem usar jargão vazio", "O produto visível é compressor de parafuso, não pistão", "O CTA é visível acima da dobra no mobile".

---

## Variações por tipo de material

### Criativos estáticos (banners, posts)
- Especificar o **ângulo de conversão** de cada criativo separadamente quando houver mais de um
- Indicar hierarquia de elementos: o que deve ter destaque visual (não o conteúdo, a hierarquia)
- Se forem múltiplos criativos com ângulos distintos, criar uma subseção por criativo dentro de "Direcionamentos estratégicos"

### Landing pages
- Adicionar seção **"Fluxo pós-conversão"**: o que acontece depois que o lead preenche o formulário
- Adicionar seção **"Formulário"**: campos necessários, lógica de qualificação, integração com CRM
- Indicar se haverá múltiplas versões (uma por ângulo de banner)
- Especificar plataforma de construção se definida

### E-mails e réguas de CRM
- Indicar posição na régua (e-mail 1, 2, 3...) e gatilho de envio
- Indicar segmento da base que receberá
- Especificar objetivo do e-mail dentro da sequência (nutrir, converter, reativar)

### Posts de redes sociais
- Indicar plataforma, formato (feed, stories, carrossel) e objetivo (alcance, engajamento, conversão)
- Indicar se é orgânico ou impulsionado

---

## Regras de formatação

- Usar títulos de seção em negrito ou com `###`
- Usar listas apenas quando listar itens enumeráveis (dimensões, campos, critérios)
- Buscar sempre ser conciso e objetivo
- Escrever em prosa nos direcionamentos estratégicos — não transformar raciocínio em bullet points
- **Nunca usar tabelas**
- Não incluir copy redigida, headlines prontas ou textos finais
- Não incluir "sugestões de como poderia ficar" — o briefing direciona, não executa
- Incluir ao final a linha: `Responsável pelo briefing: [nome] / [empresa]` e `Data: [data]`