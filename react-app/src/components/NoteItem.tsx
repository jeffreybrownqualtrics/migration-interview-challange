import React from 'react';
import { Note } from './SharedServiceTypes';

interface NoteProps {
  note: Note;
  onDelete: (noteId: string) => void;
}

export const NoteItem: React.FC<NoteProps> = ({ note, onDelete }) => {

  return (
    <div className="note-item">
      <div className="note-content">
        <span className="note-text">{note.text}</span>
        <div className="note-metadata">
          <small className="created-date">Created: {note.createdAt.toLocaleDateString()}</small>
        </div>
      </div>
      <div className="note-actions">
        <button className="delete-btn">🗑️ Delete</button>
      </div>
    </div>
  );
}; 