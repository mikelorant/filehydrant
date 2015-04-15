//= require jquery
//= require semantic-ui
//= require moment
//= require pretty-bytes
//= require angular
//= require angular-rails-templates
//= require angular-route
//= require angular-resource
//= require angular-moment
//= require angular-pretty-bytes
//= require_tree ./controllers
//= require_tree ./services
//= require_tree ../templates

var app = angular.module('app', [
    'filehydrant.controllers.navigation',
    'filehydrant.controllers.torrents',
    'filehydrant.services.torrent',
    'ngRoute',
    'ngResource',
    'angularMoment',
    'prettyBytes',
    'templates'
]);

app.config(function ($routeProvider, $locationProvider) {
    $routeProvider.when('/torrents', {
        controller: 'TorrentsController',
        templateUrl: 'torrents.html'
    }).otherwise({
        redirectTo: '/torrents'
    });
    return $locationProvider.hashPrefix('!');
});
