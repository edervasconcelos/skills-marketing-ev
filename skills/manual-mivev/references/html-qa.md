# QA Para Manual MIV em HTML

Execute uma checagem objetiva antes de finalizar.

## Encoding e Português

- O arquivo deve usar `<meta charset="utf-8">`.
- Texto visível deve estar em PT-BR com acentos.
- Procurar sobras comuns sem acento: `Solucoes`, `proposito`, `inovacao`, `experiencia`, `aplicacoes`, `Atuacao`, `recepcao`, `gestao`, `validacao`.
- Procurar mojibake: `Ã`, `Â`, `??`, `éé`, `conteé`, `Atuaé`, `organizaé`.
- Não acentuar IDs/classes se isso quebrar links ou CSS. Exemplo aceitável: `id="aplicacoes"` com label visível `Aplicações`.

## Browser QA

Use Playwright quando disponível:

```js
const { chromium } = require("playwright");
const path = require("path");

(async () => {
  const file = "file:///" + path.resolve("CAMINHO_DO_HTML").replace(/\\/g, "/");
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 1366, height: 768 } });
  const errors = [];
  page.on("pageerror", e => errors.push(e.message));
  page.on("console", msg => {
    if (["error", "warning"].includes(msg.type())) errors.push(`${msg.type()}: ${msg.text()}`);
  });
  await page.goto(file);
  await page.waitForLoadState("networkidle");
  const data = await page.evaluate(() => ({
    title: document.title,
    desktopOverflow: document.body.scrollWidth > innerWidth + 2,
    sections: document.querySelectorAll("section").length,
  }));
  await page.setViewportSize({ width: 390, height: 844 });
  await page.waitForTimeout(200);
  const mobileOverflow = await page.evaluate(() => document.body.scrollWidth > innerWidth + 2);
  console.log({ ...data, mobileOverflow, errors });
  await browser.close();
})();
```

## Visual QA

- Verificar capa, logo, aplicações, usos incorretos e checklist.
- Confirmar que nenhuma logo ou texto foi cortado por `overflow: hidden`.
- Confirmar que cards com preço, labels ou listas continuam legíveis.
- Confirmar que o menu fixo não cobre títulos ao navegar por âncoras; usar `scroll-margin-top`.
- Confirmar contraste suficiente em labels pequenos.
- Confirmar responsividade em 1366px, 768px e 390px.

## Finalização

No resumo ao usuário, informar:

- Caminho do arquivo.
- Principais mudanças.
- Resultado da validação: console, overflow, número de seções e pendências.
