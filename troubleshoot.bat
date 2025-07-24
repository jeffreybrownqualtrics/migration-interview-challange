@echo off
echo ========================================
echo Windows Build Troubleshooting Script
echo ========================================
echo.

echo Checking Node.js installation...
where node >nul 2>nul
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo Node.js found: %NODE_VERSION%
) else (
    echo ERROR: Node.js not found in PATH
    echo Please install Node.js from https://nodejs.org/
    echo.
)

echo.
echo Checking npm installation...
where npm >nul 2>nul
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
    echo npm found: %NPM_VERSION%
) else (
    echo ERROR: npm not found in PATH
    echo.
)

echo.
echo Checking project structure...
if exist package.json (
    echo package.json found
) else (
    echo ERROR: package.json not found
    echo Make sure you're in the project root directory
    echo.
)

if exist react-app (
    echo react-app directory found
    if exist react-app\package.json (
        echo react-app\package.json found
    ) else (
        echo ERROR: react-app\package.json not found
    )
) else (
    echo ERROR: react-app directory not found
    echo.
)

if exist angular-app (
    echo angular-app directory found
) else (
    echo ERROR: angular-app directory not found
    echo.
)

echo.
echo Checking React dependencies...
if exist react-app\node_modules (
    echo React node_modules found
) else (
    echo WARNING: React node_modules not found
    echo Run 'cd react-app && npm install' to install dependencies
    echo.
)

echo.
echo Checking build artifacts...
if exist public\angular\browser (
    echo Angular build found: public\angular\browser\
) else (
    echo Angular build NOT found
    echo.
)

if exist public\react (
    echo React build found: public\react\
) else (
    echo React build NOT found
    echo.
)

if exist react-app\build (
    echo React build directory found: react-app\build\
) else (
    echo React build directory NOT found
    echo.
)

echo.
echo ========================================
echo Troubleshooting complete
echo ========================================
echo.
echo If you see any ERROR messages above, please fix them before running the build.
echo.
pause 