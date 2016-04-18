var Crawler = require('./crawler');
var io = require("socket.io-client");
var Worker = require('webworker-threads').Worker;

var socket = new io("http://localhost:3000/spider")

function _321go(msg) {
    var worker = new Worker(function() {
        this.onmessage = function(event) {
            postMessage(event.data);
        };
    });
    worker.addEventListener('message', function(event) {
        try {
            var crawler = new Crawler("http://place.qyer.com/", {
                interval: 1000,
                maxDepth: 3,
                host: "place.qyer.com",
                initialPath: '/' + event.data + '/travel-notes/',
                useProxy: false,
                scanSubdomains: false,
                stripQuerystring: true,
                domainWhitelist: ["place.qyer.com", "bbs.qyer.com"],
                proxyHostname: '218.3.177.19',
                proxyPort: 8088,
                // cache: new Crawler.cache('/src/crawler'),
                maxConcurrency: 5
            }, {
                    key: "qyer",
                    conditions: [{
                        regex: /thread\-\d+\-\d+\.html/g,
                        inQueue: true
                    }, {
                            regex: new RegExp(event.data + '/(.*?)', 'g')   //place.qyer.com/poi/*****
                        }]
                });
            crawler.on("fetchcomplete", function(queueItem, next) {
                console.log("fetchcomplete:", queueItem.responseBody);
                next();
            });

            crawler.start();
        } catch (e) {
            console.log(e);
        }
    });
    worker.postMessage(msg);
}

_321go("japan");

// socket.on("start", function(msg) {
//     _321go(msg);
// });

// socket.on("getQueue", function(msg) {
//     socket.emit("response", Crawler.items['qyer'].crawler.queue);
// });


