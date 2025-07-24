Write-Host "Quick Start - Building and Running" -ForegroundColor Green
Write-Host ""

Write-Host "Building project..." -ForegroundColor Yellow
& .\build.ps1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed. Check the output above." -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "Starting development servers..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Live updating enabled:" -ForegroundColor Cyan
Write-Host "- React: http://localhost:3001" -ForegroundColor White
Write-Host "- Main app: http://localhost:3000" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

npm run dev:win 