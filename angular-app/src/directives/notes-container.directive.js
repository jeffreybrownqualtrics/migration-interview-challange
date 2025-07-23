// Notes Container Directive
(function() {
  'use strict';

  angular.module('notesApp')
    .directive('notesContainer', notesContainer);

  function notesContainer() {
    return {
      restrict: 'E',
      templateUrl: 'views/notes-container.html',
      scope: {}, // Isolated scope
      bindToController: true,
      controllerAs: 'vm',
      controller: NotesContainerController
    };
  }

  NotesContainerController.$inject = ['$scope', '$window'];

  function NotesContainerController($scope, $window) {
    var vm = this;
    
    // Properties
    vm.notes = [];
    vm.newNoteText = '';
    vm.showForm = true;
    vm.hasNotes = () => vm.notes && vm.notes.length > 0;

    // Methods
    vm.addNote = addNote;
    vm.deleteNote = deleteNote;
    vm.clearInput = clearInput;
    vm.refreshNotes = refreshNotes;

    // Initialize
    activate();

    function activate() {
      // Connect to shared service when available
      if ($window.sharedNotesService) {
        loadNotesFromSharedService();
      }
    }

    function loadNotesFromSharedService() {
      if ($window.sharedNotesService) {
        vm.notes = $window.sharedNotesService.getNotes();
      }
    }

    function refreshNotes() {
      loadNotesFromSharedService();
      if (!$scope.$root.$$phase && !$scope.$$phase) {
        $scope.$apply(); // Trigger digest cycle only if not already in progress
      }
    }

    function addNote() {
      if (vm.newNoteText && vm.newNoteText.trim()) {
        if ($window.sharedNotesService) {
          $window.sharedNotesService.addNote(vm.newNoteText.trim());
          // Refresh notes after adding
          refreshNotes();
        } else {
          // Fallback if shared service not available
          vm.notes.push({
            id: generateId(),
            text: vm.newNoteText.trim(),
            createdAt: new Date()
          });
        }
        vm.newNoteText = '';
      }
    }

    function deleteNote(noteId) {
      if ($window.sharedNotesService) {
        $window.sharedNotesService.deleteNote(noteId);
        // Refresh notes after deleting
        refreshNotes();
      } else {
        // Fallback if shared service not available
        vm.notes = vm.notes.filter(function(note) {
          return note.id !== noteId;
        });
      }
    }

    function clearInput() {
      vm.newNoteText = '';
    }

    function generateId() {
      return Date.now().toString(36) + Math.random().toString(36).substr(2);
    }
  }

})(); 