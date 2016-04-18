var core = require("./core");

var open = require('amqplib').connect('amqp://nick:nick@localhost');
var qname = "crawler";

core.q.getQueue(qname, {
    durable: true
}).then(function(result) {
    result.ch.bindQueue(result.q.queue, "amq.topic", 'crawler.*');
    result.ch.consume(result.q.queue, function(message) {
        var setting = JSON.parse(message.content.toString());
        var crawler;

        console.log(Date.now(), message.content.toString());
        if (setting.opt == "start") {
            setting.setting.content = JSON.parse(setting.setting.content);
            crawler = new core.crawler(setting.setting.content);
            crawler.on("fetchcomplete", function(craw, condition, data, next) {
                ch.publish('amq.topic', 'crawler_data.' + craw.key + "-" + condition.key, new Buffer(JSON.stringify(data)));
                next();
                console.log(data);
            });
            crawler.on("complete", function() {
                console.log("next");
                result.ch.ack(message);
            });
            console.log("start");
        } else if (setting.opt == "stop") {
            crawler && crawler.stop();
            result.ch.ack(message);
        } else {
            result.ch.ack(message);
        }
    }, { noAck: false });
}, console.warn);


// open.then(function(conn) {
//     var ok = conn.createChannel();

//     ok = ok.then(function(ch) {
//         ch.prefetch(1);
//         ch.assertQueue(qname, {
//             durable: true
//         }).then(function(q) {
//             ch.bindQueue(q.queue, "amq.topic", 'crawler.*');
//             ch.consume(q.queue, function(message) {
//                 var setting = JSON.parse(message.content.toString());
//                 var crawler;

//                 console.log(Date.now(), message.content.toString());
//                 if (setting.opt == "start") {
//                     setting.setting.content = JSON.parse(setting.setting.content);
//                     crawler = new core.crawler(setting.setting.content);
//                     crawler.on("fetchcomplete", function(craw, condition, data, next) {
//                         ch.publish('amq.topic', 'crawler_data.' + craw.key + "-" + condition.key, new Buffer(JSON.stringify(data)));
//                         next();
//                         console.log(data);
//                     });
//                     crawler.on("complete", function() {
//                         console.log("next");
//                         ch.ack(message);
//                     });
//                     console.log("start");
//                 } else if (setting.opt == "stop") {
//                     crawler && crawler.stop();
//                     ch.ack(message);
//                 } else {
//                     ch.ack(message);
//                 }
//             }, { noAck: false });
//         });
//     });
// }).then(null, console.warn);