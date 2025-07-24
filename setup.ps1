Write-Host "========================================" -ForegroundColor Green
Write-Host "Angular to React Interview - Windows Setup" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Step 1: Checking prerequisites..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    Write-Host "After installation, restart your PowerShell and try again." -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

try {
    $npmVersion = npm --version
    Write-Host "npm found: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: npm is not installed or not in PATH" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

Write-Host ""
Write-Host "Step 2: Installing root dependencies..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error installing root dependencies" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}
Write-Host "Root dependencies installed successfully." -ForegroundColor Green
Write-Host ""

Write-Host "Step 3: Setting up Angular app..." -ForegroundColor Yellow
Write-Host "AngularJS setup complete - no dependencies needed" -ForegroundColor Green
Write-Host ""

Write-Host "Step 4: Setting up React app..." -ForegroundColor Yellow
Set-Location react-app
Write-Host "Installing React dependencies..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error installing React dependencies" -ForegroundColor Red
    Set-Location ..
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}
Set-Location ..
Write-Host "React dependencies installed successfully." -ForegroundColor Green
Write-Host ""

Write-Host "Step 5: Building the project..." -ForegroundColor Yellow
Write-Host "Building Angular app..." -ForegroundColor Yellow
npm run build:angular:win
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error building Angular app" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}

Write-Host "Building React app..." -ForegroundColor Yellow
Set-Location react-app
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error building React app" -ForegroundColor Red
    Set-Location ..
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}
Set-Location ..

Write-Host "Copying React build to public directory..." -ForegroundColor Yellow
if (-not (Test-Path "public\react")) {
    New-Item -ItemType Directory -Path "public\react" -Force | Out-Null
}

if (Test-Path "react-app\build") {
    Copy-Item -Path "react-app\build\*" -Destination "public\react\" -Recurse -Force
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error copying React build files" -ForegroundColor Red
        Read-Host "Press Enter to continue"
        exit $LASTEXITCODE
    }
} else {
    Write-Host "ERROR: React build directory not found" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Build artifacts created:" -ForegroundColor Cyan
if (Test-Path "public\angular\browser") {
    Write-Host "- Angular app: public\angular\browser\" -ForegroundColor Green
} else {
    Write-Host "- Angular app: NOT FOUND" -ForegroundColor Red
}
if (Test-Path "public\react") {
    Write-Host "- React app: public\react\" -ForegroundColor Green
} else {
    Write-Host "- React app: NOT FOUND" -ForegroundColor Red
}
Write-Host ""
Write-Host "Starting development servers..." -ForegroundColor Yellow
Write-Host ""
Write-Host "The application will be available at:" -ForegroundColor Cyan
Write-Host "- Main app: http://localhost:3000" -ForegroundColor White
Write-Host "- React dev server: http://localhost:3001" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop the development servers" -ForegroundColor Yellow
Write-Host ""

npm run dev 