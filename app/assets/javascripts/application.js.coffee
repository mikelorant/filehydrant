#= require angular
#= require angular-rails-templates
#= require angular-route
#= require jquery
#= require bootstrap
#= require_tree ./controllers
#= require_tree ./services
#= require_tree ../templates

app = angular.module('app', [
  'filehydrant.controllers.navigation'
  'filehydrant.controllers.torrents'
  'ngRoute'
  'templates'
])

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when('/torrents',
      controller: 'TorrentsController'
      templateUrl: 'torrents.html')
    .otherwise redirectTo: '/torrents'

  $locationProvider.hashPrefix '!'
