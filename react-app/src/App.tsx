import React from 'react';
import './App.css';
import { NotesApp } from './components/NotesApp';

function App() {
  return (
    <div className="notes-app">
      <header className="app-header">
        <h1>📝 React Notes App</h1>
        <p className="subtitle">Interview Challenge - Build the Missing Features</p>
      </header>

      {/* Notes functionality extracted to separate component */}
      <NotesApp />

      <div className="challenge-section">
        <h3>🎯 Your Mission</h3>
        <div className="challenge-content">
          <p>Study the AngularJS implementation at <a href="http://localhost:3000/angular" target="_blank">/angular</a> and build equivalent functionality in React.</p>
          
          <h4>Features to Implement:</h4>
          <ul className="features-list">
            <li>✅ Text input (already provided)</li>
            <li>✅ Add button (already provided)</li>
            <li>❌ Add note functionality</li>
            <li>❌ Display notes list</li>
            <li>❌ Delete notes with confirmation</li>
            <li>❌ Empty state when no notes</li>
            <li>❌ Any other features you think are missing</li>
          </ul>

          <h4>Available Resources:</h4>
          <ul className="resources-list">
            <li>🔧 <code>window.sharedNotesService</code> - Shared service for data management</li>
            <li>📖 <a href="http://localhost:3000/angular" target="_blank">AngularJS reference implementation</a></li>
            <li>🎨 CSS classes already defined in App.css</li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default App;
