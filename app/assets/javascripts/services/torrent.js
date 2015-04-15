angular
    .module('filehydrant.services.torrent', [])
    .factory('TorrentFactory', function ($resource) {

        factory = {};

        factory.getTorrent = function () {
            return $resource("api/torrents/:id", {id: '@id'});
        };

        return factory;
    });
