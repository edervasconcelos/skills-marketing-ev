# Skills de marketing e consultoria

Skills para agentes de IA (Claude Code, Codex, Gemini CLI, Cursor e similares) criadas por Eder Vasconcelos para o trabalho de consultoria de marketing: manual de copy, manual de tráfego pago, auditoria de Instagram, handoff de projeto e outras.

**Mapa interativo:** [https://edervasconcelos.github.io/skills-marketing-ev/](https://edervasconcelos.github.io/skills-marketing-ev/). Lá você descreve o que quer fazer e o mapa indica a skill certa. Ele também lista outras 104 skills abertas de outros autores, com o comando para instalar cada uma.

## Como instalar

### Opção 1: pelo terminal (recomendado)

Precisa ter o [Node.js](https://nodejs.org) instalado.

Todas as skills deste repositório:

```bash
npx skills add edervasconcelos/skills-marketing-ev
```

Só uma skill:

```bash
npx skills add edervasconcelos/skills-marketing-ev --skill manual-copy-padraoev
```

O comando pergunta em quais ferramentas instalar (Claude Code, Codex, Cursor etc.) e coloca cada skill na pasta certa.

### Opção 2: instalador

1. Baixe o repositório: botão verde **Code** → **Download ZIP** e descompacte.
2. Rode o instalador:
   - **Windows:** clique com o botão direito em `instalar_windows.ps1` → **Executar com o PowerShell**.
   - **Mac ou Linux:** no terminal, dentro da pasta, rode `bash instalar_mac_linux.sh`.

O instalador coloca as skills em `~/.claude/skills` (Claude Code) e `~/.agents/skills` (outras ferramentas). Uma skill que você já tenha com o mesmo nome não é sobrescrita.

### Opção 3: uma skill por vez, sem terminal

Na pasta `downloads/` há um `.zip` de cada skill. Descompacte e coloque a pasta em `~/.claude/skills/` (Claude Code) ou `~/.agents/skills/` (outras ferramentas).

## Como usar

No Claude Code, chame pelo nome (`/manual-copy-padraoev`) ou só descreva a tarefa: o agente escolhe a skill sozinho. Nas outras ferramentas, peça "use a skill manual-copy-padraoev".

No ChatGPT ou no Gemini (web), abra o `SKILL.md` da skill e use o conteúdo como instrução de um GPT ou Gem personalizado.

## Skills deste repositório

| Skill | Para que serve |
|---|---|
| `briefing-criativo` | Gera briefings estruturados para solicitação de materiais criativos (criativos estáticos, landing pages, e-mails, posts, peças gráficas). |
| `copy-maestro` | Estratégia de copy: persona, ICP, jornada do lead (UCM), consciência de mercado e copy de conversão. |
| `manual-copy-padraoev` | Cria o Manual de Copy completo de um cliente de consultoria a partir do diagnóstico existente. |
| `manual-mivev` | Criar ou revisar Manual de Identidade Visual (MIV/brandbook) em HTML para clientes. |
| `manual-trafego-padraoev` | Cria o Manual de Tráfego Pago completo de um cliente de consultoria em HTML com imagens, ensinando alguém sem experiência prévia a montar as primeiras campanhas em Meta Ads e… |
| `skill_vasconcelos` | Handoff de projeto (exige as URLs reais dos materiais no Surge). |
| `skill_vasconcelos_EV` | Framework de Arquitetura da Informação e UI/UX ultra-detalhado. |
| `social-media-IG-AuditEV` | Auditoria completa de Instagram com engajamento real, evidências visuais e mockup de bio. |

## Skills de outros autores

O mapa também indica skills abertas de outros autores (Corey Haines, Firecrawl, Leonxlnx, NextLevelBuilder, Garry Tan e outros). Elas **não** estão copiadas aqui: o mapa mostra o comando que instala cada uma direto do repositório original. Assim você recebe sempre a versão mais nova, e a licença de cada autor fica respeitada.

## Licença

As skills deste repositório estão sob a licença [MIT](LICENSE): use, adapte e compartilhe à vontade, mantendo o crédito ao autor.
