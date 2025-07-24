@echo off
echo ========================================
echo Angular to React Interview - Development Mode
echo ========================================
echo.

echo Checking if project is built...
if not exist public\angular\browser (
    echo Angular app not built. Building now...
    call npm run build:angular:win
    if %errorlevel% neq 0 (
        echo Error building Angular app
        pause
        exit /b %errorlevel%
    )
)

if not exist public\react (
    echo React app not built. Building now...
    cd react-app
    call npm run build
    if %errorlevel% neq 0 (
        echo Error building React app
        cd ..
        pause
        exit /b %errorlevel%
    )
    cd ..
    if not exist public\react mkdir public\react
    xcopy react-app\build\* public\react\ /e /i /y
)

echo.
echo ========================================
echo Starting Development Servers
echo ========================================
echo.
echo The following servers will start:
echo - Express server (nodemon): http://localhost:3000
echo - React dev server: http://localhost:3001
echo.
echo Live updating is enabled for:
echo - React app: Changes in react-app/src will auto-reload
echo - Express server: Changes to server.js will auto-restart
echo.
echo Press Ctrl+C to stop all servers
echo.

echo Starting development servers with live updating...
call npm run dev 