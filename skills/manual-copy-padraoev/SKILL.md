---
name: manual-copy-padraoev
description: Cria o Manual de Copy completo de um cliente de consultoria a partir do diagnóstico existente. Gera o documento estruturado em 18 seções cobrindo arquétipo, posicionamento, persona, JTBD, SWOT, objeções, CVBA, banco de copy por canal e checklist de aprovação. Use quando o projeto tiver diagnóstico aprovado e for hora de produzir o manual de referência de comunicação do cliente.
---

# Manual de Copy Padrão EV

## Objetivo
Gerar o Manual de Copy completo e padronizado de um cliente de consultoria, servindo como referência de comunicação para toda a duração do projeto.

## Quando usar
- O diagnóstico do cliente foi concluído (kick-off + semanas 1–2 da consultoria)
- O projeto tem ICP, posicionamento e oferta definidos
- Há necessidade de padronizar copy para LP, Ads, WhatsApp, formulários ou qualquer canal
- Um novo integrante precisa entender a comunicação do cliente sem reler todo o histórico

## Materiais necessários antes de começar

Solicite ao usuário o que não estiver no contexto:

1. **Transcrição ou resumo do kick-off** — contexto do cliente, mercado, dores
2. **UCM ou diagnóstico SPICED** — mapa de jornada do lead
3. **Auditoria de concorrentes** — para benchmarking e anti-referências
4. **Copy ou criativos já aprovados** — se existirem (usar como âncora de tom)
5. **Tipo de negócio** — B2B, B2C ou B2B2C (define quais seções priorizar)

> Regra: nunca inicie sem pelo menos o kick-off e o ICP definido. Infira o que puder — pergunte só o indispensável.

## Como executar

1. Leia `references/template.md` — é o esqueleto completo das 18 seções com instruções de preenchimento
2. Preencha seção por seção com os dados reais do cliente — nunca deixe seção vazia; se faltar dado, indique o que precisa ser coletado
3. Adapte terminologia ao segmento do cliente (agro, varejo, serviços B2B, saúde...)
4. Seções condicionais:
   - **B2B** → desenvolver Comitê de Compra (seção 11) com papéis e influenciadores
   - **B2C** → desenvolver Jornada Emocional (seção 11) e omitir comitê de compra
   - **Produto físico ou técnico** → detalhar Claims Pendentes (seção 18) com lista de validação
5. Rode revisão PT-BR ao final: `python3 scripts/revisar_md_ptbr.py caminho/arquivo.md`
6. Verifique com `--check` antes de entregar ao cliente

## Output esperado

Arquivo `.md` salvo em:
```
Projetos/{CLIENTE}/Manual_de_Copy/manual-de-copy-{cliente-slug}.md
```

18 seções completas. Banco de Copy (seção 17) deve ter no mínimo 3 variações por canal ativo do cliente.

## Leia também
- `references/template.md` — template completo das 18 seções com instruções de preenchimento
