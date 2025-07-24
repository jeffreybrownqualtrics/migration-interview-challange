@echo off
echo Building Angular to React Interview Project for Windows...
echo.

echo Step 1: Checking prerequisites...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed or not in PATH
    pause
    exit /b 1
)

echo Node.js and npm found. Proceeding with build...
echo.

echo Step 2: Building Angular app...
call npm run build:angular:win
if %errorlevel% neq 0 (
    echo Error building Angular app
    pause
    exit /b %errorlevel%
)
echo Angular build completed successfully.
echo.

echo Step 3: Installing React dependencies (if needed)...
cd react-app
if not exist node_modules (
    echo Installing React dependencies...
    call npm install
    if %errorlevel% neq 0 (
        echo Error installing React dependencies
        pause
        exit /b %errorlevel%
    )
)
cd ..

echo Step 4: Building React app...
cd react-app
echo Running React build...
call npm run build
if %errorlevel% neq 0 (
    echo Error building React app
    echo Please check the React build output above for details
    pause
    exit /b %errorlevel%
)
cd ..

echo Step 5: Copying React build to public directory...
if not exist public\react mkdir public\react
if exist react-app\build (
    echo Copying React build files...
    xcopy react-app\build\* public\react\ /e /i /y
    if %errorlevel% neq 0 (
        echo Error copying React build files
        pause
        exit /b %errorlevel%
    )
    echo React build files copied successfully.
) else (
    echo ERROR: React build directory not found
    echo The React build process may have failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Build artifacts:
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
echo You can now run 'npm start' to start the server
pause 