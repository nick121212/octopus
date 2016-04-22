var Crawler = require('simplecrawler');
var _ = require('lodash');
var EventEmitter = require("events").EventEmitter;
var zlib = require('zlib');
var robotsParser = require('robots-parser');
var util = require("util");

/**
 * 爬虫类
*/
function FXCrawler(settings) {
    this.startCount = 0;
    this.settings = settings;
    this.discoverComplete = false;
    this.isMaster = false;
    this.crawler = new Crawler(this.settings.crawler.host);
    this.key = this.settings.key;
    this.queueFile = this.key + "-queue.json";
    this.options = this.settings.crawler;
    this.init();
}
/**
 * 继承
 */
util.inherits(FXCrawler, EventEmitter);
/**
 * 初始化爬虫
*/
FXCrawler.prototype.init = function() {
    var _this = this;

    _this.initRobot();
    _this.initFilter();
    // _this.initQ();
    // _this.initChilds();
    // 设置参数，初始化crawler完毕
    _.each(_this.settings.crawler, function(val, key) {
        _this.crawler[key] = val;
    });
    _this.initCrawler();
    _this.start();
};
/**
 * 开始爬虫
 */
FXCrawler.prototype.start = function() {
    this.startCount++;
    this.crawler.start();
}
/**
 * 结束爬虫
 */
FXCrawler.prototype.stop = function() {
    this.crawler.stop();
}
/**
 * 机器人应答
*/
FXCrawler.prototype.initRobot = function() {
    var robots = this.settings.robots;

    robots.txtUrl && robotsParser(robots.txtUrl, robots.headers || []);
};
/**
 * 获取condition的信息，没有则返回null
 */
FXCrawler.prototype.getCondition = function(url) {
    var _this = this, result;

    _.each(_this.settings.conditions, function(condition) {
        regexp = new RegExp(condition.regex, condition.scope);
        result = regexp.test(url);

        if (result) {
            result = condition;
            return false;
        }
    });

    return result;
};
/**
 * 爬取的页面正则匹配
 */
FXCrawler.prototype.initFilter = function() {
    var _this = this;

    this.crawler.addFetchCondition(function(parsedURL, queueItem) {
        var result = false, regexp;

        _.each(_this.settings.notFetch, function(fetch) {
            regexp = new RegExp(fetch.regex, fetch.scope);
            result = regexp.test(parsedURL.uriPath);

            if (result) {
                return false;
            }
        });

        return !result;
    });
};
/**
 * 完成爬取任务
 */
FXCrawler.prototype.complete = function() {
    if (this.discoverComplete) {
        this.emit("complete");
    } else {
        this.crawler.queue.defrost(this.queueFile);
        this.start();
    }
};
/**
 * 保存queue里面的数据到硬盘
 */
FXCrawler.prototype.save = function() {
    this.crawler.queue.freeze(this.queueFile, function() { });
}
/**
 * 初始化爬取任务
 */
FXCrawler.prototype.initConditionMission = function(condition) {
    // var worker = new Worker(function() {
    //     this.onmessage = function(event) {
    //         postMessage(event.data);
    //     };
    // });
    // worker.addEventListener('message', function(event) {
    //     try {
    //         console.log(event.data);
    //     } catch (e) {
    //         console.log(e);
    //     }
    // });
    // worker.postMessage(condition);
}
/**
 * 初始化爬虫事件
 */
FXCrawler.prototype.initCrawler = function() {
    var _this = this;

    _this.crawler.on('crawlstart', function() {
        console.log("crealer start on " + Date.now() + "at key:" + _this.key);
    }).on('queueadd', function(queueItem) {
        // console.log(queueItem.url + "add to the queue!");
    }).on('fetchstart', function(queueItem, requestOptions) {
        console.log("start fetch:" + queueItem.url);
    }).on('fetchcomplete', function(queueItem, responseBody, responseObject) {
        var evtDone = this.wait();
        var buffer = new Buffer(responseBody, 'utf-8');
        var condition;

        zlib.gunzip(buffer, function(err, decoded) {
            if (err) {
                console.log(err);
                evtDone();
                return
            }
            queueItem.responseBody = decoded.toString();
            condition = _this.getCondition(queueItem.url);
            _this.emit("fetchcomplete", this, condition, queueItem, evtDone);
        });
    }).on('complete', function() {
        console.log("complete");
        _this.complete();
    }).on('discoverycomplete', function(queueItem, resources) {
        _this.discoverComplete = true;
        // console.log(queueItem.url, resources.length);
    }).on('gziperror', function(queueItem, error, resourceData) {
        console.log(error);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    }).on('fetcherror', function(queueItem, response) {
        console.log("fetcherror", response.code);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    }).on('fetchtimeout', function(queueItem, crawlerTimeoutValue) {
        console.log("fetchtimeout:" + queueItem.url);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    });
};

module.exports = exports = FXCrawler;