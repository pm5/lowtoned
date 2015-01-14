
angular.module 'App'

.controller Main: <[$scope Sound]> ++ ($scope, Sound) ->
  $scope.Sound = Sound
