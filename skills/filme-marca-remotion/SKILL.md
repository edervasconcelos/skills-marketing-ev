---
name: filme-marca-remotion
description: Conduz a criação de um filme de apresentação de marca em código com Remotion, no estilo de vídeo de lançamento de produto (Apple, Linear, Stripe, Vercel, Figma), nunca estilo slide animado. Cobre entrevista inicial, conceito e quadros de estilo com aprovação, storyboard preso a uma grade musical de 120 BPM, construção cena a cena com verificação de contraste e corte de texto, trilha e narração opcionais via ElevenLabs, e entrega em MP4 1080p e 720p. Use quando o usuário pedir filme da marca, vídeo institucional em código, vídeo de lançamento de produto, ou mencionar /filme-marca-remotion ou Remotion.
---

# Filme da marca com Remotion

Produz, dentro do próprio Claude Code, um filme de apresentação de marca em
código (Remotion 4 + React + TypeScript) com linguagem de filme de lançamento
de produto — não de apresentação de slides.

## O que separa um filme de um slide (guia toda decisão visual)

- **Um espaço só.** Fundo contínuo do primeiro ao último quadro; nunca "troca"
  — só o conteúdo entra e sai. Fundo chapado e saturado alternando a cada
  cena é a marca registrada do slide.
- **Uma ideia por plano.** Composição centrada, um objeto principal, muito
  respiro. Evite repetir "texto de um lado, caixa do outro".
- **Transição é movimento de câmera:** dissolução com desfoque, mergulho em
  profundidade, deslize, clarão breve. Nunca varredura em barra, íris,
  cortina ou qualquer transição de menu de PowerPoint.
- **Tipografia curta e confiante.** Sans neogrotesca, peso médio a semibold,
  tracking apertado nos tamanhos grandes, texto secundário esmaecido. Sem
  monoespaçada em caixa alta, sem numeração tipo "01 / 06".
- **Material e luz.** Cards de vidro fosco (desfoque de fundo, borda de luz
  fina, sombra suave), luz pastel difusa que deriva devagar, profundidade de
  campo (o que está longe fica menor, mais apagado, fora de foco).
- **Cor contida.** Base escura, uma família de pastéis para luz e destaque,
  um destaque por quadro. Nada fluorescente.
- **Um elemento recorrente** que nasce na abertura, atravessa as cenas com
  função real em cada uma e fecha o filme (ponto de luz, forma do logo) —
  é ele que costura o filme.

Se o resultado sair com cara de slide, a correção é reler este bloco e
**propor outra direção**, nunca ajustar detalhe.

