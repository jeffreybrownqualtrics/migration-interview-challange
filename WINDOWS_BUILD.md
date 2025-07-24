# Windows Build Guide

This guide explains how to build the Angular to React Interview project on Windows.

## Prerequisites

1. **Node.js**: Install Node.js from [nodejs.org](https://nodejs.org/)
2. **npm**: Usually comes with Node.js
3. **Git**: Install Git from [git-scm.com](https://git-scm.com/)

## Quick Start

### Option 1: Complete Setup (Recommended)

For a complete setup that installs dependencies, builds the project, and starts development servers:

```cmd
setup.bat
```

Or using PowerShell:
```powershell
.\setup.ps1
```

This will:
- Check prerequisites (Node.js, npm)
- Install all dependencies (root and React)
- Build both Angular and React apps
- Start development servers with live updating

### Option 2: Manual Setup

If you prefer to run commands manually:

```cmd
npm install
cd react-app && npm install && cd ..
npm run build
npm run dev
```

## Live Updating Features

The development setup provides live updating for:

- **React App**: Changes in `react-app/src` will automatically reload in the browser
- **Express Server**: Changes to `server.js` will automatically restart the server
- **Angular App**: Changes require a manual rebuild (run `npm run build:angular`)

### Development URLs

When running in development mode:
- **Main Application**: http://localhost:3000
- **React Development Server**: http://localhost:3001 (with hot reload)

## Troubleshooting

### Common Issues

#### "npm is not recognized"
- Install Node.js from [nodejs.org](https://nodejs.org/)
- Restart your command prompt after installation
- Verify installation: `node --version` and `npm --version`

#### "Access denied" errors
- Run Command Prompt or PowerShell as Administrator
- Check file permissions in the project directory

#### Live updating not working
- Make sure you're using `setup.bat` or `npm run dev`
- Check that both servers are running (Express on 3000, React on 3001)
- Verify you're editing files in the correct directories (`react-app/src` for React)

#### Build artifacts not found
- Run `npm run build` to rebuild the project
- Check that the `shared` directory contains both `angular/browser` and `react` folders

## Manual Build Steps

If the automated setup fails, you can run these steps manually:

1. **Install root dependencies**:
   ```cmd
   npm install
   ```

2. **Install React dependencies**:
   ```cmd
   cd react-app
   npm install
   cd ..
   ```

3. **Build the project**:
   ```cmd
   npm run build
   ```

4. **Start development servers**:
   ```cmd
   npm run dev
   ```

## Running the Application

After building, start the server:

```cmd
npm start
```

The application will be available at `http://localhost:3000`

## Development

For development, you can use:

```cmd
npm run dev
```

This will start both the Angular and React development servers along with the Express server.

## Command Differences

| Unix Command | Windows Equivalent |
|--------------|-------------------|
| `mkdir -p` | `if not exist dir mkdir dir` |
| `rm -rf` | `rmdir /s /q` |
| `cp -r` | `xcopy /e /i /y` |
| `PORT=3001` | `set PORT=3001` |

## Getting Help

1. Check the console output for specific error messages
2. Ensure you're running commands from the project root directory
3. Verify Node.js and npm are properly installed
4. Try running `npm run build` to rebuild the project 