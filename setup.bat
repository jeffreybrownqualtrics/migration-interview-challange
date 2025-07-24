@echo off
echo ========================================
echo Angular to React Interview - Windows Setup
echo ========================================
echo.

echo Step 1: Checking prerequisites...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    echo After installation, restart your command prompt and try again.
    pause
    exit /b 1
)

where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed or not in PATH
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
echo Node.js found: %NODE_VERSION%
echo npm found: %NPM_VERSION%
echo.

echo Step 2: Installing root dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Error installing root dependencies
    pause
    exit /b %errorlevel%
)
echo Root dependencies installed successfully.
echo.

echo Step 3: Setting up Angular app...
echo AngularJS setup complete - no dependencies needed
echo.

echo Step 4: Setting up React app...
cd react-app
echo Installing React dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Error installing React dependencies
    cd ..
    pause
    exit /b %errorlevel%
)
cd ..
echo React dependencies installed successfully.
echo.

echo Step 5: Building the project...
echo Building Angular app...
call npm run build:angular:win
if %errorlevel% neq 0 (
    echo Error building Angular app
    pause
    exit /b %errorlevel%
)

echo Building React app...
cd react-app
call npm run build
if %errorlevel% neq 0 (
    echo Error building React app
    cd ..
    pause
    exit /b %errorlevel%
)
cd ..

echo Copying React build to public directory...
if not exist public\react mkdir public\react
if exist react-app\build (
    xcopy react-app\build\* public\react\ /e /i /y
    if %errorlevel% neq 0 (
        echo Error copying React build files
        pause
        exit /b %errorlevel%
    )
) else (
    echo ERROR: React build directory not found
    pause
    exit /b 1
)

echo.
echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo Build artifacts created:
if exist public\angular\browser (
    echo - Angular app: public\angular\browser\
) else (
    echo - Angular app: NOT FOUND
)
if exist public\react (
    echo - React app: public\react\
) else (
    echo - React app: NOT FOUND
)
echo.
echo Starting development servers...
echo.
echo The application will be available at:
echo - Main app: http://localhost:3000
echo - React dev server: http://localhost:3001
echo.
echo Press Ctrl+C to stop the development servers
echo.

call npm run dev 