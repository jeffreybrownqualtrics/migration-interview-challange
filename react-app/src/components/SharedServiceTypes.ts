// Type definitions for the shared notes service

export interface Note {
  id: string;
  text: string;
  createdAt: Date;
}

// ## Shared service located in public/shared-service.js ##

export interface SharedNotesService {
  getNotes(): Note[];
  addNote(text: string): void;
  deleteNote(id: string): void;
}

// Extend the Window interface
//accessed via window.sharedNotesService
declare global {
  interface Window {
    sharedNotesService: SharedNotesService;
  }
} 