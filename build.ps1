Write-Host "Building Angular to React Interview Project for Windows..." -ForegroundColor Green
Write-Host ""

Write-Host "Step 1: Checking prerequisites..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Red
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

Write-Host "Node.js and npm found. Proceeding with build..." -ForegroundColor Green
Write-Host ""

Write-Host "Step 2: Building Angular app..." -ForegroundColor Yellow
npm run build:angular:win
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error building Angular app" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}
Write-Host "Angular build completed successfully." -ForegroundColor Green
Write-Host ""

Write-Host "Step 3: Installing React dependencies (if needed)..." -ForegroundColor Yellow
Set-Location react-app
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing React dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error installing React dependencies" -ForegroundColor Red
        Read-Host "Press Enter to continue"
        exit $LASTEXITCODE
    }
}
Set-Location ..

Write-Host "Step 4: Building React app..." -ForegroundColor Yellow
Set-Location react-app
Write-Host "Running React build..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error building React app" -ForegroundColor Red
    Write-Host "Please check the React build output above for details" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit $LASTEXITCODE
}
Set-Location ..

Write-Host "Step 5: Copying React build to public directory..." -ForegroundColor Yellow
if (-not (Test-Path "public\react")) {
    New-Item -ItemType Directory -Path "public\react" -Force | Out-Null
}

if (Test-Path "react-app\build") {
    Write-Host "Copying React build files..." -ForegroundColor Yellow
    Copy-Item -Path "react-app\build\*" -Destination "public\react\" -Recurse -Force
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error copying React build files" -ForegroundColor Red
        Read-Host "Press Enter to continue"
        exit $LASTEXITCODE
    }
    Write-Host "React build files copied successfully." -ForegroundColor Green
} else {
    Write-Host "ERROR: React build directory not found" -ForegroundColor Red
    Write-Host "The React build process may have failed" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Build completed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Build artifacts:" -ForegroundColor Cyan
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
Write-Host "You can now run 'npm start' to start the server" -ForegroundColor Cyan
Read-Host "Press Enter to continue" 