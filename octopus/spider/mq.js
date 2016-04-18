var ampq = require('amqp');
var util = require('util');

var connection = ampq.createConnection({
    host: '192.168.1.210',
    port: 5672,
    login: 'nick',
    password: 'nick',
    authMechanism: 'AMQPLAIN',
    defaultExchangeName: 'amq.topic',
    vhost: '/nick',
    ssl: { enabled: false }
});

connection.on('ready', function() {
    console.log("connection ok!");
    // Use the default 'amq.topic' exchange
    connection.queue('qyer', function(q) {
        // Catch all messages
        q.bind('qyer.*');
        q.on("queueBindOk", function() {
            console.log("queueBindOk", arguments);
        });
        // Receive messages
        q.subscribe({deliveryKeyInPayload:true},function(message) {
            // Print messages to stdout
            console.log(message);
            // message.acknowledge(false);
        });
    });
});

module.exports = exports = connection;