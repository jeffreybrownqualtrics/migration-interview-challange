import React, { useState } from 'react';

interface NotesAppProps {}

// Shared Service
console.log('notes', window.sharedNotesService.getNotes());

export const NotesApp: React.FC<NotesAppProps> = () => {
  const [newNoteText, setNewNoteText] = useState('');

  // TODO: Implement these functions
  const handleAddNote = (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Add note clicked:', newNoteText);
  };

  return (
    <div className="notes-container">
      {/* Basic form - functionality needs to be implemented */}
      <form onSubmit={handleAddNote} className="add-note-form">
        <input
          type="text"
          value={newNoteText}
          onChange={(e) => setNewNoteText(e.target.value)}
          placeholder="What needs to be remembered?"
          className="note-input"
        />
        <button type="submit" className="add-btn">
          Add Note
        </button>
      </form>

      {/* TODO: Display notes list here */}
      <div className="notes-list">
        <p className="placeholder-text">
          📝 Notes will appear here when you implement the functionality!
        </p>
      </div>
    </div>
  );
}; 