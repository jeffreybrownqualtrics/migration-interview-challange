@echo off
echo Quick Start - Building and Running
echo.

echo Building project...
call build.bat
if %errorlevel% neq 0 (
    echo Build failed. Check the output above.
    pause
    exit /b %errorlevel%
)

echo.
echo Starting development servers...
echo.
echo Live updating enabled:
echo - React: http://localhost:3001
echo - Main app: http://localhost:3000
echo.
echo Press Ctrl+C to stop
echo.

call npm run dev:win 