'use strict';

var Hapi = require('hapi');
var server = new Hapi.Server();

server.connection({
    port: 3000
});

server.register([
    {
        register: require('./task'),
        options: {}

    }
], function(error) {

    if (error) {
        console.error(error);
        return;
    }

    server.start(function() {
        console.log('Service started');
    });
});



