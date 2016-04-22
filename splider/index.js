var core = require("../core");
var _ = require("lodash");

var qname_setting = "crawler.setting";
var qname_data = "crawler.data";

// 获取queue
core.q.getQueue(qname_setting, {
    durable: true
}, 1).then(function(result) {
    // 绑定queue到exchange
    result.ch.bindQueue(result.q.queue, "amq.topic", 'crawler.setting.#');
    // 消费
    result.ch.consume(result.q.queue, function(message) {
        var setting = JSON.parse(message.content.toString());
        var crawler;

        // 数据queue
        core.q.getQueue(qname_data, { durable: true }, 1).then(function(result_data) {
            result_data.ch.bindQueue(result_data.q.queue, "amq.topic", 'crawler.data.#');
            //console.log(Date.now(), message.content.toString());
            if (setting.opt == "start") {
                setting.setting.content = JSON.parse(setting.setting.content);
                // 构造爬虫
                crawler = new core.crawler(setting.setting.content);
                // 注册爬虫完成事件，数据存入data-queue
                crawler.on("fetchcomplete", function(craw, condition, data, next) {
                    var con = _.extend({}, data);

                    delete con['responseBody'];
                    core.elastic.create({
                        index: "crawler",
                        type: "urls",
                        id: data.url,
                        body: con
                    }, function(err) {
                        if (!err && condition) {
                            data.condition = condition;
                            result_data.ch.publish('amq.topic', 'crawler.data.' + craw.key + "." + condition.key, new Buffer(JSON.stringify(data)));
                        }
                        next();
                    });
                });
                // 继续下一个爬虫任务
                crawler.on("complete", function() {
                    console.log("next");
                    result.ch.ack(message);
                });
                console.log("start");
            } else if (setting.opt == "stop") {
                if (crawler) {
                    crawler.save();
                    crawler.stop();
                }
                result.ch.ack(message);
            } else {
                result.ch.reject(message);
            }
        });
    }, { noAck: false });
}, console.warn);