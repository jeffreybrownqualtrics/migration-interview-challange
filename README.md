# AngularJS to React Migration Interview Template

A comprehensive interview template for testing candidates' ability to understand AngularJS patterns and implement equivalent functionality in React. This project provides a simplified but educational AngularJS notes application and a minimal React starting point for candidates to implement.

## 📋 Overview

This project demonstrates a shared service architecture where both AngularJS and React applications use the same backend service for data persistence and state management.

## 🚀 Quick Start

### Prerequisites
- Node.js (v18+ recommended)
- npm

### Setup
```bash
# Install main dependencies
# Setup React application (AngularJS has no dependencies)
# Build both applications
# Start the server in Dev mode
npm run setup
```

The server will be available at `http://localhost:3000` with:
- **Main page:** Instructions and links to both apps
- **AngularJS app:** `http://localhost:3000/angular` - Full working implementation
- **React app:** `http://localhost:3001/react` - Starter template for candidates

## 📱 Applications

**Architecture:**
```
project-root/
├── server.js                      # Express server serving both apps
├── shared/                        # Shared resources and build outputs
│   ├── shared-service.js          # Shared service for both apps
├── angular-app/src/
│   ├── index.html                 # Main HTML with ng-app
│   ├── app.js                     # Module definition & controller
│   ├── app.css                    # Styling for the entire app
│   ├── directives/
│   │   ├── notes-container.directive.js   # Main container directive
│   │   └── note-item.directive.js         # Nested item directive
│   └── views/
│       ├── notes-container.html           # Template for container directive
│       └── note-item.html                 # Template for item directive
└── react-app/src/
    ├── App.tsx                    # Main app component with instructions
    ├── App.css                    # Styling for the entire app
    └── components/
        ├── index.ts               # Component exports
        ├── NotesApp.tsx           # Notes functionality component
        ├── NoteItem.tsx           # Individual note display component
        └── SharedServiceTypes.ts  # TypeScript interfaces & types
```

**Shared Service Architecture:**
- Both applications use `window.sharedNotesService` for data persistence
- Service handles localStorage and provides consistent API
- Server serves shared service from `/shared-service.js`
