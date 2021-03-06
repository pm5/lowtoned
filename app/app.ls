# Declare app level module which depends on filters, and services

angular.module "App" <[app.templates ngMaterial ui.router App.Sound App.Player]>

.config <[$stateProvider $urlRouterProvider $locationProvider $mdThemingProvider]> ++ ($stateProvider, $urlRouterProvider, $locationProvider, $mdThemingProvider) ->
  $stateProvider
    .state 'about' do
      url: '/about'
      templateUrl: 'app/about/view.html'
      controller: "About"
    .state 'main' do
      url: '/main'
      templateUrl: 'app/main/view.html'
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
