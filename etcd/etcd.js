var Etcd = require('node-etcd');

var etcd = new Etcd(['127.0.0.1:4001']);

etcd.mkdir("proxy/", console.log);

module.exports = exports = etcd;