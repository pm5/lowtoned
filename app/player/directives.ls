
angular.module 'App.Player', []

.directive 'tnPlayerButton' -> do
  restrict: 'A'
  link: (scope, element) ->
    playing = false
    element.click ->
      playing := not playing
      element.html if playing then '<i class="icono-volumeHigh"></i>' else '<i class="icono-volumeMute"></i>'
