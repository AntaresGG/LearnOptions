param(
  [int]$Port = 8000
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
  $root = Split-Path -Parent $MyInvocation.MyCommand.Path
  Set-Location -LiteralPath $root

  $python = Get-Command python -ErrorAction SilentlyContinue
  if ($null -eq $python) {
    $py = Get-Command py -ErrorAction SilentlyContinue
    if ($null -eq $py) {
      throw "Python was not found on PATH."
    }
    Write-Host "Serving LearnOptions at http://127.0.0.1:$Port/"
    & $py.Source -3 -m http.server $Port --bind 127.0.0.1
    exit $LASTEXITCODE
  }

  Write-Host "Serving LearnOptions at http://127.0.0.1:$Port/"
  & $python.Source -m http.server $Port --bind 127.0.0.1
  exit $LASTEXITCODE
}
catch {
  [pscustomobject]@{
    ok = $false
    stage = "start-site"
    message = $_.Exception.Message
  } | ConvertTo-Json -Depth 3
  exit 1
}
