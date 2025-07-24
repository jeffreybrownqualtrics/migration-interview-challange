# Windows Build Guide

This guide explains how to build the Angular to React Interview project on Windows.

## Prerequisites

1. **Node.js**: Install Node.js from [nodejs.org](https://nodejs.org/)
2. **npm**: Usually comes with Node.js
3. **Git**: Install Git from [git-scm.com](https://git-scm.com/)

## Quick Start

### Complete Setup (Recommended for new installations)

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
- Start development servers automatically

### Build Only (if dependencies are already installed)

#### Option 1: Using the improved batch file

```cmd
build.bat
```

This will:
- Check prerequisites (Node.js, npm)
- Install React dependencies if needed
- Build both Angular and React apps
- Copy build artifacts to the correct locations
- Provide detailed feedback and error handling

#### Option 2: Using npm scripts

```cmd
npm run build:win
```

#### Option 3: Using PowerShell

```powershell
.\build.ps1
```

**Note**: You may need to set the execution policy first:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Setup vs Build

- **Use `setup.bat` or `setup.ps1`** when:
  - Setting up the project for the first time
  - Want to install all dependencies and start development servers
  - Need a complete fresh installation

- **Use `build.bat` or `build.ps1`** when:
  - Dependencies are already installed
  - Only need to rebuild the project
  - Want to check build status without starting servers

## Troubleshooting

If you encounter issues, run the troubleshooting script first:

```cmd
troubleshoot.bat
```

This will check:
- Node.js and npm installation
- Project structure
- React dependencies
- Existing build artifacts

## What the Windows build does

The improved Windows build process performs these steps:

1. **Prerequisites Check**: Verifies Node.js and npm are installed
2. **Angular Build**: Creates and populates `public\angular\browser\`
3. **React Dependencies**: Installs React dependencies if needed
4. **React Build**: Runs the React build process in `react-app\`
5. **Copy Artifacts**: Copies React build files to `public\react\`

## Common Issues and Solutions

### "React app isn't built" Error

This usually happens when:
1. **React dependencies not installed**: The build script now automatically installs them
2. **Build process fails**: Check the console output for specific error messages
3. **Path issues**: Make sure you're running from the project root directory

### "npm is not recognized"

- Install Node.js from [nodejs.org](https://nodejs.org/)
- Restart your command prompt after installation
- Verify installation: `node --version` and `npm --version`

### "Access denied" errors

- Run Command Prompt or PowerShell as Administrator
- Check file permissions in the project directory

### Build artifacts not found

Run the troubleshooting script to check what's missing:
```cmd
troubleshoot.bat
```

## Manual Setup Steps

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
   npm run build:win
   ```

4. **Start development servers**:
   ```cmd
   npm run dev
   ```

## Manual Build Steps

If the automated build fails, you can run these steps manually:

1. **Install React dependencies**:
   ```cmd
   cd react-app
   npm install
   cd ..
   ```

2. **Build React app**:
   ```cmd
   cd react-app
   npm run build
   cd ..
   ```

3. **Copy React build**:
   ```cmd
   if not exist public\react mkdir public\react
   xcopy react-app\build\* public\react\ /e /i /y
   ```

4. **Build Angular app**:
   ```cmd
   npm run build:angular:win
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

## Getting Help

1. Run `troubleshoot.bat` to diagnose issues
2. Check the console output for specific error messages
3. Ensure you're running commands from the project root directory
4. Verify Node.js and npm are properly installed 