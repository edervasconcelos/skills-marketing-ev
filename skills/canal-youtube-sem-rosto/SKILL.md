---
name: canal-youtube-sem-rosto
description: Conduz a produção de vídeos para um canal de YouTube sem rosto, estilo documentário explicativo ("a economia de X", "quanto custa ter um Y"). Cobre engenharia reversa de canais de referência, geração de 10 temas por vez, pesquisa com busca na web + dossiê com fontes, roteiro de narração ato por ato, storyboard cena a cena com prompts de imagem, preparo da narração para gravação ou gerador de voz, e 3 conceitos de thumbnail. Use quando o usuário pedir para criar roteiro de documentário, canal sem rosto, vídeo explicativo no estilo "a economia de", ou mencionar /canal-youtube-sem-rosto.
---

# Canal de YouTube sem rosto (documentário explicativo)

Método para canais como "a economia de um cassino" ou "quanto custa ter um aeroporto":
tema do dia a dia com muito dinheiro escondido, título de curiosidade, narração e desenho
explicativo. O segredo não é o nicho, é o sistema abaixo.

Claude não gera imagem nem voz sozinho. Esta skill entrega o roteiro, o storyboard com
prompts de imagem e a narração pronta para gravar — quem desenha é um gerador de imagem
externo (ou o próprio Claude via artifact HTML, para cenas de número), e quem narra é a
pessoa ou um gerador de voz (ex.: ElevenLabs).

## Regras fixas do projeto

No início de qualquer trabalho com esta skill, confirme com o usuário (ou leia do
conhecimento do projeto, se já existir) o blueprint do canal:

- Formato do título (ex.: "A economia de...", "Quanto custa ter um...")
- Idioma da narração
- Duração alvo dos vídeos (geralmente 15 a 20 minutos, ~150 palavras por minuto)
- Público: quem assiste e o que essa pessoa quer entender
- Estilo visual (ex.: desenho à mão simples, fundo bege, bonequinho palito, traço preto
  grosso, poucas cores chapadas, metáfora visual no lugar de ilustração literal)

Regras que valem para tudo que for produzido:
1. **Nunca invente número, data, nome ou caso.** Todo dado vem de busca na web, com o
   link da fonte. Se não achar, escreve `[SEM FONTE]` e segue.
2. Linguagem de conversa, frases curtas, sem cara de texto de IA.
3. Resposta longa sai em partes: termina uma parte, para e espera o usuário dizer
   "continua".
4. Se existir um arquivo `BLUEPRINT.md` salvo no projeto/conhecimento, siga-o.

## Etapa 1 — Engenharia reversa (antes de escolher tema)

Antes de pensar em tema, desmonte um canal que já funciona para entender a receita.

1. Busque no YouTube pelo formato ("a economia de", "quanto custa ter um", ou em inglês
   "the economics of") e abra os canais que aparecem em Vídeos > Populares.
2. Procure o sinal certo: vídeo com visualizações muito acima do número de inscritos do
   canal. Canal novo com poucos vídeos e esse sinal é a melhor referência.
3. Peça ao usuário 2-3 prints da aba Populares com os títulos, views e data de cada vídeo
   (ou receba a lista de títulos colada).
4. Com o material em mãos, faça a engenharia reversa e produza um resumo de até uma
   página chamado `BLUEPRINT.md`, cobrindo:
   - a fórmula dos títulos (o padrão que se repete e por que dá curiosidade sem parecer
     caça-clique);
   - a psicologia das thumbnails (o que aparece, a cor, o texto, onde o olho bate
     primeiro);
   - por que os temas parecem familiares e mesmo assim revelam um mundo que quase
     ninguém conhece;
   - quais vídeos têm views muito acima do normal do canal e o que eles têm em comum;
   - a fórmula do canal em uma frase;
   - cinco macronichos com a mesma psicologia que quase ninguém cobre, com 3 títulos de
     exemplo cada — a ideia é copiar a fórmula, nunca o nicho;
   - o que não copiar desse canal.

