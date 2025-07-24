Write-Host "========================================" -ForegroundColor Green
Write-Host "Angular to React Interview - Development Mode" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Checking if project is built..." -ForegroundColor Yellow
if (-not (Test-Path "public\angular\browser")) {
    Write-Host "Angular app not built. Building now..." -ForegroundColor Yellow
    npm run build:angular:win
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error building Angular app" -ForegroundColor Red
        Read-Host "Press Enter to continue"
        exit $LASTEXITCODE
    }
}

if (-not (Test-Path "public\react")) {
    Write-Host "React app not built. Building now..." -ForegroundColor Yellow
    Set-Location react-app
    npm run build
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error building React app" -ForegroundColor Red
        Set-Location ..
        Read-Host "Press Enter to continue"
        exit $LASTEXITCODE
    }
    Set-Location ..
    if (-not (Test-Path "public\react")) {
        New-Item -ItemType Directory -Path "public\react" -Force | Out-Null
    }
    Copy-Item -Path "react-app\build\*" -Destination "public\react\" -Recurse -Force
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Starting Development Servers" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "The following servers will start:" -ForegroundColor Cyan
Write-Host "- Express server (nodemon): http://localhost:3000" -ForegroundColor White
Write-Host "- React dev server: http://localhost:3001" -ForegroundColor White
Write-Host ""
Write-Host "Live updating is enabled for:" -ForegroundColor Cyan
Write-Host "- React app: Changes in react-app/src will auto-reload" -ForegroundColor White
Write-Host "- Express server: Changes to server.js will auto-restart" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop all servers" -ForegroundColor Yellow
Write-Host ""

Write-Host "Starting development servers with live updating..." -ForegroundColor Yellow
npm run dev 