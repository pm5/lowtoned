
angular.module 'App.Player', []

.directive 'tnPlayerButton' -> do
  restrict: 'A'
  link: (scope, element) ->
    playing = false
    element.click ->
      element.text if playing then '+' else '-'
      playing := not playing