Salve o `BLUEPRINT.md` no conhecimento do projeto (ou peça para o usuário salvar) — ele
orienta todas as etapas seguintes.

## Etapa 2 — Temas que o YouTube quer recomendar

O erro mais comum não é edição nem thumbnail, é escolher um tema que nunca teve chance.
A pergunta certa não é "o que eu posto agora?", é "o que a galera já tem curiosidade e
quase ninguém explica?".

Gere 10 temas por vez, seguindo o blueprint: negócios, setores e sistemas do dia a dia
que movimentam muito dinheiro por trás de coisas que todo mundo vê e quase ninguém
entende. Para cada tema, entregue:
- assunto;
- título no formato do canal;
- ideia da thumbnail (o que aparece e o destaque);
- texto da thumbnail, de 2 a 4 palavras;
- a pergunta de curiosidade que faz a pessoa clicar;
- por que o YouTube recomendaria esse vídeo para um canal com zero inscritos;
- se tem história e dado público suficiente para 15-20 minutos;
- nota de potencial de 0 a 10, com o motivo em uma linha (é palpite seu, nunca prometa
  views).

Descarte tema sem dado público suficiente para pesquisar. Se o usuário não gostar de
nenhum, gere mais 10 de setores diferentes, sem repetir.

## Etapa 3 — Pesquisa e roteiro

Pesquisa primeiro, roteiro depois — nunca escreva 3 mil palavras de uma vez sem
pesquisar antes, isso sai com cara de chatbot.

**Dossiê (use busca na web):**
1. Os números principais (quanto custa, quanto fatura, quanto gasta, margem, dívida),
   cada um com o link da fonte e o ano.
2. Como o dinheiro entra e como sai.
3. A história por baixo do tema: o sistema escondido, a contradição, onde está o dinheiro
   de verdade e o maior risco.
4. Pelo menos um caso real em que deu errado, com fonte.
5. A pergunta que segura quem assiste até o fim.

Se duas fontes trazem números diferentes, mostre as duas. Nunca complete uma lacuna com
estimativa própria.

**Roteiro, ato por ato**, baseado só no dossiê aprovado:
- Abre com o número ou a contradição mais forte, nos primeiros 15 segundos.
- A cada 2-3 minutos, uma complicação nova, uma virada ou uma resposta que abre a
  próxima pergunta.
- Linguagem de conversa, frase curta, número do jeito que se fala.
- Não invente nada; se faltar dado, marque `[CONFERIR]`.
- Sem título de seção no meio: é texto para ser lido em voz alta.
- Mostre primeiro a estrutura em atos (uma linha por ato) para aprovação, depois escreva
  um ato por vez.

Cerca de 150 palavras por minuto de narração (20 minutos ≈ 3 mil palavras).

Antes de gravar, o usuário deve ler o roteiro inteiro, conferir os números grandes no
link da fonte, cortar repetição e reescrever o que não soar como a própria voz dele —
Claude faz a pesquisa pesada e o primeiro rascunho, a decisão final é do usuário.

## Etapa 4 — Storyboard cena a cena

Imagem bonita solta não conta história. Cada imagem nasce de uma frase do roteiro.

- Uma cena a cada frase ou ideia nova, mais ou menos uma imagem a cada 5-8 segundos de
  narração.
