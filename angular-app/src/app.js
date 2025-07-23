// Main AngularJS application module
(function() {
  'use strict';

  // Define the main module
  angular.module('notesApp', []);

  // Main controller for the notes application
  angular.module('notesApp')
    .controller('NotesController', NotesController);

  NotesController.$inject = ['$scope'];

  function NotesController($scope) {
    var vm = this;
    
    // Root controller for the notes application - called from index.html
  }

})(); 