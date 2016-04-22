var elasticsearch = require('elasticsearch');
var client = new elasticsearch.Client({
    host: "123.59.57.180:80",
    log: "trace"
});

// client.ping({
//     "requestTimeout": Infinity,
//     "hello": "elasticsearch"
// }, function(error) {
//     if (error) {
//         console.log(error);
//     } else {
//         console.log("all is well!");
//     }
// });

module.exports = exports = client;