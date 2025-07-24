const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Create shared directories if they don't exist
const fs = require('fs');
const sharedDir = path.join(__dirname, 'shared');
const angularDir = path.join(sharedDir, 'angular');
const reactDir = path.join(sharedDir, 'react');

[sharedDir, angularDir, reactDir].forEach(dir => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
});

// Serve shared service file from root shared directory
app.use(express.static(sharedDir));

// Serve static files for Angular app (from browser subdirectory)
app.use('/angular', express.static(path.join(angularDir, 'browser')));

// Serve static files for React app  
app.use('/react', express.static(reactDir));

// Handle Angular routes - serve index.html for any /angular/* path
app.get('/angular*', (req, res) => {
  const angularIndex = path.join(angularDir, 'browser', 'index.html');
  if (fs.existsSync(angularIndex)) {
    res.sendFile(angularIndex);
  } else {
    res.status(404).send(`
      <html>
        <body>
          <h1>Angular App Not Built</h1>
          <p>Please run: <code>npm run build:angular</code></p>
          <p>Or for development: <code>cd angular-app && ng serve</code></p>
        </body>
      </html>
    `);
  }
});

// Handle React routes - serve index.html for any /react/* path
app.get('/react*', (req, res) => {
  const reactIndex = path.join(reactDir, 'index.html');
  if (fs.existsSync(reactIndex)) {
    res.sendFile(reactIndex);
  } else {
    res.status(404).send(`
      <html>
        <body>
          <h1>React App Not Built</h1>
          <p>Please run: <code>npm run build:react</code></p>
          <p>Or for development: <code>cd react-app && npm start</code></p>
        </body>
      </html>
    `);
  }
});

// Root route with instructions
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Angular to React Interview</title>
        <style>
          body { font-family: Arial, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
          .route { background: #f5f5f5; padding: 15px; margin: 10px 0; border-radius: 5px; }
          .route h3 { margin-top: 0; }
          code { background: #e0e0e0; padding: 2px 6px; border-radius: 3px; }
        </style>
      </head>
      <body>
        <h1>Angular to React Migration Interview</h1>
        <p>This is an interview template for testing Angular to React migration skills.</p>
        
        <div class="route">
          <h3><a href="/angular">📱 Angular App (/angular)</a></h3>
          <p>A fully functional notes application with:</p>
          <ul>
            <li>Add notes with text input</li>
            <li>Display notes in a list</li>
            <li>Mark notes as complete/incomplete</li>
            <li>Delete notes</li>
            <li>Drag and drop reordering</li>
            <li>Filter by status (all/active/completed)</li>
          </ul>
        </div>

        <div class="route">
          <h3><a href="/react">⚛️ React App (/react)</a></h3>
          <p>Starting point with minimal implementation:</p>
          <ul>
            <li>Basic text input</li>
            <li>Candidate builds the rest based on Angular implementation</li>
          </ul>
        </div>

        <h3>Development Commands:</h3>
        <ul>
          <li><code>npm install</code> - Install dependencies</li>
          <li><code>npm run setup</code> - Setup both Angular and React apps</li>
          <li><code>npm run dev</code> - Run development servers</li>
          <li><code>npm run build</code> - Build both apps</li>
          <li><code>npm start</code> - Start production server</li>
        </ul>
      </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`🚀 Interview server running on http://localhost:${PORT}`);
  console.log(`📱 Angular app: http://localhost:${PORT}/angular`);
  console.log(`⚛️  React app: http://localhost:${PORT}/react`);
}); 