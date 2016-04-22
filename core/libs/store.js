var cheerio = require('cheerio');
var _ = require('lodash');
var elastic = require('./elastic');

function FXStore(data) {
    this.data = data;
    this.condition = data.condition;
    this.$ = cheerio.load(data.responseBody)
    // this.init();
}

FXStore.prototype.init = function(cb) {
    var contentData = {}, _this = this;

    _.forEach(this.condition.datas, function(dataType) {
        _.forEach(dataType.datas, function(data, dataKey) {
            contentData[dataKey] = _this.getData(dataType, data);
        });
    });

    elastic.create({
        index: this.condition.store.elastic.index,
        type: this.condition.store.elastic.type,
        id: this.data.url,
        body: contentData
    }, function() {
        cb();
    });

    return contentData;
}

FXStore.prototype.getData = function(dataType, data) {
    switch (dataType.type.toLowerCase()) {
        case "url":
            return this.getDataUrl(dataType, data);
        case "html":
            return this.getDataHtml(dataType, data);
    }
}

FXStore.prototype.getDataUrl = function(dataType, data) {
    var url = this.data.url;

    _.forEach(data.replace, function(replace) {
        url = url.replace(new RegExp(replace, data.scope), '');
    });

    return url;
}

FXStore.prototype.getDataHtml = function(dataType, data) {
    var $selector = null;

    if (dataType.selector) {
        !dataType.$selector && (dataType.$selector = this.$(dataType.selector.selector));
        _.forEach(dataType.selector.methods, function(method) {
            dataType.$selector[method.name] && [dataType.$selector = dataType.$selector[method.name](method.params)];
        });
    }

    if (data.selector) {
        $selector = dataType.$selector.find(data.selector);
    } else {
        $selector = dataType.$selector;
    }

    if (data.method) {
        return (typeof $selector[data.method] == "function") && $selector[data.method]();
    } else if (data.attr) {
        return $selector.attr(data.attr);
    }
}

exports = module.exports = FXStore;