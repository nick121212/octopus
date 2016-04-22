var iconv = require('iconv-lite');
var zlib = require('zlib');
var util = require("util");
var EventEmitter = require("events").EventEmitter;
var _ = require('lodash');
var robotsParser = require('robots-parser');
var Crawler = require('simplecrawler');
var Worker = require('webworker-threads').Worker;

/**
 * 构造函数
 * initialPath: 起始地址
 * options: 爬虫的设置
 */
function Crawlers(initialPath, options, settings) {
    var crawler = this.crawler = Crawler.crawl(initialPath);

    this.isStart = false;
    this.settings = settings;
    // 处理默认值
    options = _.extend({
        host: 'localhost',
        initialPath: '/',
        initialPort: 80,
        initialProtocol: 'http',
        interval: 250,
        maxConcurrency: 5,
        timeout: 10000,
        listenerTTL: 10000,
        userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',
        decodeResponses: false,
        respectRobotsTxt: true,
        allowInitialDomainChange: false,
        filterByDomain: true,
        scanSubdomains: false,
        // queue:null,
        ignoreWWWDomain: true,
        stripWWWDomain: false,
        stripQuerystring: false,
        // discoverRegex:'',
        // cache:'',
        useProxy: false,
        proxyHostname: '127.0.0.1',
        proxyPort: 8123,
        proxyUser: null,
        proxyPass: null,
        // domainWhitelist: [],
        // supportedMimeTypes: [],
        // allowedProtocols: [],
        maxResourceSize: 16777216,
        downloadUnsupported: false,
        needsAuth: false,
        authUser: '',
        authPass: '',
        customHeaders: {},
        acceptCookies: true,
        urlEncoding: 'unicode',
        parseHTMLComments: true,
        parseScriptTags: true,
        maxDepth: 0,
        fetchWhitelistedMimeTypesBelowMaxDepth: true,
        ignoreInvalidSSL: false
    }, options);
    options.decodeResponses = false;
    // 设置参数，初始化crawler完毕
    _.each(options, function(val, key) {
        crawler[key] = val;
    });
    crawler.cache = new Crawler.cache('/src/crawler');

    Crawlers.items[settings.key] = this;
    this.init();
}
util.inherits(Crawlers, EventEmitter);

Crawlers.items = [];

Crawlers.prototype.robots = function() {
    return robotsParser(_this.settings.robots.txtUrl, _this.settings.robots.headers);
}
Crawlers.prototype.start = function() {
    this.crawler.start();
}
Crawlers.prototype.initConditionMission=function () {  
    
}
Crawlers.prototype.init = function() {
    var _this = this;

    if (_this.settings.conditions) {
        _this.conditionID = _this.crawler.addFetchCondition(function(parsedURL, queueItem) {
            var result = false;

            !/window\.location\;/gi.test(parsedURL.uriPath) && !/string(.*?)href/gi.test(parsedURL.uriPath) && !/%7b(.*?)%7d/gi.test(parsedURL.uriPath) &&
                _.each(_this.settings.conditions, function(condition) {
                    result = condition.regex.test(parsedURL.uriPath);
                    if (result) {
                        return false;
                    }
                });
            return result;
        });
    }

    _this.crawler.on('crawlstart', function() {
        _this.isStart = true;
    }).on('queueadd', function(queueItem) {
        // console.log(queueItem.url + "add to the queue!");
    }).on('fetchstart', function(queueItem, requestOptions) {
        console.log("start fetch:" + queueItem.url);
    }).on('fetchcomplete', function(queueItem, responseBody, responseObject) {
        var evtDone = this.wait();
        var buffer = new Buffer(responseBody, 'utf-8');

        zlib.gunzip(buffer, function(err, decoded) {
            data = decoded.toString();
            queueItem.responseBody = data;
            _this.emit("fetchcomplete", queueItem, evtDone);
        });
    }).on('complete', function() {
        _this.isStart = false;
        console.log("complete");
    }).on('discoverycomplete', function(queueItem, resources) {
        // console.log(queueItem.url, resources.length);
    }).on('gziperror', function(queueItem, error, resourceData) {
        console.log(error);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    }).on('fetcherror', function(queueItem, response) {
        console.log("fetcherror", response.code);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    }).on('fetchtimeout', function(queueItem, crawlerTimeoutValue) {
        console.log("fetchtimeout" + crawlerTimeoutValue);
        _this.crawler.queueURL(queueItem.uriPath, queueItem);
    });
}

module.exports = exports = Crawlers;