- Não descreva a frase ao pé da letra: traduza cada uma numa ideia visual (metáfora, não
  ilustração literal — ex.: "parece uma máquina de fazer dinheiro" vira "o navio como uma
  impressora soltando nota pela chaminé", não um navio no mar).
- Para cada cena, numa tabela: número da cena, trecho da narração, ideia visual, tipo
  (DESENHO ou NÚMERO) e o prompt de imagem em inglês.
- Todo prompt de tipo DESENHO termina com o estilo fixo combinado com o usuário (ex. do
  guia original: "Hand-drawn minimalist explainer cartoon, beige paper background, thick
  black ink outlines, simple stick figures with round white heads, few flat colors, big
  empty space, no shadows, no gradients, 16:9.") — use o estilo do blueprint do canal, se
  houver um definido.
- Gere em lotes de 15 cenas. No fim de cada lote, entregue um bloco só com os prompts de
  DESENHO, numerados, um por linha, pronto para colar no gerador de imagem, e espere o
  usuário dizer "continua".

Para cenas do tipo NÚMERO, Claude pode gerar a própria cena como um artifact HTML
(página 16:9, 1920x1080, no estilo do canal, com o número grande no centro, uma frase
curta embaixo e um desenho simples em SVG) em vez de depender do gerador de imagem — o
usuário abre em tela cheia e tira print.

## Etapa 5 — Narração

Narração primeiro, porque é ela que dita o ritmo de tudo que vem depois.

Prepare o roteiro aprovado para narração: frase curta, número escrito do jeito que se
fala ("dois bilhões de reais", nunca "R$ 2 bi"), sem parênteses e sem sigla que trave a
leitura. Marque com `/` onde a pessoa deve respirar. Não mude nenhum dado.

O usuário grava a própria voz (celular, cômodo sem eco) ou usa um gerador de voz externo
(ElevenLabs ou similar — plano grátis tem limite de uso; antes de monetizar, confira se o
plano libera uso comercial).

Teste só a abertura antes de gerar tudo: o gancho soa natural? Dá para acompanhar os
números? A pessoa ouviria essa voz por 20 minutos? Se a resposta for não, troca a voz
antes de gerar o resto — narrador ruim não se conserta na edição.

Se o usuário tiver Claude Code e FFmpeg disponível, ofereça o limpeza opcional do áudio
gravado (cortar silêncios maiores que 0,6s mantendo uma pausa curta, normalizar o volume
para -16 LUFS) antes de rodar qualquer comando.

## Etapa 6 — Edição e thumbnail

Ordem de edição sugerida: narração primeiro na timeline (é a espinha), imagens na ordem
do storyboard, troca de imagem a cada ideia nova (nunca uma imagem parada por muito
tempo), legenda limpa com movimento sutil (zoom lento, deslize — transição cortada seca
resolve quase tudo), e um acerto leve de cor/contraste no vídeo todo no final.

**Thumbnail:** com o título e o roteiro final, gere pelo menos 3 conceitos. Para cada um:
o objeto principal, o texto (2 a 4 palavras), onde fica cada coisa (setas ou destaques) e
por que alguém clicaria. Depois escreva o prompt de imagem em inglês de cada conceito, no
estilo do canal, em 16:9, com contraste alto e pouca coisa na tela — precisa ler bem
pequeno, no tamanho que aparece no celular.

## Quando dá errado

| Problema | O que fazer |
|---|---|
| Nenhum tema empolga | Gere mais 10 até aparecer um que o próprio usuário assistiria. Tema sem dado público, descarte. |
| Roteiro com cara de chatbot | Peça ato por ato, corte frase genérica, peça um trecho escrito pelo usuário como exemplo de voz. |
| Número sem fonte ou estranho | "Refaz esse trecho só com dado que tem link. O que não tiver fonte, tira." Confira os números grandes. |
| A resposta cortou no meio | Escreva "continua de onde parou". |
| Imagens com estilos diferentes | Repita o mesmo bloco de estilo no fim de todo prompt e a mesma configuração no gerador em todos os lotes. |
| Vídeo arrastado | Corte o silêncio morto (sem tirar toda pausa) e troque de imagem mais rápido. |
| Copiou o nicho de alguém | Volte no `BLUEPRINT.md` e leve a fórmula para um dos macronichos que ninguém cobre. |

## Créditos

Método estudado num tutorial público de canal sem rosto e adaptado para o Claude por
Deploy Club (AI Deploy Club, 2026). FFmpeg é projeto de código aberto (licença LGPL 2.1
ou superior). Claude e Claude Code são da Anthropic. YouTube é do Google. ElevenLabs é da
ElevenLabs — citadas sem vínculo nem patrocínio.
