@echo off
echo Testing Windows Development Setup
echo.

echo Testing Angular build...
call npm run build:angular:win
if %errorlevel% neq 0 (
    echo ERROR: Angular build failed
    pause
    exit /b 1
)
echo Angular build: OK
echo.

echo Testing React build...
cd react-app
call npm run build
if %errorlevel% neq 0 (
    echo ERROR: React build failed
    cd ..
    pause
    exit /b 1
)
cd ..
echo React build: OK
echo.

echo Testing React start script...
cd react-app
call npm run start:win --dry-run
if %errorlevel% neq 0 (
    echo ERROR: React start script failed
    cd ..
    pause
    exit /b 1
)
cd ..
echo React start script: OK
echo.

echo Testing dev:win command...
call npm run dev:win --dry-run
if %errorlevel% neq 0 (
    echo ERROR: dev:win command failed
    pause
    exit /b 1
)
echo dev:win command: OK
echo.

echo ========================================
echo All tests passed! Windows development setup is working.
echo ========================================
echo.
echo You can now run:
echo - quickstart.bat (for quick start)
echo - dev.bat (for development mode)
echo - setup.bat (for complete setup)
echo.
pause 