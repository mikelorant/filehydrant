angular
    .module('filehydrant.controllers.torrents', [])
    .controller('TorrentsController', function($scope, TorrentFactory) {

    $scope.loaded = false;
    TorrentFactory.getTorrent().query().$promise.then(function(result) {
        $scope.torrents = result;
        $scope.loaded = true;
    });
});
