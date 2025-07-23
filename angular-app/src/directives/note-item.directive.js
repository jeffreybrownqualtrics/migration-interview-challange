// Note Item Directive (Nested within notes-container)
(function() {
  'use strict';

  angular.module('notesApp')
    .directive('noteItem', noteItem);

  function noteItem() {
    return {
      restrict: 'E',
      templateUrl: 'views/note-item.html',
      scope: {
        noteData: '=',
        onDelete: '&'
      },
      bindToController: true,
      controllerAs: 'vm',
      controller: NoteItemController
    };
  }

  NoteItemController.$inject = [];

  function NoteItemController() {
    var vm = this;

    // Properties
    vm.showConfirm = false;

    // Methods
    vm.confirmDelete = confirmDelete;
    vm.cancelDelete = cancelDelete;
    vm.formatDate = formatDate;

    function confirmDelete() {
      // Call parent delete function with note ID
      vm.onDelete({ noteId: vm.noteData.id });
      vm.showConfirm = false;
    }

    function cancelDelete() {
      vm.showConfirm = false;
    }

    function formatDate(date) {
      if (!date) return '';
      
      var dateObj = new Date(date);
      return dateObj.toLocaleDateString() + ' ' + dateObj.toLocaleTimeString([], {
        hour: '2-digit',
        minute: '2-digit'
      });
    }
  }

})(); 