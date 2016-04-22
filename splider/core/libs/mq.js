var Promise = require("bluebird");
var conn_promise = require('amqplib').connect('amqp://nick:nick@114.55.8.106');

function getQueue(qname, q_setting, prefetch) {
    return new Promise(function(resolve, reject, prefetch) {
        conn_promise.then(function(conn) {
            var ch_promise = conn.createChannel();

            ch_promise.then(function(ch) {
                ch.prefetch(prefetch || 0);

                // ch.checkQueue(qname).then(function(param) {
                //     console.log(arguments);
                // }, function() {
                //     console.log(arguments);
                // });
                ch.assertQueue(qname, q_setting).then(function(q) {
                    resolve({
                        ch: ch,
                        q: q
                    });
                }, reject);
            }, reject);
        }, reject);
    });
}

module.exports = exports = {
    getQueue: getQueue
};