**Referências de ritmo, luz e composição** (estudar a linguagem, nunca copiar
plano, marca ou trilha): Apple (keynotes de produto — "Introducing Apple
Vision Pro", "Introducing Liquid Glass"), Linear (filmes de release), Stripe
(aberturas do Stripe Sessions), Vercel (Vercel Ship, Next.js Conf), Figma
(aberturas da Config — ritmo colado na batida), Notion/Arc/Raycast (produto
real em close, cursor e digitação contando a história). Se o Claude tiver
acesso à web, assista 2-3 antes de propor o conceito; sem acesso, trabalhe a
partir destas descrições e avise que não assistiu.

## Antes de começar

Confirme com o usuário (ou confira sozinho no ambiente):
- Claude Code instalado e logado, Node.js recente, espaço livre em disco
  (render de vídeo e versões anteriores ocupam bastante).
- Logo da marca, de preferência em SVG, e prints/telas reais dos
  serviços, se houver.
- Opcional: chave da ElevenLabs para trilha e narração (fica só em `.env`,
  nunca no chat), e um ffmpeg completo no sistema (o embutido do Remotion
  não faz sidechain nem remoção de silêncio).

Trabalhe dentro de uma pasta exclusiva do projeto do filme. Não instale nada
no sistema operacional e nunca peça nem digite senha — dependências entram só
dentro da pasta do projeto; o que exigir administrador, peça para o usuário
fazer. Antes de refazer uma versão, guarde a anterior (código e MP4) numa
pasta à parte.

## Como trabalhar

Avise em uma linha o que está fazendo a cada passo. Nas etapas marcadas com
**APROVAÇÃO**, pare e espere o sim do usuário — a menos que ele diga para
seguir direto até a entrega, caso em que mostre as decisões tomadas no final.
Quando algo falhar, mostre o erro real e a correção; não contorne em
silêncio. Na dúvida entre mais um efeito e mais respiro, **escolha o
respiro** — é a regra que mais separa um filme de um slide animado.

## Etapa 0 — Entrevista

Confira sozinho o ambiente primeiro (versão do Node, se existe ffmpeg, espaço
em disco, o que já há na pasta). Depois pergunte tudo de uma vez, em lista
numerada, já com sugestões onde puder:

1. Nome da marca, o que faz em uma frase, onde está o logo (SVG de
   preferência — se só houver PNG, redesenhe em vetor medindo o original e
   mostre os dois lado a lado antes de usar).
2. Cores (hex), fonte e cor de fundo — se não souber, proponha três paletas
   dentro da direção acima.
3. De 4 a 8 serviços/soluções, cada um com o resultado que entrega. Por
   padrão só números reais; se for teste com dados fictícios, a entrega deve
   dizer isso com clareza.
4. Pasta com prints e telas reais — sem isso, recrie os elementos de
   interface em código como cards ilustrativos.
5. Onde vai ser publicado e em que formato: 16:9, 9:16 (Reels/TikTok/
   Shorts), 1:1 ou 4:5. Mais de um formato: já pensar o layout para os dois.
6. Duração desejada (padrão 60-64s).
7. Referência específica além das listadas acima.
8. Tem chave da ElevenLabs para voz e trilha? Se sim, só em `.env`.
9. Voz feminina ou masculina, e como se pronunciam o nome da marca e siglas.
10. Aprovar cada etapa ou seguir direto.

## Etapa 1 — Conceito e quadros de estilo (APROVAÇÃO)

Proponha um conceito com título de trabalho e o elemento recorrente. Entregue
a paleta com o uso de cada cor, a tabela de tipografia com tamanhos e as
margens de segurança.

Monte o projeto mínimo e renderize **três quadros estáticos reais** (abertura,
cena de produto, número de prova) com `npx remotion still`. Olhe as três
imagens, corrija o que estiver ruim e só então mostre ao usuário — é a etapa
mais barata para mudar de direção, não construa mais nada antes do sim. Se o
usuário disser que está com cara de slide, releia o bloco de linguagem visual
e proponha outra direção, não ajuste detalhes.

## Etapa 2 — Storyboard (APROVAÇÃO)

Tabela cena a cena: id, início e fim, o que aparece, o que a narração diz, a
transição de entrada.

- **Grade musical de 120 BPM a 30 fps:** um tempo dura 15 quadros. Todo corte
  cai em múltiplo de 15; cortes de seção, em múltiplo de 60. Entradas de
  texto e de número também caem na batida.
- **Sequência:** abertura com marca e promessa → bloco de palavras rápidas
  (uma por segundo, uma por serviço) → uma cena por solução mostrando o
  produto em uso → prova com um número por compasso, sozinho no quadro →
  fechamento com o logo se desenhando.
- Varie o enquadramento entre as cenas de solução (objeto, escala, direção
  da câmera) para não parecerem o mesmo template repetido.
- Nunca a mesma transição duas vezes seguidas. Os números da prova são os
  mesmos que apareceram nas cenas.
- **Narração:** texto corrido que faça sentido para quem nunca ouviu falar
  da marca, dividido em blocos por cena, cada um continuando o anterior e
  cabendo na janela (até 2,5 palavras por segundo). A copy é do usuário —
  mostre e espere aprovação.

## Etapa 3 — Construção

- Remotion 4, React, TypeScript. Um arquivo de tema com paleta, tipografia,
  tempos de todas as cenas, textos e narração (lugar único para mudar tudo),
  um componente por cena, um arquivo de composição com o fundo contínuo e as
  transições.
- Fundo numa camada única atrás de todas as cenas; cenas transparentes. A
  luz muda de tom e posição entre cenas por interpolação, nunca por corte.
- Transições centradas no corte: a cena que sai termina antes da batida, a
  que entra começa nela — nunca dois textos sobrepostos.
- Fontes e imagens locais dentro do projeto — o render não pode depender de
  internet.
- Vidro fosco usa `backdrop-filter`: renderize um quadro de teste com
  elemento nítido passando atrás de um card, com e sem `--gl=angle`, e fixe
  o modo que desfocar limpo.
- Grão fino por cima de tudo (gradiente escuro sem grão marca faixas após
  compressão). Numerais de largura fixa só onde há contagem.
- **Nenhum dado de cliente, nome, telefone, e-mail ou valor de terceiros** —
  recrie ou borre, e mostre cada print antes de entrar no filme.
- Se usar subagentes: modelo leve para trabalho mecânico, o mais capaz para
  o design das cenas. Uma cena por vez.

**Verificação, em toda cena, antes de seguir:** renderize ao menos três
quadros (início, meio, fim) com `npx remotion still`, mais um quadro no meio
de cada transição. Procure texto cortado, letras coladas, palavra de destaque
quebrando entre linhas, elemento fora da margem de segurança, dois textos
sobrepostos no corte, número que não bate com o da cena, soma que não fecha
100%. Meça o contraste nos quadros renderizados (não só na conta teórica),
no ponto mais claro do fundo atrás de cada texto — mínimo 4,5:1; se não
passar, escureça o vidro ou reforce o texto.

**Render:** confira espaço em disco, renderize com
`npx remotion render --concurrency=2`, um render por vez, primeiro sem
áudio. Extraia quadros do próprio MP4 em vários tempos e confira se batem
com os stills. Versão leve 720p (CRF 24) pode usar `npx remotion ffmpeg`.

## Etapa 4 — Trilha e narração (só com chave da ElevenLabs)

A mixagem precisa de ffmpeg completo (o embutido do Remotion não tem
sidechain nem remoção de silêncio) — avise antes de começar se não houver um
no sistema.

- **Trilha:** `POST /v1/music`, `music_length_ms`, `force_instrumental: true`.
  Pedir "exatamente 120 BPM, 4/4, tempo constante, cresce a cada 8 compassos,
  termina com batida final no tempo forte, sem vocal". Medir o BPM e o
  deslocamento da primeira batida, cortar o começo para ela cair em 0:00,
  ajustar ao tamanho do filme, entrada e saída suaves.
- **Voz:** um bloco por vez com `eleven_multilingual_v2`, `language_code: pt`,
  `stability 0.5`, `similarity_boost 0.75`, `style 0.25`, enviando
  `previous_text`/`next_text` para manter a entonação. Siglas escritas como
  se falam. Palavras rápidas num take só, a 80% da velocidade, tempo de cada
  palavra medido pelo endpoint `/with-timestamps`.
- **Mixagem:** aparar silêncio com limiar suave (-55 dB início, -60 dB fim,
  0,25s de folga no fim); posicionar cada bloco no início da sua cena; bloco
  que estourar a janela, acelerar no máximo 14%; trilha ~6 dB abaixo da voz
  com sidechain; normalizar em -16 LUFS, pico abaixo de -1 dBTP. Colar o
  áudio no vídeo já renderizado com `-c:v copy`.

Sem ElevenLabs: pule está etapa e entregue o vídeo mudo, o roteiro e um
arquivo com os tempos de cada cena e de cada palavra rápida.

## Etapa 5 — Entrega

Caminho do MP4 em 1080p e da versão 720p, lista de tempos das cenas, o que
trocar no arquivo de tema para reaproveitar o filme com outra marca. Liste
separadamente as decisões tomadas sozinho e tudo o que não foi possível
verificar (ex.: não assistiu em movimento, não testou em outros players,
áudio não gerado).

## Vale o tempo todo

- Nenhuma chave de API aparece no vídeo nem é impressa no terminal.
- Relate o resultado como ele é: se algo não foi testado ou ficou aquém, diga.
- Na dúvida entre mais um efeito e mais respiro, escolha o respiro.

## Checklist final (mostrar ao usuário)

- [ ] Abriu o Claude Code dentro de uma pasta nova, exclusiva para o filme
- [ ] Entrevista respondida com dados reais da marca, sem números inventados
- [ ] Conceito e os três quadros aprovados antes de liberar a construção
- [ ] Storyboard e copy da narração aprovados
- [ ] Chave da ElevenLabs guardada só no `.env`, nunca no chat
- [ ] MP4 final assistido em movimento, com a lista do que não foi verificado

## Quando dá errado

| Problema | O que fazer |
|---|---|
| Filme parece slide animado | Reler o bloco de linguagem visual e propor outra direção, não ajustar detalhe |
| Texto cortado ou sobreposto no corte | Rerenderizar o quadro da transição e corrigir antes de seguir — nunca entregar sem conferir |
| Contraste abaixo de 4,5:1 | Escurecer o vidro fosco ou reforçar o peso/opacidade do texto |
| Sem ffmpeg completo para mixagem | Avisar antes da Etapa 4 e entregar vídeo mudo + roteiro + tempos |
| Vidro fosco borrado errado | Testar com e sem `--gl=angle` e fixar o modo que desfocar limpo |

## Créditos

Prompt original publicado por **Castilho IA** (castilhoia.com, @castilho.ia),
adaptado para skill do Claude Code. Remotion é projeto de código aberto —
confira a licença no site oficial antes de uso comercial. ElevenLabs é da
ElevenLabs. Claude e Claude Code são da Anthropic. Citados sem vínculo nem
patrocínio.
