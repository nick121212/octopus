/**
 * Created by NICK on 16/4/12.
 * email:nick121212@126.com
 * qq:289412378
 * copyright NICK
 */

var FXCrawler = require('./libs/crawler');
var mq = require('./libs/mq');
var elastic = require('./libs/elastic');
var store = require('./libs/store');

module.exports = exports = {
    crawler: FXCrawler,
    q: mq,
    elastic: elastic,
    store: store
};