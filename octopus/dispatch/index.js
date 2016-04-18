var express = require("express");
var http = require("http");
var socketio = require("socket.io");

var app = express();
var server = http.createServer(app);
var io = socketio(server);

app.get('/', function(req, res) {
    res.send("<h1>Hello world</h1>");
})

server.listen(3000, function() {
    console.log("listening on *:3000");
});

io.of("spider").on("connection", function(socket) {
    socket.emit("start", "japan");
    // socket.emit("start", "china");

    setInterval(function() {
        socket.emit("getQueue", "japan");
    }, 5000);

    socket.on("response", function(data) {
        console.log(data.scanIndex);
    });

    socket.on('disconnect', function() {
        console.log('user disconnected');
    });
});

