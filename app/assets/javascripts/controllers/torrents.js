angular.module('filehydrant.controllers.torrents', ['ngResource'])
    .controller('TorrentsController', function($scope, $resource, $q) {
        var torrents = $resource('/api/torrents', {}, {
            get: { method: 'GET', isArray: false }
        });

        $scope.torrents = torrents.get();
        $scope.torrents.$promise.then(function (result) {
            $scope.torrents = result.data;
        });
});
