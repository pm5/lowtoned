# Declare app level module which depends on filters, and services

angular.module "App" <[app.templates ngMaterial ui.router]>

.config <[$stateProvider $urlRouterProvider $locationProvider $mdThemingProvider]> ++ ($stateProvider, $urlRouterProvider, $locationProvider, $mdThemingProvider) ->
  $stateProvider
    .state 'about' do
      url: '/about'
      templateUrl: 'app/partials/about.html'
      controller: "About"
    .state 'main' do
      url: '/main'
      templateUrl: 'app/partials/main.html'
      controller: "Main"
    # Catch all
  $urlRouterProvider
    .otherwise('/main')
  $mdThemingProvider
    .theme 'default'
    .primaryColor 'indigo'
    .accentColor 'pink'

  # Without serve side support html5 must be disabled.
  $locationProvider.html5Mode true

.run <[$rootScope $state $stateParams $location $window $anchorScroll]> ++ ($rootScope, $state, $stateParams, $location, $window, $anchorScroll) ->
  $rootScope.$state = $state
  $rootScope.$stateParam = $stateParams
  $rootScope.config_build = require 'config.jsenv' .BUILD
  $rootScope.$on '$stateChangeSuccess' (e, {name}) ->
    window?ga? 'send' 'pageview' page: $location.$$path, title: name

.controller AppCtrl: <[$scope $location $rootScope $sce]> ++ (s, $location, $rootScope, $sce) ->
  s <<< {$location}
  s.$watch '$location.path()' (activeNavId or '/') ->
    s <<< {activeNavId}

  s.getClass = (id) ->
    if s.activeNavId.substring 0 id.length is id
      'active'
    else
      ''

.controller About: <[$rootScope $http]> ++ ($rootScope, $http) ->
    $rootScope.activeTab = 'about'

.controller Main: <[$scope]> ++ ($scope) ->
  $scope.sounds =
    * faceImageURL: 'http://farm4.staticflickr.com/3703/9285812653_8eaa7eae43_q_d.jpg'
      description: 'Fire'
    * faceImageURL: 'http://farm3.staticflickr.com/2669/4198677183_cef0bb3e11_q_d.jpg'
      description: 'Coffee Shop'
    * faceImageURL: 'http://farm3.staticflickr.com/2885/12363155663_c63a953c16_q_d.jpg'
      description: 'Tree'
    * faceImageURL: 'http://farm3.staticflickr.com/2726/4487634622_2784ab3729_q_d.jpg'
      description: 'Breeze'
