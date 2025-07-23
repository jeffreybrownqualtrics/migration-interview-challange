// Shared Notes Service - Available to both Angular and React apps
class SharedNotesService {
  constructor() {
    this.STORAGE_KEY = 'interview-notes';
    this.notes = [];
    this.filter = 'all';
    this.loadFromStorage();
  }

  // Get current state
  getNotes() {
    return [...this.notes];
  }

  // Actions
  addNote(text) {
    if (!text.trim()) return;
    
    const newNote = {
      id: this.generateId(),
      text: text.trim(),
      completed: false,
      createdAt: new Date(),
      order: this.notes.length > 0 ? Math.max(...this.notes.map(n => n.order)) + 1 : 0
    };
    
    this.notes = [...this.notes, newNote];
    this.saveToStorage();
  }

  deleteNote(id) {
    this.notes = this.notes.filter(note => note.id !== id);
    this.saveToStorage();
  }

  generateId() {
    return Date.now().toString(36) + Math.random().toString(36).substr(2);
  }

  saveToStorage() {
    try {
      if (typeof localStorage !== 'undefined') {
        localStorage.setItem(this.STORAGE_KEY, JSON.stringify(this.notes));
      }
    } catch (error) {
      console.error('Failed to save notes to localStorage:', error);
    }
  }

  loadFromStorage() {
    try {
      if (typeof localStorage !== 'undefined') {
        const stored = localStorage.getItem(this.STORAGE_KEY);
        if (stored) {
          const notes = JSON.parse(stored).map((note) => ({
            ...note,
            createdAt: new Date(note.createdAt)
          }));
          this.notes = notes.sort((a, b) => a.order - b.order);
        }
      }
    } catch (error) {
      console.error('Failed to load notes from localStorage:', error);
      this.notes = [];
    }
  }
}

// Create and expose the shared service globally
window.sharedNotesService = new SharedNotesService();
console.log('Shared Notes Service initialized and available on window.sharedNotesService'); 