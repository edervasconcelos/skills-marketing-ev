---
name: manual-mivev
description: Create or revise professional Brazilian Portuguese HTML manuals de identidade visual (MIV/brandbook) for clients from brand sources such as PDFs, presentations, logos, websites, social profiles, existing copy manuals, and prior project files. Use when the user asks for Manual_MIVev, manual de identidade, MIV, brandbook, guia de marca, identidade visual, logo usage, brand applications, or how to apply/not apply a brand in HTML deliverables.
---

# Manual_MIVev

Create a single-file HTML manual de identidade visual for a client, with strategic brand interpretation, visual system, logo usage, applications, incorrect uses, and approval checklist.

## Operating Rules

1. Treat the client's official materials as the source of truth. If a newer official PDF/presentation contradicts earlier assumptions, revise the manual to the newer official source.
2. Do not create visual identity from imagination when source files exist. Extract palette, typography cues, logo behavior, positioning, offer architecture, language, and proof points from the materials.
3. Work in approval gates when the user asks for them. If they ask "separe as skills" or "escopo antes", present the proposed skills/agents and structure before creating files.
4. Prefer HTML-only for MIV unless the user requests Markdown first. Create Markdown only when explicitly requested or required by the workflow.
5. Write all visible text in Portuguese Brazil with accents. Keep code IDs/classes/anchors ASCII when needed for HTML stability, but visible labels must be properly accented.
6. Validate the final HTML in Playwright or an equivalent browser check before finalizing.

## Recommended Skill Stack

When available, combine this skill with:

- `ckm:brand` for positioning, voice, logo rules, and brand consistency.
- `ckm:design` or `ckm:design-system` for visual system, sections, components, tokens, and applications.
- `ui-ux-pro-max` for readability, hierarchy, responsive behavior, and polish.
- `skill-creator` only when updating this skill itself.

## Workflow

1. **Collect sources**
   - Read all user-provided docs, PDFs, HTMLs, Markdown files, screenshots, and folders.
   - Extract PDF text and screenshots when the PDF is visual-heavy.
   - Use official brand presentations, logos, and decks before secondary sources.
   - If using online references, browse only when needed and cite sources in the response.

2. **Build the brand diagnosis**
   - Identify brand role, audience, category, value promise, tone, visual territory, palette, typography, imagery, applications, and restrictions.
   - Note contradictions and resolve them by source hierarchy: official current material > official older material > client website/social > inferred patterns.

3. **Define the manual structure**
   - Follow `references/manual-structure.md` unless the user approves a different scope.
   - Include logo application and incorrect usage sections. Do not leave logo rules vague.
   - Include application examples for channels the client actually uses: LP, ads, deck, WhatsApp, social, proposal, signage, etc.

4. **Create the HTML**
   - Build a polished, single-file `.html` inside a client folder such as `Manual de Identidade/`.
   - Use responsive full-width sections, stable dimensions, readable cards, and accessible contrast.
   - Use real assets when provided. If the official vector logo is missing, make a clearly provisional HTML approximation and state that the vector file prevails.
   - Keep the design tailored to the brand; do not reuse Stylus Corp colors unless the client is Stylus Corp.

5. **Revise Portuguese and encoding**
   - Ensure visible copy uses accents: `Atuação`, `Soluções`, `experiência`, `aplicações`, `propósito`, `inovação`, etc.
   - Save as UTF-8. Avoid PowerShell write patterns that corrupt accents.
   - Do not convert HTML IDs like `#aplicacoes` to accented forms unless all corresponding links/selectors are also updated safely.

6. **QA before final**
   - Use `references/html-qa.md`.
   - Check no console errors, no desktop/mobile overflow, logos are not clipped, anchors work, and key sections render.
   - Take screenshots of problem areas when visual inspection matters.

## File Naming

Use a simple sequence:

- `01_manual_identidade_{cliente_slug}.html` for the main MIV.
- If a wireframe/scope is requested first: `00_escopo_manual_identidade_{cliente_slug}.md`.
- Keep files in `Projetos/{Cliente}/Manual de Identidade/` unless the user gives another path.

## Final Response

Report the file path, what changed, and validation results. Keep it short. Mention if any required assets are pending, especially official logo vector files.
