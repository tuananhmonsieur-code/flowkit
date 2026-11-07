# Flow Kit — Start Agent Server (Windows PowerShell)
# Usage: .\start.ps1
# Optional env vars: $env:FLOW_PROJECT_ID = "your-uuid"

Write-Host "=======================================" -ForegroundColor Cyan
Write-Host "  Flow Kit — Starting Agent Server" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
$venv = Join-Path $root "venv\Scripts\python.exe"

if (-not (Test-Path $venv)) {
    Write-Host "ERROR: venv not found. Run setup first." -ForegroundColor Red
    exit 1
}

# Flow Project ID (from flow.google.com)
$env:FLOW_PROJECT_ID = "ded63e57-2983-4af0-83c9-94a5a20c7a24"

Write-Host "Starting on http://127.0.0.1:8100 ..." -ForegroundColor Green
Write-Host "Press Ctrl+C to stop." -ForegroundColor Yellow
Write-Host ""

Set-Location $root
& $venv -m agent.main
