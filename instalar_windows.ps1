# Instala as skills deste pacote no Claude Code e nas outras ferramentas (Codex, Gemini CLI, Cursor).
# Nao sobrescreve skills que ja existam com o mesmo nome.
$origem = Join-Path $PSScriptRoot "skills"
$destinos = @((Join-Path $HOME ".claude\skills"), (Join-Path $HOME ".agents\skills"))
foreach ($d in $destinos) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
    Get-ChildItem -Directory $origem | ForEach-Object {
        $alvo = Join-Path $d $_.Name
        if (Test-Path $alvo) { Write-Host "Ja existe, mantido: $alvo" }
        else { Copy-Item -Recurse $_.FullName $alvo; Write-Host "Instalada: $alvo" }
    }
}
Write-Host ""
Write-Host "Pronto. Abra o Claude Code e digite / para ver as skills."
Read-Host "Pressione Enter para fechar"
