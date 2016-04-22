var core = require("../core");
var _ = require("lodash");

var qname_data = "crawler.data";

// 获取queue
core.q.getQueue(qname_data, {
    durable: true
}, 1).then(function(result) {
    // 消费
    result.ch.consume(result.q.queue, function(message) {
        var data = JSON.parse(message.content.toString());
        var store = new core.store(data);

        store.init(function() {
            result.ch.ack(message);
        });
    }, { noAck: false });
}, console.warn);